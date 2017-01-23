<?php

class Sales_model extends CI_Model
{

    public function __construct()
    {
        $this->load->database();
        $this->load->library('session');
    }

    public function getSalesByTeamAndRound($teamId, $roundId, $regionId = '', $productId = '')
    {
        // Get a list of all user accounts
        $this->db->select("tbl_sales.*, tbl_products.name AS product_name, tbl_products.range AS product_range,"
                . " tbl_products.design AS product_design, tbl_products.reliability AS product_reliability, tbl_teams.name AS team_name ");
        $this->db->where("tbl_sales.team_id", $teamId);
        $this->db->where("tbl_sales.round_id", $roundId);
        $this->db->join('tbl_products', ' tbl_sales.product_id = tbl_products.id', 'left');
         $this->db->join('tbl_teams', ' tbl_sales.team_id = tbl_teams.id', 'left');
        if ($regionId != '')
        {
            $this->db->where("tbl_sales.region_id", $regionId);
        }
        if ($productId != '')
        {
            $this->db->where("tbl_sales.product_id", $productId);
        }

        $this->db->order_by("tbl_sales.id", "asc");
        $query = $this->db->get('tbl_sales');
        if ($query->num_rows() > 0)
        {
            return $query->result_array();
        }
        return array();
        
    }

    public function getSalesByRound($teamId, $regionId)
    {
        // Get a list of all user accounts
        $this->db->select("*");
        $this->db->where("team_id", $teamId);
        $this->db->where("region_id", $regionId);
        $this->db->order_by("id", "asc");
        $query = $this->db->get('tbl_sales');
        if ($query->num_rows() > 0)
        {
            return $query->result_array();
        }
        return array();
    }

    public function addSales($data)
    {
        $insertData = array(
            'quantity' => $data['quantity'],
            'team_id' => $data['team_id'],
            'round_id' => $data['round_id'],
            'region_id' => $data['region_id'],
            'product_id' => $data['product_id'],
            'offer_price' => $data['offer_price']
        );
        $this->db->insert('tbl_sales', $insertData);
    }

    public function updateSales($data)
    {
        // update the user account
        $updateData = array(
            'quantity' => $data['quantity'],
            'offer_price' => $data['offer_price']
        );
        $this->db->where('id', $data['id']);
        $this->db->update('tbl_sales', $updateData);
    }

    public function removeSalesByTeamOd($id)
    {
        $this->db->delete('tbl_sales', array('team_id' => $id));
    }

}
