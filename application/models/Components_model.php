<?php

class Components_model extends CI_Model {

    public function __construct() {
        $this->load->database();
    }

    function getComponentsByTeamId($id, $roundId = 0) {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where('team_id', $id);
        if ($roundId != 0) {
            $this->db->where('round_id', $roundId);
        }
        $this->db->order_by("tbl_components.is_default", "desc");
        $this->db->order_by("tbl_components.id", "asc");
        $query = $this->db->get('tbl_components');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }
    
    function getComponentById($id) {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where('id', $id);
        $query = $this->db->get('tbl_components');
        if ($query->num_rows() > 0) {
            return $query->row_array();
        }
        return array();
    }
    
    function getComponentByNameAndRound($name, $round, $game_id, $team_id) {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where('name', $name);
        $this->db->where('round_id', $round);
        $this->db->where('game_id', $game_id);
        $this->db->where('team_id', $team_id);
        $query = $this->db->get('tbl_components');
        if ($query->num_rows() > 0) {
            return $query->row_array();
        }
        return array();
    }

    public function addComponent($data) {
        $insertData = array(
            'name' => $data['name'],
            'inhouse_manufacturing' => $data['inhouse_manufacturing'],
            'require' => $data['require'],
            'team_id' => $data['team_id'],
            'round_id' => $data['round_id'],
            'game_id' => $data['game_id']
        );
        $this->db->insert('tbl_components', $insertData);
        return $this->db->insert_id();
    }

    public function updateComponent($data) {
        // update the user account
        $updateData = array(
            'name' => $data['name'],
            'inhouse_manufacturing' => $data['inhouse_manufacturing'],
            'require' => $data['require']
        );
        //exit;
        $this->db->where('id', $data['component_id']);
        $this->db->update('tbl_components', $updateData);
        return $this->db->last_query();
    }

    public function updateTeamFactor($teamId, $data) {
        // update the user account
        $updateData = array(
            'factor_value' => $data['factor_value'],
        );
        //exit;
        $this->db->where('team_id', $teamId);
        $this->db->where('factor_id', $data['factor_id']);
        $this->db->update('tbl_team_factors', $updateData);
    }

    public function removeComponentsByTeamId($id) {
        $this->db->delete('tbl_components', array('team_id' => $id));
    }

}
