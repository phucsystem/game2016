<?php

class Teamactionrecords_model extends CI_Model
{

    public function __construct()
    {
        $this->load->database();
        $this->load->library('session');
    }

    function getRecordsByTeamId($id, $factor_key = null, $round_id = null)
    {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where('team_id', $id);
        if ($factor_key != null)
        {
            $this->db->where('key', $factor_key);
        }
        if ($round_id != null)
        {
            $this->db->where('round_id', $round_id);
        }
        $query = $this->db->get('tbl_team_action_records');
        if ($query->num_rows() > 0)
        {
            return $query->result_array();
        }
        return array();
    }

    function addRecord($data)
    {
        $insertData = array(
            'key' => $data['key'],
            'value' => $data['value'],
            'game_id' => $data['game_id'],
            'round_id' => $data['round_id'],
            'team_id' => $data['team_id'],
            'region_id' => $data['region_id'],
            'description' => $data['description'],
            'new_value' =>$data['new_value'],
            'created_date' => get_curr_date()
        );

        if (isset($data['product_id']))
        {
            $insertData['product_id'] = $data['product_id'];
        }

        $this->db->insert('tbl_team_action_records', $insertData);
        return $this->db->insert_id();
    }

    function removeRecordByTeamId($id)
    {
        $this->db->delete('tbl_team_action_records', array('team_id' => $id));
    }

}
