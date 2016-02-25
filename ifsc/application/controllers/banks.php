<?php
class Banks extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
		$this->load->model('bank_model');
        if(!$this->session->userdata('is_logged_in')){
            redirect(ADMIN.'/login');
        }
		sub_admin_permission_check();
		$this->load->library('breadcrumbs');
    }
	
	public function admin_index($type = null, $page_num =1,$sortfield='id',$order='desc') 
	{
	    $this->load->helper('date_helper');
		$this->load->helper('thumb_helper');
		$conditions = array();
		$search_session = array();
		$cofig =array();
		$config = admin_settings_initialize('settings');
		$this->sorting = array('name' =>'banks.name','created' =>'banks.created');
		if($type == 'active')
		{
			$conditions[] = array( 'direct'=>0, 'rule' => 'where', 'field'=>'banks.is_active', 'value' => 1 );	
			$config['base_url'] = base_url().ADMIN.'/banks/active';
			$data['indextitle']  = 'Banks - Active List';
			$data['type'] = 'active';
		} 
		else if($type == 'inactive') 
		{
			$conditions[] = array( 'direct'=>0, 'rule' => 'where', 'field'=>'banks.is_active', 'value' => 0 );	
			$config['base_url'] = base_url().ADMIN.'/banks/inactive';
			$data['indextitle']  = 'Banks - Inactive List';
			$data['type'] = 'inactive';
		}
		else
		{
			$config['base_url'] = base_url().ADMIN.'/banks/index';
			$data['indextitle']  = 'Banks List';
			$data['type'] = 'index';
		}
		/*****pagination ********/ 
		if(empty($page_num)) $page_num = 1;
		$limit_end = ($page_num-1) * $config['per_page'];
		$limit_start = $config['per_page'];
		$this->pagination->suffix = '/'.$sortfield.'/'.$order;
		$this->pagination->first_url = $config['base_url'].'/1/'.$sortfield.'/'.$order;

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
		   $conditions[] = array( 'direct'=>0,  'rule' => 'where', 'field' => "(banks.name LIKE '%" . $data['keyword'] . "%'", 'value'=> null);
		 }
		if(isset($this->sorting[$sortfield])) $sort_f =  $this->sorting[$sortfield] ; else $sort_f =  '';
		$data['banks'] = $this->bank_model->get_banks( 1 , $conditions, $sort_f, $order, $limit_start ,$limit_end);        
		$config['total_rows'] =$this->bank_model->get_banks( 0 , $conditions, '', '', '', ''); 
		if($config['total_rows'] <= $limit_end )
		if($page_num && $page_num != 1) 
		redirect(ADMIN.'/banks/'.$data['type'].'/'. ($page_num -1).'/'.$sortfield.'/'.$order );
		$this->pagination->initialize($config);  
		$data['per_page']  = $limit_start;
		$data['main_content'] = 'admin/banks/admin_index';
		$data['title']="Banks";
		$this->load->view('includes/template', $data);
	}
	
	function update_status($id, $status, $pageredirect=null,$pageno)
	{ 
		$fieldsorts = $this->input->get('sortingfied');
		$typesorts = $this->input->get('sortype');
		if($status == 'enable')
		{
			$data = array('is_active' => '1');
			$this->session->set_flashdata('flash_message', $this->lang->line('enabled') );
		} 
		else if($status == 'disable')
		{
			$data = array('is_active' => '0');
			$this->session->set_flashdata('flash_message', $this->lang->line('disabled') );
		} 
		else 
		{
			$this->session->set_flashdata('flash_message', $this->lang->line('edit_error') );
			redirect(base_url().ADMIN.'/banks/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
		}
		$this->bank_model->update_status($id, $data);
		redirect(base_url().ADMIN.'/banks/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
	
	function bulkautions($pageredirect=null,$pageno)
	{
		$fieldsorts = $this->input->get('sortingfied');
		$typesorts = $this->input->get('sortype');
		$bulk_type= $this->input->post('more_action_id');
		$bulk_ids= $this->input->post('checkall_box');
		if($bulk_type == 1)
		{
			foreach($bulk_ids as $id) {
				$data = array('is_active' => '1');
				$this->advertisment_model->update_status($id, $data);
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_enabled'));
		}
		else if($bulk_type == 2)
		{
			foreach($bulk_ids as $id) {
				$data = array('is_active' => '0');
				$this->advertisment_model->update_status($id, $data);
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_disabled') );
		}
		else 
		{
			$this->session->set_flashdata('flash_message', $this->lang->line('edit_error') );
			redirect(base_url().ADMIN.'/advertisments/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
		}
		redirect(base_url().ADMIN.'/advertisments/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
	public function  view($id)
	{
	    $getValues = $this->advertisment_model->get_advertisment_detail($id);
		$pageredirect=$this->input->get('pagemode');
		$pageno=$this->input->get('modestatus');
		$fieldsorts = $this->input->get('sortingfied');
		$typesorts = $this->input->get('sortype');
		if(count($getValues)) {
			$this->load->helper('thumb_helper');
			// add breadcrumbs
			$this->breadcrumbs->push('Advertisments', base_url().ADMIN.'/advertisments');
			$this->breadcrumbs->push('View', base_url().ADMIN.'/advertisment_view/view');
			$this->data['advertisments'] = $getValues;	
			$this->data['main_content'] = 'admin/advertisments/view';
			$this->data['title']="View Advertisement Details";
			$this->load->view('includes/template', $this->data);
		} else {
			$this->session->set_flashdata('flash_message', $this->lang->line('edit_error'));
			redirect(base_url().ADMIN.'/advertisments/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
		}
	}
	function delete($id)
	{
		$pageredirect=$this->input->get('pagemode');
		$pageno=$this->input->get('modestatus');
		$fieldsorts = $this->input->get('sortingfied');
		$typesorts = $this->input->get('sortype');
		if($this->advertisment_model->delete($id)) 
		{
			$this->session->set_flashdata('flash_message', $this->lang->line('deleted'));
		}
		redirect(base_url().ADMIN.'/advertisments/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
	

	public function edit($id) 
	{
	
		
		$getValues = $this->advertisment_model->get_values($id);
		$pageredirect=$this->input->get('pagemode');
		$pageno=$this->input->get('modestatus');
		$fieldsorts = $this->input->get('sortingfied');
		$typesorts = $this->input->get('sortype');
		if(count($getValues)) 
		{
			$this->load->helper('thumb_helper');
			$this->breadcrumbs->push('Advertisments', base_url().ADMIN.'/categories');
			$this->breadcrumbs->push('Edit', base_url().ADMIN.'/categories/edit');
			
			if (isset($_POST) && !empty($_POST))
			{
				
				$this->form_validation->set_rules('name','Business Name','trim|required');
				$this->form_validation->set_rules('owner','Contact Person','trim|required');
				$this->form_validation->set_rules('email',ucwords($this->lang->line('Email')),'trim|valid_email');
				//$this->form_validation->set_rules('website','Website','trim|valid_url_format');
				//$this->form_validation->set_rules('contact_number','Contact Number','trim|required');
				//$this->form_validation->set_rules('address_line','Address','trim|required');
				//$this->form_validation->set_rules('city','City','trim|required');
				//$this->form_validation->set_rules('area','Area','trim|required');
				//$this->form_validation->set_rules('working_start','Start Time','trim|required');
				//$this->form_validation->set_rules('working_end','End Time','trim|required');
				if ($this->form_validation->run() === true)
				{	
			echo "dffd";die;
					$this->advertisment_model->edit($id);
					$this->session->set_flashdata('flash_message', $this->lang->line('record_update'));
					redirect(base_url().ADMIN.'/advertisments/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
				}				
			}
			$this->data['message'] = (validation_errors() ? validation_errors() : $this->session->flashdata('message'));
			$this->data['advertisments'] = $getValues;
			$this->data['countries']= $this->countries_model->get_countries();
			$this->data['is_active']=$getValues['is_active'] ? 1 : 0 ; 
			$this->data['main_content'] = 'admin/advertisments/edit';
			$this->data['title']="Edit Advertisments";
			$this->load->view('includes/template', $this->data);
		}
		else
		{
			$this->session->set_flashdata('flash_message', $this->lang->line('edit_error'));
			redirect(base_url().ADMIN.'/advertisments/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
		}

    }
	
}