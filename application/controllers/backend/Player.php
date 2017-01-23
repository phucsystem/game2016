<?php

class Player extends Backend_Controller {

    function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->data['curr_step'] = STEP_MASTER_PLAYER;
        $this->load->model('Users_model');

        $this->is_master_logged_in();
    }

    public function index() {
        $this->data['players'] = $this->Users_model->getUserbyUserType(USER_TYPE_PLAYER);
        foreach ($this->data['players'] as $pKey => $pValue) {
            if ($pValue['role'] = PLAYER_LEADER) {
                $this->data['players'][$pKey]['role'] = 'Team Leader';
            } else {
                $this->data['players'][$pKey]['role'] = 'Team Member';
            }
        }
        $this->data['successAction'] = $this->uri->segment(4);

        $this->load->view('backend/layout/header', $this->data);
        $this->load->view('backend/player/index');
        $this->load->view('backend/layout/footer');
    }

    public function checkuser($name) {
        $data['result'] = false;
        $existUser = $this->Users_model->getUserByAccount($name);
    
        if (!empty($existUser)) {
            $data['result'] = true;
        }

        echo json_encode($data);
        exit;
    }

    public function add() {
        $this->load->model('Teams_model');
        $this->data['teams'] = $this->Teams_model->getTeams();

        if ($this->input->post() != false) {
            $postData = $this->input->post();
            $this->Users_model->createUser(USER_TYPE_PLAYER);
            redirect('master/player/success/add');
        }

        $this->load->view('backend/layout/header', $this->data);
        $this->load->view('backend/player/add', $this->data);
        $this->load->view('backend/layout/footer');
    }

    public function edit() {
        $this->load->model('Teams_model');
        $this->data['teams'] = $this->Teams_model->getTeams();

        $this->data['id'] = $this->uri->segment(4);
        $this->data['currPlayer'] = $this->Users_model->getUser($this->data['id']);

        if ($this->input->post()) {
            $this->Users_model->updatePlayer($this->data['id']);
            redirect('master/player/success/edit');
        }


        $this->load->view('backend/layout/header', $this->data);
        $this->load->view('backend/player/edit', $this->data);
        $this->load->view('backend/layout/footer');
    }

    public function remove() {
        $data['result'] = false;
        $this->Users_model->removePlayer(($this->uri->segment(4)));
        $data['result'] = true;
        echo json_encode($data);
        exit;
    }

}
