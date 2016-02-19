<div class="top-login top-login-mobile">
		<ul class="clearfix">
			<li class="signup"><?php if($this->session->userdata('is_logged') && $this->session->userdata('is_hotel_logged_in') ){ ?>
				<?php echo anchor(base_url().HOTEL.'/dashboard', 'Dashboard',array('title'=>'Dashboard')); ?>
			<?php } else if( $this->session->userdata('is_logged') && $this->session->userdata('is_user_logged_in') ) { ?>
				<?php echo anchor(base_url().'user'.'/dashboard', 'Dashboard',array('title'=>'Dashboard')); ?>
			<?php } else  { ?>
				<a href="#" title="Signup / Register">Signup / Register</a>
			<?php } ?>
			</li>
			<li class="login"><?php if($this->session->userdata('is_logged')){ ?>
			<li class="login"><?php echo anchor(base_url().'logout', 'Logout',array('title'=>'Logout')); ?></li>
			<?php } else  { ?>
			<li class="login"><?php echo anchor(base_url().'login', 'Login',array('title'=>'Login')); ?></li>
			<?php } ?>
			<li class="lang">
				<?php echo form_dropdown('lang_select',array_flip($this->config->item('language_list')),isset($_COOKIE["selected_lang"]) ? $_COOKIE["selected_lang"] : 'english') ?>
			</li>
		</ul>
</div>