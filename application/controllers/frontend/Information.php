<?php

class Information extends Frontend_Controller {

    function __construct() {
        parent::__construct();
        $this->data['curr_step'] = STEP_INFORMATION;

        $this->load->library('session');
        // Check login
        $this->is_logged_in($this->session->userdata('userName'));

        $this->load->model('Teams_model');
        $this->data['teamInfo'] = $this->Teams_model->getTeam($this->data['userData']['teamId']);
        //Update user info in user data
        $this->data['userData']['roundId'] = $this->data['teamInfo']['current_round'];
        $this->data['userData']['gameId'] = $this->data['teamInfo']['game_id'];
    }

    function Storage() {
        $this->load->model('Components_model');
        $this->load->model('Componentmaterials_model');
        $this->load->model('Storages_model');
        $this->load->model('Products_model');
        $regionList = $this->getRegionList();
        $this->data['regionList'] = $regionList;


        // Get component storage information
        // Get component for team
        $this->data['components'] = $this->Components_model->getComponentsByTeamId($this->data['userData']['teamId'], $this->data['userData']['roundId']);
        foreach ($this->data['components'] as $key => $value) {
            $this->data['components'][$key]['materials'] = $this->Componentmaterials_model->getMaterialsByComponentId($value['id']);
        }

        // Get products storage information
        $product_storage = $this->Storages_model->getStoragesByTypeAndTeamId(ITEM_STORE_TYPE_PRODUCT, $this->data['userData']['teamId']);

        $this->data['developedProduct'] = $this->Products_model->getProductsByTeamId($this->data['userData']['teamId']);
        foreach ($product_storage as $k => $p) {
            foreach ($this->data['developedProduct'] as $pr) {
                if ($p['item_id'] == $pr['id']) {
                    $p['product_name'] = $pr['name'];
                    $p['price'] = $pr['manufacturing_cost'];
                    $p['region_name'] = $this->getRegionNameById($p['region_id']);
                    $product_storage[$k] = $p;
                    break;
                }
            }
        }

        $this->data['product_storage'] = $product_storage;
        
        //Get storage capacity
        $storage_capacity = array();
        foreach ($regionList as $r){
        	  $this->data['storage_capacity'][$r['label']] = $this->getAvailableStorageByRegion($r['id']) ;
        }
        

        $this->load->view('frontend/layout/simple_header', $this->data);
        $this->load->view('frontend/information/storage', $this->data);
        $this->load->view('frontend/layout/simple_footer');
    }

    function Component() {
        $this->data['curr_sub_step'] = STEP_INFORMATION_COMPONENT;


        $this->load->model('Components_model');
        $this->load->model('Componentmaterials_model');

        // Get component for team
        $this->data['components'] = $this->Components_model->getComponentsByTeamId($this->data['userData']['teamId'], $this->data['userData']['roundId']);
        foreach ($this->data['components'] as $key => $value) {
            $this->data['components'][$key]['materials'] = $this->Componentmaterials_model->getMaterialsByComponentId($value['id']);
        }


        $this->load->view('frontend/layout/simple_header', $this->data);
        $this->load->view('frontend/information/component', $this->data);
        $this->load->view('frontend/layout/simple_footer');
    }

    function Region() {
        $this->data['curr_sub_step'] = STEP_INFORMATION_REGION;
        $regionList = $this->getRegionList();

        $regionFactorListForTeam = $this->getRegionFactorsForTeam();
        $regionFactorListForGame = $this->getRegionFactorsForGame();
        $regionInfo = array();

        $this->load->model('Regions_model');
        foreach ($regionList as $value) {
            $regionInfo[$value['id']] = reset_array_key($this->Regions_model->getRegionByRoundIdAndRegionId(
                            $this->data['userData']['roundId'], $value['id'], $this->data['userData']['gameId'], $this->data['teamInfo']['id']), 'factor_id');
            $regionInfo[$value['id']] += reset_array_key($this->Regions_model->getRegionByRoundIdAndRegionId(
            		$this->data['userData']['roundId'], $value['id'], $this->data['userData']['gameId']), 'factor_id');
            
        }
        $this->data['regionList'] = $regionList;
        $this->data['regionFactorList'] = $regionFactorListForTeam + $regionFactorListForGame;

        $this->data['regionInfo'] = $regionInfo;


        $this->load->view('frontend/layout/simple_header', $this->data);
        $this->load->view('frontend/information/region', $this->data);
        $this->load->view('frontend/layout/simple_footer');
    }

