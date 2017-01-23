<?php

class Customerfactors_model extends CI_Model {

    public function __construct() {
        $this->load->database();
    }

    public function getCustomerFactors($gameId, $roundId, $regionId = '', $customerId = '') {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where("game_id", $gameId);
        $this->db->where("round_id", $roundId);
        if ($regionId != '') {
            $this->db->where("region_id", $regionId);
        }
        
        if ($customerId != '') {
            $this->db->where("customer_id", $customerId);
        }
        $this->db->order_by("id", "asc");
        $query = $this->db->get('tbl_customer_factors');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    public function addCustomerFactors($data) {
        $insertData = array(
            'game_id' => $data['game_id'],
            'round_id' => $data['round_id'],
            'region_id' => $data['region_id'],
            'customer_id' => $data['customer_id'],
            'factor_id' => $data['factor_id'],
            'factor_weight' => $data['factor_weight'],
            'factor_min_value' => $data['factor_min_value']
        );
        $this->db->insert('tbl_customer_factors', $insertData);
    }

    public function editCustomerFactors($data) {
        $updateData = array(
            'factor_weight' => $data['factor_weight'],
            'factor_min_value' => $data['factor_min_value']
        );
        $this->db->where('game_id', $data['game_id']);
        $this->db->where('round_id', $data['round_id']);
        $this->db->where('region_id', $data['region_id']);
        $this->db->where('customer_id', $data['customer_id']);
        $this->db->where('factor_id', $data['factor_id']);

        $this->db->update('tbl_customer_factors', $updateData);
    }

    public function removeCustomerFactors($id) {
        $this->db->delete('tbl_customer_factors', array('id' => $id));
    }

    public function removeCustomerFactorsByGameId($id) {
        $this->db->delete('tbl_customer_factors', array('game_id' => $id));
    }

}
