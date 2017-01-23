<?php

class Salesdata_model extends CI_Model {

    public function __construct() {
        $this->load->database();
        $this->load->library('session');
    }

    public function getSalesDataByGameId($gameId, $regionId = '', $roundId = '') {
        // Get a list of all user accounts
        $this->db->select("tbl_sales_data.*, tbl_products.name AS product_name,  tbl_teams.name AS team_name,");
        $this->db->where("tbl_sales_data.game_id", $gameId);
        $this->db->join('tbl_products', ' tbl_sales_data.product_id = tbl_products.id', 'left');
        $this->db->join('tbl_teams', ' tbl_sales_data.team_id = tbl_teams.id', 'left');
        if ($regionId != '') {
            $this->db->where("tbl_sales_data.region_id", $regionId);
        }
        if ($roundId != '') {
            $this->db->where("tbl_sales_data.round_id", $roundId);
        }
        $this->db->order_by("tbl_sales_data.id", "desc");
        $query = $this->db->get('tbl_sales_data');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    public function getSalesDataByTeamId($teamId, $roundId = '') {
        // Get a list of all user accounts
        $this->db->select("tbl_sales_data.*, tbl_products.name AS product_name,  tbl_teams.name AS team_name,");
        $this->db->where("tbl_sales_data.team_id", $teamId);
        if ($roundId != '') {
        	$this->db->where("tbl_sales_data.round_id", $roundId);
        }
        $this->db->join('tbl_products', 'tbl_sales_data.product_id = tbl_products.id', 'left');
        $this->db->join('tbl_teams', 'tbl_sales_data.team_id = tbl_teams.id', 'left');
        $this->db->order_by("tbl_sales_data.id", "desc");
        $query = $this->db->get('tbl_sales_data');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    public function getSalesDataById($id) {
        // Get a list of all user accounts
        $this->db->select("tbl_sales_data.*");
        $this->db->where("tbl_sales_data.id", $id);
        $this->db->order_by("tbl_sales_data.id", "desc");
        $query = $this->db->get('tbl_sales_data');
        if ($query->num_rows() > 0) {
            return $query->row_array();
        }
        return array();
    }

    public function addSalesData($data) {
        $insertData = array(
            'product_id' => $data['product_id'],
            'region_id' => $data['region_id'],
            'round_id' => $data['round_id'],
            'team_id' => $data['team_id'],
            'qty' => $data['qty'],
            'remain_qty' => $data['qty'],
            'offer_price' => $data['offer_price'],
            'game_id' => $data['game_id'],
        		'customer_id' => $data['customer_id'],
        );
        $this->db->insert('tbl_sales_data', $insertData);
    }

    public function updateSaleData($id, $data) {
        // update the user account
        $updateData = array(
            'qty' => $data['qty'],
            'remain_qty' => $data['remain_qty'],
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_sales_data', $updateData);
    }

    public function removeSalesDataByGameId($id) {
        $this->db->delete('tbl_sales_data', array('game_id' => $id));
    }

}

