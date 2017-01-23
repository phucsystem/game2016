<?php

class Teamregionfactors_model extends CI_Model {

    public function __construct() {
        $this->load->database();
        $this->load->library('session');
    }
    
     function getTeams() {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->order_by("id", "asc");
        $query = $this->db->get('tbl_team_region_factors');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }
 
     public function addCredit($teamId) {
         
        
        $data = array(
            'storage_capacity' => $this->input->post('team-storage-capacity'),
            'factory_capacity' => $this->input->post('team-factory-capacity'),
            'region_id' => $this->input->post('region-id'),
            'team_id'  => $teamId
        );
        $this->db->insert('tbl_team_region_factors',$data);
    }
    
    function getFactorByTeamId($teamId) {
        // Get the team details
        $this->db->select("*");
        $this->db->where("team_id", $teamId);
        $query = $this->db->get('tbl_team_region_factors');
        if ($query->num_rows() > 0) {
            return $query->row_array();
        }
        return array();
    }
    
    
     function updateFactor($teamId) {
        // update the user account
       $data = array(
           'storage_capacity' => $this->input->post('team-storage-capacity'),
            'factory_capacity' => $this->input->post('team-factory-capacity'),
            'region_id' => $this->input->post('region-id'),
            'team_id'  => $teamId
        );
        $this->db->where('team_id', $teamId);
        $this->db->update('tbl_team_region_factors',$data);
    }  
}