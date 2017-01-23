<?php

class Round extends Backend_Controller {

    function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->data ['curr_step'] = STEP_MASTER_GAME;

        $this->is_master_logged_in();
    }

    public function index($gameId, $tab = '') {
        $this->load->model('Teams_model');
        $this->load->model('Games_model');
        $teams = $this->Teams_model->getTeamsByGameId($gameId);
        foreach ($teams as $tKey => $tValue) {
            $teams [$tKey] ['round_status_name'] = $this->getRoundStatusNameById($tValue ['round_status']);
            $teams [$tKey] ['current_round_name'] = $this->getStepNameById($tValue ['current_step']);
        }
        $this->data ['gameId'] = $gameId;
        $this->data ['teams'] = $teams;
        $this->data ['tab'] = $tab;

        $this->data ['gameInfo'] = $this->Games_model->getGameById($gameId);
        $this->data ['current_round'] = $this->data ['gameInfo'] ['current_round'];

        $this->showSaleData($gameId);
        $this->showReport($gameId);

        $this->data ['improvement_view'] = $this->load->view('backend/round/improvement', $this->data, true);
        $this->data ['recycle_view'] = $this->load->view('backend/round/recycle', $this->data, true);

        $this->load->view('backend/layout/header', $this->data);
        $this->load->view('backend/round/index', $this->data);
        $this->load->view('backend/layout/footer');
    }

    public function getrecyclehistory($teamId) {
        $data = array();
        $this->load->model('Recycledata_model');
        $returnProducts = $this->Recycledata_model->getRecycleDataByTeamIdAndRoundId($teamId);
        foreach ($returnProducts as $rKey => $rValue) {
            $returnProducts [$rKey] ['region_name'] = $this->getRegionNameById($rValue ['region_id']);
        }
        $data ['recycle_history'] = $returnProducts;
        echo json_encode($data);
        exit();
    }

    public function sale($gameId) {
        $retData = array();
        $retData ['result'] = false;
        if ($this->input->server('REQUEST_METHOD') == 'POST') {
            $this->load->model('Sales_model');
            $this->load->model('Salesdata_model');
            $this->load->model('Games_model');
            $this->load->model('Regions_model');
            $this->load->model('Storages_model');

            $this->data ['gameInfo'] = $this->Games_model->getGameById($gameId);

            $postData = $this->input->post();
            $saleData = $postData ['sale'];
            $customerId = $saleData ['customer'];

            unset($saleData ['customer']);

            foreach ($saleData as $sale) {
                // Add record of sale data
                $saleData = array();
                $saleData ['product_id'] = $sale ['product_id'];
                $saleData ['team_id'] = $sale ['team_id'];
                $saleData ['region_id'] = $sale ['region_id'];
                $saleData ['round_id'] = $this->data ['gameInfo'] ['current_round'];
                $saleData ['qty'] = $sale ['sell_qty'];
                $saleData ['offer_price'] = $sale ['offered_price'];
                $saleData ['game_id'] = $this->data ['gameInfo'] ['id'];
                $saleData ['customer_id'] = $customerId;
                $this->Salesdata_model->addSalesData($saleData);

                // Minus product quantity in storage
                $currentStorage = $this->Storages_model->getStoragesByTypeAndTeamId(ITEM_STORE_TYPE_PRODUCT, $sale ['team_id'], $sale ['product_id'], $sale ['region_id']);
                $currentStorage [0] ['quantity'] -= $sale ['sell_qty'];
                $this->Storages_model->updateStorage($currentStorage [0] ['id'], $currentStorage [0]);

                // Minus product quality in offer
                $teamSaleData = $this->Sales_model->getSalesByTeamAndRound($sale ['team_id'], $this->data ['gameInfo'] ['current_round'], $sale ['region_id'], $sale ['product_id']);
                $teamSaleData [0] ['quantity'] -= $sale ['sell_qty'];
                $this->Sales_model->updateSales($teamSaleData [0]);


                // Record action
                // Get product info
                $this->load->model('Products_model');
                $productInfo = $this->Products_model->getProductById($sale ['product_id']);

                $plusMoney = $saleData ['offer_price'] * $saleData ['qty'];
                // Plus money to team
                $newMoneyAmt = $this->updateTeamFactor($sale ['team_id'], $this->data ['gameInfo'] ['current_round'], TEAM_MONEY, $plusMoney);
                $this->recordAction(RECORD_TYPE_MONEY, $plusMoney, $this->data ['gameInfo'] ['id'], $sale ['team_id'], $this->data ['gameInfo'] ['current_round'], 'Add money for sale of ' . $productInfo ['name'] . '.', $sale ['product_id'], $newMoneyAmt);

                $regionFactors = reset_array_key($this->Regions_model->getRegionByRoundIdAndRegionId($this->data ['gameInfo'] ['current_round'], $sale ['region_id'], $this->data ['gameInfo'] ['id'], 0), 'factor_id');
                $eco_credit_for_sale = $regionFactors [REGION_ECO_CREDIT_SALE] ['factor_value'];
                $so_credit_for_sale = $regionFactors [REGION_SO_CREDIT_SALE] ['factor_value'];

                // Plus ECO credit to team
//                $plus_eco_credit = $eco_credit_for_sale * $sale ['sell_qty'];
//                $new_eco_credit = $this->updateTeamFactor($sale ['team_id'], $this->data ['gameInfo'] ['current_round'], TEAM_ECO_CREDIT, $plus_eco_credit);
//                $this->recordAction(RECORD_TYPE_ECO, $plus_eco_credit, $this->data ['gameInfo'] ['id'], $sale ['team_id'], $this->data ['gameInfo'] ['current_round'], 'Add eco credit for sale of ' . $productInfo ['name'], $sale ['product_id'] . '.', $new_eco_credit);


                // Plus SO credit to team
                $plus_so_credit = $so_credit_for_sale * $sale ['sell_qty'];
                $new_so_credit = $this->updateTeamFactor($sale ['team_id'], $this->data ['gameInfo'] ['current_round'], TEAM_SO_CREDIT, $plus_so_credit);
                $this->recordAction(RECORD_TYPE_SO, $plus_eco_credit, $this->data ['gameInfo'] ['id'], $sale ['team_id'], $this->data ['gameInfo'] ['current_round'], 'Add so credit for sale of ' . $productInfo ['name'], $sale ['product_id'] . '.', $new_so_credit);
            }
            $retData ['result'] = true;
        }

        echo json_encode($retData);
        exit();
    }

