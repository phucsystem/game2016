<?php

class Record extends Frontend_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->library('session');
        $this->is_logged_in($this->session->userdata('userName'));
    }

    public function detail($type)
    {
        $this->load->model('Teamactionrecords_model');

        $this->data['type'] = ucfirst($type);
        $records = array();
        switch ($type)
        {
            case 'money':
                $records = $this->Teamactionrecords_model->getRecordsByTeamId($this->data['userData']['teamId'], RECORD_TYPE_MONEY);
                break;
            case 'economic':
                $records = $this->Teamactionrecords_model->getRecordsByTeamId($this->data['userData']['teamId'], RECORD_TYPE_ECO);

                break;
            case 'social':
                $records = $this->Teamactionrecords_model->getRecordsByTeamId($this->data['userData']['teamId'], RECORD_TYPE_SO);

                break;
            case 'me':
                $records = $this->Teamactionrecords_model->getRecordsByTeamId($this->data['userData']['teamId'], RECORD_TYPE_ME);
                break;
        }
        
        $this->data['records'] = $records;
        
        $this->load->view('frontend/layout/header', $this->data);
        $this->load->view('frontend/record/detail', $this->data);
        $this->load->view('frontend/layout/footer');
    }

}