    function Event() {
        $this->data['curr_sub_step'] = STEP_INFORMATION_EVENT;
        $this->load->model('Events_model');
        $this->data['eventInfo'] = $this->Events_model->getEventByGameId($this->data['userData']['gameId'], $this->data['userData']['roundId']);
        if (is_array($this->data['eventInfo'])) {
            $this->data['eventInfo'] = $this->data['eventInfo'][0];
        }

        $this->load->view('frontend/layout/simple_header', $this->data);
        $this->load->view('frontend/information/event', $this->data);
        $this->load->view('frontend/layout/simple_footer');
    }

    function Customer() {
        $this->data['curr_sub_step'] = STEP_INFORMATION_CUSTOMER;
        $this->load->model('Customerfactors_model');
        $regionList = $this->getRegionList();
        $customerList = $this->getCustomerList();
        $customerFactorList = array_merge($this->getCustomerFactors1(), $this->getCustomerFactors2());


        $this->data['regionList'] = $regionList;
        $this->data['customerList'] = $customerList;
        $this->data['customerFactorList'] = $customerFactorList;


        foreach ($regionList as $r) {
            $customerFactorsInfo = array();
            $returnCustomerFactors = array();

            $customerFactorsInfo = $this->Customerfactors_model->getCustomerFactors($this->data['userData']['gameId'], $this->data['userData']['roundId'], $r['id']);

            foreach ($customerFactorsInfo as $f) {
                $returnCustomerFactors[$f['customer_id']][] = $f;
            }

            foreach ($this->getCustomerList() as $c) {
                $this->data['customerFactorsInfo'][$r['id']][$c['id']] = reset_array_key($returnCustomerFactors[$c['id']], 'factor_id');
            }
        }


        $this->load->view('frontend/layout/simple_header', $this->data);
        $this->load->view('frontend/information/customer', $this->data);
        $this->load->view('frontend/layout/simple_footer');
    }

    function Recycle() {
        $this->data['curr_sub_step'] = STEP_INFORMATION_RECYCLE;

        $this->data['recycleMethodsList'] = $this->getRecycleMethodFactors();
        $this->load->model('Recyclemethods_model');
        $this->data['recycleMethodInfo'] = $this->Recyclemethods_model->getRecycleMethodByGameId($this->data['userData']['gameId'], $this->data['userData']['roundId'], $this->data['userData']['teamId']);

        $newRecycleMethodInfo = array();
        foreach ($this->data['recycleMethodInfo'] as $rf) {
            $newRecycleMethodInfo[$rf['method_code']][$rf['factor_id']] = $rf['factor_value'];
        }

        $this->data['recycleMethodInfo'] = $newRecycleMethodInfo;

        $this->load->view('frontend/layout/simple_header', $this->data);
        $this->load->view('frontend/information/recycle', $this->data);
        $this->load->view('frontend/layout/simple_footer');
    }

    function Evaluations() {
        $this->data['curr_sub_step'] = STEP_INFORMATION_EVALUATIONS;

        $this->load->view('frontend/layout/simple_header', $this->data);
        $this->load->view('frontend/information/evaluations', $this->data);
        $this->load->view('frontend/layout/simple_footer');
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
    	$this->load->model ( 'Teamfactors_model' );
    	$this->data ['teamFactorsInfo'] = reset_array_key ( $this->Teamfactors_model->getFactorsByTeamIdAndRoundId ( $this->data ['teamInfo'] ['id'], $this->data ['teamInfo'] ['current_round'] ), 'factor_id' );
    	 
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
    
    	return $warehouseCapacity;
    }

}
