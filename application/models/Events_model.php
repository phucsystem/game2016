<?php

class Events_model extends CI_Model {

    public function __construct() {
        $this->load->database();
    }
    
    public function getEventByGameId($gameId, $roundId = 0) {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where("game_id", $gameId);
        if ($roundId != 0) {
            $this->db->where("round_id", $roundId);
        }
        $this->db->order_by("id", "asc");
        $query = $this->db->get('tbl_events');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    public function addEvent($data) {
        $data = array(
            'game_id' => $data['game_id'],
            'round_id' => $data['round_id'],
            'team_id' => $data['team_id'],
            'title' => $data['title'],
            'description' => $data['description']
        );
        $this->db->insert('tbl_events', $data);
        return $this->db->insert_id();
    }
    
    public function editEvent($data) {
        $updateData = array(
            'title' => $data['title'],
            'description' => $data['description']
        );
        $this->db->where('game_id', $data['game_id']);
        $this->db->where('round_id', $data['round_id']);
        $this->db->update('tbl_events', $updateData);
    }

    public function removeEventByGameId($id) {
        $this->db->delete('tbl_events', array('game_id' => $id));
    }

}
