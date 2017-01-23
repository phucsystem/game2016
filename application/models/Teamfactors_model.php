<?php

class Teamfactors_model extends CI_Model {

    public function __construct() {
        $this->load->database();
        $this->load->library('session');
    }

    function getTeams() {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->order_by("id", "asc");
        $query = $this->db->get('tbl_team_factors');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    function getFactorsByTeamId($teamId, $roundId = '') {
        // Get the team details
        $this->db->select("*");
        $this->db->where("team_id", $teamId);
        if ($roundId != '') {
            $this->db->where("round_id", $roundId);
        }
        $query = $this->db->get('tbl_team_factors');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    function getFactorsByTeamIdAndRoundId($teamId, $roundId) {
        $this->db->select("*");
        $this->db->where("team_id", $teamId);
        $this->db->where("round_id", $roundId);
        $query = $this->db->get('tbl_team_factors');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    public function addTeamFactor($data) {

        $insertData = array(
            'round_id' => $data['round_id'],
            'team_id' => $data['team_id'],
            'factor_id' => $data['factor_id'],
            'factor_value' => $data['factor_value'],
        );
        $this->db->insert('tbl_team_factors', $insertData);
    }

    public function updateTeamFactor($teamId, $data, $roundId = null) {
        // update the user account
        $updateData = array(
            'factor_value' => $data['factor_value'],
        );
        //exit;
        $this->db->where('team_id', $teamId);
        $this->db->where('factor_id', $data['factor_id']);
        if ($roundId != null) {
            $this->db->where('round_id', $roundId);
        }
        $this->db->update('tbl_team_factors', $updateData);
    }

    public function removeTeamFactorsByTeamId($id) {
        $this->db->delete('tbl_team_factors', array('team_id' => $id));
    }

}
