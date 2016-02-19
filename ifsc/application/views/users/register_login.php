<div class="login-register">
<div class="login-main">
	<div class="login-inner">
		<h3>I am Already Register</h3>
	<div class="border-class">
		<form id="new_login_form_url" action="<?php echo base_url().'home/login';?>" method="post">
			<div class="input">
				<input type="text" name="email" placeholder="Your E-mail ID" />
			</div>
			<div class="input">
				<input type="password" name="password" placeholder="Password" />
			</div>
			<input type="hidden" name="redirect_url" placeholder="Url" value="<?php echo $redirect_url;?>"/>
			<div class="submit">
				<a href="<?php echo base_url().'forgot_password';?>" title="Forgot Your Password">Forgot Your Password ?</a>
				<input type="submit" name="submit" value="Submit" title="Submit" />
			</div>			
		</form>
	</div>
	</div>
	<div class="social-login">
		<a href="<?php echo base_url().'facebook';?>" target="_blank" title="Sign In with Facebook" class="facebook">Facebook</a>
		<a href="<?php echo base_url().'googleplus';?>" title="Sign In with Google+" target="_blank" class="googleplus">Google+</a>
		<a href="<?php echo base_url().'twitter';?>" title="Sign In with Twitter" target="_blank" class="twitter">Twitter</a>
	</div>
</div>
<div class="login-main registration-main">
    <div class="login-inner">
		<h3>New User Sign Up</h3>
		<div class="border-class">
		<form id="login_form_url" action="<?php echo base_url().'home/register';?>" method="post">
			<div class="input">
				<input type="text" autocomplete="off"  name="name" placeholder="Name *" />
			</div>
			<div class="input">
				<input type="text" autocomplete="off"  name="contact_number" placeholder="Contact Number *" />
			</div>
			<div class="input">
				<input type="text" autocomplete="off"  name="email" placeholder="Email *" />
			</div>
			<div class="input">
				<input type="password" autocomplete="off"  name="password" placeholder="Password *"/>
			</div>
			<div class="input">
				<input type="password" autocomplete="off"  name="confirm_password" placeholder="Confirm Password *" />
			</div>
			<div class="submit">
				<input type="submit" name="submit" value="Submit" title="Submit" />
				<input type="button" name="Cancel" class="reset-button" value="Reset" title="Reset" />
			</div>			
		</form>
		</div>
	</div>
</div>
<div class="register-your-business">
		<p>You want to register your business <a href="<?php echo base_url().'register-your-business';?>" target="_blank" title="Register Your Business" class="facebook">Click Here</a></p>
</div>
</div>