<div class="login-register">
<div class="login-main reset-password">
	<div class="login-inner">
		<h3>Reset Password</h3>
		<form id="reset_form_url" action="<?php echo base_url().'reset_password'.'/'.$slug;?>" method="post">
			<div class="input">
				<input type="password" name="password" placeholder="Password" />
			</div>
				<div class="input">
				<input type="password" name="confirm_password" placeholder="Confirm Password" />
			</div>
			<div class="submit">
				<input type="submit" name="submit" value="Reset Password" title="Reset Password" />
			</div>			
		</form>
	</div>
</div>
</div>
