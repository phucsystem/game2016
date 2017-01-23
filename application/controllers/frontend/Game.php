<?php
class Game extends Frontend_Controller {
	function __construct() {
		parent::__construct ();
		$this->data ['curr_step'] = STEP_DASHBOARD;
		$this->load->library ( 'session' );
		// Check login
		$this->is_logged_in ( $this->session->userdata ( 'userName' ) );
		// Load model
		$this->load->model ( 'Games_model' );
		$this->load->model ( 'Teams_model' );
		$this->load->model ( 'Users_model' );
		$this->load->model ( 'Teamfactors_model' );
		$this->load->model ( 'Teamactionrecords_model' );
		$this->load->model ( 'Storages_model' );
		$this->load->model ( 'Regions_model' );
		$this->load->model ( 'Products_model' );
		$this->load->model ( 'Productcomponents_model' );
		
		// Get team info
		$this->data ['teamInfo'] = $this->Teams_model->getTeam ( $this->data ['userData'] ['teamId'] );
		$this->data ['teamLocalStorage'] = 1;
		switch ($this->data ['teamInfo'] ['region_id']) {
			case REGION_INDUSTRIAL_COUNTRY :
				$this->data ['teamLocalStorage'] = TEAM_STORAGE_CAPACITY_IC;
				break;
			case REGION_EMERGING_COUNTRY_1 :
				$this->data ['teamLocalStorage'] = TEAM_STORAGE_CAPACITY_EC1;
				break;
			case REGION_EMERGING_COUNTRY_2 :
				$this->data ['teamLocalStorage'] = TEAM_STORAGE_CAPACITY_EC2;
				break;
			case REGION_DEVELOPMENT_COUNTRY :
				$this->data ['teamLocalStorage'] = TEAM_STORAGE_CAPACITY_DC;
				break;
		}
		
		// Update user info in user data
		$this->data ['userData'] ['roundId'] = $this->data ['teamInfo'] ['current_round'];
		$this->data ['userData'] ['gameId'] = $this->data ['teamInfo'] ['game_id'];
		
		$this->data ['teamFactorsInfo'] = reset_array_key ( $this->Teamfactors_model->getFactorsByTeamIdAndRoundId ( $this->data ['teamInfo'] ['id'], $this->data ['teamInfo'] ['current_round'] ), 'factor_id' );
		
		$this->data ['teamMoney'] = $this->data ['teamFactorsInfo'] [TEAM_MONEY] ['factor_value'];
		
		$this->data ['gameInfo'] = $this->Games_model->getGameById ( $this->data ['teamInfo'] ['game_id'] );
		
		$showRecycle = false;
		if ($this->data ['gameInfo'] ['current_round'] >= $this->data ['gameInfo'] ['recycle_round']) {
			$showRecycle = true;
		}
		$this->data ['showRecycle'] = $showRecycle;
		
		$enableInput = true;
		if ($this->data ['teamInfo'] ['round_status'] == ROUND_WAIT_FOR_EVALUATE || $this->data ['userData'] ['role'] == PLAYER_MEMBER) {
			$enableInput = false;
		}
		
		$this->data ['enableInput'] = $enableInput;
	}
	public function dashboard() {
		$this->data ['curr_step'] = STEP_DASHBOARD;
		
		$this->load->model ( 'Events_model' );
		$this->data ['eventInfo'] = $this->Events_model->getEventByGameId ( $this->data ['userData'] ['gameId'], $this->data ['userData'] ['roundId'] );
		if (is_array ( $this->data ['eventInfo'] )) {
			$this->data ['eventInfo'] = $this->data ['eventInfo'] [0];
		}
		
		$this->data ['teamInfo'] ['leader'] = $this->Users_model->getTeamLeaderByTeamId ( $this->data ['userData'] ['teamId'] );
		
		$this->data ['teamInfo'] ['region'] = $this->getRegionNameById ( $this->data ['teamInfo'] ['region_id'] );
		$this->data ['teamInfo'] ['current_step_name'] = $this->getStepNameById ( $this->data ['teamInfo'] ['current_step'] );
		$this->data ['teamInfo'] ['round_status_name'] = $this->getRoundStatusNameById ( $this->data ['teamInfo'] ['round_status'] );
		// Get team factor record for whole game
		$teamRecords = $this->Teamfactors_model->getFactorsByTeamId ( $this->data ['userData'] ['teamId'] );
		
		$this->data ['gameName'] = $this->data ['gameInfo'] ['name'];
		$numberOfRound = $this->data ['gameInfo'] ['number_of_round'];
		
		$this->load->model ( 'Chartdata_model' );
		$chartData = $this->Chartdata_model->getByTeamId ( $this->data ['userData'] ['teamId'] );
		$chartData = group_array_key ( $chartData, 'round_id' );
		
		// Start get team record for chart
		$this->data ['teamInfo'] ['teamFactorsRecord'] = array ();
		for($i = 1; $i <= $numberOfRound; $i ++) {
			$money = 0;
			$eco = 0;
			$so = 0;
			$me = 0;
			
			if (! empty ( $chartData [$i] )) {
				foreach ( $chartData [$i] as $r ) {
					if (( string ) $r ['factor_key'] == TEAM_MONEY) {
						$money = $r ['factor_value'];
						continue;
					}
					if (( string ) $r ['factor_key'] == TEAM_ECO_CREDIT) {
						$eco = $r ['factor_value'];
						continue;
					}
					if (( string ) $r ['factor_key'] == TEAM_SO_CREDIT) {
						$so = $r ['factor_value'];
						continue;
					}
					if (( string ) $r ['factor_key'] == TEAM_ME_CREDIT) {
						$me = $r ['factor_value'];
						continue;
					}
					;
					
					continue;
				}
			} else {
				foreach ( $teamRecords as $r ) {
					if ($r ['round_id'] == $i) {
						if ($r ['factor_id'] == TEAM_MONEY) {
							$money = $r ['factor_value'];
							continue;
						}
						if ($r ['factor_id'] == TEAM_ECO_CREDIT) {
							$eco = $r ['factor_value'];
							continue;
						}
						if ($r ['factor_id'] == TEAM_SO_CREDIT) {
							$so = $r ['factor_value'];
							continue;
						}
						if ($r ['factor_id'] == TEAM_ME_CREDIT) {
							$me = $r ['factor_value'];
							continue;
						}
					}
					;
					continue;
				}
			}
			
			array_push ( $this->data ['teamInfo'] ['teamFactorsRecord'], array (
					'period' => 'Round ' . $i,
					'ECO' => $eco,
					'SO' => $so,
					'ME' => $me,
					'Money' => $money 
			) );
		}
		// End get team record for chart
		
		$this->data ['redirectUrl'] = '';
		if ($this->data ['teamInfo'] ['current_step'] != STEP_DASHBOARD) {
			$this->data ['redirectUrl'] = $this->getStepUrlById ( $this->data ['teamInfo'] ['current_step'] );
		}
		
		$this->load->view ( 'frontend/layout/header', $this->data );
		$this->load->view ( 'frontend/game/dashboard', $this->data );
		$this->load->view ( 'frontend/layout/footer' );
	}
	public function startround() {
		$data = array ();
		$data ['result'] = false;
		$this->Teams_model->changeRoundStatus ( $this->data ['userData'] ['teamId'], ROUND_IN_PROGRESS );
		$this->Teams_model->changeCurrStep ( $this->data ['userData'] ['teamId'], STEP_DEVELOPMENT );
		
		$data ['result'] = true;
		echo json_encode ( $data );
		exit ();
	}
	public function endround() {
		$data = array ();
		$data ['result'] = false;
		$this->Teams_model->changeRoundStatus ( $this->data ['userData'] ['teamId'], ROUND_WAIT_FOR_EVALUATE );
		
		$data ['result'] = true;
		echo json_encode ( $data );
		exit ();
	}
	public function nextstep() {
		$data = array ();
		$data ['result'] = false;
		$nextStep = $this->uri->segment ( 3 );
		if ($this->data ['showRecycle'] == false && $nextStep == STEP_RECYCLING) {
			$nextStep = STEP_PRODUCTION;
		}
		$this->Teams_model->changeCurrStep ( $this->data ['userData'] ['teamId'], $nextStep );
		$data ['url'] = $this->getStepUrlById ( $nextStep );
		
		$data ['result'] = true;
		echo json_encode ( $data );
		exit ();
	}
	public function getStepUrlById($id) {
		switch ($id) {
			case STEP_DEVELOPMENT :
				return site_url ( 'game/products' );
				break;
			case STEP_COMPONENTS :
				return site_url ( 'game/components' );
				break;
			case STEP_RECYCLING :
				return site_url ( 'game/recycling' );
				break;
			case STEP_PRODUCTION :
				return site_url ( 'game/production' );
				break;
			case STEP_TRANSPORT :
				return site_url ( 'game/transport' );
				break;
			case STEP_SALE :
				return site_url ( 'game/sales' );
				break;
		}
	}
	public function products() {
		$this->data ['curr_step'] = STEP_DEVELOPMENT;
		
		/*
		 * Check post method
		 */
		if ($this->input->post () != false) {
			$postData = $this->input->post ();
			$productInfo = array ();
			$productInfo ['id'] = $postData ['product'] ['id'];
			$productInfo ['sell_price'] = $postData ['product'] ['selling_cost'];
			$productInfo ['range'] = $postData ['product'] ['range'];
			$productInfo ['reliability'] = $postData ['product'] ['reliability'];
			$productInfo ['design'] = $postData ['product'] ['design'];
			$productInfo ['manufacturing_cost'] = $postData ['product'] ['manufacture_cost'];
			$this->Products_model->updateProduct ( $productInfo ['id'], $productInfo );
			$totalCost = $postData ['product'] ['selling_cost'];
			
			foreach ( $postData ['product'] ['component'] as $componentKey => $componentValue ) {
				$componentInfo = array ();
				$componentInfo ['component_id'] = $componentKey;
				$componentInfo ['material_id'] = $componentValue;
				$this->Productcomponents_model->updateProductComponent ( $componentInfo ['component_id'], $componentInfo );
			}
			
			// Update team money after payment
			$this->data ['teamFactorsInfo'] [TEAM_MONEY] ['factor_value'] -= $totalCost;
			$this->Teamfactors_model->updateTeamFactor ( $this->data ['userData'] ['teamId'], $this->data ['teamFactorsInfo'] [TEAM_MONEY] );
			
			// Log change of money
			$actionRecord2 = array ();
			$actionRecord2 ['key'] = RECORD_TYPE_MONEY;
			$actionRecord2 ['value'] = '-' . $totalCost;
			$actionRecord2 ['game_id'] = $this->data ['teamInfo'] ['game_id'];
			$actionRecord2 ['round_id'] = $this->data ['userData'] ['roundId'];
			$actionRecord2 ['team_id'] = $this->data ['userData'] ['teamId'];
			$actionRecord2 ['region_id'] = '';
			$actionRecord2 ['new_value'] = $this->data ['teamFactorsInfo'] [TEAM_MONEY] ['factor_value'];
			$actionRecord2 ['description'] = 'Paymnent for developing new product.';
			$this->Teamactionrecords_model->addRecord ( $actionRecord2 );
			
			redirect ( 'game/products/success/edit' );
		}
		
		$this->data ['successAction'] = $this->uri->segment ( 4 );
		$this->data ['developedProduct'] = $this->Products_model->getProductsByTeamId ( $this->data ['userData'] ['teamId'] );
		
		if (empty ( $this->data ['developedProduct'] )) {
			redirect ( 'game/development' );
		}
		
		$this->load->model ( 'Components_model' );
		$this->load->model ( 'Componentmaterials_model' );
		
		$this->data ['components'] = reset_array_key ( $this->Components_model->getComponentsByTeamId ( $this->data ['userData'] ['teamId'], $this->data ['userData'] ['roundId'] ), 'id' );
		
		foreach ( $this->data ['components'] as $key => $value ) {
			$this->data ['components'] [$key] ['materials'] = $this->Componentmaterials_model->getMaterialsByComponentId ( $value ['id'] );
			foreach ( $this->data ['components'] [$key] ['materials'] as $mtKey => $mtValue ) {
				if (file_exists ( FCPATH . '/assets/imgs/components/' . $mtValue ['image'] )) {
					$this->data ['components'] [$key] ['materials'] [$mtKey] ['image'] = '/assets/imgs/components/' . $mtValue ['image'];
				} else {
					$this->data ['components'] [$key] ['materials'] [$mtKey] ['image'] = '/assets/imgs/no_image.gif';
				}
			}
		}
		
		$inhouseManuCost = $this->data ['teamFactorsInfo'] [TEAM_INHOUSE_MANUFACTURING_COST] ['factor_value'];
		$fixedCost = $this->data ['teamFactorsInfo'] [TEAM_FIXED_COST] ['factor_value'];
		$developmentCost = $this->data ['teamFactorsInfo'] [TEAM_DEVELOPMENT_COST] ['factor_value'];
		
		// Get region factor for team
		$regionFactors = reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $this->data ['userData'] ['roundId'], $this->data ['teamInfo'] ['region_id'], $this->data ['userData'] ['gameId'], $this->data ['teamInfo'] ['id'] ), 'factor_id' );
		// Get region factor for game
		$regionFactors += reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $this->data ['userData'] ['roundId'], $this->data ['teamInfo'] ['region_id'], $this->data ['userData'] ['gameId'], 0 ), 'factor_id' );
		
		// cost factor 1
		$qualityFactor1 = $regionFactors [REGION_QUALITY_FACTOR_1] ['factor_value'];
		$qualityFactor2 = $regionFactors [REGION_QUALITY_FACTOR_2] ['factor_value'];
		$this->data ['qualityFactor'] = $qualityFactor1 * $qualityFactor2;
		
		$this->data ['manufacturingCost'] = $fixedCost;
		$this->data ['developmentCost'] = $developmentCost;
		$this->data ['inhouseManuCost'] = $inhouseManuCost;
		
		$this->load->view ( 'frontend/layout/header', $this->data );
		$this->load->view ( 'frontend/game/products', $this->data );
		$this->load->view ( 'frontend/layout/footer' );
	}
	public function development() {
		/*
		 * Check post method
		 */
		if ($this->input->post () != false) {
			$postData = $this->input->post ();
			$this->load->model ( 'Products_model' );
			$this->load->model ( 'Productcomponents_model' );
			$productInfo = array ();
			$productInfo ['name'] = $postData ['product'] ['name'];
			$productInfo ['sell_price'] = $postData ['product'] ['selling_cost'];
			$productInfo ['range'] = $postData ['product'] ['range'];
			$productInfo ['reliability'] = $postData ['product'] ['reliability'];
			$productInfo ['design'] = $postData ['product'] ['design'];
			$productInfo ['manufacturing_cost'] = $postData ['product'] ['manufacture_cost'];
			$productInfo ['team_id'] = $this->data ['userData'] ['teamId'];
			$productId = $this->Products_model->addProduct ( $productInfo );
			
			$totalCost = $postData ['product'] ['selling_cost'];
			
			foreach ( $postData ['product'] ['component'] as $componentKey => $componentValue ) {
				$componentInfo = array ();
				$componentInfo ['product_id'] = $productId;
				$componentInfo ['component_id'] = $componentKey;
				$componentInfo ['material_id'] = $componentValue;
				$componentInfo ['team_id'] = $this->data ['userData'] ['teamId'];
				$this->Productcomponents_model->addProductComponent ( $componentInfo );
			}
			$this->data ['teamFactorsInfo'] [TEAM_MONEY] ['factor_value'] -= $totalCost;
			$this->Teamfactors_model->updateTeamFactor ( $this->data ['userData'] ['teamId'], $this->data ['teamFactorsInfo'] [TEAM_MONEY] );
			
			// Log change of money
			$actionRecord2 = array ();
			$actionRecord2 ['key'] = RECORD_TYPE_MONEY;
			$actionRecord2 ['value'] = '-' . $totalCost;
			$actionRecord2 ['game_id'] = $this->data ['teamInfo'] ['game_id'];
			$actionRecord2 ['round_id'] = $this->data ['userData'] ['roundId'];
			$actionRecord2 ['team_id'] = $this->data ['userData'] ['teamId'];
			$actionRecord2 ['region_id'] = '';
			$actionRecord2 ['new_value'] = $this->data ['teamFactorsInfo'] [TEAM_MONEY] ['factor_value'];
			$actionRecord2 ['description'] = 'Paymnent for developing new product.';
			$this->Teamactionrecords_model->addRecord ( $actionRecord2 );
			
			redirect ( 'game/products/success/add' );
		}
		
		$this->data ['successAction'] = $this->uri->segment ( 4 );
		
		$this->data ['curr_step'] = STEP_DEVELOPMENT;
		
		$this->load->model ( 'Components_model' );
		$this->load->model ( 'Componentmaterials_model' );
		$this->data ['curr_sub_step'] = STEP_INFORMATION_COMPONENT;
		$this->data ['components'] = $this->Components_model->getComponentsByTeamId ( $this->data ['userData'] ['teamId'], $this->data ['userData'] ['roundId'] );
		foreach ( $this->data ['components'] as $key => $value ) {
			$this->data ['components'] [$key] ['materials'] = $this->Componentmaterials_model->getMaterialsByComponentId ( $value ['id'] );
			foreach ( $this->data ['components'] [$key] ['materials'] as $mtKey => $mtValue ) {
				if (file_exists ( FCPATH . '/assets/imgs/components/' . $mtValue ['image'] )) {
					$this->data ['components'] [$key] ['materials'] [$mtKey] ['image'] = '/assets/imgs/components/' . $mtValue ['image'];
				} else {
					$this->data ['components'] [$key] ['materials'] [$mtKey] ['image'] = '/assets/imgs/no_image.gif';
				}
			}
		}
		
		$inhouseManuCost = $this->data ['teamFactorsInfo'] [TEAM_INHOUSE_MANUFACTURING_COST] ['factor_value'];
		$fixedCost = $this->data ['teamFactorsInfo'] [TEAM_FIXED_COST] ['factor_value'];
		$developmentCost = $this->data ['teamFactorsInfo'] [TEAM_DEVELOPMENT_COST] ['factor_value'];
		
		// Get region factor for team
		$regionFactors = reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $this->data ['userData'] ['roundId'], $this->data ['teamInfo'] ['region_id'], $this->data ['userData'] ['gameId'], $this->data ['teamInfo'] ['id'] ), 'factor_id' );
		// Get region factor for game
		$regionFactors += reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $this->data ['userData'] ['roundId'], $this->data ['teamInfo'] ['region_id'], $this->data ['userData'] ['gameId'], 0 ), 'factor_id' );
		
		// cost factor 1
		$qualityFactor1 = $regionFactors [REGION_QUALITY_FACTOR_1] ['factor_value'];
		$qualityFactor2 = $regionFactors [REGION_QUALITY_FACTOR_2] ['factor_value'];
		$this->data ['qualityFactor'] = $qualityFactor1 * $qualityFactor2;
		
		$this->data ['manufacturingCost'] = $fixedCost;
		$this->data ['developmentCost'] = $developmentCost;
		$this->data ['inhouseManuCost'] = $inhouseManuCost;
		
		$this->load->view ( 'frontend/layout/header', $this->data );
		$this->load->view ( 'frontend/game/development', $this->data );
		$this->load->view ( 'frontend/layout/footer' );
	}
	public function components() {
		$this->data ['successAction'] = $this->uri->segment ( 4 );
		$this->data ['curr_step'] = STEP_COMPONENTS;
		
		$this->load->model ( 'Products_model' );
		$this->load->model ( 'Productcomponents_model' );
		$this->load->model ( 'Components_model' );
		$this->load->model ( 'Componentmaterials_model' );
		
		if ($this->input->post () != false) {
			$postData = $this->input->post ();
			$paymentAmount = 0;
			
			// Save component to team's storage
			foreach ( $postData ['component'] as $purchaseComponent ) {
				$componentData = array ();
				$componentData ['item_type'] = ITEM_STORE_TYPE_MATERIAL;
				$componentData ['item_id'] = $purchaseComponent ['material'];
				$componentData ['quantity'] = $purchaseComponent ['qty'];
				$componentData ['team_id'] = $this->data ['userData'] ['teamId'];
				$componentData ['region_id'] = $this->data ['teamInfo'] ['region_id'];
				$componentData ['status'] = PRODUCT_STATUS_NEW;
				$paymentAmount += $purchaseComponent ['qty'] * $purchaseComponent ['cost'];
				
				$componentStorage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_MATERIAL, $this->data ['userData'] ['teamId'], $purchaseComponent ['material'] );
				if ($componentStorage != null) {
					$componentData ['quantity'] = $componentData ['quantity'] + $componentStorage [0] ['quantity'];
					$this->Storages_model->updateStorage ( $componentStorage [0] ['id'], $componentData );
				} else {
					$this->Storages_model->addStorage ( $componentData );
				}
			}
			
			// Update team money after payment
			$this->data ['teamFactorsInfo'] [TEAM_MONEY] ['factor_value'] -= $paymentAmount;
			$this->Teamfactors_model->updateTeamFactor ( $this->data ['userData'] ['teamId'], $this->data ['teamFactorsInfo'] [TEAM_MONEY] );
			
			// Log change of money
			$actionRecord = array ();
			$actionRecord ['key'] = RECORD_TYPE_MONEY;
			$actionRecord ['value'] = '-' . $paymentAmount;
			$actionRecord ['game_id'] = $this->data ['teamInfo'] ['game_id'];
			$actionRecord ['round_id'] = $this->data ['userData'] ['roundId'];
			$actionRecord ['team_id'] = $this->data ['userData'] ['teamId'];
			$actionRecord ['region_id'] = '';
			$actionRecord ['new_value'] = $this->data ['teamFactorsInfo'] [TEAM_MONEY] ['factor_value'];
			$actionRecord ['description'] = 'Payment for purchasing component.';
			$this->Teamactionrecords_model->addRecord ( $actionRecord );
			
			redirect ( 'game/components/success/purchase' );
		}
		
		// Get developed product list
		$this->data ['developedProduct'] = $this->Products_model->getProductsByTeamId ( $this->data ['userData'] ['teamId'] );
		
		// Get component for team
		$this->data ['components'] = $this->Components_model->getComponentsByTeamId ( $this->data ['userData'] ['teamId'], $this->data ['userData'] ['roundId'] );
		
		foreach ( $this->data ['components'] as $key => $value ) {
			$this->data ['components'] [$key] ['materials'] = $this->Componentmaterials_model->getMaterialsByComponentId ( $value ['id'] );
		}
		
		$this->load->view ( 'frontend/layout/header', $this->data );
		$this->load->view ( 'frontend/game/components', $this->data );
		$this->load->view ( 'frontend/layout/footer' );
	}
	public function recycling() {
		$this->data ['err_msg'] = '';
		$this->load->model ( 'Recyclemethods_model' );
		
		$this->data ['successAction'] = $this->uri->segment ( 4 );
		if ($this->data ['showRecycle'] == false) {
			redirect ( 'game/production' );
		}
		$this->data ['regionName'] = $this->getRegionNameById ( $this->data ['teamInfo'] ['region_id'] );
		$this->data ['localAvailableStorage'] = $this->getAvailableStorageByRegion ( $this->data ['teamInfo'] ['region_id'] );
		
		$usedProductStorage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_PRODUCT, $this->data ['teamInfo'] ['id'], '', $this->data ['teamInfo'] ['region_id'], PRODUCT_STATUS_USED );
		
		foreach ( $usedProductStorage as $uKey => $uValue ) {
			$product = $this->Products_model->getProductById ( $uValue ['item_id'] );
			$usedProductStorage [$uKey] ['product_name'] = $product ['name'];
		}
		
		$this->data ['usedProducts'] = $usedProductStorage;
		$this->data ['reycleMethods'] = group_array_key ( $this->Recyclemethods_model->getRecycleMethodByGameId ( 0, $this->data ['teamInfo'] ['current_round'], $this->data ['teamInfo'] ['id'] ), 'method_code' );
		// Get region factor for team
		$regionInfo = reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $this->data ['userData'] ['roundId'], $this->data ['teamInfo'] ['region_id'], $this->data ['userData'] ['gameId'], $this->data ['teamInfo'] ['id'] ), 'factor_id' );
		// Get region factor for game
		$regionInfo += reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $this->data ['userData'] ['roundId'], $this->data ['teamInfo'] ['region_id'], $this->data ['userData'] ['gameId'], 0 ), 'factor_id' );
		
		foreach ( $this->data ['reycleMethods'] as $mKey => $mValue ) {
			$mValue = reset_array_key ( $mValue, 'factor_id' );
			
			$this->data ['reycleMethods'] [$mKey] ['cost_factor2'] = 1 + pow ( ($regionInfo [REGION_LABOR_COST] ['factor_value'] + $regionInfo [REGION_OSH_COST] ['factor_value'] + $regionInfo [REGION_ENVIRONMENT_REGULATION] ['factor_value']) / 15, 2 );
			
			$this->data ['reycleMethods'] [$mKey] ['cost'] = $mValue [RECYCLE_METHOD_COST] ['factor_value'] * $this->data ['reycleMethods'] [$mKey] ['cost_factor2'] * $regionInfo [REGION_COST_FACTOR_RECYCLE] ['factor_value'];
			
			$this->data ['reycleMethods'] [$mKey] ['return_money'] = $mValue [RECYCLE_METHOD_RETURN_MONEY] ['factor_value'] * $regionInfo [REGION_RECYCLING_QUALITY_FACTOR_1] ['factor_value'] * $regionInfo [REGION_QUALITY_FACTOR_2] ['factor_value'];
			
			$this->data ['reycleMethods'] [$mKey] ['eco_credit'] = $mValue [RECYCLE_METHOD_ECO_CREDIT] ['factor_value'];
			$this->data ['reycleMethods'] [$mKey] ['so_credit'] = $mValue [RECYCLE_METHOD_SO_CREDIT] ['factor_value'];
			$this->data ['reycleMethods'] [$mKey] ['me_credit'] = $mValue [RECYCLE_METHOD_ME_CREDIT] ['factor_value'];
			
			$this->data ['reycleMethods'] [$mKey] ['return_handlebar'] = $mValue [RECYCLE_METHOD_COMPONENT] ['factor_value'] * $regionInfo [REGION_RECYCLING_QUALITY_FACTOR_1] ['factor_value'] * $regionInfo [REGION_QUALITY_FACTOR_2] ['factor_value'];
			$this->data ['reycleMethods'] [$mKey] ['return_frame'] = $mValue [RECYCLE_METHOD_COMPONENT1] ['factor_value'] * $regionInfo [REGION_RECYCLING_QUALITY_FACTOR_1] ['factor_value'] * $regionInfo [REGION_QUALITY_FACTOR_2] ['factor_value'];
			$this->data ['reycleMethods'] [$mKey] ['return_casing'] = $mValue [RECYCLE_METHOD_COMPONENT2] ['factor_value'] * $regionInfo [REGION_RECYCLING_QUALITY_FACTOR_1] ['factor_value'] * $regionInfo [REGION_QUALITY_FACTOR_2] ['factor_value'];
			$this->data ['reycleMethods'] [$mKey] ['return_motor'] = $mValue [RECYCLE_METHOD_COMPONENT3] ['factor_value'] * $regionInfo [REGION_RECYCLING_QUALITY_FACTOR_1] ['factor_value'] * $regionInfo [REGION_QUALITY_FACTOR_2] ['factor_value'];
		}
		
		if ($this->input->post () != false) {
			$recycleData = $this->input->post ();
			// Check the team has enough money for recycling
			$recycleData = $recycleData ['recycle'];
			$cost = $recycleData ['cost'];
			$teamMoney = $this->data ['teamFactorsInfo'] [TEAM_MONEY] ['factor_value'];
			
			if ($cost > $teamMoney) {
				$this->data ['err_msg'] = 'Your team\'s money is not enough to execute recycling process';
			} else {
				
				// minus used product storage
				$productStorage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_PRODUCT, $this->data ['teamInfo'] ['id'], $recycleData ['product_id'], $this->data ['teamInfo'] ['region_id'], PRODUCT_STATUS_USED );
				$storageData ['quantity'] = $productStorage [0] ['quantity'] - $recycleData ['qty'];
				$this->Storages_model->updateStorage ( $productStorage [0] ['id'], $storageData );
				
				// add components to storage
				$components = reset_array_key ( $this->Productcomponents_model->getProductComponentsByProductId ( $recycleData ['product_id'] ), 'component_name' );
				
				/*
				 * Add component to storage
				 */
				
				$handlebarId = $components ['Handle bars'] ['material_id'];
				$frameId = $components ['Frame'] ['material_id'];
				$casingId = $components ['Casing'] ['material_id'];
				$motorId = $components ['Motor'] ['material_id'];
				
				$handlebarStorage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_MATERIAL, $this->data ['teamInfo'] ['id'], $handlebarId, $this->data ['teamInfo'] ['region_id'] );
				$storageData ['quantity'] = $handlebarStorage [0] ['quantity'] + $recycleData ['return_handlebar'];
				$this->Storages_model->updateStorage ( $handlebarStorage [0] ['id'], $storageData );
				
				$frameStorage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_MATERIAL, $this->data ['teamInfo'] ['id'], $frameId, $this->data ['teamInfo'] ['region_id'] );
				$storageData ['quantity'] = $frameStorage [0] ['quantity'] + $recycleData ['return_frame'];
				$this->Storages_model->updateStorage ( $frameStorage [0] ['id'], $storageData );
				
				$casingStorage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_MATERIAL, $this->data ['teamInfo'] ['id'], $casingId, $this->data ['teamInfo'] ['region_id'] );
				$storageData ['quantity'] = $casingStorage [0] ['quantity'] + $recycleData ['return_casing'];
				$this->Storages_model->updateStorage ( $casingStorage [0] ['id'], $storageData );
				
				$motorStorage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_MATERIAL, $this->data ['teamInfo'] ['id'], $motorId, $this->data ['teamInfo'] ['region_id'] );
				$storageData ['quantity'] = $motorStorage [0] ['quantity'] + $recycleData ['return_motor'];
				$this->Storages_model->updateStorage ( $motorStorage [0] ['id'], $storageData );
				
				/*
				 * End component to storage
				 */
				
				$newMoney = $this->updateMoney ( $recycleData ['return_money'] );
				$this->recordAction ( RECORD_TYPE_MONEY, $recycleData ['return_money'], 'Return money from recycling.', '', $newMoney );
				
				$newMoney = $this->updateMoney ( $recycleData ['cost'] * (- 1) );
				$this->recordAction ( RECORD_TYPE_MONEY, $recycleData ['cost'] * (- 1), 'Payment for recycling.', '', $newMoney );
				
				$newEco = $this->updateEco ( $recycleData ['return_eco'] );
				$this->recordAction ( RECORD_TYPE_ECO, $recycleData ['return_eco'], 'Bonus for recycling.', '', $newEco );
				
				$newMe = $this->updateMe ( $recycleData ['return_me'] );
				$this->recordAction ( RECORD_TYPE_ME, $recycleData ['return_me'], 'Penalty for recycling.', '', $newMe );
				
				$newSo = $this->updateSo ( $recycleData ['return_so'] );
				$this->recordAction ( RECORD_TYPE_SO, $recycleData ['return_so'], 'Bonus for recycling.', '', $newSo );
				
				redirect ( 'game/recycling/success/recycle' );
			}
		}
		
		$this->data ['curr_step'] = STEP_RECYCLING;
		$this->load->view ( 'frontend/layout/header', $this->data );
		$this->load->view ( 'frontend/game/recycling', $this->data );
		$this->load->view ( 'frontend/layout/footer' );
	}
	public function production() {
		$this->data ['curr_step'] = STEP_PRODUCTION;
		$this->data ['err_msg'] = '';
		$this->data ['lack_components'] = array ();
		
		$fullCapacity = $this->data ['teamFactorsInfo'] [TEAM_FACTORY_CAPACITY] ['factor_value'];
		$usedCapacity = $this->Teamactionrecords_model->getRecordsByTeamId ( $this->data ['userData'] ['teamId'], RECORD_TYPE_FACTORY_CAPACITY, $this->data ['userData'] ['roundId'] );
		
		// Get region factor for team
		$regionFactors = reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $this->data ['userData'] ['roundId'], $this->data ['teamInfo'] ['region_id'], $this->data ['userData'] ['gameId'], $this->data ['teamInfo'] ['id'] ), 'factor_id' );
		// Get region factor for game
		$regionFactors += reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $this->data ['userData'] ['roundId'], $this->data ['teamInfo'] ['region_id'], $this->data ['userData'] ['gameId'], 0 ), 'factor_id' );
		
		// cost factor 1
		$regionCostFactor = $regionFactors [REGION_COST_FACTOR];
		// cost factor 2
		$laborCostImpact = $regionFactors [REGION_LABOR_COST] ['factor_value'];
		$oshImpact = $regionFactors [REGION_OSH_COST] ['factor_value'];
		$environmentRegulationImpact = $regionFactors [REGION_ENVIRONMENT_REGULATION] ['factor_value'];
		$regionCostFactor2 = 1 + pow ( ($laborCostImpact + $oshImpact + $environmentRegulationImpact) / 15, 2 );
		
		$this->data ['regionCostFactor'] = $regionCostFactor ['factor_value'] * $regionCostFactor2;
		
		// get remain capacity
		foreach ( $usedCapacity as $c ) {
			$fullCapacity -= $c ['value'];
		}
		$this->data ['remain_capacity'] = $fullCapacity;
		
		if ($this->input->post () != false) {
			$postData = $this->input->post ();
			$postData = $postData ['production'];
			$availableComponents = array ();
			$lackComponents = array ();
			$isComponentAvailable = true;
			
			$productStorage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_PRODUCT, $this->data ['userData'] ['teamId'], $postData ['product-id'], $this->data ['teamInfo'] ['region_id'], PRODUCT_STATUS_NEW );
			
			if ($postData ['qty'] > $this->getAvailableStorageByRegion ( $this->data ['teamInfo'] ['region_id'] )) {
				$this->data ['err_msg'] = 'The production quantity exceed the storge capacity limit. Production can not be executed.';
			} else {
				
				// Get component list of product
				$this->load->model ( 'Productcomponents_model' );
				$componentList = $this->Productcomponents_model->getProductComponentsByProductId ( $postData ['product-id'] );
				
				// Check if component is enough for production
				foreach ( $componentList as $c ) {
					// Minus component in storage
					$componentStorage = array ();
					$componentStorage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_MATERIAL, $this->data ['userData'] ['teamId'], $c ['material_id'], $this->data ['teamInfo'] ['region_id'] );
					
					if ($componentStorage == null) {
						$isComponentAvailable = false;
						$lackCom = array ();
						$lackCom ['component_name'] = $c ['component_name'] . ' - ' . $c ['material_name'];
						$lackComponents [] = $lackCom;
					} else {
						
						if (isset ( $componentStorage [0] )) {
							$componentStorage [0] ['quantity'] -= $postData ['qty'] * 1;
							if ($componentStorage [0] ['quantity'] < 0) {
								$isComponentAvailable = false;
								$componentStorage [0] ['component_name'] = $c ['component_name'] . ' - ' . $c ['material_name'];
								$lackComponents [] = $componentStorage [0];
							} else {
								$availableComponents [] = $componentStorage [0];
							}
						}
					}
				}
				
				// Only start production when components are available
				if ($isComponentAvailable == true) {
					// Update components storage
					foreach ( $availableComponents as $c ) {
						$this->Storages_model->updateStorage ( $c ['id'], $c );
					}
					
					// Add product to storage
					$storageData = array ();
					$storageData ['item_type'] = ITEM_STORE_TYPE_PRODUCT;
					$storageData ['item_id'] = $postData ['product-id'];
					$storageData ['quantity'] = $postData ['qty'];
					$storageData ['team_id'] = $this->data ['userData'] ['teamId'];
					$storageData ['region_id'] = $this->data ['teamInfo'] ['region_id'];
					$storageData ['status'] = PRODUCT_STATUS_NEW;
					$productStorage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_PRODUCT, $this->data ['userData'] ['teamId'], $postData ['product-id'], $this->data ['teamInfo'] ['region_id'], PRODUCT_STATUS_NEW );
					if ($productStorage != null) {
						$storageData ['quantity'] = $storageData ['quantity'] + $productStorage [0] ['quantity'];
						$this->Storages_model->updateStorage ( $productStorage [0] ['id'], $storageData );
					} else {
						$this->Storages_model->addStorage ( $storageData );
					}
					
					// Log change of capacity
					$this->recordAction ( RECORD_TYPE_FACTORY_CAPACITY, $postData ['qty'], 'Manufacture products', $postData ['product-id'] );
					
					// Update team money after payment
					$newMoney = $this->updateMoney ( - 1 * $postData ['cost'] );
					
					// Log change of money
					$this->recordAction ( RECORD_TYPE_MONEY, '-' . $postData ['cost'], 'Paymnent for manufacturing product.', '', $newMoney );
					
					// Get region factor for team
					$regionFactors = reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $this->data ['userData'] ['roundId'], $this->data ['teamInfo'] ['region_id'], $this->data ['userData'] ['gameId'], $this->data ['teamInfo'] ['id'] ), 'factor_id' );
					// Get region factor for game
					$regionFactors += reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $this->data ['userData'] ['roundId'], $this->data ['teamInfo'] ['region_id'], $this->data ['userData'] ['gameId'], 0 ), 'factor_id' );
					
					// Minus ECO credit for producion
					$minusEco = $postData ['qty'] * $regionFactors [REGION_ECO_CREDIT_PRODUCTION] ['factor_value'] * (- 1);
					$newEco = $this->updateEco ( $minusEco );
					$this->recordAction ( RECORD_TYPE_ECO, $minusEco, 'Descrease ECO credit due to production.', '', $newEco );
					
					redirect ( 'game/production/success/produce' );
				} else {
					$this->data ['err_msg'] = 'Some components are not enough for production.';
					$this->data ['lack_components'] = $lackComponents;
				}
			}
		}
		
		$this->data ['successAction'] = $this->uri->segment ( 4 );
		
		// get product list
		$this->load->model ( 'Products_model' );
		$this->data ['developedProduct'] = $this->Products_model->getProductsByTeamId ( $this->data ['userData'] ['teamId'] );
		
		// get production records
		$this->data ['production-record'] = $this->Teamactionrecords_model->getRecordsByTeamId ( $this->data ['userData'] ['teamId'], RECORD_TYPE_FACTORY_CAPACITY, $this->data ['userData'] ['roundId'] );
		foreach ( $this->data ['production-record'] as $k => $p ) {
			foreach ( $this->data ['developedProduct'] as $pr ) {
				if ($p ['product_id'] == $pr ['id']) {
					$p ['product_name'] = $pr ['name'];
					$p ['price'] = $pr ['manufacturing_cost'];
					$p ['total_cost'] = $pr ['manufacturing_cost'] * $p ['value'];
					$this->data ['productionRecord'] [$k] = $p;
					break;
				}
			}
		}
		
		$this->load->view ( 'frontend/layout/header', $this->data );
		$this->load->view ( 'frontend/game/production', $this->data );
		$this->load->view ( 'frontend/layout/footer' );
	}
	public function transport() {
		if ($this->input->post () != false) {
			$postData = $this->input->post ();
			
			/*
			 * Transport new product
			 */
			if (! empty ( $postData ['transport'] )) {
				$transportData = $postData ['transport'];
				$totalTransportCost = 0;
				$overWarehouseCost = 0;
				$usedProductTransport = array ();
				// Get transport data from each region
				foreach ( $transportData as $trKey => $trValue ) {
					// Get transport product in each region
					foreach ( $trValue as $tp ) {
						if ($tp ['qty'] > 0) {
							$totalTransportCost += $tp ['transport-cost'];
							
							// Get region factor for team
							$regionFactors = reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $this->data ['userData'] ['roundId'], $trKey, $this->data ['userData'] ['gameId'], $this->data ['teamInfo'] ['id'] ), 'factor_id' );
							// Get region factor for game
							$regionFactors += reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $this->data ['userData'] ['roundId'], $trKey, $this->data ['userData'] ['gameId'], 0 ), 'factor_id' );
							// Minus ECO credit for producion
							
							$minusEco = $tp ['qty'] * $regionFactors [REGION_ECO_CREDIT_TRANSPORT] ['factor_value'] * (- 1);
							
							$newEco = $this->updateEco ( $minusEco );
							$this->recordAction ( RECORD_TYPE_ECO, $minusEco, 'Descrease ECO credit due to transportation.', '', $newEco );
							
							$currentStorage = array ();
							$destinationStorage = array ();
							
							// Calculate over warehouse cost
							$availableWarehouseCapacity = $this->getAvailableStorageByRegion ( $tp ['to-region'] );
							$availableWarehouseCapacity -= $tp ['qty'];
							if ($availableWarehouseCapacity < 0) {
								$overWarehouseCost += abs ( $availableWarehouseCapacity ) * COST_OVER_CAPACITY_WAREHOUSE;
							}
							
							// Minus product qty in current storage
							$currentStorage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_PRODUCT, $this->data ['userData'] ['teamId'], $tp ['item-id'], $trKey, PRODUCT_STATUS_NEW );
							$currentStorage [0] ['quantity'] -= $tp ['qty'];
							
							$this->Storages_model->updateStorage ( $currentStorage [0] ['id'], $currentStorage [0] );
							
							// Plus productqty in destination storage
							$destinationStorage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_PRODUCT, $this->data ['userData'] ['teamId'], $tp ['item-id'], $tp ['to-region'], PRODUCT_STATUS_NEW );
							if (empty ( $destinationStorage )) {
								$storageData = array ();
								$storageData ['item_type'] = ITEM_STORE_TYPE_PRODUCT;
								$storageData ['item_id'] = $tp ['item-id'];
								$storageData ['quantity'] = $tp ['qty'];
								$storageData ['team_id'] = $this->data ['userData'] ['teamId'];
								$storageData ['region_id'] = $tp ['to-region'];
								$storageData ['status'] = PRODUCT_STATUS_NEW;
								
								$this->Storages_model->addStorage ( $storageData );
							} else {
								$destinationStorage [0] ['quantity'] += $tp ['qty'];
								$this->Storages_model->updateStorage ( $destinationStorage [0] ['id'], $destinationStorage [0] );
							}
						}
					}
				}
				
				// Update over warehouse cost
				if ($overWarehouseCost > 0) {
					$overWarehouseCost = - 1 * $overWarehouseCost;
					$newMoneyAmt = $this->updateMoney ( $overWarehouseCost );
					$this->recordAction ( RECORD_TYPE_MONEY, $overWarehouseCost, 'Paymnent for over warehouse capacity after proceeding product transportation.', '', $newMoneyAmt );
				}
				$totalTransportCost = - 1 * $totalTransportCost;
				// Update team money after payment
				if (abs ( $totalTransportCost ) > 0) {
					$newMoneyAmt = $this->updateMoney ( $totalTransportCost );
					// Log change of money
					$this->recordAction ( RECORD_TYPE_MONEY, $totalTransportCost, 'Paymnent for product transport.', '', $newMoneyAmt );
				}
			}
			
			/*
			 * Transport used product
			 */
			if (! empty ( $postData ['usedtransport'] )) {
				$transportData = $postData ['usedtransport'];
				$totalTransportCost = 0;
				$overWarehouseCost = 0;
				$usedProductTransport = array ();
				// Get transport data from each region
				foreach ( $transportData as $trKey => $trValue ) {
					// Get transport product in each region
					foreach ( $trValue as $tp ) {
						
						if ($tp ['qty'] > 0) {
							$totalTransportCost += $tp ['transport-cost'];
							$overWarehouseCost = 0;
							
							// Get region factor for team
							$regionFactors = reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $this->data ['userData'] ['roundId'], $trKey, $this->data ['userData'] ['gameId'], $this->data ['teamInfo'] ['id'] ), 'factor_id' );
							// Get region factor for game
							$regionFactors += reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $this->data ['userData'] ['roundId'], $trKey, $this->data ['userData'] ['gameId'], 0 ), 'factor_id' );
							// Minus ECO credit for producion
							
							$minusEco = $tp ['qty'] * $regionFactors [REGION_ECO_CREDIT_TRANSPORT] ['factor_value'] * (- 1);
							
							$newEco = $this->updateEco ( $minusEco );
							$this->recordAction ( RECORD_TYPE_ECO, $minusEco, 'Descrease ECO credit due to transportation.', '', $newEco );
							
							$currentStorage = array ();
							$destinationStorage = array ();
							
							// Calculate over warehouse cost
							$availableWarehouseCapacity = $this->getAvailableStorageByRegion ( $tp ['to-region'] );
							$availableWarehouseCapacity -= $tp ['qty'];
							if ($availableWarehouseCapacity < 0) {
								$overWarehouseCost += abs ( $availableWarehouseCapacity ) * COST_OVER_CAPACITY_WAREHOUSE;
							}
							
							// Minus product qty in current storage
							$currentStorage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_PRODUCT, $this->data ['userData'] ['teamId'], $tp ['item-id'], $trKey, PRODUCT_STATUS_USED );
							$currentStorage [0] ['quantity'] -= $tp ['qty'];
							
							$this->Storages_model->updateStorage ( $currentStorage [0] ['id'], $currentStorage [0] );
							
							// Plus productqty in destination storage
							$destinationStorage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_PRODUCT, $this->data ['userData'] ['teamId'], $tp ['item-id'], $tp ['to-region'], PRODUCT_STATUS_USED );
							if (empty ( $destinationStorage )) {
								$storageData = array ();
								$storageData ['item_type'] = ITEM_STORE_TYPE_PRODUCT;
								$storageData ['item_id'] = $tp ['item-id'];
								$storageData ['quantity'] = $tp ['qty'];
								$storageData ['team_id'] = $this->data ['userData'] ['teamId'];
								$storageData ['region_id'] = $tp ['to-region'];
								$storageData ['status'] = PRODUCT_STATUS_USED;
								
								$this->Storages_model->addStorage ( $storageData );
							} else {
								$destinationStorage [0] ['quantity'] += $tp ['qty'];
								$this->Storages_model->updateStorage ( $destinationStorage [0] ['id'], $destinationStorage [0] );
							}
						}
					}
				}
				
				// Update over warehouse cost
				if ($overWarehouseCost > 0) {
					$overWarehouseCost = - 1 * $overWarehouseCost;
					$newMoneyAmt = $this->updateMoney ( $overWarehouseCost );
					$this->recordAction ( RECORD_TYPE_MONEY, $overWarehouseCost, 'Paymnent for over warehouse capacity after proceeding product transportation.', '', $newMoneyAmt );
				}
				$totalTransportCost = - 1 * $totalTransportCost;
				// Update team money after payment
				if (abs ( $totalTransportCost ) > 0) {
					$newMoneyAmt = $this->updateMoney ( $totalTransportCost );
					// Log change of money
					$this->recordAction ( RECORD_TYPE_MONEY, $totalTransportCost, 'Paymnent for product transport.', '', $newMoneyAmt );
				}
			}
			
			redirect ( 'game/transport/success/transport' );
		}
		
		$this->data ['successAction'] = $this->uri->segment ( 4 );
		
		$this->load->model ( 'Products_model' );
		$this->data ['curr_step'] = STEP_TRANSPORT;
		$this->data ['regionList'] = $this->getRegionList ();
		
		// Get storage capacity
		$this->data ['store_capacity'] [REGION_INDUSTRIAL_COUNTRY] = $this->data ['teamFactorsInfo'] [TEAM_STORAGE_CAPACITY_IC] ['factor_value'];
		$this->data ['store_capacity'] [REGION_EMERGING_COUNTRY_1] = $this->data ['teamFactorsInfo'] [TEAM_STORAGE_CAPACITY_EC1] ['factor_value'];
		$this->data ['store_capacity'] [REGION_EMERGING_COUNTRY_2] = $this->data ['teamFactorsInfo'] [TEAM_STORAGE_CAPACITY_EC2] ['factor_value'];
		$this->data ['store_capacity'] [REGION_DEVELOPMENT_COUNTRY] = $this->data ['teamFactorsInfo'] [TEAM_STORAGE_CAPACITY_DC] ['factor_value'];
		
		$this->data ['available_capacity'] [REGION_INDUSTRIAL_COUNTRY] = $this->getAvailableStorageByRegion ( REGION_INDUSTRIAL_COUNTRY );
		$this->data ['available_capacity'] [REGION_EMERGING_COUNTRY_1] = $this->getAvailableStorageByRegion ( REGION_EMERGING_COUNTRY_1 );
		$this->data ['available_capacity'] [REGION_EMERGING_COUNTRY_2] = $this->getAvailableStorageByRegion ( REGION_EMERGING_COUNTRY_2 );
		$this->data ['available_capacity'] [REGION_DEVELOPMENT_COUNTRY] = $this->getAvailableStorageByRegion ( REGION_DEVELOPMENT_COUNTRY );
		
		// Get product storage capacity
		$product_storage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_PRODUCT, $this->data ['userData'] ['teamId'], null, null, PRODUCT_STATUS_NEW );
		$this->data ['developedProduct'] = $this->Products_model->getProductsByTeamId ( $this->data ['userData'] ['teamId'] );
		
		foreach ( $product_storage as $k => $p ) {
			foreach ( $this->data ['developedProduct'] as $pr ) {
				if ($p ['item_id'] == $pr ['id']) {
					$p ['product_name'] = $pr ['name'];
					$p ['price'] = $pr ['manufacturing_cost'];
					$product_storage [$k] = $p;
					break;
				}
			}
		}
		$this->data ['product_storage'] = group_array_key ( $product_storage, 'region_id' );
		
		// Get used product storage capacity
		$used_product_storage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_PRODUCT, $this->data ['userData'] ['teamId'], null, null, PRODUCT_STATUS_USED );
		
		foreach ( $used_product_storage as $k => $p ) {
			foreach ( $this->data ['developedProduct'] as $pr ) {
				if ($p ['item_id'] == $pr ['id']) {
					$p ['product_name'] = $pr ['name'];
					$p ['price'] = $pr ['manufacturing_cost'];
					$used_product_storage [$k] = $p;
					break;
				}
			}
		}
		$this->data ['used_product_storage'] = group_array_key ( $used_product_storage, 'region_id' );
		
		// Get transport regions for each region
		$tranportRegion = array ();
		$regionList = $this->getRegionList ();
		foreach ( $regionList as $rKey => $rValue ) {
			$regionList2 = $this->getRegionList ();
			unset ( $regionList2 [$rKey] );
			$tranportRegion [$rKey] = $regionList2;
		}
		$this->data ['transport_region'] = $tranportRegion;
		
		// Get region factor setting by game master
		$regionInfo = array ();
		$this->load->model ( 'Regions_model' );
		foreach ( $regionList as $value ) {
			$regionInfo [$value ['id']] = reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $this->data ['userData'] ['roundId'], $value ['id'], $this->data ['userData'] ['gameId'], $this->data ['teamInfo'] ['id'] ), 'factor_id' );
			$regionInfo [$value ['id']] += reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $this->data ['userData'] ['roundId'], $value ['id'], $this->data ['userData'] ['gameId'] ), 'factor_id' );
		}
		
		$transportCost = array ();
		// Get tranposrt cost for each region
		foreach ( $regionList as $rKey => $rValue ) {
			foreach ( $tranportRegion [$rKey] as $trKey => $trValue ) {
				
				$costFactor2 = 1 + pow ( ($regionInfo [$rKey] [REGION_LABOR_COST] ['factor_value'] 
						+ $regionInfo [$rKey] [REGION_OSH_COST] ['factor_value'] + $regionInfo [$rKey] [REGION_ENVIRONMENT_REGULATION] ['factor_value']) / 15, 2 );
				
				switch ($trValue ['id']) {
					case REGION_INDUSTRIAL_COUNTRY :
						$transportCost [$rKey] [$trValue ['id']] = $regionInfo [$rKey] [REGION_TRANSPORT_COST_IC] ["factor_value"] 
						* $regionInfo [$rKey] [REGION_COST_FACTOR_TRANSPORT] ["factor_value"];
						break;
					case REGION_EMERGING_COUNTRY_1 :
						$transportCost [$rKey] [$trValue ['id']] = $regionInfo [$rKey] [REGION_TRANSPORT_COST_EC1] ["factor_value"] 
						* $regionInfo [$rKey] [REGION_COST_FACTOR_TRANSPORT] ["factor_value"];
						break;
					case REGION_EMERGING_COUNTRY_2 :
						$transportCost [$rKey] [$trValue ['id']] = $regionInfo [$rKey] [REGION_TRANSPORT_COST_EC2] ["factor_value"] 
						* $regionInfo [$rKey] [REGION_COST_FACTOR_TRANSPORT] ["factor_value"];
						break;
					case REGION_DEVELOPMENT_COUNTRY :
						$transportCost [$rKey] [$trValue ['id']] = $regionInfo [$rKey] [REGION_TRANSPORT_COST_DC] ["factor_value"] 
						* $regionInfo [$rKey] [REGION_COST_FACTOR_TRANSPORT] ["factor_value"];
						break;
				}
			}
		}
		
		$this->data ['transport_cost'] = $transportCost;
		$this->load->view ( 'frontend/layout/header', $this->data );
		$this->load->view ( 'frontend/game/transport', $this->data );
		$this->load->view ( 'frontend/layout/footer' );
	}
	public function sales() {
		$this->load->model ( 'Sales_model' );
		if ($this->input->post () != false) {
			$postData = $this->input->post ();
			$saleData = $postData ['sale'];
			foreach ( $saleData as $rsKey => $rsValue ) {
				foreach ( $rsValue as $s ) {
					$checkData = $this->Sales_model->getSalesByTeamAndRound ( $this->data ['userData'] ['teamId'], $this->data ['userData'] ['roundId'], $rsKey, $s ['id'] );
					if (! empty ( $checkData )) {
						$checkData [0] ['quantity'] = $s ['qty'];
						$checkData [0] ['offer_price'] = $s ['offer'];
						$this->Sales_model->updateSales ( $checkData [0] );
					} else {
						if ($s ['qty'] > 0) {
							$sale = array ();
							$sale ['quantity'] = $s ['qty'];
							$sale ['team_id'] = $this->data ['userData'] ['teamId'];
							$sale ['round_id'] = $this->data ['userData'] ['roundId'];
							$sale ['region_id'] = $rsKey;
							$sale ['product_id'] = $s ['id'];
							$sale ['offer_price'] = $s ['offer'];
							$this->Sales_model->addSales ( $sale );
						}
					}
				}
			}
			
			redirect ( 'game/sales/success/sale' );
		}
		
		$this->data ['successAction'] = $this->uri->segment ( 4 );
		
		$this->data ['curr_step'] = STEP_SALE;
		$this->data ['regionList'] = $this->getRegionList ();
		
		$this->load->model ( 'Products_model' );
		$this->load->model ( 'Storages_model' );
		
		$product_storage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_PRODUCT, $this->data ['userData'] ['teamId'], null, null, PRODUCT_STATUS_NEW );
		$this->data ['developedProduct'] = $this->Products_model->getProductsByTeamId ( $this->data ['userData'] ['teamId'] );
		$return_product_storage = array ();
		foreach ( $product_storage as $k => $p ) {
			foreach ( $this->data ['developedProduct'] as $pr ) {
				if ($p ['item_id'] == $pr ['id']) {
					$p ['product_name'] = $pr ['name'];
					$p ['price'] = $pr ['manufacturing_cost'];
					$return_product_storage [$k] = $p;
					break;
				}
			}
		}
		
		$return_product_storage = group_array_key ( $return_product_storage, 'region_id' );
		$this->data ['product_storage'] = $return_product_storage;
		
		// Get sale data
		foreach ( $this->data ['regionList'] as $r ) {
			$this->data ['sale_data'] [$r ['id']] = reset_array_key ( $this->Sales_model->getSalesByTeamAndRound ( $this->data ['userData'] ['teamId'], $this->data ['userData'] ['roundId'], $r ['id'] ), 'product_id' );
		}
		
		$this->load->view ( 'frontend/layout/header', $this->data );
		$this->load->view ( 'frontend/game/sales', $this->data );
		$this->load->view ( 'frontend/layout/footer' );
	}
	public function information() {
		$this->data ['curr_step'] = STEP_INFORMATION;
		
		$this->load->view ( 'frontend/layout/header', $this->data );
		$this->load->view ( 'frontend/game/information', $this->data );
		$this->load->view ( 'frontend/layout/footer' );
	}
	public function getproduct($productId = null) {
		$return = array ();
		$return ['info'] = array ();
		if ($productId != null) {
			$this->load->model ( 'Products_model' );
			$this->load->model ( 'Productcomponents_model' );
			$return ['info'] = $this->Products_model->getProductById ( $productId );
			$return ['info'] ['component'] = reset_array_key ( $this->Productcomponents_model->getProductComponentsByProductId ( $return ['info'] ['id'] ), 'component_id' );
		}
		echo json_encode ( $return );
		exit ();
	}
	public function updateMoney($money) {
		$this->data ['teamFactorsInfo'] [TEAM_MONEY] ['factor_value'] += $money;
		$this->Teamfactors_model->updateTeamFactor ( $this->data ['userData'] ['teamId'], $this->data ['teamFactorsInfo'] [TEAM_MONEY], $this->data ['teamInfo'] ['current_round'] );
		return $this->data ['teamFactorsInfo'] [TEAM_MONEY] ['factor_value'];
	}
	public function updateEco($eco) {
		$this->data ['teamFactorsInfo'] [TEAM_ECO_CREDIT] ['factor_value'] += $eco;
		$this->Teamfactors_model->updateTeamFactor ( $this->data ['userData'] ['teamId'], $this->data ['teamFactorsInfo'] [TEAM_ECO_CREDIT], $this->data ['teamInfo'] ['current_round'] );
		return $this->data ['teamFactorsInfo'] [TEAM_ECO_CREDIT] ['factor_value'];
	}
	public function updateMe($me) {
		$this->data ['teamFactorsInfo'] [TEAM_ME_CREDIT] ['factor_value'] += $me;
		$this->Teamfactors_model->updateTeamFactor ( $this->data ['userData'] ['teamId'], $this->data ['teamFactorsInfo'] [TEAM_ME_CREDIT], $this->data ['teamInfo'] ['current_round'] );
		return $this->data ['teamFactorsInfo'] [TEAM_ME_CREDIT] ['factor_value'];
	}
	public function updateSo($so) {
		$this->data ['teamFactorsInfo'] [TEAM_SO_CREDIT] ['factor_value'] += $so;
		$this->Teamfactors_model->updateTeamFactor ( $this->data ['userData'] ['teamId'], $this->data ['teamFactorsInfo'] [TEAM_SO_CREDIT], $this->data ['teamInfo'] ['current_round'] );
		return $this->data ['teamFactorsInfo'] [TEAM_SO_CREDIT] ['factor_value'];
	}
	public function recordAction($key, $value, $description = '', $productId = '', $newValue = '') {
		$actionRecord = array ();
		$actionRecord ['key'] = $key;
		$actionRecord ['value'] = $value;
		$actionRecord ['new_value'] = $newValue;
		$actionRecord ['game_id'] = $this->data ['teamInfo'] ['game_id'];
		$actionRecord ['round_id'] = $this->data ['userData'] ['roundId'];
		$actionRecord ['team_id'] = $this->data ['userData'] ['teamId'];
		$actionRecord ['region_id'] = '';
		$actionRecord ['product_id'] = $productId;
		$actionRecord ['description'] = $description;
		$this->Teamactionrecords_model->addRecord ( $actionRecord );
	}
	public function getAvailableStorageByRegion($regionId) {
		$factorKey = '';
		switch ($regionId) {
			case REGION_INDUSTRIAL_COUNTRY :
				$factorKey = TEAM_STORAGE_CAPACITY_IC;
				break;
			case REGION_EMERGING_COUNTRY_1 :
				$factorKey = TEAM_STORAGE_CAPACITY_EC1;
				break;
			case REGION_EMERGING_COUNTRY_2 :
				$factorKey = TEAM_STORAGE_CAPACITY_EC2;
				break;
			case REGION_DEVELOPMENT_COUNTRY :
				$factorKey = TEAM_STORAGE_CAPACITY_DC;
				break;
		}
		
		$warehouseCapacity = 0;
		if ($factorKey != '') {
			// Get setting capacity
			$warehouseCapacity = $this->data ['teamFactorsInfo'] [$factorKey] ['factor_value'];
			
			// Get product storage capacity
			$totalProductStorage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_PRODUCT, $this->data ['userData'] ['teamId'], null, $regionId );
			
			foreach ( $totalProductStorage as $k => $p ) {
				$warehouseCapacity -= $p ['quantity'];
			}
			
			if ($warehouseCapacity < 0) {
				$warehouseCapacity = 0;
			}
		}
		
		return $warehouseCapacity;
	}
	
	
	public function checkRecycle($teamId) {
		$this->load->model ( 'Recycledata_model' );
		// Get recycle data for previous round
		$data ['recycle_data'] = $this->Recycledata_model->getRecycleDataByTeamIdAndRoundId ( $teamId, $this->data ['teamInfo'] ['current_round'] - 1, RECYCLE_STATUS_OFFER );
		foreach ( $data ['recycle_data'] as $rKey => $rValue ) {
			// $data['recycle_data'][$rKey]['cost'] = $rValue;
			$data ['recycle_data'] [$rKey] ['region_name'] = $this->getRegionNameById ( $rValue ['region_id'] );
			$data ['recycle_data'] [$rKey] ['available_capacity'] = $this->getAvailableStorageByRegion ( $rValue ['region_id'] );
		}
		
		echo json_encode ( $data );
		exit ();
	}
	public function rejectRecycle($teamId) {
		$this->load->model ( 'Recycledata_model' );
		// Get recycle data for previous round
		$recycleData = $this->Recycledata_model->getRecycleDataByTeamIdAndRoundId ( $teamId, $this->data ['teamInfo'] ['current_round'] - 1 );
		foreach ( $recycleData as $r ) {
			$r ['status'] = RECYCLE_STATUS_REJECT;
			$this->Recycledata_model->updateRecycleData ( $r ['id'], $r );
		}
		
		$data ['result'] = true;
		echo json_encode ( $data );
		exit ();
	}
	public function approveRecycle($teamId) {
		$this->load->model ( 'Recycledata_model' );
		$result = array ();
		$result ['result'] = false;
		
		if ($this->input->post () != false) {
			$data = $this->input->post ();
			
			$recycleData = reset_array_key ( $this->Recycledata_model->getRecycleDataByTeamIdAndRoundId ( $teamId, $this->data ['teamInfo'] ['current_round'] - 1 ), 'id' );
			
			foreach ( $data ['recycle_data'] as $rKey => $rData ) {
				if ($rData ['qty'] > 0) {
					// Update team storage
					$storageData = array ();
					$storageData ['item_type'] = ITEM_STORE_TYPE_PRODUCT;
					$storageData ['item_id'] = $rData ['product_id'];
					$storageData ['quantity'] = $rData ['qty'];
					$storageData ['team_id'] = $teamId;
					$storageData ['region_id'] = $rData ['region_id'];
					$storageData ['status'] = PRODUCT_STATUS_USED;
					$productStorage = $this->Storages_model->getStoragesByTypeAndTeamId ( ITEM_STORE_TYPE_PRODUCT, $teamId, $rData ['product_id'], $rData ['region_id'], PRODUCT_STATUS_USED );
					if ($productStorage != null) {
						$storageData ['quantity'] = $storageData ['quantity'] + $productStorage [0] ['quantity'];
						$this->Storages_model->updateStorage ( $productStorage [0] ['id'], $storageData );
					} else {
						$this->Storages_model->addStorage ( $storageData );
					}
				}
				// Update status
				$recycleData [$rKey] ['status'] = RECYCLE_STATUS_APPROVE;
				$recycleData [$rKey] ['return_qty'] = $rData;
				$this->Recycledata_model->updateRecycleData ( $rKey, $recycleData [$rKey] );
			}
			$result ['result'] = true;
		}
		echo json_encode ( $result );
		exit ();
	}
}
