<?php
class MY_Model extends CI_Model
{
    protected $primary_key = null;
	protected $table_name = null;
	
	protected $meta_tables = array();
	protected $primary_table = null;
	protected $primary_keys = array();
	
	protected $table_fields = array();
	protected $table_alias = array();
	
	protected $return_type = "object";
	
	protected $select_fields = array();
	protected $join_tables = array();

	function __construct()
    {	
        parent::__construct();
		//$this->init();
    }
	
	function init() {
		if($this->table_name !== null) {
			if(!isset($this->table_fields[$this->table_name])) {
				$this->table_fields[$this->table_name] = array();			
				foreach($this->get_field_types($this->table_name) as $field) {				
					$this->table_fields[$this->table_name][] = $field->name;
				}
			}
		}
		
		foreach($this->meta_tables as $meta_table => $values) {
			if(!isset($this->table_fields[$meta_table])) {
				$this->table_fields[$meta_table] = array();
				foreach($this->get_field_types($meta_table) as $field) {				
					$this->table_fields[$meta_table][] = $field->name;
				}
			}
		}
	}

    function db_table_exists($table_name = null)
    {
    	return $this->db->table_exists($table_name);
    }
	
	function asArray() {
		$this->return_type = "array";
		return $this;
	}
	
	function beforeGet() {		
		foreach($this->meta_tables as $meta_table => $values) {
			$this->db->join($meta_table . " " . $values["as"], $values["conditions"], "left");
		}
    	$this->db->select($this->getSelectFields(), false);
		
		foreach($this->join_tables as $join_table) {
			extract($join_table);
			$this->db->join($table, $conditions, $type);
		}
		
		$this->select_fields = array();
		$this->join_tables = array();
	}

    function getList($table_name = null)
    {
		$this->beforeGet();
		$table_name = $table_name === null ? $this->table_name : $table_name;
		//$this->db->get($table_name . " as main");echo $this->db->last_query();die;
    	$results = $this->db->get($table_name . " as main")->result($this->return_type);	
		$this->return_type = "object";
    	return $results;
    }

		/***Get the Count of records ***/
	 function getCount($table_name = null)
    {
		$this->beforeGet();
		$table_name = $table_name === null ? $this->table_name : $table_name;
		//$this->db->get($table_name . " as main");echo $this->db->last_query();die;
    	$results = $this->db->get($table_name . " as main")->num_rows();	
		$this->return_type = "object";
    	return $results;
    }

    public function getRow($table_name = null)
    {
		$this->beforeGet();
    	$table_name = $table_name === null ? $this->table_name : $table_name;
		//$this->db->get($table_name . " as main");echo $this->db->last_query();die;
    	$results =  $this->db->get($table_name . " as main")->row(0, $this->return_type);
		$this->return_type = "object";
		return $results;
    }
	
	public function getCols($table_name = null, $col_name = null)
    {
		$this->beforeGet();		
    	$table_name = $table_name === null ? $this->table_name : $table_name;				
		$result = $this->db->get($table_name ." as main")->result_array();		
		
		$return = array();
		if(!empty($result)) {
			foreach($result as $i =>$value) {				
				if($col_name !== null) {
					$return[] = $value[$col_name];
					continue;
				}
				$j = 0;
				foreach($value as $k => $v) {
					if($j > 0) break;
					$return[] = $v;
					$j++;
				}
			}
		}
    	return $return;
    }
	
	function getSelectFields() {
		if(!empty($this->select_fields)) return $this->select_fields;
		return "*";
	}
	
	function select($select)
    {
		if (is_string($select))
		{
			$select = trim(preg_replace('/\s+/', ' ', $select));
			$select = str_replace(", ", ",", $select);
			$select = explode(',', $select);
		}
		$this->select_fields = array_merge($this->select_fields, $select);
		return $this;
	}
	
	function join($table, $conditions, $select_fields = null, $type = "")
    {	
		if($select_fields !== null) $this->select($select_fields);
		$this->join_tables[] = compact("table", "conditions", "type");
    	
		return $this;
    }
	
	function leftJoin($table, $conditions, $select_fields = null) {
		$this->join($table, $conditions, $select_fields, "left");
		return $this;
	}
	
