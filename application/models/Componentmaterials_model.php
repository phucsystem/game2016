<?php

class Componentmaterials_model extends CI_Model {

    public function __construct() {
        $this->load->database();
    }

    function getMaterialsById($id) {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where('id', $id);
        $query = $this->db->get('tbl_component_materials');
        if ($query->num_rows() > 0) {
            return $query->row_array();
        }
        return array();
    }

    function getMaterialsByNameAndRound($name, $round, $game_id, $team_id, $component_id) {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where('name', $name);
        $this->db->where('round_id', $round);
        $this->db->where('game_id', $game_id);
           $this->db->where('team_id', $team_id);
           $this->db->where('component_id', $component_id);
        $query = $this->db->get('tbl_component_materials');
        if ($query->num_rows() > 0) {
            return $query->row_array();
        }
        return array();
    }

    function getMaterialsByComponentId($componentId) {
        // Get a list of all user accounts
        $this->db->select("tbl_component_materials.*, tbl_storages.quantity AS storage_qty, tbl_storages.region_id AS region_id");
        $this->db->join('tbl_storages', ' tbl_component_materials.id = tbl_storages.item_id AND tbl_storages.item_type = ' . ITEM_STORE_TYPE_MATERIAL, 'left');
        $this->db->where('component_id', $componentId);

        $this->db->order_by("id", "asc");
        $query = $this->db->get('tbl_component_materials');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    public function addMaterial($data) {
        $insertData = array(
            'name' => $data['name'],
            'cost' => $data['cost'],
            'range' => $data['range'],
            'design' => $data['design'],
            'reliability' => $data['reliability'],
            'component_id' => $data['component_id'],
            'team_id' => $data['team_id'],
            'image' => $data['image'],
            'round_id' => $data['round_id'],
            'game_id' => $data['game_id']
        );
        $this->db->insert('tbl_component_materials', $insertData);
        return $this->db->insert_id();
    }

    public function updateMaterial($data) {
        // update the user account
        $updateData = array(
            'name' => $data['name'],
            'cost' => $data['cost'],
            'range' => $data['range'],
            'design' => $data['design'],
            'reliability' => $data['reliability']
        );
        //exit;
        $this->db->where('id', $data['material_id']);
        $this->db->update('tbl_component_materials', $updateData);
    }

    public function removeMaterialsByTeamId($id) {
        $this->db->delete('tbl_component_materials', array('team_id' => $id));
    }

}
