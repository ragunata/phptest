<?php
class Home_model extends CI_Model {
 
    # Construct - Load the database
    public function __construct()
    {
       
    }
	
	#Home Get Home Cities
	public function get_home_cities()
	{
		$response=array();
	    $this->db->select('cities.name,cities.city_image,cities.image_dir');
		$this->db->where('cities.featured_city','1');
		$this->db->where('cities.is_active','1');
		$this->db->order_by('id','rand()');
		$this->db->limit('20');
		$query = $this->db->get('cities');
	    $results=$query->result_array();
        return $results; 	
	}
	
	#Home Update Profile
	public function update_profile($user_id=null,$profile_image=null)
	{
		
		$data = array(
			'email'			=> strtolower($this->input->post('email')),			
			'modified' 		=> date('Y-m-d h:i:s'),
		);
		if(!empty($profile_image))
		{
			$image_data = array(
			'image_dir'			=> $profile_image['image_dir'],			
			'profile_image' 	=> $profile_image['profile_image'],
		     );
		  $data=array_merge($image_data,$data);
		}
		$this->db->where('id', $user_id);
		$update = $this->db->update('users', $data);
		
		$profile_data = array(
			'first_name'	=> strtolower($this->input->post('name')),			
			'modified' 		=> date('Y-m-d h:i:s'),
			'mobile_number' => $this->input->post('contact_number'),
		);
		$this->db->where('user_id', $user_id);
		$update = $this->db->update('user_profiles', $profile_data);
		
		
	}
	# User Create an account
	public function create_account($verify_link)
	{
		$data = array(
			'email'			=> strtolower($this->input->post('email')),			
 			'password'		=> md5($this->input->post('password')),
			'user_type'		=>'3',
			'is_approved' 	=> 1,
			'created'		=> date('Y-m-d h:i:s'),
			'modified' 		=> date('Y-m-d h:i:s'),
			'register_type' => 1,
			'is_active'		=> 1,
			'uid'			=> $verify_link,
		);
		$this->db->insert('users', $data);
		$id = $this->db->insert_id();
		
		$profile_data = array(
			'created'		=> date('Y-m-d h:i:s'),
			'modified' 		=> date('Y-m-d h:i:s'),
			'first_name' 	=> $this->input->post('name'),
			'user_id'		=> $id
		);
		$this->db->insert('user_profiles', $profile_data);
		$id = $this->db->insert_id();
		return $id;
	}

	#Check User Code verify
	public function check_verify_code($vid) 
	{
		$today_date = date("Y-m-d h:i:s", time());
		$this->db->where('uid', $vid);    	 	
		$query = $this->db->get('users');
		$numRows = $query->num_rows;
		$result = $query->row_array();
		if($numRows == 1) {
			$update_vid = array('uid'=>'','email_verified_date'=>date('Y-m-d h:i:s'),'is_email_confirmed'=>'1');
			$this->db->where('id',$result['id']);
			$this->db->update('users', $update_vid);
			return true;
		}else{
			return false;
		}
	}

	#validate user
    function validate_users($user_name, $password ,$user_type) 
	{
		$this->db->select('id,email,user_type,is_email_confirmed,is_active,is_approved,register_type');
		$this->db->where('email', $user_name);
		$this->db->where('password', $password);
		$this->db->where('user_type', $user_type);
		$query = $this->db->get('users');
		if($query->num_rows == 1){
			return $query->row();
		}		
	}	
	