	function rightJoin($table, $conditions, $select_fields = null) {
		$this->join($table, $conditions, $select_fields, "left");
		return $this;
	}
	
	function containsText($field, $match = '', $and_condition = FALSE) {
		if($and_condition) $this->like($field, $match);
		else $this->or_like($field, $match);
		return $this;
	}
	
	function startTextWith($field, $match = '', $and_condition = FALSE) {
		if($and_condition) $this->like($field, $this->escape_like_str($match), "after");
		else $this->or_like($field, $this->escape_like_str($match), "after");
		return $this;
	}
	
	function endTextWith($field, $match = '', $and_condition = FALSE) {
		if($and_condition) $this->like($field, $this->escape_like_str($match), "before");
		else $this->or_like($field, $this->escape_like_str($match), "before");
		return $this;
	}
	
	function setPage($page, $limit = 10) {
		$offset = ($page - 1) * $limit;
		$this->db->limit( $limit, $offset );
		return $this;
	}
	
	function getTableAlias($table_name) {
		$table_name = trim(preg_replace('/\s+/', ' ', $table_name));
		list($table, $alias) = export(" as ", $table_name);
		if(!$alias) list($table, $alias) = export(" AS ", $table_name);
		if(!$alias) list($table, $alias) = export(" ", $table_name);
		
		if(!$alias) {
			$table = $table_name;
			$alias = array_search($table, $this->table_alias);
			if(!$alias) $alias = $this->_unique_join_name($table);
		}
		$this->table_alias[$alias] = $table_name;
		
		return $alias;
	}	

    function get_field_types($table_name)
    {
    	$results = $this->db->field_data($table_name);

    	return $results;
    }
	
	function field_exists($field, $table_name = null)
    {
    	if(empty($table_name))
    	{
    		$table_name = $this->table_name;
    	}
    	return $this->db->field_exists($field,$table_name);
    }

	public function set_primary_key($field_name, $table_name = null)
    {
    	$table_name = $table_name === null ? $this->table_name : $table_name;

    	$this->primary_keys[$table_name] = $field_name;
    }
	
    function get_primary_key($table_name = null)
    {
    	$table_name = $table_name === null ? $this->table_name : $table_name;
    		
		if(isset($this->primary_keys[$table_name]))
		{
			return $this->primary_keys[$table_name];
		}

		$fields = $this->get_field_types($table_name);

		foreach($fields as $field)
		{
			if($field->primary_key == 1)
			{
				return $field->name;
			}
		}

		return false;
    }

    function escape_str($value)
    {
    	return $this->db->escape_str($value);
    }
	
	function escape_like_str($value)
    {
		return $this->db->escape_like_str($value);
	}
	
	function group_by($field) {
		$this->db->group_by($field);
		return $this;
	}
	
	function order_by($order_by, $direction = "DESC")
    {
    	$this->db->order_by( $order_by , $direction );
		return $this;
    }

    function where($key, $value = NULL, $escape = TRUE)
    {
		if(is_array($value)) $this->db->where_in( $key, $value, $escape);
    	else $this->db->where( $key, $value, $escape);
		return $this;
    }

    function or_where($key, $value = NULL, $escape = TRUE)
    {
    	$this->db->or_where( $key, $value, $escape);
		return $this;
    }

    function having($key, $value = NULL, $escape = TRUE)
    {
    	$this->db->having( $key, $value, $escape);
		return $this;
    }

    function or_having($key, $value = NULL, $escape = TRUE)
    {
    	$this->db->or_having( $key, $value, $escape);
		return $this;
    }

    function like($field, $match = '', $side = 'both')
    {
    	switch ($side) {
			case "after":
				$this->where($field ." like '". $match . "%'", null, true);
				break;
			case "before":
				$this->where($field ." like '%". $match . "'", null, true);
				break;
			default:
				$this->where($field ." like '%". $match . "%'", null, true);
		}
		return $this;
    }

    function or_like($field, $match = '', $side = 'both')
    {
    	switch ($side) {
			case "after":
				$this->or_where($field ." like '". $match . "%'", null, true);
				break;
			case "before":
				$this->or_where($field ." like '%". $match . "'", null, true);
				break;
			default:
				$this->or_where($field ." like '%". $match . "%'", null, true);
		}
		return $this;
    }
	
