<?php

class Improvement_model extends CI_Model {

    public function __construct() {
        $this->load->database();
    }
    
    public function getByTeamId($teamID, $roundId = 0) {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where("team_id", $teamID);
        if ($roundId != 0) {
            $this->db->where("round_id", $roundId);
        }
        $this->db->order_by("id", "asc");
        $query = $this->db->get('tbl_improvement');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    public function addImprovement($data) {
        $data = array(
            'round_id' => $data['round_id'],
            'team_id' => $data['team_id'],
            'factor_id' => $data['factor_id'],
            'value' => $data['value'],
            'description' => $data['description']
        );
        $this->db->insert('tbl_improvement', $data);
        return $this->db->insert_id();
    }
    
}
