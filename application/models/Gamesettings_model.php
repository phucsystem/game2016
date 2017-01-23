<?php

class Gamesettings_model extends CI_Model {

    public function __construct() {
        $this->load->database();
    }

    function getSettings($gameId) {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where('game_id', $gameId);
        $this->db->order_by("id", "asc");
        $query = $this->db->get('tbl_game_setting');
        if ($query->num_rows() > 0) {
            $result = $query->result_array();
            $retData = array();
            foreach ($result as $key => $value) {
                $retData[$value['type']][$value['key']] = $value;
            }
            return $retData;
        }
        return array();
    }


}
