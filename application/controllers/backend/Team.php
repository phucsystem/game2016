<?php
class Team extends Backend_Controller {
	function __construct() {
		parent::__construct ();
		$this->load->library ( 'session' );
		$this->data ['curr_step'] = STEP_MASTER_TEAM;
		$this->load->model ( 'Teams_model' );
		$this->load->model ( 'Teamfactors_model' );
		$this->load->model ( 'Components_model' );
		$this->load->model ( 'Componentmaterials_model' );
		$this->load->model ( 'Events_model' );
		$this->load->model ( 'Teamregionfactors_model' );
		$this->load->model ( 'Users_model' );
		$this->load->model ( 'Gamesettings_model' );
		$this->load->model ( 'Regions_model' );
		$this->load->model ( 'Recyclemethods_model' );
		$this->load->model ( 'Chartdata_model' );
		
		$this->is_master_logged_in ();
	}
	public function index() {
		$this->data ['successAction'] = $this->uri->segment ( 4 );
		$this->data ['teams'] = $this->Teams_model->getTeams ();
		
		foreach ( $this->data ['teams'] as $key => $value ) {
			$this->data ['teams'] [$key] ['region_name'] = $this->getRegionNameById ( $value ['region_id'] );
		}
		
		$this->load->view ( 'backend/layout/header', $this->data );
		$this->load->view ( 'backend/team/index', $this->data );
		$this->load->view ( 'backend/layout/footer', $this->data );
	}
	public function add() {
		if ($this->input->post () != false) {
			
			$retData = array ();
			$retData ['result'] = false;
			
			$postData = $this->input->post ();
			$factors = array ();
			parse_str ( $postData ['factors'], $factors );
			
			$newTeamId = $this->Teams_model->addTeam ();
			
			/*
			 * Add team factor value
			 */
			foreach ( $factors ['factor'] as $factorKey => $factorValue ) {
				$factorData = array ();
				$factorData ['round_id'] = 1;
				$factorData ['team_id'] = $newTeamId;
				$factorData ['factor_id'] = $factorKey;
				$factorData ['factor_value'] = $factorValue;
				$this->Teamfactors_model->addTeamFactor ( $factorData );
				
				$chartData = array();
				$chartData['team_id'] = $newTeamId;
				$chartData['round_id'] = 1;
				
				switch ($factorKey) {
					case TEAM_ECO_CREDIT :
						$chartData['factor_key'] = $factorKey;
						$chartData['factor_value'] = $factorValue;
						$this->Chartdata_model->add($chartData);
						break;
					case TEAM_SO_CREDIT :
						$chartData['factor_key'] = $factorKey;
						$chartData['factor_value'] = $factorValue;
						$this->Chartdata_model->add($chartData);
						break;
					case TEAM_ME_CREDIT :
						$chartData['factor_key'] = $factorKey;
						$chartData['factor_value'] = $factorValue;
						$this->Chartdata_model->add($chartData);
						break;
					case TEAM_MONEY :
						$chartData['factor_key'] = $factorKey;
						$chartData['factor_value'] = $factorValue;
						$this->Chartdata_model->add($chartData);
						break;
				}
			}
			
			$retData ['result'] = true;
			$retData ['team_id'] = $newTeamId;
			
			echo json_encode ( $retData );
			exit ();
		}
		$this->showData ();
		$this->data ['teamFactorInfo'] = reset_array_key ( $this->Teamfactors_model->getFactorsByTeamIdAndRoundId ( 0, 1 ), 'factor_id' );
		
		$this->data ['success_add_link'] = site_url ( 'master/team/success/add' );
		
		$this->load->view ( 'backend/layout/header', $this->data );
		$this->load->view ( 'backend/team/add', $this->data );
		$this->load->view ( 'backend/layout/footer' );
	}
	public function add_round($teamId) {
		if ($this->input->post () != false) {
			$retData = array ();
			$retData ['result'] = false;
			$postData = $this->input->post ();
			$teamInfo = $this->Teams_model->getTeam ( $teamId );
			$this->load->model ( 'Regions_model' );
			
			/**
			 * Save round setting for team
			 */
			foreach ( $postData ['round'] as $roundKey => $roundValue ) {
				
				/*
				 * Save manufacturing factors
				 */
				$newFactor = array ();
				$newFactor ['round_id'] = $roundKey;
				$newFactor ['team_id'] = $teamId;
				foreach ( $roundValue ['factor'] as $factorKey => $factorValue ) {
					$newFactor ['factor_id'] = $factorKey;
					$newFactor ['factor_value'] = $factorValue;
					$this->Teamfactors_model->addTeamFactor ( $newFactor );
				}
				
				$newComponent = array ();
				$newComponent ['round_id'] = $roundKey;
				$newComponent ['team_id'] = $teamId;
				$newComponent ['game_id'] = $teamInfo ['game_id'];
				foreach ( $roundValue ['component'] as $componentKey => $componentValue ) {
					$newComponent ['name'] = $componentValue ['factor'] ['name'];
					$newComponent ['inhouse_manufacturing'] = $componentValue ['factor'] ['inhouse_manufacturing'];
					$newComponent ['require'] = $componentValue ['factor'] ['require'];
					
					$newComponentId = $this->Components_model->addComponent ( $newComponent );
					
					$componentMaterial = array ();
					$componentMaterial ['component_id'] = $newComponentId;
					$componentMaterial ['team_id'] = $teamId;
					$componentMaterial ['game_id'] = $teamInfo ['game_id'];
					$componentMaterial ['round_id'] = $roundKey;
					
					foreach ( $componentValue ['material'] as $materialKey => $materialValue ) {
						$componentMaterial ['name'] = $materialValue ['name'];
						$componentMaterial ['cost'] = $materialValue ['cost'];
						$componentMaterial ['range'] = $materialValue ['range'];
						$componentMaterial ['design'] = $materialValue ['design'];
						$componentMaterial ['reliability'] = $materialValue ['reliability'];
						$componentMaterial ['image'] = $materialValue ['image'];
						
						$this->Componentmaterials_model->addMaterial ( $componentMaterial );
					}
				}
				
				/*
				 * Add region factor data
				 */
				$regionData = array ();
				$regionData = $roundValue ['region'];
				foreach ( $regionData as $regionKey => $regionValue ) {
					$regionFactor = array ();
					$regionFactor ['game_id'] = $teamInfo ['game_id'];
					$regionFactor ['team_id'] = $teamId;
					$regionFactor ['round_id'] = $roundKey;
					$regionFactor ['region_id'] = $regionKey;
					
					/*
					 * Insert region factors for each region
					 */
					foreach ( $regionValue ['factor'] as $factorKey => $factorValue ) {
						$regionFactor ['factor_id'] = $factorKey;
						$regionFactor ['factor_value'] = $factorValue;
						$this->Regions_model->addRegion ( $regionFactor );
					}
				}
				
				/*
				 * Insert region recycle methods for each region
				 */
				foreach ( $roundValue ['recycle'] as $recycleKey => $recycleValue ) {
					$recycleMethod = array ();
					$recycleMethod ['method_code'] = $this->uuid->v4 ();
					$recycleMethod ['game_id'] = $teamInfo ['game_id'];
					;
					$recycleMethod ['team_id'] = $teamId;
					$recycleMethod ['round_id'] = $roundKey;
					
					foreach ( $recycleValue ['factor'] as $recycleFactorKey => $recycleFactorValue ) {
						
						$recycleMethod ['factor_id'] = $recycleFactorKey;
						$recycleMethod ['factor_value'] = $recycleFactorValue;
						$this->Recyclemethods_model->addRecycleMethod ( $recycleMethod );
					}
				}
			}
			$retData ['result'] = true;
			echo json_encode ( $retData );
			exit ();
		}
	}
	public function remove() {
		$data ['result'] = false;
		$teamId = $this->uri->segment ( 4 );
		$this->Teams_model->removeTeam ( $teamId );
		$this->Teamfactors_model->removeTeamFactorsByTeamId ( $teamId );
		$this->Components_model->removeComponentsByTeamId ( $teamId );
		$this->Componentmaterials_model->removeMaterialsByTeamId ( $teamId );
		
		$data ['result'] = true;
		echo json_encode ( $data );
		exit ();
	}
	public function edit() {
		$teamId = $this->uri->segment ( 4 );
		
		if ($this->input->post () != false) {
			$retData = array ();
			$retData ['result'] = false;
			$postData = $this->input->post ();
			$factors = array ();
			parse_str ( $postData ['factors'], $factors );
			
			$this->Teams_model->editTeam ( $this->uri->segment ( 4 ) );
			
			/*
			 * Add team factor value
			 */
			foreach ( $factors ['factor'] as $factorKey => $factorValue ) {
				$factorData = array ();
				$factorData ['round_id'] = 1;
				$factorData ['factor_id'] = $factorKey;
				$factorData ['factor_value'] = $factorValue;
				$this->Teamfactors_model->updateTeamFactor ( $this->uri->segment ( 4 ), $factorData );
			}
			
			$retData ['result'] = true;
			
			echo json_encode ( $retData );
			exit ();
		}
		
		$this->data ['success_edit_link'] = site_url ( 'master/team/success/edit' );
		$this->showData ( $teamId );
		
		$this->data ['teamInfo'] = $this->Teams_model->getTeam ( $teamId );
		$this->data ['teamFactorInfo'] = reset_array_key ( $this->Teamfactors_model->getFactorsByTeamId ( $teamId ), 'factor_id' );
		$this->data ['gameInfo'] = $this->Games_model->getGameById ( $this->data ['teamInfo'] ['game_id'] );
		
		// Load default component setting for new game
		$this->data ['components'] = group_array_key ( $this->Components_model->getComponentsByTeamId ( $teamId ), 'round_id' );
		
		foreach ( $this->data ['components'] as $roundComponentkey => $roundComponentValue ) {
			foreach ( $roundComponentValue as $key => $value ) {
				$this->data ['components'] [$roundComponentkey] [$key] ['materials'] = $this->Componentmaterials_model->getMaterialsByComponentId ( $value ['id'] );
			}
		}
		
		$this->data ['teamManufacturingFactors'] = $this->getTeamManufacturingFactors ();
		
		for($i = 1; $i <= $this->data ['gameInfo'] ['number_of_round']; $i ++) {
			$this->data ['teamFactorsInfo'] [$i] = reset_array_key ( $this->Teamfactors_model->getFactorsByTeamIdAndRoundId ( $teamId, $i ), 'factor_id' );
		}
		
		foreach ( $this->getRegionList () as $r ) {
			for($j = 1; $j <= $this->data ['gameInfo'] ['number_of_round']; $j ++) {
				$this->data ['regionInfo'] [$j] [$r ['id']] = reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( $j, $r ['id'], $this->data ['gameInfo'] ['id'], $teamId ), 'factor_id' );
			}
		}
		
