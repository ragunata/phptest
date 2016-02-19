<?php
class Listings extends CI_Controller {

    #Magic Method - Construct the object
    public function __construct()
    {
        parent::__construct();
		$this->load->model('advertisment_model');
		$this->site_name=admin_settings_initialize('sitename');
    }
	
	#Advertisment Index 
	public function index() 
	{
	    $data=array();
		$config=array();
	
		$this->load->library('pagination');
		$this->load->helper('thumb');
		
		#Query String
		$city=(isset($_GET['city']) && $_GET['city']!='0')?$_GET['city']:'';
		$area=(isset($_GET['area']) && $_GET['area']!='0')?$_GET['area']:'';
		$keyword=(isset($_GET['keyword']))?$_GET['keyword']:'';
		$category=(isset($_GET['category']))?$_GET['category']:'';
		$home_category=(isset($_GET['home_category']))?$_GET['home_category']:'';
		$category_name=(isset($_GET['category_name']))?$_GET['category_name']:'';
		
		
		if($this->uri->segment('1')=='home-search' && $this->uri->segment('2')!='')
		{
			$home_category=ucwords(str_replace('-',' ',$this->uri->segment('2')));	
		}
		
		if($this->uri->segment('1')=='home-search' && $this->uri->segment('3')!='')
		{
			$city=ucwords(str_replace('-',' ',$this->uri->segment('3')));	
		}
		
		if($this->uri->segment('1')=='home-search' && $this->uri->segment('4')!='')
		{
			$area=ucwords(str_replace('-',' ',$this->uri->segment('4')));	
		}
		
		if($this->uri->segment('1')=='search' && $this->uri->segment('2')!='')
		{
			$city=ucwords(str_replace('-',' ',$this->uri->segment('2')));	
		}
		if($this->uri->segment('1')=='search' && $this->uri->segment('3')!='')
		{
			$area=ucwords(str_replace('-',' ',$this->uri->segment('3')));	
		}
		
		$r_category_name=(isset($_GET['r_category']))?ucwords(str_replace('-',' ',$_GET['r_category'])):'';
		if($this->uri->segment('1')=='category-search' && $this->uri->segment('3')!='')
		{
			$city=ucwords(str_replace('-',' ',$this->uri->segment('3')));	
		}
		if($this->uri->segment('1')=='category-search' && $this->uri->segment('4')!='')
		{
			$area=ucwords(str_replace('-',' ',$this->uri->segment('4')));	
		}
		if($this->uri->segment('1')=='category-search' && $this->uri->segment('2')!='')
		{
			$r_category_name=$this->uri->segment('2');	
			$r_category_name=ucwords(str_replace('-',' ',$r_category_name));
		}
		
		$query_string='?city='.$city.'&area='.$area.'&keyword='.$keyword.'&category='.$category.'&home_category='.$home_category.'&r_category='.$r_category_name;
				
	     $meta_keywords='';
		 if(!empty($category_name))
		 {
			 $meta_keywords=$category_name; 
		 }
		 if(!empty($home_category))
		 { 
			 $meta_keywords=$home_category; 
		 }
		 if(!empty($keyword))
		 { 
			 $meta_keywords=$keyword; 
		 }
		 		
		#Pagination Settings
		$config['suffix'] = $query_string;
		$config['base_url'] = base_url().'listings/index';
		$config['first_url'] = base_url().'listings/index'.$query_string;
	  
		$config['per_page'] = '5';
		$config['num_links'] = '5';
		$config["uri_segment"] = ($this->uri->segment(1)!='search') ? 3: 2;
		$config["full_tag_open"] = '<ul>';
		$config["full_tag_close"] = '</ul>';
		$config["cur_tag_open"] = '<li><a class="selected">';
		$config["cur_tag_close"] = '</a></li>';
		$config["num_tag_open"] = '<li>';
		$config["num_tag_close"] = '</li>';
		$s=0;
		if($this->uri->segment(3)!='' && $this->uri->segment(1)!='search' && $this->uri->segment(1)!='category-search')
		{
			$s=$this->uri->segment(3);
		}
		$page = ($this->uri->segment(3) && $this->uri->segment(1)!='search') ? $s : 0;

	
		#Get Advertisment List
		$data["list"] = $this->advertisment_model->get_add_list('all',$config['per_page'], $page,$city,$area,$keyword,$category,$home_category,$r_category_name);
	
		$config['total_rows'] = $data["list"]['all_total_rows'];
		
		$this->pagination->initialize($config);
		$data["pagination_link"]= $this->pagination->create_links();
		
		#Get Related Category
		$new_category='';
		if(!empty($data["list"]))
		{
			foreach($data["list"]['listings'] as $key=>$cat)
			{
				if($cat['category_id']!='')
				{
				  $new_category.=$cat['category_id'];
				}
			}
			
		}
		$data['category_list']=$this->advertisment_model->get_new_list_category($new_category);
	
		#BreadCrumb Push 
		$this->load->library('breadcrumbs');
		$this->breadcrumbs->push('Dialbe',base_url());
		$header_tilte="";
		if(!empty($city) && $city!='0')
		{
		   $this->breadcrumbs->push(ucfirst($city),base_url().'search/'.url_title(strtolower($city)));	
		   $header_tilte="Business Listings in ".ucwords(str_replace('-',' ',$city));
		}
		if(!empty($area) && $area!='0' && !empty($city) && $city!='0')
		{
		   $this->breadcrumbs->push(ucfirst($area),base_url().'search/'.url_title(strtolower($city)).'/'.url_title(strtolower($area)));	
		   $header_tilte="Business Listings in ".ucwords(str_replace('-',' ',$area));
		}
		if($meta_keywords!='')
		{
		   $this->breadcrumbs->push(ucfirst($meta_keywords),base_url().'search/'.url_title(strtolower($area)).'/'.url_title(strtolower($meta_keywords)));	
		   $header_tilte=ucwords(str_replace('-',' ',$meta_keywords));
		}
		
		if($city!='' && $r_category_name!='')
		{
		   $this->breadcrumbs->push(ucfirst($r_category_name),base_url().'search/'.url_title(strtolower($city)).'/'.url_title(strtolower($r_category_name)));	
		   $header_tilte=ucwords(str_replace('-',' ',$r_category_name));
		}
		
		if($city=='' && $area=='' && $r_category_name!='')
		{
		   $this->breadcrumbs->push(ucfirst($r_category_name),base_url().'search/'.url_title(strtolower($r_category_name)).'/'.url_title(strtolower($r_category_name)));	
		   $header_tilte=ucwords(str_replace('-',' ',$r_category_name));
		}
		
		if($r_category_name!='')
		{
			$meta_keywords=$r_category_name;
		}
	    
        $description='';		
		if($meta_keywords!='')
		{
			   if($area!='')
			   {
				$description='Get  location, contact  phone numbers, email, user  reviews & ratings and more details of '.$meta_keywords.' in '.$area .', '.$city;
               }
               else if($city!='' && $area=='')
			   {
				   $description='Get  location, contact  phone numbers, email, user  reviews & ratings and more details of '.$meta_keywords.' in '.$city;
			   }
              else
			  {  
                $description='Get  location, contact  phone numbers, email, user  reviews & ratings and more details of '.$meta_keywords;  
			  }			   
		}
		else
		{
			if($area!='')
			{
			$description='Get  location, contact  phone numbers, email, user  reviews & ratings and more details in '.$area.', '.$city;		
			}
			else
			{
			  $description='Get  location, contact  phone numbers, email, user  reviews & ratings and more details in '.$city;	
			}
		}
		
		if($meta_keywords!='')
		{
			$title_of_layout=$meta_keywords;
			if($city!='' && $area!='')
			{
				$title_of_layout=$title_of_layout.' in '.$area.' '.$city;	
			}
			else if($city!='')
			{
				$title_of_layout=$title_of_layout.' in '.$city;	
			}
			else if($area!='')
			{
				$title_of_layout=$title_of_layout.' in '.$area;
			}
			else
			{
				
				$title_of_layout=$title_of_layout.' Business Listings';
			}
		}
		else
		{
			$title_of_layout="Business Listings";
			if($city!='' && $area!='')
			{
				$title_of_layout=$title_of_layout.' in '.$area.' ,'.$city;	
			}
			else if($city!='')
			{
				$title_of_layout=$title_of_layout.' in '.$city;	
			}
			else if($area!='')
			{
				$title_of_layout=$title_of_layout.' in '.$area;
			}
		}
		
		$data['title_of_layout']=$title_of_layout;
	    $data['title_of_description']=$description;
		
		
		if(empty($header_tilte))
		{
		    $this->breadcrumbs->push(ucfirst('Listings'),base_url().'listings');
			$header_tilte=ucwords('Listings');
		}
		$data['total_count']=$config['total_rows'];
		$data['search_header_title']=$header_tilte;
		if(empty($data['list']['listings']))
		{
		$data['related_list']=$this->advertisment_model->get_related_list('related',$config['per_page'], $page,$city,$area,$keyword,$category_name,$home_category,$r_category_name);
		}
		$data['main_content']=$this->load->view('advertisments/list', $data,true);
		$this->load->view('layouts/default',$data);
	}
	
	
	#Advertisment View 
	public function view()
	{
		#Query String
		$city=(isset($_GET['city']) && $_GET['city']!='0')?$_GET['city']:'';
		$area=(isset($_GET['area']) && $_GET['area']!='0')?$_GET['area']:'';
		$keyword=(isset($_GET['keyword']))?$_GET['keyword']:'';
		$category=(isset($_GET['category']))?$_GET['category']:'';
		$home_category=(isset($_GET['home_category']))?$_GET['home_category']:'';
		$category_name=(isset($_GET['category_name']))?$_GET['category_name']:'';
		if(!empty($category_name))
		{
			$category_name=ucwords(str_replace('-',' ',$category_name));
		}
		$add_id=$this->uri->segment('2');
		$data=array();
	
		#Get Add Detail
		$data['result']=$this->advertisment_model->get_add_detail($add_id);
		
		if(empty($data['result']))
		{
			redirect(base_url());	
		}
		if($this->uri->segment('1')=='mysearch' && $this->uri->segment('5')!='')
		{
			$city=strtolower($this->uri->segment('5'));
		}
		$data['category_list']=$this->advertisment_model->get_category_list($data['result']['list_cat_id'],$keyword,$city,$area,$data['result']['name']);
		
		
		#Get Contact Detail
		//$data['contact_number']=$this->advertisment_model->get_contact_detail($add_id);
		
		#Get Business Data
		
		$data['business_data']=$this->advertisment_model->get_business_data($add_id);
				
		#Set Meta Title And Keyword
		
		$category_name=(isset($data['business_data'][0]['category_name'])) ? $data['business_data'][0]['category_name'] : '';
		$shop_name=(isset($data['result']['name'])) ? $data['result']['name'] : '';
		$category_name_list=($category_name!='') ? ' | '.$category_name:'';
		
		$description='Get  location, contact  phone numbers, email, user  reviews & ratings and more details of '.$shop_name.' listed under '.$category_name. ' in '.$data['result']['area_name'].' ,'.$data['result']['city_name']; 
		
		$data['title_of_layout']=$data['result']['name'].' in '.$data['result']['area_name'].' '.$data['result']['city_name'].$category_name_list;
		$data['title_of_description']=$description;
		$data['meta_rating']='General';
		
		#BreadCrumb Push 
		$this->load->library('breadcrumbs');
		$this->breadcrumbs->push('Dialbe',base_url());
		
		if(!empty($data['result']['city_name']))
		{
		   $this->breadcrumbs->push(ucfirst($data['result']['city_name']),base_url().'search/'.url_title(strtolower($data['result']['city_name'])));
		}
		if(!empty($data['result']['city_name']) && !empty($data['result']['area_name']))
		{
		   $this->breadcrumbs->push(ucfirst($data['result']['area_name']),base_url().'search/'.url_title(strtolower($data['result']['city_name'])).'/'.url_title(strtolower($data['result']['area_name'])));
		}
		
		$this->breadcrumbs->push(ucfirst($data['result']['name']),base_url());	
		$this->load->model('comment_model');
	    $data['advertisment_id']=$add_id;
		$data['user_comments']=$this->comment_model->get_comment_list($add_id);
		$data['main_content']=$this->load->view('advertisments/view', $data,true);
		
		$this->load->view('layouts/default',$data);
	}
	
