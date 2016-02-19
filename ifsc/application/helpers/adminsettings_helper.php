<?php
if(!defined('BASEPATH')) exit('No direct script access allowed');

# Admin Common Settings
function admin_settings_initialize($getId=null) {
	$ci=& get_instance();
    $ci->load->database(); 
	 $ci->db->cache_on(); 

	$ci->db->select('id,setting_fields,sitename');
	$ci->db->where('id', 1);
	$query = $ci->db->get('settings');
	 $ci->db->cache_off(); 
    $row = $query->row();
	
	$settingFields = unserialize($row->setting_fields);
	$adminDatas="";
	if($getId=='settings') {
		$adminDatas = array(
					'per_page' => $settingFields['back_pagination'],
					'use_page_numbers' => 'TRUE',
					'num_links' => 5,
					'full_tag_open' => '<ul>',
					'full_tag_close' => '</ul>',
					'num_tag_open' => '<li>',
					'num_tag_close' => '</li>',
					'cur_tag_open' => '<li class="active"><a>',
					'cur_tag_close' => '</a></li>'
			);
	} else if($getId=='email') {
		$adminDatas = $settingFields['email_address'];
	} else if($getId=='sitename') {
		$adminDatas= $row->sitename;
	} else if($getId=='front_paging_count') {
		$adminDatas = $settingFields['front_pagination'];
	} else if($getId=='meta_words'){
		$adminDatas = $settingFields;
	}
	else if($getId=='meta')
	{
			$adminDatas['keywords'] = $settingFields['keywords'];
			$adminDatas['description'] = $settingFields['description'];
	}
	return $adminDatas;
}

#Sub Admission 
function sub_admin_permission_check(){
	$ci=& get_instance();
	if($ci->session->userdata('is_sub_admin')){
		$sets = $ci->config->item('sub_admin_roles');
		if(!in_array($ci->router->fetch_method(),$sets[$ci->router->fetch_class()])){
			$ci->session->set_flashdata('flash_message', $ci->lang->line('not_authenticate'));
			redirect(ADMIN.'/dashboard');
		}
	}
}

#sub Admission permission check
function sub_admin_menu_check($menu){
	$ci=& get_instance();
	if($ci->session->userdata('is_sub_admin')){
		$sets = $ci->config->item('sub_admin_roles');
		if(!in_array($menu,array_keys($sets))){
			return false;
		} else {
			return true;
		}
	}else {
		return true;
	}
}

#Format To Array
function pr($arr_values) {
	if($arr_values!="") {
		echo '<pre>';
		print_r($arr_values);
	}
}


#User Profile Info
function user_profile_info($user_id=null,$user_type_id=null) {
	$ci=& get_instance();
	$ci->load->database();
	$ci->db->select('users.id,user_profiles.first_name as name,users.profile_image,users.image_dir');
	$ci->db->where('users.id',$user_id);
	$ci->db->join('user_profiles', 'user_profiles.user_id = users.id', 'left');
	$query = $ci->db->get('users');
	$info=$query->row_array();
	return $info;
}


#Home Cities List
function get_cites($type=null)
{
	$cities_info=array();
	$ci=& get_instance();
	$ci->load->database();
	$ci->db->select('cities.id,cities.name');
	$ci->db->where('cities.is_active','1');
	$ci->db->order_by('cities.name','asc');
	$query = $ci->db->get('cities');
	$cities=$query->result_array();
	$cities_info['0']="Select City";
	if($type)
	{
	foreach($cities as $city)
	{
		$cities_info[$city['id']]=ucwords($city['name']);	
	}	
	}
	else
	{
	foreach($cities as $city)
	{
		$cities_info[$city['name']]=ucwords($city['name']);	
	}
	}
	return $cities_info;
}

#Home Countries List function get_countries

function get_countries()
{
	$country_info=array();
	$ci=& get_instance();
	$ci->load->database();
	$ci->db->select('countries.id,countries.name');
	$ci->db->where('countries.is_active','1');
	$ci->db->order_by('countries.name','asc');
	$query = $ci->db->get('countries');
	$countries=$query->result_array();
	$country_info['0']="Select Country";
	foreach($countries as $c)
	{
		$country_info[$c['id']]=ucwords($c['name']);	
	}
	return $country_info;
}


function get_areas($select_city=null)
{
	$areas_info=array();
	$areas_info['0']="Select Location";
	if($select_city!='')
	{
	$ci=& get_instance();
	$ci->load->database();
	$ci->db->select('areas.id,areas.name');
	$ci->db->where('areas.is_active','1');
	$ci->db->where('cities.name',$select_city);
	$ci->db->join('cities','cities.id=areas.city_id','left');
	$ci->db->order_by('areas.name','asc');
	$query = $ci->db->get('areas');
	$areas=$query->result_array();
	if(!empty($areas))
	{
		foreach($areas as $area)
		{
			$areas_info[$area['name']]=ucwords($area['name']);	
		}
	}
	}
	return $areas_info;	
}

function highlight_text($string,$keyword)
{
	if(!empty($keyword))
	{
	 $words =explode(' ',$keyword);
		foreach($words as $word)
		{
			$string = str_ireplace($word, '<span class="highlight_word">'.$word.'</span>', $string);
		}
	}
    return ucwords($string);
}

function footer_cities()
{
	$ci=& get_instance();
	$ci->load->database();
	$ci->db->select('cities.id,cities.name');
	$ci->db->where('cities.is_active','1');
	$ci->db->where('cities.featured_city','1');
	$ci->db->order_by('cities.name','asc');
	$query = $ci->db->get('cities');
	$cities=$query->result_array();
	return $cities;
}

function get_menus()
{	
        $ci=& get_instance();
	    $ci->load->database();
        $response=array();
	    $ci->db->select('main_category.name,main_category.id');
		$ci->db->where('main_category.is_active','1');
		$ci->db->order_by('main_category.list_count');
		$ci->db->limit('8');
		$query = $ci->db->get('main_category');
	    $results=$query->result_array();
        return $results; 	
}


function get_user_rating($list_id=null)
{
	
	    $ci=& get_instance();
	    $ci->load->database();
        $response=array();
	    $ci->db->select('count(advertisment_comments.id) as total_user_rated');
		$ci->db->where('advertisment_comments.advertisment_id',$list_id);
		$query = $ci->db->get('advertisment_comments');
	    $results=$query->row_array();
        return $results;
}


function get_list_phone($list_id=null)
{
	        $ci=& get_instance();
	        $ci->load->database();
		    $ci->db->select('advertisment_phones.number as contact_number');
		    $ci->db->from('advertisment_phones');
			$ci->db->where('advertisment_phones.advertisment_id',$list_id);
			$ci->db->limit('1');
			$query = $ci->db->get();
		    return $query->row_array();
}


function get_list_images($list_id=null)
{
	        $ci=& get_instance();
	        $ci->load->database();
	        $ci->db->select('advertisment_images.url as image_url');
		    $ci->db->from('advertisment_images');
			$ci->db->where('advertisment_images.advertisment_id',$list_id);
			$ci->db->where('advertisment_images.type','1');
			$ci->db->limit('1');
			$query = $ci->db->get();
            return $query->row_array();
}

function get_list_count($cat_id=null)
{
	        $ci=& get_instance();
	        $ci->load->database();
	        $ci->db->select('count(category_listing.id) as list_count');
		    $ci->db->from('category_listing');
			$ci->db->where('category_listing.category_id',$cat_id);
			$query = $ci->db->get();
            return $query->row_array();
}