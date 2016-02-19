<?php
class Advertisment_model extends CI_Model {
 	
	
	public function update_views_counts($add_id=null,$view_count=0)
	{
		$view_count=1+$view_count;
		$data=array('view_count'=>$view_count);
		$this->db->where('id', $add_id);
		$this->db->update('advertisements', $data);
	}
	
	
	public function add_data($add_data,$category_data,$contact_data)
	{

		$city_id=$add_data['city_id'];
		$area_id=$add_data['area_id'];
        $category_data_new=explode(',',$category_data);	
		$category_data_id=array();
		foreach($category_data_new as $key=>$name)
		{
			$name=str_replace('&', 'And', $name);
			$name=str_replace('"', '', $name);
			$name=str_replace("'", '', $name);
			$category_data_id[]=$this->categoryFindOrSave($name);
		}
		$category_data_ids['category_id']=implode(',',$category_data_id);
		$add_data=array_merge($add_data,$category_data_ids);
		$this->db->insert('advertisements', $add_data);
		$last_insert_id = $this->db->insert_id();
		foreach($category_data_id as $key=>$value)
		{
			$cat_data=array(
			'created_at'=> date('Y-m-d h:i:s'),
			'listing_id'=>$last_insert_id,
			'city_id'=>$city_id,
			'area_id'=>$area_id,
			'category_id'=>$value,
			);
		   $this->db->insert('category_listing', $cat_data);
	    }
		
		  $contact_numbers=explode(',',$contact_data);
		  foreach($contact_numbers as $key=>$number)
		  {  
			   if($key==0){$type='1';}else{$type='2';}
			   $advertisment_phones_data=array(
				'created'=> date('Y-m-d h:i:s'),
				'advertisment_id'=>$last_insert_id,
				'number'=>$number,
				'type'=>$type,
				);
			   $this->db->insert('advertisment_phones', $advertisment_phones_data);
		  }		
	}
	
	
	public function add_business()
	{
		$city_id='0';
		$area_id='0';
		$last_insert_id='0';
		$category_id='0';
		$all_contact_number='';
		
		if($this->input->post('contact_number'))
		{
			$all_contact_number=$this->input->post('contact_number');
		}
		
		if($this->input->post('contact_number1'))
		{
			$all_contact_number=$all_contact_number.','.$this->input->post('contact_number1');
		}
		
		if($this->input->post('contact_number2'))
		{
			$all_contact_number=$all_contact_number.','.$this->input->post('contact_number2');
		}
		$contact_numbers=explode(',',$all_contact_number);
		if($this->input->post('city'))
		{
			
			$city_id=$this->cityFindOrSave($this->input->post('city'));
		}
		if($this->input->post('area'))
		{
			$area_id=$this->areaFindOrSave($this->input->post('area'),$city_id);
		}
		
		$data = array(
			'name'=> $this->input->post('name'),			
 			'owner'=> $this->input->post('owner'),		
			'address_line'=>$this->input->post('address_line'),
			'city_id'=> $city_id,
			'area_id'=> $area_id,
			'zip' =>$this->input->post('zip'),
			'fax'=>$this->input->post('fax'),
			'website'=>$this->input->post('website'),
			'description'=>$this->input->post('description'),
			'working_start'=>$this->input->post('working_start'),
			'working_end'=>$this->input->post('working_end'),
			'email'=>$this->input->post('email'),
			'user_id'=>0,
			'plan_id'=>4,
			'created_at'=> date('Y-m-d h:i:s'),
			'contact_number'=>$all_contact_number,
		);
		$this->db->insert('advertisements', $data);
		$last_insert_id = $this->db->insert_id();
		
		$listing_data=array(
		'created_at'=> date('Y-m-d h:i:s'),
		'listing_id'=>$last_insert_id,
		'city_id'=>$city_id,
		'area_id'=>$area_id,
		'category_id'=>$category_id,
		);
	   $this->db->insert('category_listing', $listing_data);
	   
	  
	  $contact_numbers=explode(',',$all_contact_number);
	  foreach($contact_numbers as $key=>$number)
	  {  
	       if($key==0){$type='1';}else{$type='2';}
		   $advertisment_phones_data=array(
			'created'=> date('Y-m-d h:i:s'),
			'advertisment_id'=>$last_insert_id,
			'number'=>$number,
			'type'=>$type,
			);
		   $this->db->insert('advertisment_phones', $advertisment_phones_data);
	  }
	  
	  return true;
	}
	
