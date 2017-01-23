<?php

class Productcomponents_model extends CI_Model {

    public function __construct() {
        $this->load->database();
        $this->load->library('session');
    }

    function getProductComponentsByProductId($id) {
        // Get a list of all user accounts
        $this->db->select("tbl_product_components.*, tbl_component_materials.name AS material_name,"
                . " tbl_components.name AS component_name, tbl_components.inhouse_manufacturing AS inhouse, tbl_storages.quantity AS storage_qty");
        $this->db->join('tbl_components', 'tbl_components.id = tbl_product_components.component_id');
        $this->db->join('tbl_component_materials', 'tbl_component_materials.id = tbl_product_components.material_id');
        $this->db->join('tbl_storages', ' tbl_product_components.material_id = tbl_storages.item_id ', 'left');

        $this->db->where('product_id', $id);
        $query = $this->db->get('tbl_product_components');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    function getProductComponentsByTeamId($id) {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where('team_id', $id);
        $query = $this->db->get('tbl_product_components');
        if ($query->num_rows() > 0) {
            return $query->row_array();
        }
        return array();
    }

    function addProductComponent($data) {

        $insertData = array(
            'component_id' => $data['component_id'],
            'product_id' => $data['product_id'],
            'material_id' => $data['material_id'],
            'team_id' => $data['team_id'],
        );
        $this->db->insert('tbl_product_components', $insertData);
        return $this->db->insert_id();
    }

    function updateProductComponent($id, $data) {
        // update the user account
        $updateData = array(
            'component_id' => $data['component_id'],
            'material_id' => $data['material_id'],
        );
        $this->db->where('component_id', $id);
        $this->db->update('tbl_product_components', $updateData);
    }
    
    function updateProductComponentById($id, $data) {
        // update the user account
        $updateData = array(
            'component_id' => $data['component_id'],
            'material_id' => $data['material_id'],
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_product_components', $updateData);
    }

    function removeProduct($id) {
        $this->db->delete('tbl_product_components', array('id' => $id));
    }

}
