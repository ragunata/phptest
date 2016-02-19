<!--Start Signin-->
<section id="userlog" class="section bg-light-1">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="box-divider text-center">
					<h3 class="divider-text bg-light-1"><i class="icon-house"></i></h3>
				</div>
				<div class="userlog-form">
				<?php if(isset($message_error) && $message_error && $hotel){ ?>	
				<div class="form-row"><span class="flash-error input-error"><?php echo ucfirst($this->lang->line('Invalid Email Address & Password')); ?>.</span></div>
				<?php } if(isset($not_approve_error) && $not_approve_error && $hotel){ ?>
				<div class="form-row"><span class="flash-error input-error"><?php echo ucfirst($this->lang->line('your account was not approved yet')); ?>.</span></div>
				<?php } ?>
				<?php if($this->session->flashdata('success_message')) { ?>
				<div class="form-row"><?php echo $this->session->flashdata('success_message'); ?></div>
				<?php  } if($this->session->flashdata('mail_verify') && $this->session->flashdata('hotel')) { ?>
					<div class="form-row"><?php echo $this->session->flashdata('mail_verify'); ?></div>
				<?php  } if($this->session->flashdata('account_deactived') && $this->session->flashdata('hotel')) { ?>
					<div class="form-row"><?php echo $this->session->flashdata('account_deactived'); ?></div>
				<?php  }  if($this->session->flashdata('flash_message')){ ?>
						<div class="form-row"><?php echo $this->session->flashdata('flash_message'); ?></div>
				<?php } if($this->session->flashdata('email_message') && $this->session->flashdata('hotel')){ ?>
						<div class="form-row"><?php echo $this->session->flashdata('email_message'); ?></div>
				<?php  } if($this->session->flashdata('signup_message')){ ?>
					<div class="form-row"><span class="input-success"><?php echo $this->session->flashdata('signup_message'); ?></span></div>
				<?php } ?>
				<?php echo form_open('hotel/login',array('id' => 'loginform')); ?>
					<div class="col-md-6 col-md-offset-3">
						<div class="input-row bg-light-2 box-rounded-full">
						<?php 
						$cookie_users = get_cookie('username') && get_cookie('user_type')==2 ?  get_cookie('username') : '';
						echo form_input(array('name'=>'user_name','type'=>'text','id'=>'user_name','class'=>'box-rounded-full input-text','placeholder'=>ucwords($this->lang->line('email address')),'value'=>$this->input->post('user_name') && $hotel ? $this->input->post('user_name') : $cookie_users)); ?>
						<?php if($hotel) { echo form_error('user_name'); } ?>
						</div>
						<div class="input-row bg-light-2 box-rounded-full">
						<?php
						$cookie_password = get_cookie('userpassword') && get_cookie('user_type')==2 ? get_cookie('userpassword') : '';
						echo form_password(array('name'=>'password','type'=>'text','id'=>'password','class'=>'box-rounded-full input-text','placeholder'=>ucwords($this->lang->line('password')),'value'=>$this->input->post('userpassword') ? '': $cookie_password));
						?>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-12">
						<div class="form-agreement text-center">
							<div class="input-row">
							  <input type="checkbox" class="input-checkbox" name="Rememberme" value="rememberme" <?php if($cookie_users != '') { echo 'checked="checked"'; }?> />
								<span class="input-label"><small>Keep me logged in</small></span>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-4 col-md-offset-4">
						<div class="input-row bg-light-2 box-rounded-full">
							<?php echo form_submit('hotel_submit',ucwords($this->lang->line('sign in')),"class='input-submit submit-green box-rounded-full'", 'title="Sign In"'); ?>
						</div>
					</div>
					<div class="clearfix"></div>
					<p class="text-center"><?php echo anchor(base_url().HOTEL.'/forgot_password',ucwords($this->lang->line('forgot password')).'?'); ?></p>
					<?php echo form_close(); ?>
				</div>
			</div>	
		</div>
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="userlog-link text-center">
					<h4 class="title"><strong>Empty Beds?</strong></h4>
					<h5><strong>Free Registration</h5>
					<h3><a href="<?php echo base_url().HOTEL.'/signup'; ?>"><?php echo strtoupper($this->lang->line('join now')); ?></a></strong></h3>
					<div class="clearfix"></div>
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