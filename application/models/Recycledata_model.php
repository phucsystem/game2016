<?php

class Recycledata_model extends CI_Model {

    public function __construct() {
        $this->load->database();
        $this->load->library('session');
    }

    public function getRecycleDataByTeamIdAndRoundId($teamId, $roundId='', $status = '') {
        // Get a list of all user accounts
        $this->db->select("tbl_recycle_data.*, tbl_products.name AS product_name");
        $this->db->where("tbl_recycle_data.team_id", $teamId);
        if($roundId!=''){
            $this->db->where("tbl_recycle_data.round_id", $roundId);
        }
        if($status!=''){
            $this->db->where("tbl_recycle_data.status", $status);
        }
        $this->db->join('tbl_products', 'tbl_recycle_data.product_id = tbl_products.id', 'left');
        $this->db->order_by("tbl_recycle_data.id", "desc");
        $query = $this->db->get('tbl_recycle_data');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    public function updateRecycleData($id, $data) {
        // update the user account
        $updateData = array(
            'qty' => $data['qty'],
            'status' => $data['status'],
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_recycle_data', $updateData);
    }

    public function addRecycleData($data) {
        $insertData = array(
            'product_id' => $data['product_id'],
            'region_id' => $data['region_id'],
            'round_id' => $data['round_id'],
            'team_id' => $data['team_id'],
            'game_id' => $data['game_id'],
            'qty' => $data['qty'],
            'status' => RECYCLE_STATUS_OFFER
        );
        $this->db->insert('tbl_recycle_data', $insertData);
    }

    public function removeRecycleDataByGameId($id) {
        $this->db->delete('tbl_recycle_data', array('game_id' => $id));
    }

}
