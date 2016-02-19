<!--Start Signin-->
<section id="userlog" class="section bg-light-1">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="box-divider text-center">
					<h3 class="divider-text bg-light-1"><i class="icon-key"></i></h3>
				</div>
				<div class="userlog-form">
				<?php if( $this->session->flashdata('login_message') && ($this->session->flashdata('customer')|| $this->session->flashdata('hotel'))){ echo "<div class='form-row'>".$this->session->flashdata('login_message')."</div>"; }
					if($this->uri->segment(1)==HOTEL){ $subform = "hotel_submit"; $formUrl=HOTEL."/forgot_password"; } else { $subform = "customer_submit"; $formUrl="forgot_password"; }  ?>
				<?php echo form_open($formUrl,array('id' => 'loginform')); ?>
					<div class="col-md-6 col-md-offset-3">
						<div class="input-row bg-light-2 box-rounded-full">
						<?php 
						echo form_input(array('name'=>'email_address','type'=>'text','id'=>'user-name','class'=>'box-rounded-full input-text','placeholder'=>ucwords($this->lang->line('email address')),'value'=>$this->input->post('email_address') ? $this->input->post('email_address') : '')); ?>
						<?php echo form_error('email_address'); ?>
						</div>
						
						<div class="clearfix"></div>
					</div>
					<div class="col-md-4 col-md-offset-4">
						<div class="input-row bg-light-2 box-rounded-full">
							<?php  echo form_submit($subform,strtoupper($this->lang->line('submit')),"class='input-submit submit-green box-rounded-full'", 'title="Sign In"'); ?>
						</div>
					</div>
					<div class="clearfix"></div>
					<?php echo form_close(); ?>
				</div>
			</div>	
		</div>
		
	</div>
	<div class="bg-pattern-2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="userlog-link text-center">
						<a class="main-button box-circle-full" href="<?php echo base_url().'login';?>"><i class="icon-user"></i> Guest Sign In</a>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--End Signin-->