	#User Last Login Save
	function last_login_time($email,$user_id=null) 
	{
		$this->load->helper('date');
		$this->load->library('user_agent');
    	$this->db->select('id,email,user_type,last_login_time,current_login_time');
		if(!empty($email))
		{
		$this->db->where('email', $email);
		}
		else
		{
		$this->db->where('id', $user_id);
		}
		$query = $this->db->get('users');
		$getUserDetails = $query->row();
		
		if($getUserDetails->last_login_time == "0000-00-00 00:00:00" ) {
			$lastlogin=date('Y-m-d h:i:s',now());
		} else {
			$lastlogin=$getUserDetails->current_login_time;
		}
		$loginDetails =  array('current_login_time'=> date('Y-m-d h:i:s',now()),'last_login_time'=> $lastlogin);
		$this->db->where('id', $getUserDetails->id);
		$update = $this->db->update('users', $loginDetails);
		$logHistory = array('user_id' => $getUserDetails->id,'created'=>date('Y-m-d h:i:s',now()),'ip'=>$this->input->ip_address(),'browser_info'=>$this->agent->agent_string(),'is_deleted' => 0);
		$insert = $this->db->insert('user_logins', $logHistory);
	}
	  
	  
	#socail Account Create
	public function social_create_account($user_data,$user_type,$profile_image_data=null)
	{
	   $gender_id=0;
	   if(isset($user_data['id']))
	   {
	   $field='facebook_user_id';
	   $value=$user_data['id'];
	   }
	   else
	   {
	   $field='google_auth_id';
	   $value=$user_data['uid'];
	   $user_data['first_name']=$user_data['name'];
	   }
	   if($user_type=='4')
	   {
	   $field='twitter_auth_id';
	   $value=$user_data['id'];
	   }
	   if(isset($user_data['gender']) && $user_data['gender']=='male')
	   {
	   $gender_id="1";
	   }
	   if(isset($user_data['gender']) && $user_data['gender']=='female')
	   {
	   $gender_id="2";
	   }
	       $img_dir='';
		   $profile_image='';
	   	   if(!empty($profile_image_data))
			{
			$img_dir=$profile_image_data['img_dir'];
			$profile_image=$profile_image_data['filename'];
		    }
		    $data = array(
			'email'			=> (isset($user_data['email']))?strtolower($user_data['email']):'',
			$field          => $value, 
			'display_name'	=> strtolower($user_data['first_name']),
			'user_type'		=>'3',
			'is_approved' 	=> 1,
			'created'		=> date('Y-m-d h:i:s'),
			'modified' 		=> date('Y-m-d h:i:s'),
			'register_type' => $user_type,
			'is_active'		=> 1,
			'image_dir'=>$img_dir,
			'profile_image'=>$profile_image,
			'is_email_confirmed'=>1,
		);
		$this->db->insert('users', $data);
		$user_id = $this->db->insert_id();
		
		$profile_data = array(
			'created'		=> date('Y-m-d h:i:s'),
			'modified' 		=> date('Y-m-d h:i:s'),
			'first_name' 	=> strtolower($user_data['name']),
			'gender_id'     =>$gender_id,
			'user_id'		=> $user_id
		);
		$this->db->insert('user_profiles', $profile_data);
		$id = $this->db->insert_id();
		
		$this->db->select();
		$this->db->from('users');
		$this->db->where('users.id',$user_id);
		$query = $this->db->get();
		$users = $query->row_array(); 
		return $users;
	}
	
	
	function check_user_available($email,$uid) 
	{
		$this->load->helper('date');
		$this->db->where('email', $email);
		$this->db->where('user_type','3');
		$query = $this->db->get('users');
		if($query->num_rows == 1) { 
			$my_date = date("Y-m-d h:i:s", time());
			$new_member_insert_data = array('uid'=> $uid ,
							'uid_request_date'=> $my_date
						);
			$this->db->where('email',$email);
			$update = $this->db->update('users', $new_member_insert_data);
			return $update;
		}else{
			return FALSE;
		}		
	}
	
	public function valid_user_type($email)
	{
		$this->load->helper('date');
		$this->db->where('email', $email);
		$this->db->where('user_type','3');
		$query = $this->db->get('users');
		if($query->num_rows == 1) { 
		return true;
		}else{
			return FALSE;
		}	
	}
	
	public function getUsername($email=null)
	{
	    $this->db->select('users.email,user_profiles.first_name');
		$this->db->from('users');
		$this->db->where('users.email',$email);
		$this->db->join('user_profiles','user_profiles.user_id=users.id','lefts');
		$query = $this->db->get();
		$users = $query->row_array(); 
		return $users;	
	}
	