	public function cityFindOrSave($name)
	{
		$table_data=array();
		$this->db->select('id');        
		$this->db->where('name',$name);
		$query = $this->db->get('cities');
		$res = $query->row();
		if(!empty($res))
		{
			return $res->id;
		}
		else
		{
			$table_data=array(
			'created'=>date('Y-m-d h:i:s'),
			'name'=>$name,
			'country_id'=>0,
			'state_id'=>0,
			'is_active'=>1,
			);
         $this->db->insert('cities', $table_data);			
		 return $this->db->insert_id();
		}
	}
	
	
	
	public function areaFindOrSave($name,$city_id)
	{
		$table_data=array();
		$this->db->select('id');        
		$this->db->where('name',$name);
		$query = $this->db->get('areas');
		$res = $query->row();
		if(!empty($res))
		{
			return $res->id;
		}
		else
		{
			$table_data=array(
			'created'=>date('Y-m-d h:i:s'),
			'name'=>$name,
			'country_id'=>0,
			'state_id'=>0,
			'city_id'=>$city_id,
			'is_active'=>1,
			);
         $this->db->insert('areas', $table_data);			
		 return $this->db->insert_id();
		}
	}
	
	
	public function categoryFindOrSave($name)
	{
		$table_data=array();
		$this->db->select('id');        
		$this->db->where('name',$name);
		$query = $this->db->get('categories');
		$res = $query->row();
		if(!empty($res))
		{
			return $res->id;
		}
		else
		{
			$table_data=array(
			'created'=>date('Y-m-d h:i:s'),
			'name'=>$name,
			'is_active'=>1,
			);
         $this->db->insert('categories', $table_data);			
		 return $this->db->insert_id();
		}
	}
	
	public function get_advertisments($flag , $conditions = array(), $sort_field=null, $order_type='Desc', $limit_start, $limit_end,$r_type=null) 
	{  
		$this->db->select('advertisements.id,advertisements.created,advertisements.name,advertisements.owner,advertisements.address_line,cities.name as city_name,advertisements.is_active');
		$this->db->from('advertisements');
		if(!empty($conditions))
		{ 
				foreach($conditions as $key=>$cond)
				{
					if(!$cond['direct'])
						$this->db->$cond['rule']($cond['field'], $cond['value']);
					else
						$this->db->$cond['rule']($cond['value']);
				}
		}	
		 $this->db->join('cities', 'cities.id = advertisements.city_id', 'left');
		if(!$sort_field)
			$this->db->order_by('advertisements.id', $order_type);
		else
			$this->db->order_by($sort_field, $order_type);

		if($flag == 1){
				$this->db->limit($limit_start, $limit_end);
				$query = $this->db->get();	
				return $query->result_array(); 

		}
		else{
				$query = $this->db->get();		
				return $query->num_rows();        
		}
	}
	public function delete($id) 
	{
		$this->db->select('id');
		$this->db->where('id',$id);
		$query = $this->db->get('advertisements');
		$res = $query->row();
		
		$this->db->delete('advertisements',array('id' => $id));
		$report = array();
		$report['error'] = $this->db->_error_number();
		$report['message'] = $this->db->_error_message();
		if($report !== 0) {
			return true;
		} else {
			return false;
		}
	}
	public function update_status($id, $data) 
	{	
		$this->db->where('id', $id);
		$this->db->update('advertisements', $data);
	
		$report = array();
		$report['error'] = $this->db->_error_number();
		$report['message'] = $this->db->_error_message();

		if($report !== 0){
			return true;
		}else{
			return false;
		}
	}
	
	#Admin - Get Advertisments Detail
	public function get_advertisment_detail($id=null)
	{
		$this->db->select('advertisements.*,cities.name as city_name,states.name as state_name,countries.name as country_name,GROUP_CONCAT(advertisment_phones.number) as contact_number');
		$this->db->where('advertisements.id',$id);
		$this->db->from('advertisements');
		$this->db->join('cities','cities.id=advertisements.city_id','left');
		$this->db->join('states','states.id=advertisements.state_id','left');
		$this->db->join('countries','countries.id=advertisements.country_id','left');
		$this->db->join('advertisment_phones','advertisment_phones.advertisment_id=advertisements.id','left');
		$query = $this->db->get();			
		return $query->row_array(); 
	}
	
