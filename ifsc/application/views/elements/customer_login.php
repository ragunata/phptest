<!--Start Signin-->
<section id="userlog" class="section bg-light-1">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="box-divider text-center">
					<h3 class="divider-text bg-light-1"><i class="icon-user"></i></h3>
				</div>
				<div class="userlog-social text-center">
					<div class="col-md-8 col-md-offset-2">
						<h6 class="text-center"><?php echo ucwords($this->lang->line('get connected with your social account')); ?></h6>
						<div class="col-md-6 signin-facebook">
							<div class="input-row bg-light-2 box-rounded-full">
								<a class="social-facebook box-rounded-full" href="<?php echo $facebook_login_url;?>">
									<span><i class="icon-facebook"></i></span>
									<small><strong><?php echo ucwords($this->lang->line('sign in with facebook')); ?></strong></small>
								</a>
							</div>
						</div>
						<div class="col-md-6 signin-google">
							<div class="input-row bg-light-2 box-rounded-full">
								<a class="social-googleplus box-rounded-full" href="<?php echo base_url(); ?>home/googleplus_login/google">
									<span><i class="icon-googleplus"></i></span>
									<small><strong><?php echo ucwords($this->lang->line('sign in with google')); ?>+</strong></small>
								</a>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="box-divider text-center">
					<h4 class="divider-text bg-light-1"><?php echo $this->lang->line('or'); ?></h4>
				</div>
				<?php
				if(!empty($_GET['ref'])) {
					if($_GET['ref']=='follow-hotel' && !empty($_GET['hotel_id'])) {
						$form_url='home/login?ref='.$_GET['ref'].'&&redirect_url='.$_GET['redirect_url'].'&&hotel_id='.$_GET['hotel_id'];
					} else if($_GET['ref']=='like-hotel' && !empty($_GET['hotel_id'])) {
						$form_url='home/login?ref='.$_GET['ref'].'&&redirect_url='.$_GET['redirect_url'].'&&hotel_id='.$_GET['hotel_id'];
					} else if($_GET['ref']=='wishlist-offer' && !empty($_GET['offer_id'])) {
						$form_url='home/login?ref='.$_GET['ref'].'&&redirect_url='.$_GET['redirect_url'].'&&offer_id='.$_GET['offer_id'];
					} else if($_GET['ref']=='add-review' && !empty($_GET['hotel_id'])) {
						$form_url='home/login?ref='.$_GET['ref'].'&&redirect_url='.$_GET['redirect_url'].'&&hotel_id='.$_GET['hotel_id'];
					} else if($_GET['ref']=='add-review' && !empty($_GET['hotel_id'])) {
						$form_url='home/login?ref='.$_GET['ref'].'&&redirect_url='.$_GET['redirect_url'].'&&hotel_id='.$_GET['hotel_id'];
					} else if($_GET['ref']=='bid-offer' && !empty($_GET['offer_id'])) {
						$form_url='home/login?ref='.$_GET['ref'].'&&redirect_url='.$_GET['redirect_url'].'&&offer_id='.$_GET['offer_id'];
					} else if($_GET['ref']=='report-abuse' && !empty($_GET['offer_id'])) {
						$form_url='home/login?ref='.$_GET['ref'].'&&redirect_url='.$_GET['redirect_url'].'&&offer_id='.$_GET['offer_id'];
					} else if($_GET['ref']=='report-abuse' && !empty($_GET['hotel_id'])) {
						$form_url='home/login?ref='.$_GET['ref'].'&&redirect_url='.$_GET['redirect_url'].'&&hotel_id='.$_GET['hotel_id'];
					} 
					else if($_GET['ref']=='get-now' && !empty($_GET['offer_id'])) {
						$form_url='home/login?ref='.$_GET['ref'].'&&redirect_url='.$_GET['redirect_url'].'&&offer_id='.$_GET['offer_id'];
					} 
					else if($_GET['ref']=='send-message')
					{
						$form_url='home/login?ref='.$_GET['ref'].'&&redirect_url='.$_GET['redirect_url'];
					} 
					else 
					{
						$form_url='home/login';
					}
				} else {
					$form_url='home/login';
				}
				?>
				<div class="userlog-form">
				<?php
				if(isset($message_error) && $message_error && $customer){ ?>
					<div class="form-row"><span class="flash-error input-error"><?php echo 'Invalid Email Address or Password'; ?> </span></div>
				 <?php } if($this->session->flashdata('success_message')) { ?>
					<div class="form-row"><?php echo $this->session->flashdata('success_message'); ?></div>
				<?php  } if($this->session->flashdata('mail_verify') && $this->session->flashdata('customer') ) { ?>
					<div class="form-row"><?php echo $this->session->flashdata('mail_verify'); ?></div>
				<?php  } if($this->session->flashdata('account_deactived') && $this->session->flashdata('customer') ) { ?>
					<div class="form-row"><?php echo $this->session->flashdata('account_deactived'); ?></div>
				<?php  } if($this->session->flashdata('flash_message')){ ?>
				<div class="form-row"><span class="flash-error input-error"><?php echo $this->session->flashdata('flash_message'); ?></span></div>
				<?php  } if($this->session->flashdata('email_message')){ ?>
					<div class="form-row"><?php echo $this->session->flashdata('email_message'); ?></div>
				<?php  } if($this->session->flashdata('signup_message')){ ?>
					<div class="form-row"><span class="input-success"><?php echo $this->session->flashdata('signup_message'); ?></span></div>
				<?php } if($this->session->flashdata('email_exists'))
				{ ?>
				<div class="form-row"><?php echo $this->session->flashdata('email_exists'); ?></div>
				<?php }?> 
					<?php echo form_open($form_url,array('id' =>'user_loginform')); ?>
						<div class="col-md-6 col-md-offset-3">
							<div class="input-row bg-light-2 box-rounded-full">
							<?php
							$cookie_user = get_cookie('username') && get_cookie('user_type')==3 ?  get_cookie('username') : '';
							echo form_input(array('name'=>'user_name','type'=>'text','class'=>'box-rounded-full input-text','placeholder'=>ucwords($this->lang->line('email address')),'id'=>'user_name','value'=>$this->input->post('user_name') && $customer ? $this->input->post('user_name') : $cookie_user)); ?>
							<?php if($customer) { echo form_error('user_name'); } ?>
							</div>
							<div class="input-row bg-light-2 box-rounded-full">
							<?php 
							$user_cookie_password = get_cookie('userpassword') && get_cookie('user_type')==3 ?  get_cookie('userpassword') : '';
							echo form_password(array('name'=>'password','id'=>'password','class'=>'box-rounded-full input-text','placeholder'=>ucwords($this->lang->line('password')),'value'=>$this->input->post('userpassword') ? '': $user_cookie_password)); 
							if($customer) { echo form_error('password'); } ?>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-12">
							<div class="form-agreement text-center">
								<div class="input-row">
								<input type="checkbox" class="input-checkbox" name="Rememberme" value="rememberme" <?php if($cookie_user != '') { echo 'checked="checked"'; }?> />
									<span class="input-label">
										<small><?php echo ucwords($this->lang->line('keep me logged in')); ?></small>
									</span>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-4 col-md-offset-4">
							<div class="input-row bg-light-2 box-rounded-full">
							<?php echo form_submit('customer_submit',ucwords($this->lang->line('sign in')),"class='input-submit submit-green box-rounded-full'"); ?>
							</div>
						</div>
						<div class="clearfix"></div>
						<p class="text-center"><?php echo anchor(base_url().'forgot_password',ucwords($this->lang->line('forgot password')).'?'); ?></p>
					<?php echo form_close(); ?>
				</div>
			</div>	
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="userlog-link text-center">
						<h4 class="title"><strong><?php echo ucwords($this->lang->line('register for free')); ?></strong></h4>
						<h5><strong><?php echo ucwords($this->lang->line('more than 500 offers every day')); ?>!</h5>
						<h3><a href="<?php echo base_url().'signup'; ?>"><?php echo strtoupper($this->lang->line('join now')); ?></a></strong></h3>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="bg-pattern-2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="userlog-link text-center">
						<a class="main-button box-circle-full" href="<?php echo base_url().HOTEL.'/login';?>"><i class="icon-house"></i> <?php echo ucwords($this->lang->line('hotel sign in')); ?></a>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--End Signin-->