<?php

class Games_model extends CI_Model {

    public function __construct() {
        $this->load->database();
        $this->load->library('session');
    }

    function getGames() {
        // Get a list of all user accounts
        $this->db->select("tbl_game.*, tbl_users.name AS created_by_user ");
        $this->db->join('tbl_users', 'tbl_users.id = tbl_game.created_by');
        $this->db->order_by("tbl_game.id", "desc");
        $query = $this->db->get('tbl_game');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    function getGameById($id) {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where('id', $id);
        $query = $this->db->get('tbl_game');
        if ($query->num_rows() > 0) {
            return $query->row_array();
        }
        return array();
    }

    public function addGame() {
        $adminData = $this->session->get_userdata();

        $data = array(
            'name' => $this->input->post('name'),
            'number_of_round' => $this->input->post('number_of_round'),
            'recycle_round' => $this->input->post('recycle_round'),
            'status' => GAME_ACTIVE,
            'created_by' => $adminData['userID'],
            'created_Date' => get_curr_date()
        );
        $this->db->insert('tbl_game', $data);
        return $this->db->insert_id();
    }

    public function editGame($id, $input = null) {
        // update the user account
        if ($input == null) {
            $data = array(
                'name' => $this->input->post('name'),
                'number_of_round' => $this->input->post('number_of_round'),
                'recycle_round' => $this->input->post('recycle_round'),
            );
        } else {
            $data = array(
                'name' => $input['name'],
                'number_of_round' => $input['number_of_round'],
                'recycle_round' => $input['recycle_round'],
                'current_round' => $input['current_round'],
                'status' => $input['status']
            );
        }

        $this->db->where('id', $id);
        $this->db->update('tbl_game', $data);
    }

    public function removeGame($id) {
        $CI = & get_instance();
        $CI->load->model('Teams_model');
        $teams = $CI->Teams_model->getTeamsByGameId($id);
        foreach ($teams as $t) {
            $CI->Teams_model->removeTeam($t['id']);
        }

        $this->db->delete('tbl_game', array('id' => $id));
    }

}
