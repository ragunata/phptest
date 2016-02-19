<div class="login-register">
<div class="login-main">
	<div class="login-inner">
		<h3>Contact Informations</h3>
	<div class="border-class">
		<ul class="contactus detail-details">
											<li class="address"><i class="fa fa-location-arrow"></i><span>No.154, Velachery Main Rd, TN Police Housing Colony, Velachery Chennai, Tamil Nadu 600042</span></li>
											<li class="contactnum"><i class="fa fa-phone"></i><a href="tel:+9791447542"><span>+91 9791447542</span></a></li>
											<li class="enq-email"><i class="fa fa-envelope-o"></i><a href="mailto:damovenkatesh@gmail.com"><span>Send Enquiry By Email</a></span></li>
											<li class="timing"><i class="fa fa-clock-o"></i><span>10:00 am to 11:00 pm</span></li>
		</ul>
	</div>
	</div>
</div>
<div class="login-main registration-main">
    <div class="login-inner">
		<h3>Contact Us</h3>
		<div class="border-class">
		<form id="contact_form_url" action="<?php echo base_url().'home/contact_us';?>" method="post" class="contact_form_url">
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
				<input type="text" autocomplete="off"  name="title" placeholder="Title *" />
			</div>
			<div class="input error-textarea">
				<textarea placeholder="Message *" name="message"></textarea>
			</div>
			<div class="submit">
				<input type="submit" name="submit" value="Submit" title="Submit" />
				<input type="button" name="Cancel" class="reset-button" value="Reset" title="Reset" />
			</div>			
		</form>
		</div>
	</div>
</div>
</div>