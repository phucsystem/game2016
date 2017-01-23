<?php

class Storages_model extends CI_Model
{

    public function __construct()
    {
        $this->load->database();
        $this->load->library('session');
    }

    function getStoragesByTypeAndTeamId($type, $teamId, $item_id = null, $regionId = null, $status = '')
    {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->order_by("tbl_storages.id", "desc");
        $this->db->where('item_type', $type);
        $this->db->where('team_id', $teamId);
        if ($item_id != null)
        {
            $this->db->where('item_id', $item_id);
        }
        if ($regionId != null)
        {
            $this->db->where('region_id', $regionId);
        }
        if ($status != '')
        {
            $this->db->where('status', $status);
        }
        $query = $this->db->get('tbl_storages');

        if ($query->num_rows() > 0)
        {
            return $query->result_array();
        }
        return array();
    }

    public function addStorage($data)
    {
        $insertData = array(
            'item_type' => $data['item_type'],
            'item_id' => $data['item_id'],
            'quantity' => $data['quantity'],
            'team_id' => $data['team_id'],
            'region_id' => $data['region_id'],
            'status' => $data['status'],
        );
        $this->db->insert('tbl_storages', $insertData);
        return $this->db->insert_id();
    }

    public function updateStorage($id, $data)
    {
        // update the user account
        $updateData = array(
            'quantity' => $data['quantity'],
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_storages', $updateData);
    }
    
    public function updateStorageItemId($id, $data)
    {
        // update the user account
        $updateData = array(
            'item_id' => $data['item_id'],
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_storages', $updateData);
    }

    public function removeStorages($id)
    {
        $this->db->delete('tbl_storages', array('id' => $id));
    }

}
