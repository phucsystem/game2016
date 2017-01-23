<?php
class Regions_model extends CI_Model {
	public function __construct() {
		$this->load->database ();
	}
	public function getRegionByGameAndRoundId($gameId, $roundId, $teamId = 0) {
		// Get a list of all user accounts
		$this->db->select ( "*" );
		$this->db->where ( "game_id", $gameId );
		$this->db->where ( "round_id", $roundId );
		if ($teamId != 0) {
			$this->db->where ( "team_id", $teamId );
		}
		$this->db->order_by ( "id", "asc" );
		$query = $this->db->get ( 'tbl_regions' );
		if ($query->num_rows () > 0) {
			return $query->result_array ();
		}
		return array ();
	}
	public function getRegionByRoundIdAndRegionId($roundId, $regionId, $gameId = 0, $teamId = 0) {
		// Get a list of all user accounts
		$this->db->select ( "*" );
		$this->db->where ( "round_id", $roundId );
		$this->db->where ( "region_id", $regionId );
		$this->db->where ( "game_id", $gameId );
		$this->db->where ( "team_id", $teamId );
		$this->db->order_by ( "id", "asc" );
		$query = $this->db->get ( 'tbl_regions' );
		if ($query->num_rows () > 0) {
			return $query->result_array ();
		}
		return array ();
	}
	public function addRegion($regionData) {
		$insertData = array (
				'team_id' => $regionData ['team_id'],
				'game_id' => $regionData ['game_id'],
				'round_id' => $regionData ['round_id'],
				'region_id' => $regionData ['region_id'],
				'factor_id' => $regionData ['factor_id'],
				'factor_value' => $regionData ['factor_value'] 
		);
		$this->db->insert ( 'tbl_regions', $insertData );
	}
	public function editRegion($regionData) {
		// update the user account
		$data = array (
				'factor_value' => $regionData ['factor_value'] 
		);
		
		if(!empty( $regionData ['game_id'])){
			$this->db->where ( 'game_id', $regionData ['game_id'] );
		}
		
		$this->db->where ( 'team_id', $regionData ['team_id'] );
		$this->db->where ( 'round_id', $regionData ['round_id'] );
		$this->db->where ( 'region_id', $regionData ['region_id'] );
		$this->db->where ( 'factor_id', $regionData ['factor_id'] );
		

		$this->db->update ( 'tbl_regions', $data );
	}
	public function removeRegion($id) {
		$this->db->delete ( 'tbl_regions', array (
				'id' => $id 
		) );
	}
	public function removeRegionByGameId($id) {
		$this->db->delete ( 'tbl_regions', array (
				'game_id' => $id 
		) );
	}
}