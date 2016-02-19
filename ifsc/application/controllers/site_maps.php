<?php
class site_maps extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
		$this->load->model('advertisment_model');
    }
	
	public function index()
	{
		ini_set('memory_limit', '-1');
		$this->load->helper('file');
        header("Content-Type: text/xml;charset=iso-8859-1");      
		$limit_end=(isset($_GET['limit_end']) && $_GET['limit_end']!='')?$_GET['limit_end']:10;
		$limit_start=(isset($_GET['limit_start']) && $_GET['limit_start']!='')?$_GET['limit_start']:0;
		$this->data['results']=$this->advertisment_model->get_add_list('',$limit_end,$limit_start);
		$this->load->view('admin/sitemaps/site_maps', $this->data);
	}
	
	public function category()
	{
		ini_set('memory_limit', '-1');
		$this->load->helper('file');
        header("Content-Type: text/xml;charset=iso-8859-1");      
		$limit_end=(isset($_GET['limit_end']) && $_GET['limit_end']!='')?$_GET['limit_end']:10;
		$limit_start=(isset($_GET['limit_start']) && $_GET['limit_start']!='')?$_GET['limit_start']:0;
		$this->data['results']=$this->advertisment_model->get_business_listings($limit_end,$limit_start);
		$this->load->view('admin/sitemaps/site_maps_category', $this->data);
	}
}