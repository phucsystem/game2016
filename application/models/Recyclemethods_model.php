<?php
class Recyclemethods_model extends CI_Model {
	public function __construct() {
		$this->load->database ();
	}
	public function getRecycleMethodByGameId($gameId = 0, $roundId = 0, $teamId = 0) {
		
		// Get a list of all user accounts
		$this->db->select ( "*" );
		if ($gameId != 0) {
			$this->db->where ( "game_id", $gameId );
		}
		
		if ($roundId != 0) {
			$this->db->where ( "round_id", $roundId );
		}
		
		$this->db->where ( "team_id", $teamId );
		
		$this->db->order_by ( "id", "asc" );
		$query = $this->db->get ( 'tbl_recycle_methods' );
		if ($query->num_rows () > 0) {
			return $query->result_array ();
		}
		return array ();
	}
	public function addRecycleMethod($data) {
		$insertData = array (
				'method_code' => $data ['method_code'],
				'game_id' => $data ['game_id'],
				'team_id' => $data ['team_id'],
				'round_id' => $data ['round_id'],
				'factor_id' => $data ['factor_id'],
				'factor_value' => $data ['factor_value'] 
		);
		$this->db->insert ( 'tbl_recycle_methods', $insertData );
	}
	public function editRecycleMethod($data) {
		$updateData = array (
				'factor_value' => $data ['factor_value'] 
		);
		$this->db->where ( 'method_code', $data ['method_code'] );
		$this->db->where ( 'factor_id', $data ['factor_id'] );
		$this->db->update ( 'tbl_recycle_methods', $updateData );
	}
	public function editRecycleMethodByGameAndRoundId($data) {
		$updateData = array (
				'factor_value' => $data ['factor_value'] 
		);
		$this->db->where ( 'method_code', $data ['method_code'] );
		$this->db->where ( 'factor_id', $data ['factor_id'] );
		$this->db->where ( 'game_id', $data ['game_id'] );
		$this->db->where ( 'team_id', $data ['team_id'] );
		$this->db->where ( 'round_id', $data ['round_id'] );
		$this->db->update ( 'tbl_recycle_methods', $updateData );
	}
	public function removeRecycleMethod($id) {
		$this->db->delete ( 'tbl_recycle_methods', array (
				'method_code' => $id 
		) );
	}
	public function removeRecycleMethodByGameId($id) {
		$this->db->delete ( 'tbl_recycle_methods', array (
				'game_id' => $id 
		) );
	}
	public function removeRecycleMethodByGameIdAndRoundId($id, $round_id, $teamId) {
		$this->db->delete ( 'tbl_recycle_methods', array (
				'game_id' => $id,
				'round_id' => $round_id ,
				'team_id' => $teamId
		) );
	}
	public function removeRecycleMethodByTeamIdAndRoundId($id, $round_id) {
		$this->db->delete ( 'tbl_recycle_methods', array (
				'team_id' => $id,
				'round_id' => $round_id 
		) );
	}
}