	function limit($limit, $offset = '')
    {
    	$this->db->limit( $limit , $offset );
		return $this;
    }
	
	protected function _unique_join_name($field_name)
    {
    	return 'j'.substr(md5($field_name),0,8); //This j is because is better for a string to begin with a letter and not with a number
    }

    protected function _unique_field_name($field_name)
    {
    	return 's'.substr(md5($field_name),0,8); //This s is because is better for a string to begin with a letter and not with a number
    }
	
	function db_update($post_array, $primary_key_value)
    {
		if($this->primary_table == null) $this->primary_table = $this->table_name;
		
		if($this->db_update_table($post_array, $primary_key_value, $this->primary_table)){
			$tables = array($this->table_name);
			if(!empty($this->meta_tables)) $tables = array_merge($tables, array_keys($this->meta_tables));				
			foreach($tables as $key => $meta_table_name) {				
				if($this->primary_table == $meta_table_name) continue;
				$this->db_update_table($post_array, $primary_key_value, $meta_table_name);
			}
		} else {
			return false;
		}
    }
	
	function db_update_table($post_array, $primary_key_value, $table_name)
    {
		$primary_key_field = $this->get_primary_key($table_name);
		$fields = $this->get_field_types($table_name);
		$updated_fields = array();
		foreach($fields as $key => $row) {
			$field_name = $row->name;
			if(isset($post_array[$field_name])) {
				$updated_fields[$field_name] = $post_array[$field_name];
			}
			if($field_name == "modified") $updated_fields[$field_name] = date("Y-m-d H:i:s", strtotime("now"));
		}
		if(empty($updated_fields)) return false;
		return $this->db->update($table_name, $updated_fields, array( $primary_key_field => $primary_key_value));
	}

    function db_insert($post_array)
    {
		if($this->primary_table == null) $this->primary_table = $this->table_name;
		
		if($insert_id = $this->db_insert_table($post_array, $this->primary_table)) {
		
			$tables = array($this->table_name);
			if(!empty($this->meta_tables)) $tables = array_merge($tables, array_keys($this->meta_tables));				
			foreach($tables as $key => $meta_table_name) {
				if($this->primary_table == $meta_table_name) continue;
				$primary_key_field = $this->get_primary_key($meta_table_name);
				$post_array[$primary_key_field] = $insert_id;
				$this->db_insert_table($post_array, $meta_table_name);
			}
			
			return $insert_id;
		} else {
			return false;
		}
    }
	
	function db_insert_table($post_array, $table_name)
    {
		$fields = $this->get_field_types($table_name);
		$insert_fields = array();
		foreach($fields as $key => $row) {
			$field_name = $row->name;
			if(isset($post_array[$field_name])) {
				$insert_fields[$field_name] = $post_array[$field_name];
			}
			
			if($field_name == "created" || $field_name == "modified") $insert_fields[$field_name] = date("Y-m-d H:i:s", strtotime("now"));
		}
		if(empty($insert_fields)) return false;
		$insert = $this->db->insert($table_name, $insert_fields);
    	if($insert) {
    		return $this->db->insert_id();
    	}
    	return false;
    }

    function db_delete($primary_key_value)
    {		
		if($this->primary_table == null) $this->primary_table = $this->table_name;
		
		if($this->db_delete_table($primary_key_value, $this->primary_table)) {
			$tables = array($this->table_name);
			if(!empty($this->meta_tables)) $tables = array_merge($tables, array_keys($this->meta_tables));				
			foreach($tables as $key => $meta_table_name) {
				if($this->primary_table == $meta_table_name) continue;					
				$this->db_delete_table($primary_key_value, $meta_table_name);
			}
		} else {
			return false;
		}
    }
	
	function db_delete_table($primary_key_value, $table_name)
    {
    	$primary_key_field = $this->get_primary_key($table_name);

    	if($primary_key_field === false)
    		return false;
			
		$this->db->limit(1);
    	$this->db->delete($table_name, array( $primary_key_field => $primary_key_value ));
    	if( $this->db->affected_rows() != 1)
    		return false;
    	else
    		return true;
	}
}