//    public function autosale($gameId) {
//        $retData = array();
//        $retData ['result'] = false;
//
//        $this->load->model('Sales_model');
//        $this->load->model('Salesdata_model');
//        $this->load->model('Games_model');
//        $this->load->model('Regions_model');
//        $this->load->model('Storages_model');
//        $this->load->model('Customerfactors_model');
//        $this->load->model('Teams_model');
//        $this->load->model('Teamfactors_model');
//        
//          $passedTeam = [];
//
//        $gameInfo = $this->Games_model->getGameById($gameId);
//
//        $regions = $this->getRegionList();
//        $customers = $this->getCustomerList();
//        $saleVolume = array();
//        $customerFactorsInfo = array();
//        // Calculate volume for each customer
//        foreach ($regions as $r) {
//            $regionFactors = reset_array_key($this->Regions_model->getRegionByRoundIdAndRegionId($gameInfo ['current_round'], $r ['id'], $gameId), 'factor_id');
//            $saleVolume [$r ['id']]['volume'] = $regionFactors [REGION_MARKET_VOLUME] ['factor_value'];
//
//            foreach ($customers as $c) {
//                $customerFactorsInfo[$r ['id']][$c['id']] = reset_array_key($this->Customerfactors_model->getCustomerFactors($gameId, $gameInfo ['current_round'], $r ['id'], $c ['id']), 'factor_id');
//                $saleVolume [$r ['id']]['customers'] [$c ['id']] = $customerFactorsInfo[$r ['id']][$c['id']] [CUSTOMER_MARKET_SHARE] ['factor_weight'] * $saleVolume [$r ['id']]['volume'] / 100;
//            }
//        }
//
//        $customerFactorList = array_merge($this->getCustomerFactors1(), $this->getCustomerFactors2());
//        $teams = $this->Teams_model->getTeamsByGameId($gameId);
//        
//        $teamSales = array();
//        $teamAdvantages = array();
//        $highest_team_standardizeds = '';
//        foreach ($teams as $t) {
//            $teamRecords = reset_array_key($this->Teamfactors_model->getFactorsByTeamId($t ['id']), 'factor_id');
//            $teamAdvantages [$t ['id']]['eco'] = $teamRecords [TEAM_ECO_CREDIT] ['factor_value'];
//            $teamAdvantages [$t ['id']]['me'] = $teamRecords [TEAM_ME_CREDIT] ['factor_value'];
//            $teamAdvantages [$t ['id']]['so'] = $teamRecords [TEAM_SO_CREDIT] ['factor_value'];
//            $teamAdvantages[$t ['id']]['image'] = ( $teamAdvantages [$t ['id']] ['eco'] + $teamAdvantages [$t ['id']] ['me'] + $teamAdvantages [$t ['id']] ['so']) / 3;
//
//            if ($teamAdvantages [$t ['id']]['image'] < 0) {
//                $teamAdvantages [$t ['id']]['image'] = 0;
//            }
//            if(empty($highest_team_standardizeds)){
//                $highest_team_standardizeds = $teamAdvantages[$t ['id']]['image'];
//            }else{
//                if($teamAdvantages[$t ['id']]['image'] > $highest_team_standardizeds){
//                    $highest_team_standardizeds = $teamAdvantages[$t ['id']]['image'];
//                }
//            }
//        }
//
//        foreach ($regions as $r) {
//            foreach ($teams as $t) {
//                $teamSales[$r['id']][$t ['id']] = $this->Sales_model->getSalesByTeamAndRound($t ['id'], $gameInfo ['current_round'], $r['id']);
//            }
//        }
//
//        $saleResult = array();
//        foreach ($regions as $r) {
//            foreach ($customers as $c) {
//                $cusReliability = $customerFactorsInfo[$r ['id']][$c['id']][CUSTOMER_RELIABILITY]['factor_min_value'] ;
//                $cusRange = $customerFactorsInfo[$r ['id']][$c['id']][CUSTOMER_RANGE]['factor_min_value'] ;
//                $cusDesign = $customerFactorsInfo[$r ['id']][$c['id']] [CUSTOMER_DESIGN]['factor_min_value'] ;
//                $cusImage = $customerFactorsInfo[$r ['id']][$c['id']] [CUSTOMER_IMAGE]['factor_min_value'] ;
//                $cusMaxPrice = $customerFactorsInfo [$r ['id']][$c['id']][CUSTOMER_PRICE] ['factor_weight'];
//                
//                foreach ($teams as $t) {
//                    if ($teamAdvantages[$t ['id']]['image'] > $cusImage)
//                        foreach ($teamSales[$r['id']][$t ['id']] as $ts) {
//                            if ($ts['offer_price'] <= $cusMaxPrice &&
//                                    $ts ['product_range'] >= $cusRange &&
//                                    $ts['product_design'] >= $cusDesign &&
//                                    $ts['product_reliability'] >= $cusReliability) {
//                                $passedTeam[$r ['id']][$c['id']][$ts['id']] = $ts;
//                            }
//                        }
//                }
//            }
//        }
//        
//        $saleAdvantages = [];
//         foreach ($regions as $r) {
//            foreach ($customers as $c) {
//                $customer_range_weight = $customerFactorsInfo[$r ['id']][$c['id']][CUSTOMER_RANGE]['factor_weight'];
//                $customer_design_weight = $customerFactorsInfo[$r ['id']][$c['id']][CUSTOMER_DESIGN]['factor_weight'];
//                $customer_reliability_weight = $customerFactorsInfo[$r ['id']][$c['id']][CUSTOMER_RELIABILITY]['factor_weight'];
//                $customer_image_weight = $customerFactorsInfo[$r ['id']][$c['id']][CUSTOMER_IMAGE]['factor_weight'];
//                
//                if(!empty($passedTeam[$r ['id']][$c['id']])){
//                   foreach ($passedTeam[$r ['id']][$c['id']] as $pt) {
//                    $saleAdvantages[$r ['id']][$c['id']][$pt['id']] = $pt['product_design']*$customer_design_weight + 
//                            $pt['product_range']*$customer_range_weight+
//                            $pt['product_reliability']*$customer_reliability_weight + 
//                            $teamAdvantages[$pt ['team_id']]['image']/$highest_team_standardizeds * 100 * $customer_image_weight;
//                } 
//                }
//                
//            }
//            if (!empty($saleAdvantages[$r ['id']][$c['id']]) && is_array($saleAdvantages[$r ['id']][$c['id']])) {
//                arsort($saleAdvantages[$r ['id']][$c['id']]);
//                
//            }
//        }
//        
//        $autoSellList = [];
//        foreach ($regions as $r) {
//            foreach ($teams as $t) {
//                foreach ($teamSales[$r['id']][$t ['id']] as $sl){
//                    $autoSellList[$sl['id']] = $sl;
//                }
//            }
//        }
//
//        foreach ($regions as $r) {
//            foreach ($customers as $c) {
//                $saleItem = null;
//                if ($saleVolume [$r ['id']]['customers'] [$c ['id']] > 0) {
//                    if (!empty($saleAdvantages[$r ['id']][$c['id']])) {
//                        foreach ($saleAdvantages[$r ['id']][$c['id']] as $key =>  $sa) {
//                           $sellItem = $autoSellList[$key];
//                           $saleVolume [$r ['id']]['customers'] [$c ['id']] -= $sellItem['quantity'];
//                        }
//                    }
//                }
//            }
//        }
//
//
//        $retData['sell_products'] = $passedTeam;
//
//        echo json_encode($retData);
//        exit();
//    }

    public function stopround($teamId) {
        $this->load->model('Teams_model');
        $data ['result'] = false;
        $this->Teams_model->updateRoundStatus($teamId, ROUND_WAIT_FOR_EVALUATE);
        $data ['result'] = true;
        echo json_encode($data);
        exit();
    }

    public function finishround($gameId) {
        $this->load->model('Regions_model');
        $this->load->model('Recyclemethods_model');
        $this->load->model('Customerfactors_model');
        $this->load->model('Teamfactors_model');


        $data ['result'] = false;
        $this->load->model('Games_model');
        $this->load->model('Teams_model');

        $gameInfo = $this->Games_model->getGameById($gameId);
        $gameInfo ['status'] = GAME_ROUND_FINISH_EVALUATION;
        // Update Game
        $this->Games_model->editGame($gameId, $gameInfo);

        // Update region factor for following round
        $currentRegionInfo = $this->Regions_model->getRegionByGameAndRoundId($gameInfo ['id'], $gameInfo ['current_round']);
        $updateRound = $gameInfo ['current_round'];
        $updateRound ++;

        if ($updateRound <= $gameInfo ['number_of_round']) {
            foreach ($currentRegionInfo as $rInfo) {
                $updateRegion = $rInfo;
                $updateRegion ['round_id'] = $updateRound;
                $this->Regions_model->editRegion($updateRegion);
            }
        }

        $currCustomerInfo = $this->Customerfactors_model->getCustomerFactors($gameInfo ['id'], $gameInfo ['current_round']);
        if ($updateRound <= $gameInfo ['number_of_round']) {
            foreach ($currCustomerInfo as $cusInfo) {
                $updateCustomer = $cusInfo;
                $updateCustomer ['round_id'] = $updateRound;
                $this->Customerfactors_model->editCustomerFactors($updateCustomer);
            }
        }

        $teams = $this->Teams_model->getTeamsByGameId($gameId);
        foreach ($teams as $t) {

            $currRecycleMethod = group_array_key($this->Recyclemethods_model->getRecycleMethodByGameId(0, $gameInfo ['current_round'], $t ['id']), 'method_code');
            if ($updateRound <= $gameInfo ['number_of_round']) {
                $this->Recyclemethods_model->removeRecycleMethodByGameIdAndRoundId($gameInfo ['id'], $updateRound, $t ['id']);
                foreach ($currRecycleMethod as $rmInfo) {
                    $recycleMethod = array();
                    $recycleMethod ['method_code'] = $this->uuid->v4();
                    $recycleMethod ['game_id'] = $gameId;
                    $recycleMethod ['round_id'] = $updateRound;

                    foreach ($rmInfo as $rmFactor) {
                        $recycleMethod ['team_id'] = $rmFactor ['team_id'];
                        $recycleMethod ['factor_id'] = $rmFactor ['factor_id'];
                        $recycleMethod ['factor_value'] = $rmFactor ['factor_value'];
                        $this->Recyclemethods_model->addRecycleMethod($recycleMethod);
                    }
                }
            }



            // Get team factor record for whole game
            $teamRecords = $this->Teamfactors_model->getFactorsByTeamId($t ['id'], $gameInfo ['current_round']);
            if ($gameInfo ['current_round'] == $gameInfo ['number_of_round']) {
                $chartData = array();
                $chartData ['team_id'] = $this->data ['userData'] ['teamId'];
                $chartData ['round_id'] = $gameInfo ['current_round'];
                foreach ($teamRecords as $tr) {
                    $chartData ['factor_key'] = $tr['factor_id'];
                    $chartData ['factor_value'] = $tr['factor_value'];
                    $this->Chartdata_model->add($chartData);
                }
            }
        }


        $data ['result'] = true;
        echo json_encode($data);
        exit();
    }

    // Start new round
    public function startnew($gameId) {
        $this->load->model('Games_model');
        $this->load->model('Teams_model');
        $this->load->model('Teamfactors_model');
        $this->load->model('Improvement_model');
        $this->load->model('Products_model');
        $this->load->model('Productcomponents_model');
        $this->load->model('Components_model');
        $this->load->model('Componentmaterials_model');
        $this->load->model('Storages_model');

        $data ['result'] = false;
        $oldround = 0;
        $newround = 0;
        $gameInfo = $this->Games_model->getGameById($gameId);
        // Update Game
        if ($gameInfo ['current_round'] < $gameInfo ['number_of_round']) {
            $oldround = $gameInfo ['current_round'];
            $gameInfo ['current_round'] ++;
            $newround = $gameInfo ['current_round'];
            $gameInfo ['status'] = GAME_ACTIVE;
            $this->Games_model->editGame($gameId, $gameInfo);

            // Update setting for the round
        }
        // Update Team
        $teams = $this->Teams_model->getTeamsByGameId($gameId);
        foreach ($teams as $t) {
            $this->Teams_model->startNewRound($t ['id'], $newround);
            $teamFactors = $this->Teamfactors_model->getFactorsByTeamId($t ['id'], $oldround);
            // Copy team factor from old round to the new round
            foreach ($teamFactors as $tf) {
                $factorData = array();
                $factorData ['round_id'] = $newround;
                $factorData ['team_id'] = $t ['id'];
                $factorData ['factor_id'] = $tf ['factor_id'];
                $factorData ['factor_value'] = $tf ['factor_value'];
                $this->Teamfactors_model->addTeamFactor($factorData);
            }
            // apply improvement for new round
            $improvements = $this->Improvement_model->getByTeamId($factorData ['team_id'], $oldround);
            foreach ($improvements as $i) {

                $newValue = $this->updateTeamFactor($i ['team_id'], $i ['round_id'] + 1, $i ['factor_id'], $i ['value']);
                // Record action
                $actionKey = 0;
                switch ($i ['factor_id']) {
                    case TEAM_MONEY :
                        $actionKey = RECORD_TYPE_MONEY;
                        break;
                    case TEAM_ECO_CREDIT :
                        $actionKey = RECORD_TYPE_ECO;
                        break;
                    case TEAM_SO_CREDIT :
                        $actionKey = RECORD_TYPE_SO;
                        break;
                    case TEAM_ME_CREDIT :
                        $actionKey = RECORD_TYPE_ME;
                        break;
                }

                if ($actionKey > 0) {
                    $this->recordAction($actionKey, $i ['value'], $gameId, $i ['team_id'], $i ['round_id'], $i ['description'], '', $newValue);
                }
            }

            // Update new component id and material id for current product
            $productList = $this->Products_model->getProductsByTeamId($t ['id']);
            foreach ($productList as $p) {
                $productComponentInfo = $this->Productcomponents_model->getProductComponentsByProductId($p ['id']);

                foreach ($productComponentInfo as $pc) {
                    $componentInfo = $this->Components_model->getComponentById($pc ['component_id']);
                    $componentMaterialInfo = $this->Componentmaterials_model->getMaterialsById($pc ['material_id']);

                    $newComponentInfo = $this->Components_model->getComponentByNameAndRound($componentInfo ['name'], $newround, $gameId, $t ['id']);
                    $newMaterialInfo = $this->Componentmaterials_model->getMaterialsByNameAndRound($componentMaterialInfo ['name'], $newround, $gameId, $t ['id'], $newComponentInfo ['id']);

                    $pc ['component_id'] = $newComponentInfo ['id'];
                    $pc ['material_id'] = $newMaterialInfo ['id'];

                    $this->Productcomponents_model->updateProductComponentById($pc ['id'], $pc);
                }
            }

            // Update storage
            $materialStorage = $this->Storages_model->getStoragesByTypeAndTeamId(ITEM_STORE_TYPE_MATERIAL, $t ['id']);
            foreach ($materialStorage as $m) {
                $componentMaterialInfo = $this->Componentmaterials_model->getMaterialsById($m ['item_id']);
                $componentInfo = $this->Components_model->getComponentById($componentMaterialInfo ['component_id']);

                $newComponentInfo = $this->Components_model->getComponentByNameAndRound($componentInfo ['name'], $newround, $gameId, $t ['id']);
                $newMaterialInfo = $this->Componentmaterials_model->getMaterialsByNameAndRound($componentMaterialInfo ['name'], $newround, $gameId, $t ['id'], $newComponentInfo ['id']);

                $m ['item_id'] = $newMaterialInfo ['id'];
                $this->Storages_model->updateStorageItemId($m ['id'], $m);
            }
        }
        $data ['result'] = true;
        echo json_encode($data);
        exit();
    }

    public function showSaleData($gameId = '') {
        $this->load->model('Salesdata_model');
        $this->data ['regionList'] = $this->getRegionList();
        $this->data ['customerList'] = $this->getCustomerList();
        $this->load->model('Games_model');
        $gameInfo = $this->Games_model->getGameById($gameId);
        $this->data ['saleHistory'] = $this->Salesdata_model->getSalesDataByGameId($gameId, '', $gameInfo ['current_round']);
        $customers = $this->getCustomerList();

        foreach ($this->data ['saleHistory'] as $sKey => $sValue) {
            if (empty($sValue ['customer_id'])) {
                $sValue ['customer_id'] = 1;
            }
            $this->data ['saleHistory'] [$sKey] ['customer'] = $customers [$sValue ['customer_id']] ['label'];
            $this->data ['saleHistory'] [$sKey] ['region_name'] = $this->getRegionNameById($sValue ['region_id']);
        }

        $this->load->model('Teams_model');
        $teams = $this->Teams_model->getTeamsByGameId($gameId);
        $teamId = $teams [0] ['id'];

        $this->load->model('Regions_model');
        $this->load->model('Customerfactors_model');
        $regionList = $this->getRegionList();
        $this->data ['saleVolume'] = array();
        foreach ($regionList as $r) {
            $regionFactors = reset_array_key($this->Regions_model->getRegionByRoundIdAndRegionId($gameInfo ['current_round'], $r ['id'], $gameId, $teamId), 'factor_id');
            $regionFactors += reset_array_key($this->Regions_model->getRegionByRoundIdAndRegionId($gameInfo ['current_round'], $r ['id'], $gameId), 'factor_id');
            $this->data ['saleVolume'] [$r ['id']] = $regionFactors [REGION_MARKET_VOLUME] ['factor_value'];

            foreach ($customers as $c) {
                $customerFactorsInfo = reset_array_key($this->Customerfactors_model->getCustomerFactors($gameId, $gameInfo ['current_round'], $r ['id'], $c ['id']), 'factor_id');
                $this->data ['marketShare'] [$r ['id']] [$c ['id']] = $customerFactorsInfo [CUSTOMER_MARKET_SHARE] ['factor_weight'];
            }
        }

        $this->data ['sale_view'] = $this->load->view('backend/round/sales', $this->data, true);
    }

    public function filtersale($gameId, $region, $customer) {
        $data = array();
        $data ['result'] = null;

        $regionList = $this->getRegionList();
        $customerList = $this->getCustomerList();
        $customerFactorList = array_merge($this->getCustomerFactors1(), $this->getCustomerFactors2());

        $this->data ['regionList'] = $regionList;
        $this->data ['customerList'] = $customerList;
        $this->data ['customerFactorList'] = $customerFactorList;

        $this->load->model('Games_model');
        $this->load->model('Teams_model');
        $this->load->model('Teamfactors_model');
        $this->load->model('Customerfactors_model');

        $gameInfo = $this->Games_model->getGameById($gameId);
        $teams = $this->Teams_model->getTeamsByGameId($gameId);
        $customerFactorsInfo = reset_array_key($this->Customerfactors_model->getCustomerFactors($gameId, $gameInfo ['current_round'], $region, $customer), 'factor_id');

        $cusMarketShare = $customerFactorsInfo [CUSTOMER_MARKET_SHARE] ['factor_weight'];
        $cusMaxPrice = $customerFactorsInfo [CUSTOMER_PRICE] ['factor_weight'];
        // 4 params : weight + min value
        $cusReliability = $customerFactorsInfo [CUSTOMER_RELIABILITY];
        $cusRange = $customerFactorsInfo [CUSTOMER_RANGE];
        $cusDesign = $customerFactorsInfo [CUSTOMER_DESIGN];

        $cusImage = $customerFactorsInfo [CUSTOMER_IMAGE];

        $this->load->model('Sales_model');
        $totalSaleData = array();
        $totalRejectedData = array();
        // Sale data of round
        foreach ($teams as $t) {
            $teamSale = array();
            $teamRejected = array();

            $salesData = $this->Sales_model->getSalesByTeamAndRound($t ['id'], $t ['current_round'], $region);
            $teamRecords = reset_array_key($this->Teamfactors_model->getFactorsByTeamId($t ['id']), 'factor_id');

            $teamInfo = array();
            $teamInfo ['eco'] = $teamRecords [TEAM_ECO_CREDIT] ['factor_value'];
            $teamInfo ['me'] = $teamRecords [TEAM_ME_CREDIT] ['factor_value'];
            $teamInfo ['so'] = $teamRecords [TEAM_SO_CREDIT] ['factor_value'];
            // Image = SO + ME + ECO of team / 3
            $teamInfo ['image'] = ($teamInfo ['eco'] + $teamInfo ['me'] + $teamInfo ['so']) / 3;

            // Rule of image point
            if ($teamInfo ['image'] < 0) {
                $teamInfo ['image'] = 0;
            }

            // Sort and group optimal sale offer
            // Remove any sale offer have any param less than min value => Move to rejected product group
            if ($teamInfo ['image'] >= $cusImage ["factor_min_value"]) {
                $teamSale = $salesData;
            } else {
                $teamRejected = $salesData;
            }

            // Check if more than customer's max price
            // Check product's charateristic
            foreach ($teamSale as $saleKey => $saleValue) {
                if ($saleValue ['offer_price'] > $cusMaxPrice || $saleValue ['product_range'] < $cusRange ['factor_min_value'] || $saleValue ['product_design'] < $cusDesign ['factor_min_value'] || $saleValue ['product_reliability'] < $cusReliability ['factor_min_value']) {
                    // Reject offered product
                    $teamRejected [] = $saleValue;
                    unset($teamSale [$saleKey]);
                } else {
                    $teamSale [$saleKey] ['product_summary'] = round($saleValue ['product_range'] * $cusRange ['factor_weight'] + $saleValue ['product_design'] * $cusDesign ['factor_weight'] + $saleValue ['product_reliability'] * $cusReliability ['factor_weight'] + $teamInfo ['image'] * $cusImage ['factor_weight']);
                }
            }

            // (1) Get weighting value * product's characteristic value
            // (2) Sum all of result
            // (3) Sort by the sum of result from high to low => move to accepted product group
            $totalSaleData = array_merge($totalSaleData, $teamSale);
            $totalRejectedData = array_merge($totalRejectedData, $teamRejected);

            $data ['result'] = true;
        }

        sort_by_key($totalSaleData, 'product_summary', 'desc');

        $data ['saleData'] = $totalSaleData;
        $data ['rejectedData'] = $totalRejectedData;

        echo json_encode($data);
        exit();
    }

    public function improvement($roundId, $gameId) {
        if ($this->input->server('REQUEST_METHOD') == 'POST') {
            $postData = $this->input->post();
            $this->load->model('Improvement_model');

            $teamId = $postData ['improvement'] ['team_id'];
            $factors = $postData ['improvement'] ['factor'];

            foreach ($factors as $fKey => $fValue) {
                if ($fValue != 0) {
                    $improveData = array();
                    $improveData ['team_id'] = $teamId;
                    $improveData ['round_id'] = $roundId;
                    $improveData ['factor_id'] = $fKey;
                    $improveData ['value'] = $fValue;
                    $improveData ['description'] = $postData ['improvement'] ['note'];

                    // Update team factor
                    $newValue = $this->Improvement_model->addImprovement($improveData);
                }
            }

            redirect('master/round/index/' . $gameId . '/improve');
        }
    }

    public function getusedproduct($teamId) {
        $data = array();
        $this->load->model('Salesdata_model');
        $data ['saleHistory'] = array();
        $saleHistory = $this->Salesdata_model->getSalesDataByTeamId($teamId);
        foreach ($saleHistory as $key => $value) {
            if ($value ['remain_qty'] > 0) {
                $value ['region_name'] = $this->getRegionNameById($value ['region_id']);
                $data ['saleHistory'] [] = $value;
            }
        }

        $this->load->model('Teamfactors_model');
        $this->load->model('Teams_model');

        $this->data ['teamInfo'] = $this->Teams_model->getTeam($teamId);
        $this->data ['teamFactorsInfo'] = reset_array_key($this->Teamfactors_model->getFactorsByTeamIdAndRoundId($teamId, $this->data ['teamInfo'] ['current_round']), 'factor_id');
        $data ['store_capacity'] [REGION_INDUSTRIAL_COUNTRY] = $this->data ['teamFactorsInfo'] [TEAM_STORAGE_CAPACITY_IC] ['factor_value'];
        $data ['store_capacity'] [REGION_EMERGING_COUNTRY_1] = $this->data ['teamFactorsInfo'] [TEAM_STORAGE_CAPACITY_EC1] ['factor_value'];
        $data ['store_capacity'] [REGION_EMERGING_COUNTRY_2] = $this->data ['teamFactorsInfo'] [TEAM_STORAGE_CAPACITY_EC2] ['factor_value'];
        $data ['store_capacity'] [REGION_DEVELOPMENT_COUNTRY] = $this->data ['teamFactorsInfo'] [TEAM_STORAGE_CAPACITY_DC] ['factor_value'];

        echo json_encode($data);
        exit();
    }

    public function returnproduct($teamId) {
        $data = array();
        $postData = $this->input->post();
        $returnProducts = $postData ['recycle'];
        $this->load->model('Recycledata_model');
        $this->load->model('Salesdata_model');

        $this->load->model('Teams_model');
        $teamInfo = $this->Teams_model->getTeam($teamId);
        $totalRecyleData = array();

        foreach ($returnProducts as $pKey => $pValue) {
            $ukey = $pValue ['product_id'] . '_' . $pValue ['region_id'];
            if (empty($totalRecyleData [$ukey])) {
                $recycleData = array();
                $recycleData ['product_id'] = $pValue ['product_id'];
                $recycleData ['region_id'] = $pValue ['region_id'];
                $recycleData ['round_id'] = $teamInfo ['current_round'];
                $recycleData ['team_id'] = $teamId;
                $recycleData ['game_id'] = $pValue ['game_id'];
                $recycleData ['qty'] = $pValue ['qty'];
                $totalRecyleData [$ukey] = $recycleData;
            } else {
                $totalRecyleData [$ukey] ['qty'] += $pValue ['qty'];
            }

            // Minus sale data
            $saleData = $this->Salesdata_model->getSalesDataById($pKey);
            $saleData ['remain_qty'] -= $pValue ['qty'];
            $this->Salesdata_model->updateSaleData($pKey, $saleData);
        }
        $currRecycle = $this->Recycledata_model->getRecycleDataByTeamIdAndRoundId($teamId, $teamInfo ['current_round']);
        $tmpCurrRecycle = array();
        foreach ($currRecycle as $key => $value) {
            $tmpCurrRecycle [$value ['region_id']] [$value ['product_id']] = $value;
        }
        $currRecycle = $tmpCurrRecycle;

        // Save recycle data for each product
        foreach ($totalRecyleData as $tpKey => $tpValue) {

            $insertData = array();
            $insertData ['product_id'] = $tpValue ['product_id'];
            $insertData ['region_id'] = $tpValue ['region_id'];
            $insertData ['round_id'] = $tpValue ['round_id'];
            $insertData ['team_id'] = $tpValue ['team_id'];
            $insertData ['game_id'] = $tpValue ['game_id'];
            if (!empty($currRecycle [$tpValue ['region_id']] [$tpValue ['product_id']])) {
                $updateData = $currRecycle [$tpValue ['region_id']] [$tpValue ['product_id']];
                $updateData ['qty'] += $tpValue ['qty'];
                $this->Recycledata_model->updateRecycleData($updateData ['id'], $updateData);
            } else {
                $insertData ['qty'] = $tpValue ['qty'];
                $this->Recycledata_model->addRecycleData($insertData);
            }
        }

        $data ['result'] = true;
        echo json_encode($data);
        exit();
    }

    public function updateTeamFactor($teamId, $roundId, $factorId, $value) {
        $this->load->model('Teams_model');
        $this->load->model('Teamfactors_model');
        $teamFactors = reset_array_key($this->Teamfactors_model->getFactorsByTeamIdAndRoundId($teamId, $roundId), 'factor_id');
        $teamFactors [$factorId] ['factor_value'] += $value;
        $this->Teamfactors_model->updateTeamFactor($teamId, $teamFactors [$factorId], $roundId);
        return $teamFactors [$factorId] ['factor_value'];
    }

    public function recordAction($key, $value, $game_id, $teamId, $roundId, $description = '', $productId = '', $newValue = '') {
        $this->load->model('Teamactionrecords_model');
        $actionRecord = array();
        $actionRecord ['key'] = $key;
        $actionRecord ['value'] = $value;
        $actionRecord ['new_value'] = $newValue;
        $actionRecord ['game_id'] = $game_id;
        $actionRecord ['team_id'] = $teamId;
        $actionRecord ['round_id'] = $roundId;
        $actionRecord ['region_id'] = '';
        $actionRecord ['product_id'] = $productId;
        $actionRecord ['description'] = $description;
        $this->Teamactionrecords_model->addRecord($actionRecord);
    }

    public function showReport($gameId) {
        $this->load->model('Salesdata_model');
        $this->load->model('Games_model');
        $this->load->model('Salesdata_model');
        $this->load->model('Teamfactors_model');
        $this->load->model('Regions_model');

        $gameInfo = $this->Games_model->getGameById($gameId);
        $customers = $this->getCustomerList();
        $regions = $this->getRegionList();
        $this->data ['regionList'] = $regions;
        // Get customer market report
        $this->data ['saleHistory'] = group_array_key($this->Salesdata_model->getSalesDataByGameId($gameId, '', $gameInfo ['current_round']), 'region_id');
        $customerReportData = array();
        foreach ($regions as $c) {
            $customerData = array();
            $customerData ['region'] = $this->getRegionNameById($c ['id']);
            $customerData ['poor_student'] = 0;
            $customerData ['heavy_user'] = 0;
            $customerData ['eco_hipster'] = 0;
            $customerReportData [$c ['id']] = $customerData;
        }

        $teamSale = array();
        foreach ($this->data ['saleHistory'] as $sKey => $sValue) {

            $customerData = array();
            $customerData ['region'] = $this->getRegionNameById($sKey);
            $customerData ['poor_student'] = 0;
            $customerData ['heavy_user'] = 0;
            $customerData ['eco_hipster'] = 0;

            foreach ($sValue as $c) {
                if (empty($teamSale [$c ['team_id']] [$sKey])) {
                    $teamSale [$c ['team_id']] [$sKey] = 0;
                }
                $teamSale [$c ['team_id']] [$sKey] += $c ['qty'];

                if ($c ['customer_id'] == CUSTOMER_TYPE_POOR_STUDENT) {
                    $customerData ['poor_student'] += $c ['qty'];
                } elseif ($c ['customer_id'] == CUSTOMER_TYPE_HEAVY_USER) {
                    $customerData ['heavy_user'] += $c ['qty'];
                } elseif ($c ['customer_id'] == CUSTOMER_TYPE_ECO_HIPSTER) {
                    $customerData ['eco_hipster'] += $c ['qty'];
                }
            }
            $customerReportData [$sKey] = $customerData;
        }

        $this->data ['teamSale'] = $teamSale;

        $this->data ['customerData'] = array();
        foreach ($customerReportData as $cr) {
            array_push($this->data ['customerData'], array(
                'region' => $cr ['region'],
                'poor_student' => $cr ['poor_student'],
                'heavy_user' => $cr ['heavy_user'],
                'eco_hipster' => $cr ['eco_hipster']
            ));
        }

        $this->data ['reportTeams'] = reset_array_key($this->Teams_model->getTeamsByGameId($gameId), 'id');
        // Get team factor report
        $this->data ['teamFactors'] = $this->getTeamFactors();
        foreach ($this->data ['reportTeams'] as $tKey => $tValue) {
            $this->data ['reportTeams'] [$tKey] ['factors'] = reset_array_key($this->Teamfactors_model->getFactorsByTeamId($tKey, $tValue ['current_round']), 'factor_id');
        }

        $reportMarketShare = array();
        $this->data ['marketData'] = array();
        $this->data ['saleVolume'] = array();
        $this->load->model('Teams_model');
        $teams = $this->Teams_model->getTeamsByGameId($gameId);
        $teamId = $teams [0] ['id'];
        $customerMarketShare = array();
        $customerMarketShareItem = array();
        $saleShare = array();

        foreach ($regions as $r) {

            if (empty($this->data ['saleHistory'] [$r ['id']])) {
                $soldVolumne = 0;
            } else {
                $soldVolumne = $this->data ['saleHistory'] [$r ['id']];
            }
            $regionFactors = reset_array_key($this->Regions_model->getRegionByRoundIdAndRegionId($gameInfo ['current_round'], $r ['id'], $gameId, $teamId), 'factor_id');
            $regionFactors = reset_array_key($this->Regions_model->getRegionByRoundIdAndRegionId($gameInfo ['current_round'], $r ['id'], $gameId), 'factor_id');

            $saleVolumne = $regionFactors [REGION_MARKET_VOLUME] ['factor_value'];
            $saleShare [$r ['id']] ['Available market'] = 0;

            foreach ($teams as $t) {
                $saleShare [$r ['id']] [$t ['id']] = 0;
            }

            $customerMarketShareItem ['region'] = $r ['label'];
            if ($soldVolumne != 0) {
                foreach ($soldVolumne as $sv) {
                    if (empty($saleShare [$r ['id']] [$sv ['team_id']])) {
                        $saleShare [$r ['id']] [$sv ['team_id']] = 0;
                    }

                    if ($sv ['region_id'] == $r ['id']) {
                        $saleShare [$r ['id']] [$sv ['team_id']] += $sv ['qty'];
                    }
                }
            }
            $saleShare [$r ['id']] ['marketShare'] = $saleVolumne;
            $saleShare [$r ['id']] ['Available market'] = $saleVolumne;

            foreach ($customers as $c) {
                $soldQty = 0;
                if ($soldVolumne != 0) {
                    foreach ($soldVolumne as $sv) {
                        if ($sv ['customer_id'] == $c ['id']) {
                            $soldQty += $sv ['qty'];
                            $saleShare [$r ['id']] ['Available market'] -= $sv ['qty'];
                        }
                    }
                }
                $customerFactorsInfo = reset_array_key($this->Customerfactors_model->getCustomerFactors($gameId, $gameInfo ['current_round'], $r ['id'], $c ['id']), 'factor_id');

                $reportMarketShare [$r ['id']] [$c ['id']] = $customerFactorsInfo [CUSTOMER_MARKET_SHARE] ['factor_weight'];

                $marketItem ['label'] = $c ['label'];
                $marketItem ['value'] = $customerFactorsInfo [CUSTOMER_MARKET_SHARE] ['factor_weight'] * $saleVolumne / 100 - $soldQty;
                $this->data ['marketData'] [$r ['id']] [] = $marketItem;

                $customerMarketShareItem [$c ['id']] = $customerFactorsInfo [CUSTOMER_MARKET_SHARE] ['factor_weight'] * $saleVolumne / 100;
            }

            $customerMarketShare [] = $customerMarketShareItem;
        }

        foreach ($saleShare as $ssKey => $ssValue) {
            foreach ($ssValue as $stKey => $stValue) {
                if ($stKey == 'marketShare' || $stKey == 'region') {
                    continue;
                } elseif ($stKey == 'Available market') {
                    $saleShare [$ssKey] [$stKey] = $stValue / $ssValue ['marketShare'] * 100;
                } else {
                    $teamInfo = $this->Teams_model->getTeam($stKey);
                    $saleShare [$ssKey] [$teamInfo['name']] = $stValue / $ssValue ['marketShare'] * 100;
                    unset($saleShare [$ssKey] [$stKey]);
                }
            }
            unset($saleShare [$ssKey] ['marketShare']);
        }

        $tmpSaleData = array();
        $saleDataItem = array();
        foreach ($saleShare as $ssKey => $ssValue) {
            foreach ($ssValue as $stKey => $stValue) {
                $saleDataItem['label'] = $stKey;
                $saleDataItem['value'] = $stValue;
                $tmpSaleData[$ssKey][] = $saleDataItem;
            }
        }


        $this->data['saleShare'] = $tmpSaleData;

        $this->data ['customerMarketShare'] = json_encode($customerMarketShare);

        $this->data ['report_view'] = $this->load->view('backend/round/report', $this->data, true);
    }

}
