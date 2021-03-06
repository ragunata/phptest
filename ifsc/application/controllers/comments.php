<?php
class Comments extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('comment_model');
		$this->load->library('breadcrumbs');
    }
	
	 public function index($type = null, $page_num =1,$sortfield='id',$order='desc') 
	{
		if(!$this->session->userdata('is_logged_in')){
            redirect(ADMIN.'/login');
        }
		sub_admin_permission_check();
	    $this->load->helper('date_helper');
		$this->load->helper('thumb_helper');
		$conditions = array();
		$search_session = array();
		$cofig =array();
		$config = admin_settings_initialize('settings');
		$this->sorting = array('name' =>'user_profiles.first_name','created' =>'advertisment_comments.created','email' =>'users.email','title' =>'advertisment_comments.title','rating'=>'advertisment_comments.rating','hotel_name' =>'advertisements.name');
		if($type == 'active')
		{
			$conditions[] = array( 'direct'=>0, 'rule' => 'where', 'field'=>'advertisment_comments.is_active', 'value' => 1 );	
			$config['base_url'] = base_url().ADMIN.'/comments/active';
			$data['indextitle']  = 'Comments - Active List';
			$data['type'] = 'active';
		} 
		else if($type == 'inactive') 
		{
			$conditions[] = array( 'direct'=>0, 'rule' => 'where', 'field'=>'advertisment_comments.is_active', 'value' => 0 );	
			$config['base_url'] = base_url().ADMIN.'/comments/inactive';
			$data['indextitle']  = 'Comments - Inactive List';
			$data['type'] = 'inactive';
		}
		else
		{
			$config['base_url'] = base_url().ADMIN.'/comments/index';
			$data['indextitle']  = 'Comments List';
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
		$conditions[] = array( 'direct'=>0,  'rule' => 'where', 'field' => "(advertisment_comments.title LIKE '%" . $data['keyword'] . "%'", 'value'=> null);
		$conditions[] = array('direct'=>0,  'rule' => 'or_where', 'field' => "advertisements.name LIKE '%" . $data['keyword'] . "%'", 'value' => null);
		$conditions[] = array('direct'=>0,  'rule' => 'or_where', 'field' => "user_profiles.first_name LIKE '%" . $data['keyword'] . "%'", 'value' => null);
        $conditions[] = array( 'direct'=>0,  'rule' => 'or_where', 'field' => "users.email like '%" . $data['keyword'] . "%')", 'value'=> null); 	
		 }
		if(isset($this->sorting[$sortfield])) $sort_f =  $this->sorting[$sortfield] ; else $sort_f =  '';
		$data['comments'] = $this->comment_model->get_comments( 1 , $conditions, $sort_f, $order, $limit_start ,$limit_end);        
		$config['total_rows'] =$this->comment_model->get_comments( 0 , $conditions, '', '', '', ''); 
		if($config['total_rows'] <= $limit_end )
		if($page_num && $page_num != 1) 
		redirect(ADMIN.'/comments/'.$data['type'].'/'. ($page_num -1).'/'.$sortfield.'/'.$order );
		$this->pagination->initialize($config);  
		$data['per_page']  = $limit_start;
		$data['main_content'] = 'admin/comments/index';
		$data['title']="Comments";
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
			redirect(base_url().ADMIN.'/amenties/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
		}
		$this->comment_model->update_status($id, $data);
		redirect(base_url().ADMIN.'/comments/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
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
				$this->comment_model->update_status($id, $data);
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_enabled'));
		}
		else if($bulk_type == 2)
		{
			foreach($bulk_ids as $id) {
				$data = array('is_active' => '0');
				$this->comment_model->update_status($id, $data);
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_disabled') );
		}
		else 
		{
			$this->session->set_flashdata('flash_message', $this->lang->line('edit_error') );
			redirect(base_url().ADMIN.'/comments/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
		}
		redirect(base_url().ADMIN.'/comments/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
	public function  view($id)
	{
		if(!$this->session->userdata('is_logged_in')){
            redirect(ADMIN.'/login');
        }
		sub_admin_permission_check();
	    $getValues = $this->comment_model->get_comment_detail($id);
		$pageredirect=$this->input->get('pagemode');
		$pageno=$this->input->get('modestatus');
		$fieldsorts = $this->input->get('sortingfied');
		$typesorts = $this->input->get('sortype');
		if(count($getValues)) {
			$this->load->helper('thumb_helper');
			// add breadcrumbs
			$this->breadcrumbs->push('Comments', base_url().ADMIN.'/report_abuse');
			$this->breadcrumbs->push('View', base_url().ADMIN.'/comment_view/view');
			$this->data['comments'] = $getValues;	
			$this->data['main_content'] = 'admin/comments/view';
			$this->data['title']="View Comment Details";
			$this->load->view('includes/template', $this->data);
		} else {
			$this->session->set_flashdata('flash_message', $this->lang->line('edit_error'));
			redirect(base_url().ADMIN.'/comments/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
		}
	}
	function delete($id)
	{
		if(!$this->session->userdata('is_logged_in')){
            redirect(ADMIN.'/login');
        }
		sub_admin_permission_check();
		$pageredirect=$this->input->get('pagemode');
		$pageno=$this->input->get('modestatus');
		$fieldsorts = $this->input->get('sortingfied');
		$typesorts = $this->input->get('sortype');
		if($this->comment_model->delete($id)) 
		{
			$this->session->set_flashdata('flash_message', $this->lang->line('deleted'));
		}
		redirect(base_url().ADMIN.'/comments/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
	
	public function add_comment()
	{
	  if($_POST) 
	  {
				$this->form_validation->set_rules('score','Rating','callback_numcheck');
				$this->form_validation->set_rules('title', 'Title', 'trim|required');
				$this->form_validation->set_rules('comments', 'Comments', 'trim|required');
				if($this->form_validation->run() == true) 
				{	
			        if($this->comment_model->add_commets())
					{
				      $json_array['status']="success";
                      $this->session->set_flashdata('success','Comments added successfully');
					}
					else
					{
					  $json_array['status']="error";
					  $json_array['sts']="custom_err";
                      $json_array['msg']="Comments Could not be saved.. Please Try Again..!";		
					}
					echo json_encode($json_array);
					die;
				}
				else
				{
					echo $this->form_validation->get_json();
					die;
				}
	  }
	  else
	  {
		  redirect(base_url());
	  }
	}
	
	public function numcheck($num) 
	{
		if ($num <0 || $num =='')
		{
			$this->form_validation->set_message(
							'numcheck',
							'Please Rate it'
						);
			return FALSE;
		}
		else
		{
			return TRUE;
		}
   }
}