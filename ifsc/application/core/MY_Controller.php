<?php
class MY_Controller extends CI_Controller{


	protected $device_type;
	protected $device_id;
	protected $language_id;
	
	private $print_data = false;
	public $testing_data = false;
	protected $loggedin_customer;
	 

	const ERROR_SERVER_DB           = 10; /** Server/DB error. **/
	const ERROR_EMPTY_PARAMS        = 11; /** Empty Params **/
	const ERROR_SERVICE_UNAVAILABLE = 12; /** Service Unavailable **/
	const ERROR_NO_RECORDS          = 13; /** No Records Available **/
	const ERROR_ACCESS_DENIED       = 14; /** Un Authorized Access **/
	const ERROR_INVALID_USER        = 15; /** Invalid User **/
	const ERROR_NOT_IDENTIFY        = 16; /** There was an error occur **/
	const ERROR_EMAIL_EXISTS        = 17; /** Email already exists. **/
	const ERROR_INVALID_LOGIN       = 18; /** Invalid Email or Password **/
	const ERROR_NOT_MEMBER          = 19; /** There is no user registered with this email **/
	const ERROR_INVALID_DATA        = 20; /** Invalid Data **/
	const ERROR_PASSWORD_MISMATCH   = 21; /** Old password mismatch **/
	const SUCCESS                   = 22; /** Operation Success **/
	const ERROR_SUSPEND_USER        = 23; /** User account suspended **/
	const ERROR_INVALID_PASSWORD    = 24; /** Invalid password format **/
	const ERROR_INVALID_IMAGEFORMAT = 25; /** Invalid image format **/
	const ERROR_INACTIVE_ACCOUNT 	= 26; /** Inactive account **/
	const ERROR_EMAIL_VERIFY 		= 27; /** Inactive account **/
	const ERROR_USER_NOTEXIST 		= 28; /** User doesn't exist **/
	const ERROR_REMOVE_RECORD 		= 29; /** Remove records **/
	
	public function __construct($auth = false)
	{	
		parent::__construct();
		
		$this->load->model("webservice/common_model");
		$this->load->model("webservice/site_user_model");
		
		$this->device_type 		=	$this->input->post('device_type');
		$this->device_id		=	$this->input->post('device_id');
		$this->language_id		=	$this->input->post('language_id');
		$this->oauth_token		=	$this->input->post('oauth_token');
		
		if($this->testing_data) {
			/*--Dev mode---*/
			$this->device_type 		=	'1';
			$this->device_id		=	'23455756732542452453';
			$this->language_id      =   '1';
			/*--Dev mode End---*/
		}

		if(!($this->device_id && $this->device_type)) {
			$this->json_ws_output(self::ERROR_EMPTY_PARAMS);
		}
	}
	
	public function json_ws_output($code, $data = array()) {
		$this->getCustomerDetails();
		$json = array();
		$status = ($code == self::SUCCESS)?1:0;
		
		$json["result"] = array('status' => $status, 'message' => $code);
		
		//if(!empty($this->loggedin_customer)) $json["result"]["customer_details"] = $this->loggedin_customer;
		
		if(!empty($data)) $json = array_merge($json, $data);
		
		if($this->print_data) {
			echo "<pre>";print_r($json);die();
		}
		
		$this->output->set_content_type('application/json');
		echo json_encode($json);die();
	}
	
	public function getCustomerDetails() {
		if(empty($this->loggedin_customer)) {						
			if($this->oauth_token) {
				$customer = $this->site_user_model->select("main.id, email, last_login_time, oauth_token, user_type, first_name, last_name, main.display_name, gender_id, address, preferred_country_id, preferred_state_id, preferred_city_id, preferred_area_id,is_active");

				$this->loggedin_customer = $customer->where("main.oauth_token", $this->oauth_token)->getRow();
			}
		}
		return $this->loggedin_customer;
	}
	public function is_customer_login() {
		$customer = $this->getCustomerDetails();
		if($customer && $customer->is_active) return true;
		return false;
	}
	function _remap($method, $params = array()) {
		if(!method_exists($this, $method)) {
			array_unshift($params, $method);
			$method = "index";
		}
		return call_user_func_array(array($this, $method), $params);
	}
	
}
