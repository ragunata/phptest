<link type="text/css" rel="stylesheet" href="<?php echo base_url();?>assets/css/jquery.timepicker.css" media="screen"/>
<div class="business-add">
<h3 class="title-reg-business">Register Your Business</h3>
<h4 class="title-reg-req"> * fields are mandatory</h4>
<div class="register-business">
<form id="business_form_url" action="<?php echo base_url().'listings/add';?>" method="post">
	<div class="business-add-inner">
		<h3>Basic Information</h3>
	<div class="border-class">
			<div class="input">
				<input type="text" autocomplete="off"  name="name" placeholder="Busines Name *" />
			</div>
			<div class="input">
				<input type="text" autocomplete="off"  name="owner" placeholder="Contact Person *" />
			</div>
			<div class="input">
				<input type="text" autocomplete="off"  name="email" placeholder="Email " />
			</div>
			<div class="input">
				<input type="text" autocomplete="off"  name="website" placeholder="Website"/>
			</div>
			<div class="input">
			<input type="text" autocomplete="off"  name="contact_number" placeholder="Contact Number *" />
			</div>
	</div>
	</div>
	<div class="business-add-inner">
		<h3>Contact Information</h3>
	<div class="border-class">
			<div class="input">
				<input type="text" placeholder="Door No and Street Name *" name="address_line"/>
			</div>
			<div class="input">
				<input type="text" id="city_autocomplete"  name="city" placeholder="City *" />
				<input type="hidden" id="add_city_id"  name="add_city_id"/>
				
			</div>
			<div class="input">
				<input type="text" id="area_autocomplete"  name="area" placeholder="Area *" />
				<input type="hidden" id="add_area_id"  name="add_area_id"/>
			</div>
			<div class="input">
				<input type="text" autocomplete="off"  name="contact_number1" placeholder="Mobile Number1" />
			</div>
			<div class="input">
				<input type="text" autocomplete="off"  name="contact_number2" placeholder="Mobile Number2" />
			</div>	
	</div>
	</div>
	<div class="business-add-inner">
		<h3>About Your Business</h3>
	<div class="border-class">
	        <div class="input error-textarea">
				<textarea placeholder="Description" name="description"></textarea>
			</div>
			<div class="input">
				<input type="text" autocomplete="off"  name="fax" placeholder="Fax Number" />
			</div>
			<div class="input">
				<input type="text" autocomplete="off"  name="zip" placeholder="Zip" />
			</div>
			<div class="two-input">
			<div class="input">
				<input type="text" name="working_start" id="start_time" placeholder="Working Start Time *"/>
			</div>	
			<div class="input">
				<input type="text" name="working_end" id="end_time" placeholder="Working End Time *"/>
			</div>	
			</div>
			<div class="submit">
				<input type="submit" name="submit" value="Submit" title="Submit" />
				<input type="button" name="Cancel" class="reset-button" value="Reset" title="Reset" />
			</div>			
	</div>
	</div>
</form>
</div>
</div>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/jquery.timepicker.js"></script>
<script>
$(document).ready(function()
{
    $('#start_time').timepicker();
	$('#end_time').timepicker();
	
	$("#city_autocomplete").on("keyup",function()
	{	
		$(this).autocomplete({
			source: __cfg('path_absolute')+'home/get_cities',
			select: function(event, ui) 
			{
					$('#add_city_id').val(ui.item.id);
			}
		}).data( "ui-autocomplete" )._renderItem = function( ul, item )
		{
			var inner_html = '<a id="'+ item.id +'"  href="javascript:void(0)">' + item.label + '</a>';
			return $("<li></li>")
			.data( "item.autocomplete", item )
			.append(inner_html)
			.appendTo( ul );
		}
	});
	
	$("#area_autocomplete").on("keyup",function()
	{	
	    var city_id=$('#add_city_id').val();
		$(this).autocomplete({
			source: __cfg('path_absolute')+'home/get_areas?city_id='+city_id,
			select: function(event, ui) 
			{
					$('#add_city_id').val(ui.item.id);
			}
		}).data( "ui-autocomplete" )._renderItem = function( ul, item )
		{
			var inner_html = '<a id="'+ item.id +'"  href="javascript:void(0)">' + item.label + '</a>';
			return $("<li></li>")
			.data( "item.autocomplete", item )
			.append(inner_html)
			.appendTo( ul );
		}
	});
	
	
	
});
</script>