	#Add Advertismnets
	public function add()
	{
		$data=array();
		
		if($_POST) 
		{
				$this->form_validation->set_rules('name','Business Name','trim|required');
				$this->form_validation->set_rules('owner','Contact Person','trim|required');
				$this->form_validation->set_rules('email',ucwords($this->lang->line('Email')),'trim|valid_email');
				$this->form_validation->set_rules('website','Website','trim|valid_url_format');
				$this->form_validation->set_rules('contact_number','Contact Number','trim|required');
				$this->form_validation->set_rules('address_line','Address','trim|required');
				$this->form_validation->set_rules('city','City','trim|required');
				$this->form_validation->set_rules('area','Area','trim|required');
				$this->form_validation->set_rules('working_start','Start Time','trim|required');
				$this->form_validation->set_rules('working_end','End Time','trim|required');
				if($this->form_validation->run() == true) 
				{
					$success=$this->advertisment_model->add_business();	
					if($success) 
					{
                        $extra_array = array('status'=>'success','msg'=>'Thanks For Register we shortly contact you.');
						echo json_encode($extra_array);
						die;					
					}				
				} 
				else 
				{
					echo $this->form_validation->get_json();
					die;
				}
		}
		
		#Set Meta Title And Keyword
		$data['title_of_layout']=$this->site_name." - ".'Register Your Business';
		
		$data['main_content']=$this->load->view('advertisments/add', $data,true);
		$this->load->view('layouts/default',$data);
	}
	
}