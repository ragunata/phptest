<?php
class Import_datas extends CI_Controller 
{

    public function __construct()
    {
        parent::__construct();
		if(!$this->session->userdata('is_logged_in'))
		{
            redirect(ADMIN.'/login');
        }
		$this->load->model('bank_model');
    }
     
  
   #Import Excel From File
   public function index()
   {
	 ini_set('MAX_EXECUTION_TIME', -1);
	 ini_set('memory_limit', '-1');
	 if($_POST)
	 {
		 $this->form_validation->set_rules('file_data', 'File', 'required'); 
		 if($this->form_validation->run() == true && $_FILES['file_data']['name'] && $_FILES['file_data']['tmp_name'] && ($_FILES['file_data']['type']=='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' || $_FILES['file_data']['type']=='application/zip' || $_FILES['file_data']['type']=="application/vnd.ms-excel"))
		 {
				 $file_name= $_FILES['file_data']['tmp_name'];		 
				 require_once APPPATH . 'third_party/PHPExcel.php';
				 $objReader = PHPExcel_IOFactory::createReader('Excel2007');
				 $objReader->setReadDataOnly(true);
				 $objPHPExcel = $objReader->load($file_name);
				 $objWorksheet = $objPHPExcel->setActiveSheetIndex(0);
				 $total_rows=$objPHPExcel->setActiveSheetIndex(0)->getHighestDataRow();
				 $count=0;
				 if($total_rows > 2)
				 {
					 for($i=2; $i<=$total_rows; $i++)
					 {
						if($objWorksheet->getCellByColumnAndRow(0,$i)->getValue()!='')
						{
							$count=$count+1;
							$bankName = ltrim($objWorksheet->getCellByColumnAndRow(0,$i)->getValue());
							$ifsc = ltrim($objWorksheet->getCellByColumnAndRow(1,$i)->getValue());
							$micr = ltrim($objWorksheet->getCellByColumnAndRow(2,$i)->getValue());
							$area = ltrim($objWorksheet->getCellByColumnAndRow(3,$i)->getValue());
							$contact = ltrim($objWorksheet->getCellByColumnAndRow(4,$i)->getValue());
							$address = ltrim($objWorksheet->getCellByColumnAndRow(5,$i)->getValue());
							$city = ltrim($objWorksheet->getCellByColumnAndRow(6,$i)->getValue());
							$district = ltrim($objWorksheet->getCellByColumnAndRow(7,$i)->getValue());
							$state = ltrim($objWorksheet->getCellByColumnAndRow(8,$i)->getValue());
							$bank_id=($area!='')?$this->bank_model->bankFindOrSave($bankName):0;
							$state_id=($area!='')?$this->bank_model->stateFindOrSave($state):0;
							$district_id=($area!='')?$this->bank_model->districtFindOrSave($district,$state_id):0;
							$city_id=($city!='')?$this->bank_model->cityFindOrSave($city,$state_id,$district_id):0;
							$area_id=($area!='')?$this->bank_model->areaFindOrSave($area,$state_id,$district_id,$city_id):0;
							$data_user = array(
										 "bank_id" =>$bank_id,
										 "ifsc_code"=>$ifsc,
										 "micr_code"=>$micr,
										 "state_id" => $state_id,
										 "area_id" => $area_id,
										 "address"=>$address,
										 "city_id"=>$city_id,	
										 "area_id"=>$area_id,	
										 "contact"=>$contact,
										 "created"=>date('Y-m-d H:i:s'),
										 "is_active"=>1,				 
										 );										 
							  if(!$this->bank_model->add_data($data_user))
							  {
								$data['status']="<p style='color:red;'>Error</p>";  
								$data['total_rows']=$total_rows;
								$data['inserted_datas']=$count;
								$data['message']="<p style='color:red;'>Sowmething Went Wrong Wile Save Data on row $count</p>";   
							  }
						}					
					 }
					 $data['status']="<p style='color:green;'>Success</p>";  
					 $data['total_rows']=$total_rows;
					 $data['inserted_datas']=$count;
					 $data['message']="<p style='color:green;'>Data Imported Successfully</p>"; 
				  }
				  else
				  {
					$data['status']="<p style='color:red;'>Error</p>";  
					$data['total_rows']=0;
					$data['inserted_datas']=0;
					$data['message']="<p style='color:red;'>No Datas Available</p>"; 
				  }
		}
		else
		{
			$data['status']="<p style='color:red;'>Error</p>";  
			$data['total_rows']=0;
			$data['inserted_datas']=0;
			$data['message']="<p style='color:red;'>Please Upload Valid File</p>"; 
			
		}
    }
	else
	{
		    $data['status']='Error';  
			$data['total_rows']=0;
			$data['inserted_datas']=0;
			$data['message']='No Datas Available'; 
	}
	   	$data['main_content'] = 'admin/import_data/index';
		$data['title']="Import Files";
		$this->load->view('includes/template', $data);
    }	
}