<?php

class MY_Controller extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function getRegionFactors()
    {
        $regionFactors = array();

        $regionFactors[REGION_QUALITY_FACTOR_2] = array('id' => REGION_QUALITY_FACTOR_2, 'label' => "Quality factor 2");
        $regionFactors[REGION_MARKET_VOLUME] = array('id' => REGION_MARKET_VOLUME, 'label' => "Market volume");
        $regionFactors[REGION_EMPLOYEE_QUALIFICATION] = array('id' => REGION_EMPLOYEE_QUALIFICATION, 'label' => "Employee qualification (impact on quality)");
        $regionFactors[REGION_LABOR_COST] = array('id' => REGION_LABOR_COST, 'label' => "Labor cost (impact on costs)");
        $regionFactors[REGION_OSH_COST] = array('id' => REGION_OSH_COST, 'label' => "OSH (impact on costs)");
        $regionFactors[REGION_OSH_QUALITY] = array('id' => REGION_OSH_QUALITY, 'label' => "OSH (impact on quality)");
        $regionFactors[REGION_ENVIRONMENT_REGULATION] = array('id' => REGION_ENVIRONMENT_REGULATION, 'label' => "Environment regulation (impact on costs)");
        $regionFactors[REGION_RETURN_RATE] = array('id' => REGION_RETURN_RATE, 'label' => "Return rate");
        $regionFactors[REGION_TRANSPORT_COST_IC] = array('id' => REGION_TRANSPORT_COST_IC, 'label' => "Transport cost to IC");
        $regionFactors[REGION_TRANSPORT_COST_EC1] = array('id' => REGION_TRANSPORT_COST_EC1, 'label' => "Transport cost to EC1");
        $regionFactors[REGION_TRANSPORT_COST_EC2] = array('id' => REGION_TRANSPORT_COST_EC2, 'label' => "Transport cost to EC2");
        $regionFactors[REGION_TRANSPORT_COST_DC] = array('id' => REGION_TRANSPORT_COST_DC, 'label' => "Transport cost to DC");
        $regionFactors[REGION_ECO_CREDIT_TRANSPORT] = array('id' => REGION_ECO_CREDIT_TRANSPORT, 'label' => "ECO credit for transport");
        $regionFactors[REGION_ECO_CREDIT_PRODUCTION] = array('id' => REGION_ECO_CREDIT_PRODUCTION, 'label' => "ECO credit for production");
        $regionFactors[REGION_ECO_CREDIT_SALE] = array('id' => REGION_ECO_CREDIT_SALE, 'label' => "ECO credit for sale");
        $regionFactors[REGION_SO_CREDIT_SALE] = array('id' => REGION_SO_CREDIT_SALE, 'label' => "SO credit for sale");

        return $regionFactors;
    }
    
    public function getRegionFactorsForGame(){

    	$regionFactors = array();
    	
    	$regionFactors[REGION_QUALITY_FACTOR_2] = array('id' => REGION_QUALITY_FACTOR_2, 'label' => "Quality factor 2");
    	$regionFactors[REGION_MARKET_VOLUME] = array('id' => REGION_MARKET_VOLUME, 'label' => "Market volume");
    	$regionFactors[REGION_EMPLOYEE_QUALIFICATION] = array('id' => REGION_EMPLOYEE_QUALIFICATION, 'label' => "Employee qualification (impact on quality)");
    	$regionFactors[REGION_LABOR_COST] = array('id' => REGION_LABOR_COST, 'label' => "Labor cost (impact on costs)");
    	$regionFactors[REGION_OSH_COST] = array('id' => REGION_OSH_COST, 'label' => "OSH (impact on costs)");
    	$regionFactors[REGION_OSH_QUALITY] = array('id' => REGION_OSH_QUALITY, 'label' => "OSH (impact on quality)");
    	$regionFactors[REGION_ENVIRONMENT_REGULATION] = array('id' => REGION_ENVIRONMENT_REGULATION, 'label' => "Environment regulation (impact on costs)");
    	$regionFactors[REGION_RETURN_RATE] = array('id' => REGION_RETURN_RATE, 'label' => "Return rate");
    	$regionFactors[REGION_TRANSPORT_COST_IC] = array('id' => REGION_TRANSPORT_COST_IC, 'label' => "Transport cost to IC");
    	$regionFactors[REGION_TRANSPORT_COST_EC1] = array('id' => REGION_TRANSPORT_COST_EC1, 'label' => "Transport cost to EC1");
    	$regionFactors[REGION_TRANSPORT_COST_EC2] = array('id' => REGION_TRANSPORT_COST_EC2, 'label' => "Transport cost to EC2");
    	$regionFactors[REGION_TRANSPORT_COST_DC] = array('id' => REGION_TRANSPORT_COST_DC, 'label' => "Transport cost to DC");
    	$regionFactors[REGION_ECO_CREDIT_TRANSPORT] = array('id' => REGION_ECO_CREDIT_TRANSPORT, 'label' => "ECO credit lost for transport");
    	$regionFactors[REGION_ECO_CREDIT_PRODUCTION] = array('id' => REGION_ECO_CREDIT_PRODUCTION, 'label' => "ECO credit lost for production");
//        $regionFactors[REGION_ECO_CREDIT_LOST_TRANSPORT] = array('id' => REGION_ECO_CREDIT_SALE, 'label' => "ECO credit lost for tranpsort");
        $regionFactors[REGION_SO_CREDIT_SALE] = array('id' => REGION_SO_CREDIT_SALE, 'label' => "SO credit for sale");
    	
    	return $regionFactors;
    }
    
    public function getRegionFactorsForTeam(){
    	$regionFactors = array();
    	
    	$regionFactors[REGION_COST_FACTOR] = array('id' => REGION_COST_FACTOR, 'label' => "Cost factor for development and production");
    	$regionFactors[REGION_COST_FACTOR_RECYCLE] = array('id' => REGION_COST_FACTOR_RECYCLE, 'label' => "Cost factor for recycling");
    	$regionFactors[REGION_COST_FACTOR_TRANSPORT] = array('id' => REGION_COST_FACTOR_TRANSPORT, 'label' => "Cost factor for transport");
    	$regionFactors[REGION_QUALITY_FACTOR_1] = array('id' => REGION_QUALITY_FACTOR_1, 'label' => "Quality factor 1 for development and production");
    	$regionFactors[REGION_RECYCLING_QUALITY_FACTOR_1] = array('id' => REGION_RECYCLING_QUALITY_FACTOR_1, 'label' => "Quality factor 1 for recycling");
    	
    	return $regionFactors;
    	
    }

    public function getRegionList()
    {
        $regions = array();

        $regions[REGION_INDUSTRIAL_COUNTRY] = array('id' => REGION_INDUSTRIAL_COUNTRY, 'name' => "IC", 'label' => 'Industrialized Country');
        $regions[REGION_EMERGING_COUNTRY_1] = array('id' => REGION_EMERGING_COUNTRY_1, 'name' => "EC1", 'label' => 'Emerging Country 1');
        $regions[REGION_EMERGING_COUNTRY_2] = array('id' => REGION_EMERGING_COUNTRY_2, 'name' => "EC2", 'label' => 'Emerging Country 2');
        $regions[REGION_DEVELOPMENT_COUNTRY] = array('id' => REGION_DEVELOPMENT_COUNTRY, 'name' => "DC", 'label' => 'Developing Country');

        return $regions;
    }

    public function getCustomerFactors1()
    {
        $customerFactors = array();

        $customerFactors[CUSTOMER_MARKET_SHARE] = array('id' => CUSTOMER_MARKET_SHARE, 'label' => "Market share (%)");
        $customerFactors[CUSTOMER_PRICE] = array('id' => CUSTOMER_PRICE, 'label' => "Max Price ($)");

        return $customerFactors;
    }

    public function getCustomerFactors2()
    {
        $customerFactors = array();

        $customerFactors[CUSTOMER_RELIABILITY] = array('id' => CUSTOMER_RELIABILITY, 'label' => "Reliability");
        $customerFactors[CUSTOMER_RANGE] = array('id' => CUSTOMER_RANGE, 'label' => "Range");
        $customerFactors[CUSTOMER_DESIGN] = array('id' => CUSTOMER_DESIGN, 'label' => "Design");
        $customerFactors[CUSTOMER_IMAGE] = array('id' => CUSTOMER_IMAGE, 'label' => "Image");

        return $customerFactors;
    }

    public function getCustomerList()
    {

        $customers = array();
        $customers[CUSTOMER_TYPE_POOR_STUDENT] = array('id' => CUSTOMER_TYPE_POOR_STUDENT, 'label' => "Poor Student");
        $customers[CUSTOMER_TYPE_HEAVY_USER] = array('id' => CUSTOMER_TYPE_HEAVY_USER, 'label' => "Heavy User");
        $customers[CUSTOMER_TYPE_ECO_HIPSTER] = array('id' => CUSTOMER_TYPE_ECO_HIPSTER, 'label' => "Eco Hipster");

        return $customers;
    }

    public function getRecycleMethodFactors()
    {
        $recycleMethodFactors = array();

        $recycleMethodFactors[RECYCLE_METHOD_NAME] = array('id' => RECYCLE_METHOD_NAME, 'label' => "Name");
        $recycleMethodFactors[RECYCLE_METHOD_COST] = array('id' => RECYCLE_METHOD_COST, 'label' => "Cost");
        $recycleMethodFactors[RECYCLE_METHOD_RETURN_MONEY] = array('id' => RECYCLE_METHOD_RETURN_MONEY, 'label' => "Return Money");
        $recycleMethodFactors[RECYCLE_METHOD_COMPONENT] = array('id' => RECYCLE_METHOD_COMPONENT, 'label' => "Return Handlebars");
        $recycleMethodFactors[RECYCLE_METHOD_COMPONENT1] = array('id' => RECYCLE_METHOD_COMPONENT1, 'label' => "Return Frame");
        $recycleMethodFactors[RECYCLE_METHOD_COMPONENT2] = array('id' => RECYCLE_METHOD_COMPONENT2, 'label' => "Return Casing");
        $recycleMethodFactors[RECYCLE_METHOD_COMPONENT3] = array('id' => RECYCLE_METHOD_COMPONENT3, 'label' => "Return Motor");
        $recycleMethodFactors[RECYCLE_METHOD_ECO_CREDIT] = array('id' => RECYCLE_METHOD_ECO_CREDIT, 'label' => "ECO Credit");
        $recycleMethodFactors[RECYCLE_METHOD_SO_CREDIT] = array('id' => RECYCLE_METHOD_SO_CREDIT, 'label' => "SO Credit");
        $recycleMethodFactors[RECYCLE_METHOD_ME_CREDIT] = array('id' => RECYCLE_METHOD_ME_CREDIT, 'label' => "ME Credit");

        return $recycleMethodFactors;
    }

    public function getTeamFactors()
    {
        $teamFactors = array();

        $teamFactors[TEAM_MONEY] = array('id' => TEAM_MONEY, 'label' => "Money");
        $teamFactors[TEAM_ECO_CREDIT] = array('id' => TEAM_ECO_CREDIT, 'label' => "ECO Credit");
        $teamFactors[TEAM_SO_CREDIT] = array('id' => TEAM_SO_CREDIT, 'label' => "SO Credit");
        $teamFactors[TEAM_ME_CREDIT] = array('id' => TEAM_ME_CREDIT, 'label' => "ME Credit");
        $teamFactors[TEAM_FACTORY_CAPACITY] = array('id' => TEAM_FACTORY_CAPACITY, 'label' => "Factory Capacity");
        $teamFactors[TEAM_STORAGE_CAPACITY_IC] = array('id' => TEAM_STORAGE_CAPACITY_IC, 'label' => "Storage Capacity In IC");
        $teamFactors[TEAM_STORAGE_CAPACITY_EC1] = array('id' => TEAM_STORAGE_CAPACITY_EC1, 'label' => "Storage Capacity In EC1");
        $teamFactors[TEAM_STORAGE_CAPACITY_EC2] = array('id' => TEAM_STORAGE_CAPACITY_EC2, 'label' => "Storage Capacity In EC2");
        $teamFactors[TEAM_STORAGE_CAPACITY_DC] = array('id' => TEAM_STORAGE_CAPACITY_DC, 'label' => "Storage Capacity In DC");

        return $teamFactors;
    }

    public function getTeamManufacturingFactors()
    {
        $teamFactors = array();

        $teamFactors[TEAM_DEVELOPMENT_COST] = array('id' => TEAM_DEVELOPMENT_COST, 'label' => "Development Cost");
        $teamFactors[TEAM_INHOUSE_MANUFACTURING_COST] = array('id' => TEAM_INHOUSE_MANUFACTURING_COST, 'label' => "In House Manufacturing Cost");
        $teamFactors[TEAM_FIXED_COST] = array('id' => TEAM_FIXED_COST, 'label' => "Fixed Cost");

        return $teamFactors;
    }

    public function getRegionNameById($id)
    {
        $regions = $this->getRegionList();
        if (isset($regions[$id]))
        {
            return $regions[$id]['label'];
        }
        return null;
    }

    public function getSteps()
    {
        $steps = array();

        $steps[STEP_DASHBOARD] = array('id' => STEP_DASHBOARD, 'label' => "Dash Board");
        $steps[STEP_DEVELOPMENT] = array('id' => STEP_DEVELOPMENT, 'label' => "Product Development");
        $steps[STEP_COMPONENTS] = array('id' => STEP_COMPONENTS, 'label' => "Purchase Component");
        $steps[STEP_RECYCLING] = array('id' => STEP_RECYCLING, 'label' => "Recycle Product");
        $steps[STEP_PRODUCTION] = array('id' => STEP_PRODUCTION, 'label' => "Production");
        $steps[STEP_TRANSPORT] = array('id' => STEP_TRANSPORT, 'label' => "Transport");
        $steps[STEP_SALE] = array('id' => STEP_SALE, 'label' => "Sale Product");

        return $steps;
    }

    public function getStepNameById($id)
    {
        $steps = $this->getSteps();
        if (isset($steps[$id]))
        {
            return $steps[$id]['label'];
        }
        return null;
    }

    public function getRoundStatus()
    {

        $status = array();

        $status[ROUND_START] = array('id' => ROUND_START, 'label' => "New Round");
        $status[ROUND_IN_PROGRESS] = array('id' => ROUND_IN_PROGRESS, 'label' => "In Running");
        $status[ROUND_WAIT_FOR_EVALUATE] = array('id' => ROUND_WAIT_FOR_EVALUATE, 'label' => "Waiting For Evaluation");
        $status[ROUND_DONE] = array('id' => ROUND_DONE, 'label' => "Done");

        return $status;
    }

    public function getRoundStatusNameById($id)
    {
        $status = $this->getRoundStatus();
        if (isset($status[$id]))
        {
            return $status[$id]['label'];
        }
        return null;
    }

}

