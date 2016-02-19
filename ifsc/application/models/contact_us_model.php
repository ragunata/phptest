<?php
class Contact_us_model extends CI_Model {
 
 
    public function __construct()
    {
        $this->load->database();
    }

	public function get_contact_us($flag , $conditions = array(), $sort_field=null, $order_type='Desc', $limit_start, $limit_end) 
	{  
		$this->db->select('contact_us.id, contact_us.name, contact_us.created,contact_us.contact_number,contact_us.email');
		$this->db->from('contact_us');
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
		if(!$sort_field)
			$this->db->order_by('contact_us.id', $order_type);
		else
			$this->db->order_by($sort_field, $order_type);

		if($flag == 1){
			     if($limit_end!='-10')
				 {
				$this->db->limit($limit_start, $limit_end);
				 }
				$query = $this->db->get();		
				return $query->result_array(); 
		}
		else{
				$query = $this->db->get();		
				return $query->num_rows();        
		}
	 }
	function get_values($id) {
		$this->db->select('contact_us.id, contact_us.name, contact_us.created,contact_us.contact_number,contact_us.email,contact_us.title,contact_us.message');
		$this->db->where('contact_us.id', $id);
		$query = $this->db->get('contact_us');
		return $query->row_array();
	}

	public function update_status($id, $data) 
	{
		$this->db->where('id', $id);
		$this->db->update('contact_us', $data);
		
		$report = array();
		$report['error'] = $this->db->_error_number();
		$report['message'] = $this->db->_error_message();

		if($report !== 0){
				return true;
		}else{
				return false;
		}
	}
	
	
	public function delete($id) 
	{
		$this->db->delete('contact_us',array('id' => $id));
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
?>