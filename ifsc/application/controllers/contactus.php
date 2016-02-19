<?php
class contactus extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('contact_us_model');
        if(!$this->session->userdata('is_logged_in')){
            redirect(ADMIN.'/login');
        }
		sub_admin_permission_check();
		$this->load->library('breadcrumbs');
    }

    public function index($type = null, $page_num =1,$sortfield='id',$order='desc') 
	{
		$this->load->helper('date_helper');
		$this->load->helper('thumb_helper');
		$conditions = array();
		$search_session = array();
		
		
		//pagination settings
		$cofig =array();
		$config = admin_settings_initialize('settings');
		//sortings
		$this->sorting = array('name' =>'contact_us.name','created' =>'contact_us.created');
		
		
		
		/*****pagination ********/ 
		if(empty($page_num)) $page_num = 1;
		$limit_end = ($page_num-1) * $config['per_page'];
		$limit_start = $config['per_page'];
		$this->pagination->suffix = '/'.$sortfield.'/'.$order;

		 //search 
		 $data['keyword'] = '';
		 $data['keyword'] = $this->input->post('keyword');
		 $data['search_submit'] =$this->input->post('search_submit');
		
		/*********** pagination search ********************/
		$search_session  = array('search'=>array('type'=>$type, 'keyword'=>$data['keyword'] ));
		if($data['keyword']){ 
			$search_session  =  array('search'=>array('type'=>$type,'keyword'=>$data['keyword']));
		}
		else
		{ 
			 if(isset($this->session->userdata['search']['type']) && $this->session->userdata['search']['type'] == $type && !$data['search_submit'] && $sortfield != 'reset'){
					$data['keyword'] = $this->session->userdata['search']['keyword']; 
				}else
				{
					$type = '';
				}
				$search_session  =  array('search'=>array('type'=>$type,'keyword'=>$data['keyword']));
		}
		$this->session->set_userdata($search_session);
		/**************** End pagination search ***********/

		 if($data['keyword']  )
		 {
			$value = '( contact_us.name Like "%'.$data['keyword'].'%" )'; 
			 $conditions[] = array( 'direct'=>1,  'rule' => 'where', 'value'=> $value  );	
		 }
		 //fetch sql records with arrays
		if(isset($this->sorting[$sortfield])) $sort_f =  $this->sorting[$sortfield] ; else $sort_f =  '';
		$data['contactus'] = $this->contact_us_model->get_contact_us( 1 , $conditions, $sort_f, $order, $limit_start ,$limit_end);        
		$config['total_rows'] =$this->contact_us_model->get_contact_us( 0 , $conditions, '', '', '', '');   
		if($config['total_rows'] <= $limit_end )
			if($page_num && $page_num != 1) 
				redirect(ADMIN.'/contact_us/'.$data['type'].'/'. ($page_num -1).'/'.$sortfield.'/'.$order );
		
		$this->pagination->initialize($config);  
		$data['per_page']  = $limit_start;		
		$data['main_content'] = 'admin/contactus/index';
		$data['title']="Contact Us";
		$data['indextitle']="Contact Us";
		
		$this->load->view('includes/template', $data);
    }
	
	function update_status($id, $status, $pageredirect=null,$pageno)
	{ 
		$fieldsorts = $this->input->get('sortingfied');
		$typesorts = $this->input->get('sortype');
		if($status == 'enable'){
			$data = array('is_active' => '1');
			$this->session->set_flashdata('flash_message', $this->lang->line('enabled') );
		} else if($status == 'disable'){
			$data = array('is_active' => '0');
			$this->session->set_flashdata('flash_message', $this->lang->line('disabled') );
		} 
		else 
		{
			$this->session->set_flashdata('flash_message', $this->lang->line('edit_error') );
			redirect(base_url().ADMIN.'/contact_us/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
		}
		$this->contact_us_model->update_status($id, $data);
		redirect(base_url().ADMIN.'/contact_us/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
	
	
	function bulkautions($pageredirect=null,$pageno){
		$fieldsorts = $this->input->get('sortingfied');
		$typesorts = $this->input->get('sortype');
		$bulk_type= $this->input->post('more_action_id');
		$bulk_ids= $this->input->post('checkall_box');
		if($bulk_type == 1){
			foreach($bulk_ids as $id) {
				$data = array('is_active' => '1');
				$this->contact_us_model->update_status($id, $data);
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_enabled') );
		}
		else if($bulk_type == 2){
			foreach($bulk_ids as $id) {
				$data = array('is_active' => '0');
				$this->contact_us_model->update_status($id, $data);
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_disabled') );
		}else {
			$this->session->set_flashdata('flash_message', $this->lang->line('edit_error') );
			redirect(base_url().ADMIN.'/contact_us/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
		}
		redirect(base_url().ADMIN.'/contact_us/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
	
	function delete($id)
	{
		$pageredirect=$this->input->get('pagemode');
		$pageno=$this->input->get('modestatus');
		$fieldsorts = $this->input->get('sortingfied');
		$typesorts = $this->input->get('sortype');
		if($this->contact_us_model->delete($id))
		{
			$this->session->set_flashdata('flash_message', $this->lang->line('deleted'));
		}
		redirect(base_url().ADMIN.'/contact_us/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
	
	
	public function view($id=null)
	{
			$getValues = $this->contact_us_model->get_values($id);
			$pageredirect=$this->input->get('pagemode');
			$pageno=$this->input->get('modestatus');
			$fieldsorts = $this->input->get('sortingfied');
			$typesorts = $this->input->get('sortype');
			if(count($getValues)) {
				$this->breadcrumbs->push('Contact Us', base_url().ADMIN.'/contact_us');
				$this->breadcrumbs->push('View', base_url().ADMIN.'/contact_us/view');
				$this->data['contactus'] = $getValues;	
				$this->data['main_content'] = 'admin/contactus/view';
				$this->data['title']="View Contact Us Details";
				$this->load->view('includes/template', $this->data);
			} else {
				$this->session->set_flashdata('flash_message', $this->lang->line('edit_error'));
				redirect(base_url().ADMIN.'/contact_us/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
			}
	}
}
?>