	public function check_user_uid($uid)
	{
		$today_date = date("Y-m-d h:i:s", time());
		$this->db->where('uid', $uid); 	 	
		$query = $this->db->get('users');
		if($query->num_rows == 1)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	function update_password($email) 
	{
		$this->db->where('email',$email);
		$this->db->get('users');
	    $query = $this->db->get('users');
        if($query->num_rows < 0){
			return false;
		}else {
			$new_member_insert_data = array(
		 	'password'=> md5($this->input->post('password') ),
			'uid'=>''
			);
			$this->db->where('email', $email);
			$update = $this->db->update('users', $new_member_insert_data);
		    return $update;
		}
	}
	function get_user_info($slug=null)
	{
		$this->db->select('users.email');
		$this->db->where('uid',$slug);
		$query = $this->db->get('users');
		$users = $query->row_array(); 
		return $users;
	}
	function get_userinfo($id=null)
	{
	    $this->db->select('users.*,user_profiles.first_name,user_profiles.last_name,user_profiles.mobile_number');
		$this->db->where('users.id',$id);
		$this->db->join('user_profiles','user_profiles.user_id=users.id','left');
		$query = $this->db->get('users');
		$users = $query->row_array(); 
		return $users;		
	}
	
	function get_pages($slug)
	{
	    $this->db->select('pages.*');
		$this->db->where('pages.alias',$slug);
		$this->db->where('pages.is_active','1');
		$query = $this->db->get('pages');
		$pages = $query->row_array(); 
		return $pages;	
	}
	
	function add_contactus()
	{
	   	$profile_data = array(
			'created'		=> date('Y-m-d h:i:s'),
			'modified' 		=> date('Y-m-d h:i:s'),
			'name' 	        => $this->input->post('name'),
			'contact_number'=> $this->input->post('contact_number'),
			'email' 	    => $this->input->post('email'),
			'title' 	    => $this->input->post('title'),
			'message' 	    => $this->input->post('message'),
		);
		$this->db->insert('contact_us', $profile_data);
		$id = $this->db->insert_id();
		return true;	
	}
	
	function get_areas($city_name=null)
	{
		$areas_info=array();
		$this->db->select('areas.id,areas.name');
		$this->db->where('areas.is_active','1');
	    $this->db->where('cities.is_active','1');
		$this->db->where('cities.name',$city_name);
		$this->db->join('cities','cities.id=areas.city_id','left');
		$this->db->order_by('areas.name','asc');
		$query = $this->db->get('areas');
		$areas=$query->result_array();
		return $areas;	
	}
	
	function get_my_list($keyword=null,$city_name=null,$area_name=null)
	{
		$this->db->select('advertisements.id,advertisements.name as add_name,advertisements.owner');
		$this->db->where('advertisements.is_active','1');
		$this->db->from('advertisements');
		#City Based Search
		if(!empty($city_name))
		{
			$this->db->where('cities.name',$city_name);	
		    $this->db->join('cities','cities.id=advertisements.city_id','left');
		}
		
		#Area Based Search
		if(!empty($area_name))
		{
			$this->db->where('areas.name',$area_name);
		    $this->db->join('areas','areas.id=advertisements.area_id','left');
		}
		#Keyword Based Search
		if(!empty($keyword))
		{
			$this->db->like('advertisements.name',$keyword,'after');
		}		
		$this->db->group_by('advertisements.id');
		$query = $this->db->get();	
		$results=$query->result_array();
		return $results;
	}
	
	function get_category($keyword=null,$city_name=null,$area_name=null)
	{
		$response=array();
	    $this->db->select('categories.name,categories.id');
		#Keyword Based Search
		if(!empty($keyword))
		{
			$this->db->like('categories.name',$keyword,'after');
		}
		$this->db->order_by('categories.name');
	    $query = $this->db->get('categories');	
		$results=$query->result_array();
      
		if(!empty($results))
		{
            foreach($results as $result)
            {
                $this->db->select('advertisements.id');	
				$catid=$result['id'];
				$this->db->where("FIND_IN_SET('$catid',category_id) !=", 0);	
				#City Based Search
				if(!empty($city_name))
				{
					$this->db->where('cities.name',$city_name);	
				}
				#Area Based Search
				if(!empty($area_name))
				{
					$this->db->where('areas.name',$area_name);
				}
			    $this->db->join('areas','areas.id=advertisements.area_id','left');
		        $this->db->join('cities','cities.id=advertisements.city_id','left');
                $query = $this->db->get('advertisements');
				$new_results=$query->result_array();	
				if(!empty($new_results))
				{
						$response[]=$result;
				}
			}				
		}
        return $response;
	}
	
	function get_city_area_category($keyword=null,$city_name=null,$area_name=null)
	{
		$response=array();
	    $this->db->select('categories.name,categories.id');
		#Keyword Based Search
		if(!empty($keyword))
		{
			$this->db->like('categories.name',$keyword,'after');
		}
		if(!empty($city_name))
		{
		   $this->db->where('cities.name',$city_name);
		}
		if(!empty($area_name))
		{
		   $this->db->where('areas.name',$area_name);
		}
		$this->db->order_by('categories.name');
	    $query = $this->db->get('categories');	
		$this->db->join('category_listing','category_listing.category_id=categories.id','left');
	    $this->db->join('areas','areas.id=category_listing.area_id','left');
		$this->db->join('cities','cities.id=category_listing.city_id','left');
		$results=$query->result_array();
        return $results; 		
	}
	
	function get_home_category()
	{
		$response=array();
	    $this->db->select('main_category.name,main_category.id,main_category.font_name');
		$this->db->where('main_category.is_active','1');
		$this->db->order_by('main_category.list_count');
		$this->db->limit('20');
		$query = $this->db->get('main_category');
	    $results=$query->result_array();
        return $results; 		
	}
	
	
	public function user_type_check($fb_id=null,$fb_email=null,$user_type=null,$fun=null) 
	{
		$this->db->select('users.id,users.email,users.facebook_user_id,users.is_active,users.user_type');
		$this->db->from('users');
		if(!empty($fb_email)) {
			$this->db->where('users.email',$fb_email);
		} else if(!empty($fb_id) && $user_type=="2") {
			$this->db->where('users.facebook_user_id',$fb_id);
		} else if(!empty($fb_id) && $user_type=="3") {
			$this->db->where('users.google_auth_id',$fb_id);
		}
		else if(!empty($fb_id) && $user_type=="4") {
			$this->db->where('users.twitter_auth_id',$fb_id);
		}
		
		if($fun=='authorize') {
			$this->db->where('users.register_type',$user_type);
		} else {
			$this->db->where('users.register_type !=',$user_type);
		}
		$query = $this->db->get();
		if($fun=='authorize') {	  
			return $query->row_array();
		} else {
			return $query->num_rows(); 
		}
	}
	
	public function get_email($email=null,$user_id=null)
	{
	    $this->db->select('users.id,users.email');
		$this->db->from('users');	
		$this->db->where('users.id !=',$user_id);
		$this->db->where('users.email',$email);
		$query = $this->db->get();
		return $query->row_array();
	}
	
	function check_password($user_id=false) 
	{
		$this->db->select('id');
		$this->db->where('id',$user_id);		
		$this->db->where('password',md5($this->input->post('old_password')));
		$query=$this->db->get('users'); 
		if ($query->num_rows() > 0){
			return true;
		}else{
			return false;
		}
	}
	
	function change_password($user_id=null,$old_pwd=null,$pwd) 
	{
   		$data = array(
          'password' => $pwd
         );
		$this->db->where('id',$user_id);
      	$this->db->update('users', $data);
		$report = array();
		$report['error'] = $this->db->_error_number();
		$report['message'] = $this->db->_error_message();
		if($report !== 0){
			return true;
		}else{
			return false;
		}
   	}
	
}