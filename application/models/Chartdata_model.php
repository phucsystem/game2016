<?php

class Chartdata_model extends CI_Model {

    public function __construct() {
        $this->load->database();
    }

    function getByTeamId($id) {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where('team_id', $id);
        $query = $this->db->get('tbl_chart_data');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    public function add($data) {
        $insertData = array(
            'team_id' => $data['team_id'],
            'round_id' => $data['round_id'],
            'factor_key' => $data['factor_key'],
            'factor_value' => $data['factor_value'],
        );
        $this->db->insert('tbl_chart_data', $insertData);
        return $this->db->insert_id();
    }
    
    
    public function update($data) {
    	// update the user account
    	$updateData = array(
    			'factor_value' => $data['factor_value'],
    	);
    	//exit;
    	$this->db->where('team_id', $data['team_id']);
    	$this->db->where('round_id', $data['round_id']);
    	$this->db->where('factor_key', $data['factor_key']);
    	
    	$this->db->update('tbl_chart_data', $updateData);
    }


    public function removeByTeamId($id) {
        $this->db->delete('tbl_chart_data', array('team_id' => $id));
    }

}