/* application/libraries/Admin_Controller.php */

class Backend_Controller extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();

        $this->load->library('session');

        $this->data['curr_step'] = '';
        $this->data['curr_sub_step'] = '';

        $userData = $this->session->get_userdata();

        $this->data['userData'] = '';
        if (!empty($userData))
        {
            $this->data['userData'] = $userData;
        }
    }

    function is_master_logged_in()
    {
        $userData = $this->session->get_userdata();
        if (empty($userData['userName']) || $userData['userType'] != USER_TYPE_MASTER):
            $redirect = site_url('/master/login');
            header("Location: $redirect");
            exit;
        endif;
    }

}

/* application/libraries/Frontend_Controller.php */

class Frontend_Controller extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->library('session');

        $this->data['curr_step'] = '';
        $this->data['curr_sub_step'] = '';
        $userData = $this->session->get_userdata();

        $this->data['userData'] = '';
        if (!empty($userData))
        {
            $this->data['userData'] = $userData;
        }

        $this->data['showRecycle'] = false;
        $this->data['enableInput'] = false;
    }

    function is_logged_in($userName)
    {
        if (($userName == "") || $this->data['userData']['userType'] != USER_TYPE_PLAYER):
            $redirect = site_url('/account/login');
            header("Location: $redirect");
            exit;
        endif;
    }

}
