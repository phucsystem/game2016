<?php

class Users_model extends CI_Model {

    public function __construct() {
        $this->load->database();
        $this->load->library('session');
    }

    public function login($username, $password) {
        $this->load->model('Teams_model');

        $this->db->select("*");
        $this->db->where("account", $username);
        $this->db->where("password", $password);
        $query = $this->db->get("tbl_users");

        if ($query->num_rows() > 0) {
            foreach ($query->result() as $rows) {
                $teamInfo = $this->Teams_model->getTeam($rows->team_id);
                $data = array(
                    'userID' => $rows->id,
                    'userName' => $rows->name,
                    'userType' => $rows->user_type,
                    'teamId' => $rows->team_id,
                    'logged_in' => TRUE,
                    'role' => $rows->role,
                );

                if (!empty($teamInfo)) {
                    $data['roundId'] = $teamInfo['current_round'];
                    $data['gameId'] = $teamInfo['game_id'];
                }

                $this->session->set_userdata($data);
                return true;
            }
        } else {
            return false;
        }
    }

    public function logout() {
        $data = array(
            'userID' => '',
            'userName' => '',
            'userType' => '',
            'logged_in' => FALSE,
        );
        $this->session->unset_userdata($data);
        $this->session->sess_destroy();
    }

    function getUser($id) {
        // Get the user details
        $this->db->select("*");
        $this->db->where("id", $id);
        $query = $this->db->get('tbl_users');
        if ($query->num_rows() > 0) {
            return $query->row_array();
        }
        return array();
    }

    function getTeamLeaderByTeamId($teamId) {
        $this->db->select("*");
        $this->db->where("team_id", $teamId);
        $this->db->where("role", PLAYER_LEADER);
        $query = $this->db->get('tbl_users');
        if ($query->num_rows() > 0) {
            return $query->row_array();
        }
        return array();
    }

    function getUserByUserType($userType) {
        if ($userType == USER_TYPE_PLAYER) {
            // Get the user details
            $this->db->select("tbl_users.*, tbl_teams.name AS team_name");
            $this->db->join('tbl_teams', 'tbl_teams.id = tbl_users.team_id');
            $this->db->where("user_type", $userType);
        } else {
            // Get the user details
            $this->db->select("tbl_users.*");
            $this->db->where("user_type", $userType);
        }
        $this->db->order_by("tbl_users.id", "desc");
        $query = $this->db->get('tbl_users');

        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    function createUser($userType) {
        // Create the user account
        $password = $this->input->post('password');

        if (empty($password) == true) {
            $password = $this->generateRandomString();
        } else {
            $password = $this->input->post('password');
        }

        $teamId = $this->input->post('team-id');
        if (!empty($teamId)) {
            $teamId = $this->input->post('team-id');
        }

//        $password = 123456;

        $data = array(
            'email' => $this->input->post('email'),
            'account' => $this->input->post('account'),
            'password' => $password,
            'name' => $this->input->post('name'),
            'role' => $this->input->post('role'),
            'team_id' => $teamId,
            'user_type' => $userType
        );

        $this->sendEmailToPlayer($data);

        $this->db->insert('tbl_users', $data);
    }

    function updateUser($id) {
        // update the user account
        $data = array(
            'name' => $this->input->post('name'),
            'email' => $this->input->post('email'),
            'password' => $this->input->post('password')
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_users', $data);

        // Update session
        $userDetails = $this->session->get_userdata();
        $userDetails['userName'] = $this->input->post('name');
        $this->session->set_userdata($userDetails);
    }

    function resetPasswordByUserId($id, $email) {
        $password = $this->generateRandomString();
        // update the user account
        $data = array(
            'password' => $password,
            'email' => $email
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_users', $data);

        $this->sendResetPasswordEmail($data);
    }

    function resetPasswordByMasterId($id, $email) {
        $password = $this->generateRandomString();
        // update the user account
        $data = array(
            'password' => $password,
            'email' => $email
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_users', $data);

        $this->sendResetPasswordEmail($data);
    }

    public function updateUserTeamId($id, $teamId) {
        $data = array(
            'team_id' => $teamId
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_users', $data);
    }

    function removePlayer($id) {
        // Delete a user account
        $this->db->delete('tbl_users', array('id' => $id));
    }

    // generate random string for password
    function generateRandomString($length = 6) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    public function editPlayer($id) {
        // update the user account
        $data = array(
            'account' => $this->input->post('account'),
            'name' => $this->input->post('name'),
            'email' => $this->input->post('email'),
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_game', $data);
    }

    function updatePlayer($id) {
        // update the user account
        $data = array(
            'account' => $this->input->post('account'),
            'name' => $this->input->post('name'),
            'role' => $this->input->post('role'),
            'team_id' => $this->input->post('team-id'),
            'email' => $this->input->post('email')
        );
        $this->db->where('id', $id);
        $this->db->update('tbl_users', $data);
    }

    function getUserByAccount($name) {
        // Get the user details
        $this->db->select("*");
        $this->db->where("account", $name);
        $query = $this->db->get('tbl_users');
        if ($query->num_rows() > 0) {
            return $query->row_array();
        }
        return array();
    }

    function getUserByEmail($email) {
        // Get the user details
        $this->db->select("*");
        $this->db->where("email", $email);
        $query = $this->db->get('tbl_users');
        if ($query->num_rows() > 0) {
            return $query->row_array();
        }
        return array();
    }

    function getPlayersByTeamId($teamId) {
        // Get the user details
        $this->db->select("*");
        $this->db->where("team_id", $teamId);
        $query = $this->db->get('tbl_users');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return array();
    }

    public function sendEmailToPlayer($data) {
        send_email($data['email'], 'Your account in RELG game', 'Your new account is: <b>' . $data['account']
                . '</b> and your password is <b>' . $data['password'] . '</b>. <br> Please access following link to login: ' . site_url('account/login'));
    }

    function getMasterByEmail($email) {
        // Get the user details
        $this->db->select("*");
        $this->db->where("email", $email);
        $query = $this->db->get('tbl_users');
        if ($query->num_rows() > 0) {
            return $query->row_array();
        }
        return array();
    }

    public function sendResetPasswordEmail($data) {
        send_email($data['email'], 'Reset password in RELG game', 'Your new password is: <b>' . $data['password']
                . '</b>. <br> Please access following link to login: ' . site_url('account/login'));
    }

}
