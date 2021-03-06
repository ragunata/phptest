<?php

if(isset($form_type)){
	if($form_type==1){
		$form_type='fgt';
	}else if($form_type==2){
		$form_type='reset';
	}else{

	}
}else{
	$form_type='';
}

?>
<!DOCTYPE html> 
<html lang="en-US">
  <head>
    <title>CodeIgniter Admin Sample Project</title>
    <meta charset="utf-8">
    <link href="<?php echo base_url(); ?>assets/css/admin/global.css" rel="stylesheet" type="text/css">
  <style>
	.navbar-fixed-top{
		display:none !important;
	}
  </style>	
  </head>
  <body>
<?php
//form validation
echo validation_errors();
?>  	
<?php
	//echo "wqerew" .$this->session->flashdata('flash_message'); 
      //flash messages
      if($this->session->flashdata('flash_message')){
        if($this->session->flashdata('flash_message') == 'mailsent')
        {
          echo '<div class="alert alert-success">';
            echo '<a class="close" data-dismiss="alert">×</a>';
            echo '<strong>Well done!</strong> Mail sent successfully';
          echo '</div>';       
        }else{
          echo '<div class="alert alert-error">';
            echo '<a class="close" data-dismiss="alert">×</a>';
            echo '<strong>Oh snap!</strong> Enter the valid email address !';
          echo '</div>';          
        }
      }
?>
<div class="container login">
<?php

if($form_type=='fgt'){
$attributes = array('class' => 'form-signin');   
echo form_open(ADMIN.'/sendauthmail', $attributes);
echo '<h2 class="form-signin-heading">Forgot Password</h2>';
echo form_input('email_address', set_value('email_address'), 'placeholder="Email"');
echo form_submit('submit', 'submit', 'class="btn btn-large btn-primary"');
echo form_close();

}else if($form_type=='reset'){
$attributes = array('class' => 'form-signin');   
echo form_open(ADMIN.'/resetpassword', $attributes);
echo '<h2 class="form-signin-heading">Reset Password</h2>';
echo form_input('email_address', set_value('email_address'), 'placeholder="Email"');
echo form_password('password', '', 'placeholder="Password"');
echo form_password('password2', '', 'placeholder="Password confirm"');
echo form_submit('submit', 'submit', 'class="btn btn-large btn-primary"');
echo form_close();

}else{

$attributes = array('class' => 'form-signin');   
echo form_open(ADMIN.'/create_member', $attributes);
echo '<h2 class="form-signin-heading">Create an account</h2>';
echo form_input('first_name', set_value('first_name'), 'placeholder="First name"');
echo form_input('last_name', set_value('last_name'), 'placeholder="Last name"');
echo form_input('email_address', set_value('email_address'), 'placeholder="Email"');

echo form_input('username', set_value('username'), 'placeholder="Username"');
echo form_password('password', '', 'placeholder="Password"');
echo form_password('password2', '', 'placeholder="Password confirm"');

echo form_submit('submit', 'submit', 'class="btn btn-large btn-primary"');
echo form_close();
}
?>
</div>
    <script src="<?php echo base_url(); ?>assets/js/jquery-1.7.1.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/js/bootstrap.min.js"></script>
  </body>
</html>