		$this->data ['regions'] = $this->getRegionList ();
		$this->data ['regionFactors'] = $this->getRegionFactorsForTeam ();
		
		$this->data ['startNumber'] = 1;
		$this->data ['roundNumber'] = $this->data ['gameInfo'] ['number_of_round'];
		
		$this->data ['roundView'] = $this->load->view ( 'backend/team/round', $this->data, true );
		
		$this->load->view ( 'backend/layout/header', $this->data );
		$this->load->view ( 'backend/team/edit', $this->data );
		$this->load->view ( 'backend/layout/footer' );
	}
	public function edit_default() {
		$teamId = 0;
		
		$this->data ['success_edit_link'] = site_url ( 'master/team/success/edit' );
		$this->showData ();
		
		$this->data ['teamFactorInfo'] = reset_array_key ( $this->Teamfactors_model->getFactorsByTeamId ( $teamId ), 'factor_id' );
		
		// Load default component setting for new game
		$this->data ['components'] = group_array_key ( $this->Components_model->getComponentsByTeamId ( $teamId ), 'round_id' );
		
		foreach ( $this->data ['components'] as $roundComponentkey => $roundComponentValue ) {
			foreach ( $roundComponentValue as $key => $value ) {
				$this->data ['components'] [$roundComponentkey] [$key] ['materials'] = $this->Componentmaterials_model->getMaterialsByComponentId ( $value ['id'] );
			}
		}
		
		$this->data ['teamManufacturingFactors'] = $this->getTeamManufacturingFactors ();
		$this->data ['teamFactorsInfo'] [0] = reset_array_key ( $this->Teamfactors_model->getFactorsByTeamIdAndRoundId ( $teamId, 1 ), 'factor_id' );
		
		$this->data ['regions'] = $this->getRegionList ();
		$this->data ['regionFactors'] = $this->getRegionFactorsForTeam ();
		foreach ( $this->getRegionList () as $r ) {
			$this->data ['regionInfo'] [0] [$r ['id']] = reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( 1, $r ['id'] ), 'factor_id' );
		}
		
		$this->data ['startNumber'] = 0;
		$this->data ['roundNumber'] = 0;
		
		$this->data ['roundView'] = $this->load->view ( 'backend/team/round', $this->data, true );
		
		$this->load->view ( 'backend/layout/header', $this->data );
		$this->load->view ( 'backend/team/edit_default', $this->data );
		$this->load->view ( 'backend/layout/footer' );
	}
	public function edit_round($teamId) {
		if ($this->input->post () != false) {
			$retData = array ();
			$retData ['result'] = false;
			$postData = $this->input->post ();
			$this->load->model ( 'Regions_model' );
			
			$gameId = 0;
			if ($teamId != 0) {
				$teamInfo = $this->Teams_model->getTeam ( $teamId );
				$gameId = $teamInfo ['game_id'];
			}
			
			/**
			 * Save round setting for team
			 */
			foreach ( $postData ['round'] as $roundKey => $roundValue ) {
				/*
				 * Save manufacturing factors
				 */
				$newFactor = array ();
				$newFactor ['round_id'] = $roundKey;
				$newFactor ['team_id'] = $this->uri->segment ( 4 );
				foreach ( $roundValue ['factor'] as $factorKey => $factorValue ) {
					$newFactor ['factor_id'] = $factorKey;
					$newFactor ['factor_value'] = $factorValue;
					$this->Teamfactors_model->updateTeamFactor ( $this->uri->segment ( 4 ), $newFactor, $roundKey );
				}
				
				$newComponent = array ();
				$newComponent ['round_id'] = $roundKey;
				$newComponent ['team_id'] = $this->uri->segment ( 4 );
				foreach ( $roundValue ['component'] as $componentKey => $componentValue ) {
					
					$newComponent ['component_id'] = $componentValue ['factor'] ['id'];
					$newComponent ['name'] = $componentValue ['factor'] ['name'];
					$newComponent ['inhouse_manufacturing'] = $componentValue ['factor'] ['inhouse_manufacturing'];
					$newComponent ['require'] = $componentValue ['factor'] ['require'];
					$newComponent ['round_id'] = $roundKey;
					$this->Components_model->updateComponent ( $newComponent );
					
					$componentMaterial = array ();
					foreach ( $componentValue ['material'] as $materialKey => $materialValue ) {
						$componentMaterial ['material_id'] = $materialValue ['id'];
						
						$componentMaterial ['name'] = $materialValue ['name'];
						$componentMaterial ['cost'] = $materialValue ['cost'];
						$componentMaterial ['range'] = $materialValue ['range'];
						$componentMaterial ['design'] = $materialValue ['design'];
						$componentMaterial ['reliability'] = $materialValue ['reliability'];
						$componentMaterial ['round_id'] = $roundKey;
						
						$this->Componentmaterials_model->updateMaterial ( $componentMaterial );
					}
				}
				
				$regionData = array ();
				$regionData = $roundValue ['region'];
				
				foreach ( $regionData as $regionKey => $regionValue ) {
					$regionFactor = array ();
					if ($teamId == 0) {
						$roundKey = 1;
					}
					$regionFactor ['team_id'] = $teamId;
					$regionFactor ['round_id'] = $roundKey;
					$regionFactor ['region_id'] = $regionKey;
					
					/*
					 * Insert region factors for each region
					 */
					foreach ( $regionValue ['factor'] as $factorKey => $factorValue ) {
						$regionFactor ['factor_id'] = $factorKey;
						$regionFactor ['factor_value'] = $factorValue;
						$this->Regions_model->editRegion ( $regionFactor );
					}
				}
				
				/*
				 *
				 */
				
				// Delete recycle method
				$currRecycleMethods = reset_array_key ( $this->Recyclemethods_model->getRecycleMethodByGameId ( $gameId, $roundKey, $teamId ), 'method_code' );
				
				// Update recycle method
				foreach ( $roundValue ['recycle'] as $recycleKey => $recycleValue ) {
					$recycleMethod = array ();
					
					if (isset ( $recycleValue ['method_code'] )) {
						// Remove from delete recycle method set
						unset ( $currRecycleMethods [$recycleValue ['method_code']] );
						
						$recycleMethod ['method_code'] = $recycleValue ['method_code'];
						foreach ( $recycleValue ['factor'] as $recycleFactorKey => $recycleFactorValue ) {
							$recycleMethod ['factor_id'] = $recycleFactorKey;
							$recycleMethod ['factor_value'] = $recycleFactorValue;
							$this->Recyclemethods_model->editRecycleMethod ( $recycleMethod );
						}
					} else {
						
						$recycleMethod ['method_code'] = $this->uuid->v4 ();
						$recycleMethod ['game_id'] = $gameId;
						$recycleMethod ['team_id'] = $teamId;
						$recycleMethod ['round_id'] = $roundKey;
						
						foreach ( $recycleValue ['factor'] as $recycleFactorKey => $recycleFactorValue ) {
							$recycleMethod ['factor_id'] = $recycleFactorKey;
							$recycleMethod ['factor_value'] = $recycleFactorValue;
							$this->Recyclemethods_model->addRecycleMethod ( $recycleMethod );
						}
					}
				}
				
				// Delete recycle method
				if (! empty ( $currRecycleMethods )) {
					foreach ( $currRecycleMethods as $recycleKey => $recycleValue ) {
						$this->Recyclemethods_model->removeRecycleMethod ( $recycleValue ['method_code'] );
					}
				}
			}
			$retData ['result'] = true;
			echo json_encode ( $retData );
			exit ();
		}
	}
	public function showData($teamId = 0) {
		$this->load->model ( 'Games_model' );
		$this->data ['games'] = $this->Games_model->getGames ();
		$this->data ['regions'] = $this->getRegionList ();
		$this->data ['players'] = $this->Users_model->getUserByUserType ( USER_TYPE_PLAYER );
		$this->data ['teamFactors'] = $this->getTeamFactors ();
		$this->data ['teamFactors'] = $this->getTeamFactors ();
		
		$this->data ['recycleMethodsList'] = $this->getRecycleMethodFactors ();
		// Get recycle method info
		if ($teamId != 0) {
			$this->data ['recycleMethodInfo'] = $this->Recyclemethods_model->getRecycleMethodByGameId ( 0, 0, $teamId );
			/**
			 * Prepare recycle method info data
			 */
			$newRecycleMethodInfo = array ();
			foreach ( $this->data ['recycleMethodInfo'] as $rf ) {
				$newRecycleMethodInfo [$rf ['round_id']] [$rf ['method_code']] [$rf ['factor_id']] = $rf ['factor_value'];
			}
			$this->data ['recycleMethodInfo'] = $newRecycleMethodInfo;
		} else {
			$this->data ['recycleMethodInfo'] = $this->Recyclemethods_model->getRecycleMethodByGameId ( 0, 0, 0 );
			/**
			 * Prepare recycle method info data
			 */
			$newRecycleMethodInfo = array ();
			foreach ( $this->data ['recycleMethodInfo'] as $rf ) {
				$newRecycleMethodInfo [0] [$rf ['method_code']] [$rf ['factor_id']] = $rf ['factor_value'];
			}
			$this->data ['recycleMethodInfo'] = $newRecycleMethodInfo;
		}
		
		// Get default setting
		$this->data ['settings'] = $this->Gamesettings_model->getSettings ( 0 );
		$this->data ['startNumber'] = 1;
		$this->data ['roundNumber'] = 1;
	}
	public function round() {
		$data ['view'] = '';
		
		// if ($this->input->server('REQUEST_METHOD') == 'POST') {
		$this->load->model ( 'Components_model' );
		$this->load->model ( 'Componentmaterials_model' );
		$this->load->model ( 'Gamesettings_model' );
		// Load default component setting for new game
		$this->data ['components'] = group_array_key ( $this->Components_model->getComponentsByTeamId ( 0 ), 'round_id' );
		$this->data ['components'] [$this->uri->segment ( 4 )] = $this->data ['components'] [0];
		unset ( $this->data ['components'] [0] );
		
		foreach ( $this->data ['components'] [$this->uri->segment ( 4 )] as $key => $value ) {
			$this->data ['components'] [$this->uri->segment ( 4 )] [$key] ['materials'] = $this->Componentmaterials_model->getMaterialsByComponentId ( $value ['id'] );
		}
		
		$this->data ['teamManufacturingFactors'] = $this->getTeamManufacturingFactors ();
		$this->data ['teamFactorsInfo'] [0] = reset_array_key ( $this->Teamfactors_model->getFactorsByTeamIdAndRoundId ( 0, 1 ), 'factor_id' );
		
		$this->data ['startNumber'] = $this->uri->segment ( 4 );
		$this->data ['roundNumber'] = $this->data ['startNumber'];
		
		/*
		 * Init Region data
		 */
		$this->load->model ( 'Regions_model' );
		$regionInfo = array ();
		$regionInfo [REGION_INDUSTRIAL_COUNTRY] = $this->Regions_model->getRegionByRoundIdAndRegionId ( REGION_INDUSTRIAL_COUNTRY, 0 );
		$regionInfo [REGION_EMERGING_COUNTRY_1] = $this->Regions_model->getRegionByRoundIdAndRegionId ( REGION_EMERGING_COUNTRY_1, 0 );
		$regionInfo [REGION_EMERGING_COUNTRY_2] = $this->Regions_model->getRegionByRoundIdAndRegionId ( REGION_EMERGING_COUNTRY_2, 0 );
		$regionInfo [REGION_DEVELOPMENT_COUNTRY] = $this->Regions_model->getRegionByRoundIdAndRegionId ( REGION_DEVELOPMENT_COUNTRY, 0 );
		
		$this->data ['regions'] = $this->getRegionList ();
		$this->data ['regionFactors'] = $this->getRegionFactorsForTeam ();
		
		foreach ( $this->data ['regions'] as $r ) {
			$this->data ['regionInfo'] [$this->uri->segment ( 4 )] [$r ['id']] = reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( 1, $r ['id'] ), 'factor_id' );
		}
		
		/*
		 * End init region dat
		 */
		
		// Get recycle method
		$this->data ['recycleMethodsList'] = $this->getRecycleMethodFactors ();
		$this->data ['recycleMethodInfo'] = $this->Recyclemethods_model->getRecycleMethodByGameId ( 0, 0, 0 );
		
		$newRecycleMethodInfo = array ();
		foreach ( $this->data ['recycleMethodInfo'] as $rf ) {
			$newRecycleMethodInfo [0] [$rf ['method_code']] [$rf ['factor_id']] = $rf ['factor_value'];
		}
		$this->data ['recycleMethodInfo'] = $newRecycleMethodInfo;
		
		$data ['view'] = $this->load->view ( 'backend/team/round', $this->data, true );
		// }
		
		echo (json_encode ( $data ));
		exit ();
	}
	public function updateTeamFactor($teamId, $roundId, $factorId, $value) {
		$this->load->model ( 'Teams_model' );
		$this->load->model ( 'Teamfactors_model' );
		$teamFactors = reset_array_key ( $this->Teamfactors_model->getFactorsByTeamIdAndRoundId ( $teamId, $roundId ), 'factor_id' );
		$teamFactors [$factorId] ['factor_value'] += $value;
		$this->Teamfactors_model->updateTeamFactor ( $teamId, $teamFactors [$factorId], $roundId );
		return $teamFactors [$factorId] ['factor_value'];
	}
}
