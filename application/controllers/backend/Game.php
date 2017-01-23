<?php

class Game extends Backend_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->library('session');
        $this->data['curr_step'] = STEP_MASTER_GAME;

        $this->load->model('Games_model');
        $this->load->model('Teams_model');
        $this->load->model('Regions_model');
        $this->load->model('Events_model');
        $this->load->model('Recyclemethods_model');
        $this->load->model('Customerfactors_model');

        $this->data['eventInfo'] = array();

        $this->is_master_logged_in();
    }

    public function index()
    {
        //Get posts from database
        $this->data['games'] = $this->Games_model->getGames();
        foreach ( $this->data['games'] as $key => $value) {
        	$this->data['games'][$key]['team'] = $this->Teams_model->getTeamsByGameId($value['id']);
        }
        $this->data['successAction'] = $this->uri->segment(4);

        $this->load->view('backend/layout/header', $this->data);
        $this->load->view('backend/game/index', $this->data);
        $this->load->view('backend/layout/footer');
    }

    /*
     * add game function
     */

    public function add()
    {
        /*
         * Check post method
         */
        if ($this->input->post() != false)
        {
            $data['result'] = false;
            $postData = $this->input->post();
            // Insert game
            $gameId = $this->Games_model->addGame();
            $data['result'] = true;
            $data['gameid'] = $gameId;
            echo json_encode($data);
            exit;
        }

        $this->data['success_add_link'] = site_url('master/game/success/add');
        $this->showData();
        $this->load->view('backend/layout/header', $this->data);
        $this->load->view('backend/game/add', $this->data);
        $this->load->view('backend/layout/footer');
    }

    public function add_round($gameid, $id)
    {
        if ($this->input->post() != false)
        {
            $data['result'] = false;
            $postData = $this->input->post();
            $gameId = $id;
            /*
             * Function to add post data to database
             */
            foreach ($postData['round'] as $roundKey => $roundValue) {

                /*
                 * Add region factor data
                 */
                $regionData = array();
                $regionData = $roundValue['region'];
                foreach ($regionData as $regionKey => $regionValue) {
                    $regionFactor = array();
                    $regionFactor['game_id'] = $gameId;
                    $regionFactor['round_id'] = $roundKey;
                    $regionFactor['region_id'] = $regionKey;
                    $regionFactor['team_id'] = 0;

                    /*
                     * Insert region factors for each region
                     */
                    foreach ($regionValue['factor'] as $factorKey => $factorValue) {
                        $regionFactor['factor_id'] = $factorKey;
                        $regionFactor['factor_value'] = $factorValue;
                        $this->Regions_model->addRegion($regionFactor);
                    }

                    /*
                     * Add customer factors by round nad region
                     */


                    foreach ($regionValue['customer'] as $customerKey => $customerValue) {
                        $customerFactor = array();
                        $customerFactor['game_id'] = $gameId;
                        $customerFactor['round_id'] = $roundKey;
                        $customerFactor['region_id'] = $regionKey;
                        $customerFactor['customer_id'] = $customerKey;

                        foreach ($customerValue['factor'] as $customerFactorKey => $customerFactorValue) {
                            $customerFactor['factor_id'] = $customerFactorKey;
                            $customerFactor['factor_weight'] = $customerFactorValue['value']['weighting'];
                            $customerFactor['factor_min_value'] = $customerFactorValue['value']['minvalue'];
                            $this->Customerfactors_model->addCustomerFactors($customerFactor);
                        }
                    }
                }

             

                /*
                 * Insert event
                 */
                $eventData = array();
                $eventData['game_id'] = $gameId;
                $eventData['round_id'] = $roundKey;
                $eventData['team_id'] = 0;
                $eventData['title'] = $roundValue['event']['title'];
                $eventData['description'] = $roundValue['event']['description'];
                $this->Events_model->addEvent($eventData);
            }

            $data['result'] = true;
            echo json_encode($data);
            exit;
        }
    }

    public function edit()
    {
        $gameId = $this->uri->segment(4);
        $this->data['success_edit_link'] = site_url('master/game/success/edit');

        /*
         * Check post method
         */
        if ($this->input->post() != false)
        {
            $data['result'] = false;
            $this->Games_model->editGame($this->uri->segment(4));
            $data['result'] = true;
            echo json_encode($data);
            exit;
        }

        /*
         * Get Game Info
         */
        $this->data['gameId'] = $gameId;
        $this->data['game'] = $this->Games_model->getGameById($gameId);

        $this->showData($this->data['game']);

        $this->load->view('backend/layout/header', $this->data);
        $this->load->view('backend/game/edit', $this->data);
        $this->load->view('backend/layout/footer');
    }

    /*
     * Update data for each round in game
     * 
     */

    public function edit_round($gameid, $id)
    {
        $data['result'] = false;
        if ($this->input->post() != false)
        {
            $postData = $this->input->post();

            foreach ($postData['round'] as $roundKey => $roundValue) {
                $regionData = array();
                $regionData = $roundValue['region'];

                foreach ($regionData as $regionKey => $regionValue) {
                	
                	/*
                	 * Update region value
                	 */
                	$regionFactor = array ();
                	if($id == 0){
                		$roundKey = 1;
                	}
                	$regionFactor ['game_id'] = $id;
                	$regionFactor ['team_id'] = 0;
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

                    /*
                     * Add customer factors by round nad region
                     */

                    foreach ($regionValue['customer'] as $customerKey => $customerValue) {
                        $customerFactor = array();
                        $customerFactor['game_id'] = $id;
                        $customerFactor['round_id'] = $roundKey;
                        $customerFactor['region_id'] = $regionKey;
                        $customerFactor['customer_id'] = $customerKey;

                        foreach ($customerValue['factor'] as $customerFactorKey => $customerFactorValue) {
                            $customerFactor['factor_id'] = $customerFactorKey;
                            $customerFactor['factor_weight'] = $customerFactorValue['value']['weighting'];
                            $customerFactor['factor_min_value'] = $customerFactorValue['value']['minvalue'];
                            $this->Customerfactors_model->editCustomerFactors($customerFactor);
                        }
                    }
                }

              


                /*
                 * Insert event
                 */
                $eventData = array();
                $eventData['game_id'] = $id;
                $eventData['round_id'] = $roundKey;
                $eventData['title'] = $roundValue['event']['title'];
                $eventData['description'] = $roundValue['event']['description'];
                $this->Events_model->editEvent($eventData);
            }
            $data['result'] = true;
        }

        echo json_encode($data);
        exit;
    }

    public function showData($gameInfo = null)
    {

        $this->data['regions'] = $this->getRegionList();
        $this->data['regionFactors'] = $this->getRegionFactorsForGame();
        $this->data['customerFactors1'] = $this->getCustomerFactors1();
        $this->data['customerFactors'] = $this->getCustomerFactors2();
        $this->data['recycleMethodsList'] = $this->getRecycleMethodFactors();

      

        /*
         * Load game event
         */
        if (!empty($gameInfo))
        {
            $this->data['eventInfo'] = reset_array_key($this->Events_model->getEventByGameId($gameInfo['id']), 'round_id');
        }

        /**
         * Prepare region info data
         */
        $this->data['regionInfo'] = array();
        $this->data['customerFactorsInfo'] = array();
        foreach ($this->data['regions'] as $r) {
        	
        	/*
        	 * Get reguin info
        	 */
        	if (!empty($gameInfo))
        	{
        		for ($j = 1; $j <= $gameInfo['number_of_round']; $j++) {
        			$this->data['regionInfo'][$j][$r['id']] 
        			= reset_array_key($this->Regions_model->getRegionByRoundIdAndRegionId($j, $r['id'], $gameInfo['id']), 'factor_id');
        		}
        		
        	} else
        	{
        		// Get default data
        		$this->data['regionInfo'][1][$r['id']] 
        		= reset_array_key($this->Regions_model->getRegionByRoundIdAndRegionId(1, $r['id'], 0), 'factor_id');
        	}
        	 

            /*
             * Prepare default data for customer FactorsInfo
             */
            if (!empty($gameInfo))
            {
                for ($j = 1; $j <= $gameInfo['number_of_round']; $j++) {
                    $customerFactorsInfo = $this->Customerfactors_model->getCustomerFactors($gameInfo['id'], $j, $r['id']);
                    $returnCustomerFactors = array();
                    foreach ($customerFactorsInfo as $f) {
                        $returnCustomerFactors[$f['customer_id']][] = $f;
                    }

                    foreach ($this->getCustomerList() as $c) {
                        $this->data['customerFactorsInfo'][$j][$r['id']][$c['id']] = reset_array_key($returnCustomerFactors[$c['id']], 'factor_id');
                    }
                }
            } else
            {
                $customerFactorsInfo = $this->Customerfactors_model->getCustomerFactors(0, 1, $r['id']);
                $returnCustomerFactors = array();
                foreach ($customerFactorsInfo as $f) {
                    $returnCustomerFactors[$f['customer_id']][] = $f;
                }

                foreach ($this->getCustomerList() as $c) {
                    $this->data['customerFactorsInfo'][1][$r['id']][$c['id']] = reset_array_key($returnCustomerFactors[$c['id']], 'factor_id');
                }
            }
        }

        $startRound = 1;
        $roundNumbers = 1;
        if (!empty($gameInfo))
        {
            $roundNumbers = $gameInfo['number_of_round'];
        }

        $this->data['roundView'] = $this->load->view('backend/game/round', array('regionFactors' => $this->data['regionFactors'],
            'roundNumbers' => $roundNumbers, 'startRound' => $startRound, 'customerFactors' => $this->data['customerFactors'],
            'customerFactors1' => $this->data['customerFactors1'], 'customerFactorsInfo' => $this->data['customerFactorsInfo'], 
            'customers' => $this->getCustomerList(), 'regions' => $this->data['regions'], 'regionInfo' => $this->data['regionInfo'],
            'recycleMethodsList' => $this->data['recycleMethodsList'],
            'eventInfo' => $this->data['eventInfo']), true);
    }

    public function remove()
    {
        $data['result'] = false;

        $this->Games_model->removeGame($this->uri->segment(4));
        $this->Regions_model->removeRegionByGameId($this->uri->segment(4));
        $this->Recyclemethods_model->removeRecycleMethodByGameId($this->uri->segment(4));
        $this->Customerfactors_model->removeCustomerFactorsByGameId($this->uri->segment(4));
        $this->Events_model->removeEventByGameId($this->uri->segment(4));

        $data['result'] = true;
        echo json_encode($data);
        exit;
    }

    public function round()
    {
        $data['view'] = '';

        if ($this->input->server('REQUEST_METHOD') == 'POST')
        {

            $startRound = $this->uri->segment(4);
            $roundNumbers = $startRound;

            $this->load->model('Regions_model');
            $this->load->model('Recyclemethods_model');
            $this->load->model('Customerfactors_model');
            $this->data['regions'] = $this->getRegionList();
            
			foreach ( $this->data ['regions'] as $r ) {
				$this->data ['regionInfo'] [$startRound] [$r ['id']] = reset_array_key ( $this->Regions_model->getRegionByRoundIdAndRegionId ( 1, $r ['id'], 0, 0 ), 'factor_id' );
			}
			
           
            $this->data['regionFactors'] = $this->getRegionFactorsForGame();
            $this->data['customerFactors1'] = $this->getCustomerFactors1();
            $this->data['customerFactors'] = $this->getCustomerFactors2();
            $this->data['recycleMethodsList'] = $this->getRecycleMethodFactors();
            $this->data['recycleMethodInfo'] = $this->Recyclemethods_model->getRecycleMethodByGameId(0);

            $newRecycleMethodInfo = array();
            foreach ($this->data['recycleMethodInfo'] as $rf) {
                $newRecycleMethodInfo[0][$rf['method_code']][$rf['factor_id']] = $rf['factor_value'];
            }
            $this->data['recycleMethodInfo'] = $newRecycleMethodInfo;

            foreach ($this->data['regions'] as $r) {

                /*
                 * Prepare default data for customer FactorsInfo
                 */
                $customerFactorsInfo = $this->Customerfactors_model->getCustomerFactors(0, 1, $r['id']);
                $returnCustomerFactors = array();
                foreach ($customerFactorsInfo as $f) {
                    $returnCustomerFactors[$f['customer_id']][] = $f;
                }

                foreach ($this->getCustomerList() as $c) {
                    $this->data['customerFactorsInfo'][$startRound][$r['id']][$c['id']] = reset_array_key($returnCustomerFactors[$c['id']], 'factor_id');
                }
            }

            $data['view'] = $this->load->view('backend/game/round', array('regionFactors' => $this->data['regionFactors'],
                'roundNumbers' => $roundNumbers, 'startRound' => $startRound, 'customerFactors' => $this->data['customerFactors'],
                'customerFactors1' => $this->data['customerFactors1'], 'customerFactorsInfo' => $this->data['customerFactorsInfo'],
                'regions' => $this->data['regions'], 'regionInfo' => $this->data['regionInfo'], 'customers' => $this->getCustomerList(), 'regionInfo' => $this->data['regionInfo'], 'recycleMethodsList' => $this->data['recycleMethodsList'], 'recycleMethodInfo' => $this->data['recycleMethodInfo']), true);
        }
        echo json_encode($data);
        exit;
    }

    public function edit_default()
    {
        $gameId = 0;
        $this->data['success_edit_link'] = site_url('master/game/success/edit');

        $this->data['gameId'] = $gameId;

        $this->showData();

        $this->load->view('backend/layout/header', $this->data);
        $this->load->view('backend/game/edit_default', $this->data);
        $this->load->view('backend/layout/footer');
    }

}
