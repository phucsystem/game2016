<?php

class Products_model extends CI_Model {

    public function __construct() {
        $this->load->database();
        $this->load->library('session');
    }

    function getProductById($id) {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where('id', $id);
        $query = $this->db->get('tbl_products');
        if ($query->num_rows() > 0) {
            return $query->row_array();
        }
        return array();
    }

    function getProductsByTeamId($id) {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where('team_id', $id);
         $this->db->order_by("id", "desc");
        $query = $this->db->get('tbl_products');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    function addProduct($data) {

        $insertData = array(
            'name' => $data['name'],
            'sell_price' => $data['sell_price'],
            'range' => $data['range'],
            'reliability' => $data['reliability'],
            'design' => $data['design'],
            'manufacturing_cost' => $data['manufacturing_cost'],
            'team_id' => $data['team_id'],
        );
        $this->db->insert('tbl_products', $insertData);
        return $this->db->insert_id();
    }

    function updateProduct($id, $data) {
        // update the user account
        $updateData = array(
            'sell_price' => $data['sell_price'],
            'range' => $data['range'],
            'reliability' => $data['reliability'],
            'design' => $data['design'],
            'manufacturing_cost' => $data['manufacturing_cost']
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_products', $updateData);
    }

    function removeProduct($id) {
        $this->db->delete('tbl_products', array('id' => $id));
    }

}
