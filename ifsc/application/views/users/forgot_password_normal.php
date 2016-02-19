<div class="login-register">
<div class="login-main">
	<div class="login-inner">
		<h3>Forgot Password</h3>
		<form id="forgotpassword_url" action="<?php echo base_url().'home/forgot_password';?>" method="post">
			<div class="input">
				<input type="text" name="email_address" placeholder="Your E-mail ID" />
			</div>
			<div class="submit">
				<input type="submit" name="submit" value="Submit" title="Submit" />
			</div>			
		</form>
	</div>
</div>
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
			<div class="submit">
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
</div>