	#Front End - Advertisment List
	public function get_add_list($type=null,$limit_start=10, $limit_end=0,$city=null,$area=null,$keyword=null,$category=null,$home_category=null,$r_category=null)
	{
		$list_id=array();
		$home_list_id=array();
		$category_set='';
	
		#Home Category 
		if(!empty($home_category))
		{
			$this->db->select('categories.id as cat_id');
			$this->db->where('main_category.name',$home_category);
			$this->db->join('categories','categories.parent=main_category.id');
			$query = $this->db->get('main_category');
		    $main_categories_result=$query->result_array();
			$res=array();
			if(!empty($main_categories_result))
			{
				foreach($main_categories_result as $key=>$result)
				{
					$res[]=$result['cat_id'];
				}
				$res=array_unique($res);
			}
			else
			{
				$res[]=0;
			}
			//$category_set=$res;
		}
		
		
	
		#Category Based Search
		if(!empty($r_category))
		{
			$this->db->select('categories.id as cat_id');
			$this->db->where('categories.name',$r_category);
			$query = $this->db->get('categories');
		    $categories_result=$query->row_array();
			if(!empty($categories_result))
			{
				$res[]=$categories_result['cat_id'];
				$category_set=array_unique($res);
			}
		}
		#Category Based Search
		if(!empty($category))
		{
			$category_set[]=$category;	
		}
		if($type=="total_records")
		{
			$this->db->select('advertisements.id');
		}
		else
		{
		$this->db->select('SQL_CALC_FOUND_ROWS advertisements.id,advertisements.total_user_rated,advertisements.contact_number,advertisements.id,advertisements.zip,advertisements.name as add_name,advertisements.owner,
		advertisements.address_line,advertisements.rating,advertisements.working_start,advertisements.working_end,advertisements.category_id,
		cities.name as city_name,areas.name as area_name,advertisements.areas',false);
		}
		
		$this->db->where('advertisements.is_active','1');		
        
		if(isset($list_id) && !empty($list_id))
		{
		$this->db->where_in('advertisements.id',$list_id);	
		}
		
		if(isset($home_list_id) && !empty($home_list_id))
		{
		 $this->db->where_in('advertisements.id',$home_list_id);	
		}
		if($category_set!='')
		{
			foreach($category_set as $key=>$set)
			{	
				 if($key==0)
				 {
				  $this->db->where("FIND_IN_SET('$set',category_id) !=", 0);
				 }
				else
				{
					//$this->db->or_where("FIND_IN_SET('$set',category_id) !=", 0);
				}			 
			}
		}
	
		#City Based Search
		if(!empty($city))
		{
			$this->db->where('cities.name',$city);	
		}
		else
		{
			$this->db->where('cities.name','chennai');	
		}
		
		#Area Based Search
		if(!empty($area))
		{
			$this->db->where('areas.name',$area);
		}
		
		#Keyword Based Search
		if(!empty($keyword) && empty($category))
		{
			$this->db->or_like('advertisements.name',$keyword);
		}
		
		$this->db->from('advertisements');
		$this->db->join('cities','cities.id=advertisements.city_id');
		$this->db->join('areas','areas.id=advertisements.area_id');		  
		if($type=="total_records")
		{
			$query = $this->db->get();	
		   	$results=$query->result_array();
			return $results;	
		}
		else
		{	 
		 $this->db->limit($limit_start, $limit_end);
		 $query = $this->db->get();	
		// echo $this->db->last_query();
		 $results['listings']=$query->result_array();
		 $results_row["all_total_rows"] = $this->get_all_rows();
	     $results=array_merge($results,$results_row);
		 return $results;
		}		
	}
	
	function get_all_rows()
	{
		
		$query=$this->db->query('SELECT FOUND_ROWS() AS `Count`');
		
		$data["totalres"] = $data["totalres"] = $query->row()->Count;
		
		return 	$data["totalres"] ;
	}
	
	#Front End - Get Advertisment Detail
	public function get_add_detail($id=null)
	{
		$this->db->select('advertisements.*,cities.name as city_name,areas.name as area_name,category_id as list_cat_id');
		$this->db->where('advertisements.id',$id);
		$this->db->where('advertisements.is_active','1');
		$this->db->from('advertisements');
		$this->db->join('cities','cities.id=advertisements.city_id');
		$this->db->join('areas','areas.id=advertisements.area_id','left');
		$query = $this->db->get();			
		$results=$query->row_array(); 
		
		$this->update_views_counts($results['id'],$results['view_count']);
		return $results;
	}

    #Front End - Get Advertisment Contacts	
	public function get_contact_detail($id=null)
	{
		$this->db->select('advertisment_phones.type,advertisment_phones.number');
		$this->db->where('advertisment_phones.advertisment_id',$id);
		$this->db->from('advertisment_phones');
		$query = $this->db->get();			
		return $query->result_array(); 
	}
	
	#Front End - Get Advertisment Images	
	public function get_add_image($id=null)
	{
		$this->db->select('advertisment_images.*');
		$this->db->where('advertisment_images.advertisment_id',$id);
		$this->db->from('advertisment_images');
		$query = $this->db->get();			
		return $query->result_array(); 
	}
	
	#Front End - Category list
    public function get_category_list($add_id=null,$keyword=null,$city=null,$area=null,$add_name=null)
	{
		$add_id=explode(',',$add_id);
		$this->db->select('GROUP_CONCAT(categories.parent) as parent_ids');
		$this->db->where('categories.parent !=','0');
		$this->db->where_in('categories.id',$add_id);
		$this->db->from('categories');
		$query = $this->db->get();			
		$results=$query->row_array();
		
		$main_category=$results['parent_ids'];
		$this->db->select('categories.id,categories.name');
		$this->db->where('categories.is_active','1');
	    $this->db->join('category_listing','category_listing.category_id=categories.id','left');	
		if(!empty($main_category))
		{
		  $main_category=explode(',',$main_category);
		  $this->db->where_in('categories.parent',$main_category);
		}
		if(!empty($keyword))
		{
		    $split_array=explode(' ',$keyword);
			foreach($split_array as $result)
			{
				$this->db->or_like('categories.name',$result);
			}			
		}
		if(!empty($add_name))
		{
		    $split_array=explode(' ',$add_name);
			foreach($split_array as $result)
			{
				$this->db->or_like('categories.name',$result);
			}
		}
		#City Based Search
		if(!empty($city))
		{
			$this->db->where('cities.name',$city_name);	
			$this->db->join('cities','cities.id=category_listing.city_id','left');
		}
		
		#Area Based Search
		if(!empty($area_name))
		{
			$this->db->where('areas.name',$area_name);
			$this->db->join('areas','areas.id=category_listing.area_id','left');
		}
		$this->db->group_by('categories.id');
		$this->db->limit('10');
		$this->db->from('categories');
		$query = $this->db->get();			
		$results=$query->result_array();	
		return $results;
	}	
	
	
	
	public function get_new_list_category($category)
	{	
	    $results=array();
	    if($category!='')
		{
			$category=explode(',',$category);
			$category=array_filter($category);
		    $category=array_unique($category);
			$category=implode(',',$category);
			$this->db->select('categories.id,categories.name');
			$this->db->where('categories.is_active','1');
			$this->db->where('categories.id IN('.$category.')');
			$this->db->limit('10');
			$this->db->order_by('categories.name','ASC');
			$this->db->from('categories');
			$query = $this->db->get();			
			$results=$query->result_array();		
		}
		return $results;
	}
	
	#Get List Category
	
	public function get_list_category($category=null,$keyword=null,$city=null,$area=null,$category_name=null,$home_category=null)
	{		
	    if(!empty($home_category))
		{
		  $this->db->select('id');
		  $this->db->where('name',$home_category);
		  $this->db->from('main_category');
		  $query = $this->db->get();
	      $cat_results=$query->row_array();		  
		  $this->db->where('categories.parent',$cat_results['id']);
		}
		$this->db->select('categories.id,categories.name,advertisements.id as add_id');
		$this->db->where('categories.is_active','1');
		if(!empty($keyword))
		{
		    $split_array=explode(' ',$keyword);
			foreach($split_array as $result)
			{
				$this->db->or_like('categories.name',$result);
			}			
		}
		if(!empty($category_name))
		{
		    $split_array=explode(' ',$category_name);
			foreach($split_array as $result)
			{
				$this->db->or_like('categories.name',$result);
			}
		}
		if(!empty($category_name))
		{
		    $split_array=explode('-',$category_name);
			foreach($split_array as $result)
			{
				$this->db->or_like('categories.name',$result);
			}
		}
		
		#City Based Search
		if(!empty($city))
		{
			$this->db->where('cities.name',$city);	
		}
		
		#Area Based Search
		if(!empty($area))
		{
			$this->db->where('areas.name',$area);
		}
		$this->db->join('category_listing','category_listing.category_id=categories.id');
		$this->db->join('advertisements','advertisements.id=category_listing.listing_id');
		$this->db->join('areas','areas.id=category_listing.area_id');
		$this->db->join('cities','cities.id=category_listing.city_id');
		$this->db->group_by('categories.id');		
		$this->db->limit('10');
		$this->db->order_by('categories.name','ASC');
		$this->db->from('categories');
		$query = $this->db->get();			
		$results=$query->result_array();		
		return $results;
		
	}
	
	#Get Category Results
	public function get_related_list($type=null,$limit_start=10, $limit_end=0,$city=null,$area=null,$keyword=null,$category=null,$home_category=null)
	{
		$this->db->select('advertisements.total_user_rated,advertisements.contact_number,advertisements.id,advertisements.name as add_name,advertisements.owner,advertisements.address_line,advertisements.zip,advertisements.rating,advertisements.working_start,advertisements.working_end,cities.name as city_name,states.name as state_name,areas.name as area_name,advertisements.areas');
		$this->db->where('advertisements.is_active','1');	 
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
		if(!empty($keyword))
		{
		    $split_array=explode(' ',$keyword);
			foreach($split_array as $result)
			{
				$this->db->or_like('advertisements.name',$result);
			}			
		}
			if(!empty($home_category))
		{
		    $split_array=explode(' ',$home_category);
			foreach($split_array as $result)
			{
				$this->db->or_where('advertisements.name LIKE',$result);
			}
		}
		if(!empty($category_name))
		{
		    $split_array=explode(' ',$category_name);
			foreach($split_array as $result)
			{
				$this->db->or_like('advertisements.name',$result);
			}
		}
		$this->db->from('advertisements');
	    $this->db->join('areas','areas.id=advertisements.area_id','left');
		$this->db->join('cities','cities.id=advertisements.city_id','left');
		$this->db->join('states','states.id=advertisements.state_id','left');
		$this->db->order_by('advertisements.id','RANDOM');
		$this->db->group_by('advertisements.id');
		$this->db->limit(10);
		$query = $this->db->get();	
		$results=$query->result_array();
		return $results;
	}
	
	public function get_add_images($id=null)
	{
		    $this->db->select('advertisment_images.url as image_url');
		    $this->db->from('advertisment_images');
			$this->db->where('advertisment_images.advertisment_id',$id);
			$this->db->where('advertisment_images.type','1');
			$this->db->limit('1');
			$query = $this->db->get();
            return $query->row_array();	
	}
	
	function get_values($id) 
	{
		$this->db->select('*');
		$this->db->where('id', $id);
		$query = $this->db->get('advertisements');
		return $query->row_array();
	}
	function edit($id)
	{
		$country_id='0';
		$state_id='0';
	    $city_id='0';
		$area_id='0';
		if($this->input->post('select_country')!='0')
		{	
			$country_id=$this->input->post('select_country');
		}
		if($this->input->post('select_state')!='0')
		{	
			$state_id=$this->input->post('select_state');
		}
		if($this->input->post('select_city')!='0')
		{	
			$city_id=$this->input->post('select_city');
		}
		if($this->input->post('select_area')!='0')
		{
			$area_id=$this->input->post('select_area');
		}
		
		$data = array(
			'name'=> $this->input->post('name'),			
 			'owner'=> $this->input->post('owner'),		
			'address_line'=>$this->input->post('address_line'),
			'country_id'=> $country_id,
			'state_id'=> $state_id,
			'city_id'=> $city_id,
			'area_id'=> $area_id,
			'zip' =>$this->input->post('zip'),
			'fax'=>$this->input->post('fax'),
			'website'=>$this->input->post('website'),
			'description'=>$this->input->post('description'),
			'working_start'=>$this->input->post('working_start'),
			'working_end'=>$this->input->post('working_end'),
			'email'=>$this->input->post('email'),
			'user_id'=>0,
			'plan_id'=>4,
			'created_at'=> date('Y-m-d h:i:s'),
		);
		$this->db->where('id', $id);
		$this->db->update('advertisements', $data);
	}
	
	
	function get_business_data($add_id=null)
	{
		$this->db->select('categories.name as category_name,cities.name as city_name,areas.name as area_name');
		$this->db->join('categories','categories.id=category_listing.category_id');	
		$this->db->join('advertisements','advertisements.id=category_listing.listing_id');
		$this->db->join('areas','areas.id=category_listing.area_id');
		$this->db->join('cities','cities.id=category_listing.city_id');
	    $this->db->where('category_listing.listing_id',$add_id);
		$this->db->from('category_listing');
	    $query = $this->db->get();	
		$results=$query->result_array();
		return $results;
	}
	
	function get_business_listings($limit_start=10, $limit_end=0)
	{
		$this->db->select('categories.name as category_name,cities.name as city_name,areas.name as area_name');
		$this->db->join('categories','categories.id=category_listing.category_id','left');	
		$this->db->join('advertisements','advertisements.id=category_listing.listing_id','left');
		$this->db->join('areas','areas.id=category_listing.area_id','left');
		$this->db->join('cities','cities.id=category_listing.city_id','left');
		$this->db->from('category_listing');
		 $this->db->limit($limit_start, $limit_end);
	    $query = $this->db->get();	
		$results=$query->result_array();
		return $results;
	}
}
?>