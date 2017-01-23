<?php

class Account extends Backend_Controller {

    function __construct() {
        parent::__construct();
         $this->load->library('session');
        $this->load->model('Users_model');
    }

   
    public function login() {
        $this->data['error'] = "";
        // check post method
        if ($this->input->post() != false) {
            $username = $this->input->post('username');
            $password = $this->input->post('password');

            $result = $this->Users_model->login($username, $password);
            if ($result) {
                redirect('master');
            } else {
                $this->data['error'] = "Account is invalid";
            }
        }

        $this->load->view('backend/account/login', $this->data);
    }

    public function logout() {
        $this->Users_model->logout();
        $this->login();
    }

    public function forget() {
        $this->data['error'] = '';
      
        if ($this->input->post() != false) {
           $email = $this->input->post('email');
            $result = $this->Users_model->getUserByEmail($email);
            if ($result) {
                $this->Users_model->resetPasswordByMasterId($result['id'], $email);
            } else {
                $this->data['error'] = "Email is invalid";
            }
        }
        
          $this->load->view('backend/account/forget',  $this->data);
        
        }

    public function profile($success = NULL) {
        $this->data['isSuccess'] = false;
        if($success){
            $this->data['isSuccess'] = true;
        }
        
        $this->data['userDetails'] = $this->Users_model->getUser($this->data['userData']['userID']);
        
        if($this->input->post()){
              $this->Users_model->updateUser($this->data['userData']['userID']);
              redirect('master/account/profile/success/1');
        }
        
        $this->load->view('backend/layout/header', $this->data);
         $this->load->view('backend/account/profile', $this->data);
        $this->load->view('backend/layout/footer');
    }

}
