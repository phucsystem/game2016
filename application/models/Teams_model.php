<?php

class Teams_model extends CI_Model {

    public function __construct() {
        $this->load->database();
        $this->load->library('session');
    }

    function getTeams() {
        // Get a list of all user accounts
        $this->db->select("tbl_teams.*, tbl_game.name AS game_name");
        $this->db->order_by("tbl_teams.id", "desc");
        $this->db->join('tbl_game', 'tbl_game.id = tbl_teams.game_id');
        $query = $this->db->get('tbl_teams');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    function getTeamsByGameId($gameId) {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where("game_id", $gameId);
        $query = $this->db->get('tbl_teams');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    public function addTeam() {

        $data = array(
            'name' => $this->input->post('name'),
            'color' => $this->input->post('color'),
            'game_id' => $this->input->post('game-id'),
            'region_id' => $this->input->post('region-id'),
            'current_round' => '1'
        );
        $this->db->insert('tbl_teams', $data);

        return $this->db->insert_id();
    }

    function getTeam($id) {
        // Get the user details
        $this->db->select("*");
        $this->db->where("id", $id);
        $query = $this->db->get('tbl_teams');
        if ($query->num_rows() > 0) {
            return $query->row_array();
        }
        return array();
    }

    public function editTeam($id) {
        // update the user account
        $data = array(
            'name' => $this->input->post('name'),
            'color' => $this->input->post('color'),
            'game_id' => $this->input->post('game-id'),
            'region_id' => $this->input->post('region-id'),
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_teams', $data);
    }
    

    public function updateRoundStatus($id, $roundStatus) {
        // update the user account
        $data = array(
            'round_status' => $roundStatus
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_teams', $data);
    }

    public function changeRoundStatus($id, $status) {
        // update the user account
        $data = array(
            'round_status' => $status
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_teams', $data);
    }

    public function changeCurrStep($id, $step) {
        // update the user account
        $data = array(
            'current_step' => $step
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_teams', $data);
    }
    
      public function startNewRound($id, $round) {
        // update the user account
        $data = array(
            'current_round' => $round,
            'current_step' => STEP_DASHBOARD,
            'round_status' => ROUND_START
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_teams', $data);
    }

    public function removeTeam($id) {
        $CI = & get_instance();
        $CI->load->model('Users_model');
        $players = $CI->Users_model->getPlayersByTeamId($id);
        foreach ($players as $p){
            $CI->Users_model->removePlayer($p['id']);
        }
        
        $this->db->delete('tbl_teams', array('id' => $id));
    }

    function updateTeam($id) {
        // update the user account
        $data = array(
            'name' => $this->input->post('name'),
            'color' => $this->input->post('color'),
            'game_id' => $this->input->post('game-id'),
            'region_id' => $this->input->post('region-id'),
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_teams', $data);
    }

}
