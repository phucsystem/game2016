<?php

class Dashboard extends Backend_Controller {

    function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->data['curr_step'] = STEP_MASTER_DASHBOARD;
        
        $this->is_master_logged_in();
    }

    public function index() {
        $this->load->view('backend/layout/header', $this->data);
        $this->load->view('backend/dashboard/index');
        $this->load->view('backend/layout/footer');
    }

}
