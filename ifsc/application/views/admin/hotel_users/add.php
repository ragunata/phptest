<?php 
//print_r($hotel_users['profile']);exit;
$country_value="";
$country_id="";
$city_value="Select City";
$city_id="";
$state_value="Select State";
$state_id="";	
$area_value="Select Area";
$area_id="";



$email				= "";
$is_active				= "1";
$name				= "";
$mobile_number		= "";
$telephone_number	= "";
$_edit_id			= "";
$description		= "";
$plan_id			= "";
$class_id			= "";
$skype_name			= "";
$facebook_url		= "";
$meta_description	= "";
$meta_keywords		= "";
$image_name 		= "";
$display_name		= "";
$twitter_url		= "";
$address			= "";
$miles_from			= "";
$miles_location		= "";
$image_dir			= "";
$hotel_url          = "";
$longitude          = "";
$latitude          = "";
if(isset($hotel_users['profile'])) {
$profile 			= $hotel_users['profile'];
$email				= $profile['email'];
$display_name		= $profile['display_name'];
$name				= $profile['name'];
$mobile_number		= $profile['mobile_number'];
$telephone_number	= $profile['telephone_number'];
$_edit_id			= $profile['id'];
$description		= $profile['description'];
$address			= $profile['address'];
$miles_from			= $profile['miles_from'];
$miles_location		= $profile['miles_location'];
$plan_id			= $profile['plan_id'];
$class_id			= $profile['class_id'];
$skype_name			= $profile['skype_name'];
$twitter_url		= $profile['twitter_url'];
$facebook_url		= $profile['facebook_url'];
$hotel_url		    = $profile['hotel_url'];
$meta_description	= $profile['meta_description'];
$meta_keywords		= $profile['meta_keywords'];
$image_name			= $profile['profile_image'];
$image_dir			= $profile['image_dir'];
$is_active			= $profile['is_active'];
$longitude          = $profile['longitude'];
$latitude           = $profile['latitude'];
$area_id= $profile['preferred_area_id'];
$city_id= $profile['preferred_city_id'];
$state_id= $profile['preferred_state_id'];
$country_id= $profile['preferred_country_id'];

} else {
$hotel_users['amenities']="";
$hotel_users['suitables']="";
}
$getcities= $this->config->item('base_url').ADMIN.'/getcities';
$getcountries= $this->config->item('base_url').ADMIN.'/getcountries';
$getstates= $this->config->item('base_url').ADMIN.'/getstates';
$getareas= $this->config->item('base_url').ADMIN.'/getareas';
if(!empty($_POST['select_area']))
{
$area_id= $_POST['select_area'];
}
if(!empty($_POST['select_city']))
{
$city_id= $_POST['select_city'];
}
if(!empty($_POST['select_state']))
{
$state_id= $_POST['select_state'];
}
if(!empty($_POST['select_country']))
{
$country_id= $_POST['select_country'];
}
?>
<script type="text/javascript">
        google.maps.event.addDomListener(window, 'load', function () {
            var places = new google.maps.places.Autocomplete(document.getElementById('address'));
            google.maps.event.addListener(places, 'place_changed', function () {
                var place = places.getPlace();
                var address = place.formatted_address;
                var latitude = place.geometry.location.k;
                var longitude = place.geometry.location.D;
			    document.getElementById('latitude').value=latitude;
			    document.getElementById('longitude').value=longitude;
            });
        });
		</script>
 
<script type="text/javascript">
var availableCityTags = "<?php echo $getcities ;?>";
var availablecountryTags = "<?php echo $getcountries ;?>";
var availableStateTags = "<?php echo $getstates ;?>";
var availableAreaTags = "<?php echo $getareas ;?>";
var select_state_id="<?php echo $state_id ; ?>";	
var select_city_id="<?php echo $city_id ; ?>";	
var select_area_id="<?php echo $area_id ; ?>";	

</script>
<div class="main">
	<div class="main-inner">
	    <div class="container">
	      <div class="row">
	      	<div class="span12">
	      		<div class="widget ">
	      			<div class="widget-header">
	      				<i class="icon-user-md"></i>
	      				<h3>Hotels - <?php echo $indextitle; ?></h3>
						<span class="create_new"><?php echo $this->breadcrumbs->show(); ?></span>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
						<div class="tabbable">
							<div class="tab-pane" id="formcontrols">
							<?php
							$attributes = array('class' => 'form-horizontal', 'id' => 'add_hotels','autocomplete'=>'off');
						
							if($_edit_id==""){ $readOnly="";$disable="";
								echo form_open_multipart(ADMIN.'/hotels/add?pagemode='.$this->input->get('pagemode').'&modestatus='.$this->input->get('modestatus').'&sortingfied='.$this->input->get('sortingfied').'&sortype='.$this->input->get('sortype'), $attributes);
							}else{ $readOnly='readOnly';$disable="disabled";
								echo form_open_multipart(ADMIN.'/hotels/edit/'.$_edit_id.'?pagemode='.$this->input->get('pagemode').'&modestatus='.$this->input->get('modestatus').'&sortingfied='.$this->input->get('sortingfied').'&sortype='.$this->input->get('sortype'), $attributes);
							}		?>
								<fieldset>
									<div class="widget-header" style="padding-left:10px;" >Basic Informations	</div>
									<br/>
									<div class="control-group">											
										<label class="control-label" for="hotel_name">Hotel Name <span class="must">*</span></label>
										<div class="controls">

										<?php echo form_input(array('name'=>'hotel_name','value'=>set_value('hotel_name', $this->input->post('hotel_name') ? $this->input->post('hotel_name') : $name),'class'=> 'span3','id'=>'hotel_name') ); ?>


										<?php echo form_input(array('name'=>'suitable_list','class'=> 'span3','id'=>'suitable_list','value'=>"",'style'=>"display:none")); ?>
										<?php echo form_input(array('name'=>'amenity_list','class'=> 'span3','id'=>'amenity_list','value'=>"",'style'=>"display:none")); ?>
										  <span class="text-danger"><?php echo form_error('hotel_name'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label" for="email">Email <span class="must">*</span></label>
										<div class="controls">
										<?php echo form_input(array('name'=>'email','class'=> 'span3',$readOnly=>$readOnly,'id'=>'email','value'=>set_value('email', $this->input->post('email') ? $this->input->post('email') : $email),'class'=> 'span3','id'=>'email') ); ?>
										 <span class="text-danger"><?php echo form_error('email'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="display_name">Display Name <span class="must">*</span></label>
										<div class="controls">
										@ <?php echo form_input(array('name'=>'display_name','id'=>'display_name','value'=>set_value('display_name', $this->input->post('display_name') ? $this->input->post('display_name') : $display_name),'class'=> 'span2 nospaces','id'=>'display_name') ); ?> ( Ex: @jessy )
										 <span class="text-danger"><?php echo form_error('display_name'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->

									<?php if($_edit_id==""){?>
									<div class="control-group">											
										<label class="control-label" for="password">Password <span class="must">*</span></label>
										<div class="controls">
										<?php echo form_password(array('name'=>'password','class'=> 'span3','id'=>'password'),$this->input->post('password')); ?>
										<span><abbr title="Combinations of one digit [0-9], one alphabet [A-Z] [a-z] and one special character such as [@#&*!]"> &nbsp;Tips !!</abbr></span>
										 <span class="text-danger"><?php echo form_error('password'); ?></span>		
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->

									<div class="control-group">											
										<label class="control-label" for="confirm_password">Confirm Password <span class="must">*</span></label>
										<div class="controls">
										<?php echo form_password(array('name'=>'confirm_password','class'=> 'span3','id'=>'confirm_password'),$this->input->post('confirm_password')); ?>
										 <span class="text-danger"><?php echo form_error("confirm_password"); ?></span>	
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<?php } ?>
									<div class="control-group">											
										<label class="control-label" for="hotel_class_type">Hotel Class Type <span class="must">*</span></label>
										<div class="controls">
									
										<?php	
										$selected = ($this->input->post('hotel_class_type')) ? $this->input->post('hotel_class_type') : $class_id	;  
										echo form_dropdown('hotel_class_type',array(''=>'Select Type') + $hotel_class,$selected,"id='hotel_class_type'"); 
										
										?>
										<span class="text-danger"><?php echo form_error("hotel_class_type"); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<?php echo form_input(array('name'=>'edit_id','class'=> 'span3','id'=>'edit_id','value'=>$_edit_id,'style'=>'display:none;')); ?>
									<div class="control-group">											
										<label class="control-label" for="hotel_plan_type">Hotel Plans <span class="must">*</span></label>
										<div class="controls">
										<?php
										$plan_selected = ($this->input->post('hotel_plan_type')) ? $this->input->post('hotel_plan_type') : $plan_id	;  
										$js = 'id="hotel_plan_type" '.$disable;
										echo form_dropdown('hotel_plan_type',array(''=>'Select Type')+$plan_types,$plan_selected,$js);?>
										<span class="text-danger"><?php echo form_error("hotel_plan_type"); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
								<div class="widget-header" style="padding-left:10px;" >Contact Informations	</div>
									<br/>
									<div class="control-group">											
										<label class="control-label" for="tele_no">Telephone Number</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'tele_no','class'=> 'span3','id'=>'tele_no',$this->input->post('tele_no'),'value'=>set_value('tele_no', $this->input->post('tele_no') ? $this->input->post('tele_no') : $telephone_number),'class'=> 'span3','id'=>'tele_no')); ?>
										<span class="text-danger"><?php echo form_error("tele_no"); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->

									<div class="control-group">											
										<label class="control-label" for="mob_no">Mobile Number</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'mob_no','value'=>set_value('mob_no', $this->input->post('mob_no') ? $this->input->post('mob_no') : $mobile_number),'class'=> 'span3','id'=>'mob_no') ); ?>
										<span class="text-danger"><?php echo form_error("mob_no"); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="address">Address</label>
										<div class="controls">
										<?php echo form_textarea(array('name'=>'address','class'=> 'span5','id'=>'address','value'=>set_value('address', $this->input->post('address') ? $this->input->post('address') : $address),'rows'=>'4')); ?>
										<span class="text-danger"><?php echo form_error("address"); ?></span>	
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="miles_from">Land Mark</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'miles_from','value'=>set_value('miles_from', $this->input->post('miles_from') ? $this->input->post('miles_from') : $miles_from),'class'=> 'span1','id'=>'miles_from') ); ?> Miles From 
										
										<?php echo form_input(array('name'=>'miles_location','value'=>set_value('miles_location', $this->input->post('miles_location') ? $this->input->post('miles_location') : $miles_location),'class'=> 'span2','id'=>'miles_location') ); ?>( EX: 5.6 Miles From Berlin Schonefeld Airport)
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
											<div class="control-group">											
										<label class="control-label" for="mob_no">Latitude</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'latitude','value'=>set_value('latitude', $this->input->post('latitude') ? $this->input->post('latitude') : $latitude),'class'=> 'span3','id'=>'latitude') ); ?>
										<span class="text-danger"><?php echo form_error("mob_no"); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
											<div class="control-group">											
										<label class="control-label" for="mob_no">Longitude</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'longitude','value'=>set_value('longitude', $this->input->post('longitude') ? $this->input->post('longitude') : $longitude),'class'=> 'span3','id'=>'longitude') ); ?>
										<span class="text-danger"><?php echo form_error("longitude"); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="widget-header" style="padding-left:10px;" >Social Accounts </div>
									<br/>
									<div class="control-group">											
										<label class="control-label" for="skype_name">Skype</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'skype_name','class'=> 'span3','id'=>'skype_name','value'=>set_value('skype_name', $this->input->post('skype_name') ? $this->input->post('skype_name') : $skype_name))); ?>
										<span class="text-danger"><?php echo form_error("skype_name"); ?></span>

										</div> <!-- /controls -->
									</div> <!-- /control-group -->
									<div class="control-group">			
										<label class="control-label" for="facebook_name">Facebook</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'facebook_name','class'=> 'span3','id'=>'facebook_name','value'=>set_value('facebook_name', $this->input->post('facebook_name') ? $this->input->post('facebook_name') : $facebook_url))); ?>
										<span class="text-danger"><?php echo form_error("facebook_name"); ?></span>	

										</div> <!-- /controls -->								
									</div> <!-- /control-group -->
									<div class="control-group">			
										<label class="control-label" for="twitter_url">Twitter</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'twitter_url','class'=> 'span3','id'=>'twitter_url','value'=>set_value('twitter_url', $this->input->post('twitter_url') ? $this->input->post('twitter_url') : $twitter_url))); ?>
										<span class="text-danger"><?php echo form_error("twitter_url"); ?></span>	

										</div> <!-- /controls -->								
									</div> <!-- /control-group -->
									
									
									<div class="widget-header" style="padding-left:10px;" >Hotel Features</div>
									<br/>
									<div class="control-group genre">											
										<label class="control-label" for="amenities">Ameneties</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'amenities','class'=> 'span3','id'=>'amenities'),$this->input->post('amenities')); ?>
										</div> <!-- /controls -->	
										<?php 
										if($_edit_id==""){
										?>
										<div class="auctions-outer">
											<div class="">
												<ul id="carousel">
												<?php
												if(count($re_amenities)) {
													foreach($re_amenities as $amentiesVals) { ?>
													<li><span class="auctionadd"><?php echo $amentiesVals->name; ?><a title="close" rel="<?php echo $amentiesVals->id; ?>" class="amenties_close" id="close_<?php echo $amentiesVals->id; ?>" href="#">close</a></span></li>
												<?php } } ?>
												</ul>
											</div>				
										</div>
										<div id="amenties_div">
											<?php 
											if(count($re_amenities)) {
												foreach($re_amenities as $amentieshidden) { ?>
											<input id="amenities_<?php echo $amentieshidden->id; ?>" class="txtoption" type="hidden" value="<?php echo $amentieshidden->id; ?>" name="amenities_id[]">
											<?php } } ?>
										</div>
										<?php } else { //print_r($hotel_users['amenities']);die;?>
										<div class="auctions-outer">
											<div class="">
												<ul id="carousel">	
												<?php
												if(count($re_amenities)) {
													foreach($re_amenities as $amentiesVals) { ?>
													<li><span class="auctionadd"><?php echo $amentiesVals->name; ?><a title="close" rel="<?php echo $amentiesVals->id; ?>" class="amenties_close" id="close_<?php echo $amentiesVals->id; ?>" href="#">close</a></span></li>
												<?php } } 
												else if(count($hotel_users['amenities'])) {
													foreach($hotel_users['amenities'] as $amentiesVals) { ?>
													<li><span class="auctionadd"><?php echo $amentiesVals->name; ?><a title="close" rel="<?php echo $amentiesVals->amen_id; ?>" class="amenties_close" id="close_<?php echo $amentiesVals->amen_id; ?>" href="#">close</a></span></li>
												<?php } } ?>
												</ul>
											</div>				
										</div>
										<div id="amenties_div">
										<?php 
											if(count($re_amenities)) {
												foreach($re_amenities as $amentieshidden) { ?>
											<input id="amenities_<?php echo $amentieshidden->id; ?>" class="txtoption" type="hidden" value="<?php echo $amentieshidden->id; ?>" name="amenities_id[]">
											<?php } } 
											else if(count($hotel_users['amenities'])) {
												foreach($hotel_users['amenities'] as $amentieshidden) { ?>
											<input id="amenities_<?php echo $amentieshidden->amen_id; ?>" class="txtoption" type="hidden" value="<?php echo $amentieshidden->amen_id; ?>" name="amenities_id[]">
										<?php } } ?>
										</div>
										<?php } ?>
										
									</div> <!-- /control-group -->					
	  <div class="control-group genre">
	       <label class="control-label" for="f_amenities">Feature Ameneties</label>
			<div class="controls">
				<?php echo form_input(array('name'=>'f_amenities','class'=> 'span3','id'=>'f_amenities'),$this->input->post('f_amenities')); ?>
			<span class="text-danger"><?php echo form_error('f_amenities_id[]'); ?></span>
		</div> <!-- /controls -->	
		<?php			
										if($_edit_id=="")
										{
										?>
										<div class="auctions-outer">
											<div class="">
												<ul id="carousel" class="f-carousel">
												<?php
												if(count($f_amenities)) {
													foreach($f_amenities as $amentiesVals) { ?>
													<li  id="f_amen_<?php echo $amentiesVals->id; ?>"><span class="auctionadd"><?php echo $amentiesVals->name; ?><a title="close" rel="<?php echo $amentiesVals->id; ?>" class="f_amenties_close" id="close_<?php echo $amentiesVals->id; ?>" href="#">close</a></span></li>
												<?php } } ?>
												</ul>
											</div>				
										</div>
										<div id="f_amenties_div">
											<?php 
											if(count($f_amenities)) {
												foreach($f_amenities as $amentieshidden) { ?>
											<input id="f_amenities_<?php echo $amentieshidden->id; ?>" class="txtoption" type="hidden" value="<?php echo $amentieshidden->id; ?>" name="f_amenities_id[]">
											<?php } } ?>
										</div>
										<?php
										} 
										else 
										{?>
										<div class="auctions-outer">
											<div class="">
												<ul id="carousel" class="f-carousel">	
												<?php
												if(count($f_amenities)) {
													foreach($f_amenities as $amentiesVals) { ?>
													<li id="f_amen_<?php echo $amentiesVals->id;?>"><span class="auctionadd"><?php echo $amentiesVals->name; ?><a title="close" rel="<?php echo $amentiesVals->id; ?>" class="f_amenties_close" id="close_<?php echo $amentiesVals->id; ?>" href="#">close</a></span></li>
												<?php } } 
												else if(count($hotel_users['amenities'])) {
													foreach($hotel_users['amenities'] as $amentiesVals) { 
													if($amentiesVals->is_featured==1)
													{
													?>
													<li id="f_amen_<?php echo $amentiesVals->amen_id;?>"><span class="auctionadd"><?php echo $amentiesVals->name; ?><a title="close" rel="<?php echo $amentiesVals->amen_id; ?>" class="f_amenties_close" id="close_<?php echo $amentiesVals->amen_id; ?>" href="#">close</a></span></li>
													
												<?php } } } ?>
												</ul>
											</div>				
										</div>
										<div id="f_amenties_div">
										<?php 
											if(count($f_amenities)) 
											{
												foreach($f_amenities as $amentieshidden) { ?>
											<input id="f_amenities_<?php echo $amentieshidden->id; ?>" class="txtoption" type="hidden" value="<?php echo $amentieshidden->id; ?>" name="f_amenities_id[]">
											<?php } 
											} 
											else if(count($hotel_users['amenities'])) 
											{
												foreach($hotel_users['amenities'] as $amentieshidden) 
												{ 
												if($amentieshidden->is_featured==1)
												{
												?>
											<input id="f_amenities_<?php echo $amentieshidden->amen_id; ?>" class="txtoption" type="hidden" value="<?php echo $amentieshidden->amen_id; ?>" name="f_amenities_id[]">
										<?php 
										}} } ?>
										</div>
										<?php } ?>
	</div>
									<div class="control-group genre">											
										<label class="control-label" for="suitables">Suitable for</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'suitables','class'=> 'span3','id'=>'suitables'),$this->input->post('suitables')); ?>
										</div> <!-- /controls -->	
										<?php 
										if($_edit_id==""){ 
										?>
										<div class="suitables-outer">
											<div class="">
												<ul id="carousel2">
												<?php 
												if(count($re_suitables)) {
													foreach($re_suitables as $suitablesVals) { ?>
													<li><span class="auctionadd"><?php echo $suitablesVals->name; ?><a title="close" rel="<?php echo $suitablesVals->id; ?>" class="suitables_close" id="close_<?php echo $suitablesVals->id; ?>" href="#">close</a></span></li>
												<?php } } ?>
												</ul>
											</div>				
										</div>
										<div id="suitables_div">
										<?php 
										if(count($re_suitables)) {
											foreach($re_suitables as $suitableshidden) { ?>
										<input id="suitables_<?php echo $suitableshidden->id; ?>" class="txtoption" type="hidden" value="<?php echo $suitableshidden->id; ?>" name="suitables_id[]">
										<?php } } ?>
										</div>
										<?php } else  {?>
										<div class="suitables-outer">
											<div class="">
												<ul id="carousel2">
												<?php 
												if(count($re_suitables)) {
													foreach($re_suitables as $suitablesVals) { ?>
													<li><span class="auctionadd"><?php echo $suitablesVals->name; ?><a title="close" rel="<?php echo $suitablesVals->id; ?>" class="suitables_close" id="close_<?php echo $suitablesVals->id; ?>" href="#">close</a></span></li>
												<?php } } 
												else if(count($hotel_users['suitables'])) {
													foreach($hotel_users['suitables'] as $suitablesVals) { ?>
													<li><span class="auctionadd"><?php echo $suitablesVals->name; ?><a title="close" rel="<?php echo $suitablesVals->suit_id; ?>" class="suitables_close" id="close_<?php echo $suitablesVals->suit_id; ?>" href="#">close</a></span></li>
												<?php } 
												} ?>
												</ul>
											</div>				
										</div>
										<div id="suitables_div">
										<?php 
										if(count($re_suitables)) {
											foreach($re_suitables as $suitableshidden) { ?>
										<input id="suitables_<?php echo $suitableshidden->id; ?>" class="txtoption" type="hidden" value="<?php echo $suitableshidden->id; ?>" name="suitables_id[]">
										<?php } }
										else if(count($hotel_users['suitables'])) {
											foreach($hotel_users['suitables'] as $suitableshidden) { ?>
										<input id="suitables_<?php echo $suitableshidden->suit_id; ?>" class="txtoption" type="hidden" value="<?php echo $suitableshidden->suit_id; ?>" name="suitables_id[]">
										<?php } } ?>
										</div>
										<?php } ?>
										
									</div> <!-- /control-group -->	
									
									<div class="control-group">											
										<label class="control-label" for="description">Description</label>
										<div class="controls">
										<?php echo form_textarea(array('name'=>'description','class'=> 'span5','id'=>'description','value'=>set_value('description', $this->input->post('description') ? $this->input->post('description') : $description))); ?>
										<span class="text-danger"><?php echo form_error("description"); ?></span>	
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
										<div class="control-group">			
									<label class="control-label" for="hotel_url">Hotel Website Url</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'hotel_url','class'=> 'span3','id'=>'hotel_url','value'=>set_value('hotel_url', $this->input->post('hotel_url') ? $this->input->post('hotel_url') : $hotel_url))); echo "<br>";?>
										( Ex: http://www.hotel.com )
										<span class="text-danger"><?php echo form_error("hotel_url"); ?></span>	

										</div> <!-- /controls -->								
									</div> <!-- /control-group -->
									
									<div class="widget-header" style="padding-left:10px;" >Profile Image</div>
									<br/>
									
									<div class="control-group">											
										<label class="control-label" for="image">Image</label>
										<div class="controls">
										<?php echo form_upload(array('name'=>'image','class'=> 'span3','id'=>'image'),$this->input->post('image')); ?>
										</br> <span>( jpg, jpeg, png, gif only ) Size : 1024X300</span>
										<span class="text-danger"><?php echo form_error('image'); ?></span>
									
									
									<?php 
									  if($image_name!="" && file_exists('./'.$image_dir.$image_name) ) {
									  ?>
									  <div><br/>
									   <?php
									   $img_src = thumb(FCPATH.$image_dir.$image_name,'100','100','thumb_profile');
									   $img_prp = array('src'=>base_url().$image_dir.'thumb_profile/'.$img_src,'alt'=>$image_name,'title'=>$profile['name']);
									   echo img($img_prp);
									   ?>
									  </div>
									<?php } ?>
									
																	  
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="widget-header" style="padding-left:10px;">SEO Informations</div>
										<br/>
								
									<div class="control-group">											
										<label class="control-label" for="meta_keywords">Meta keywords</label>
										<div class="controls">
										<?php echo form_textarea(array('name'=>'meta_keywords','class'=> 'span4','style'=>'height:100px;','id'=>'meta_keywords','value'=>set_value('meta_keywords', $this->input->post('meta_keywords') ? $this->input->post('meta_keywords') : $meta_keywords))); ?>
										<span class="text-danger"><?php echo form_error("meta_keywords"); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="meta_description">Meta Description</label>
										<div class="controls">
										<?php echo form_textarea(array('name'=>'meta_description','class'=> 'span4','style'=>'height:100px;','id'=>'meta_description','value'=>set_value('meta_description', $this->input->post('meta_description') ? $this->input->post('meta_description') : $meta_description))); ?>
										<span class="text-danger"><?php echo form_error("meta_description"); ?></span>
										
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									
								
									
									
									<div class="widget-header" style="padding-left:10px;" >Hotel Location</div>
									<br/>	
								<div class="control-group">											
									<label class="control-label" for="select_country">Choose Country<span class="must">*</span></label>
									<div class="controls" id="select_country_div">
									<?php echo form_dropdown("select_country",array(""=>"Select Country")+$countries,$this->input->post('select_country') ? $this->input->post('select_country') : $country_id,'id="select_country"'); ?>								
										 <span class="text-danger"><?php echo form_error('select_country'); ?></span>	
									</div> <!-- /controls -->		
								</div> <!-- /control-group -->
								
								<div class="control-group">											
									<label class="control-label" for="select_state">Choose State<span class="must">*</span></label>
									<div class="controls" id="select_country_div">
									<?php echo form_dropdown("select_state",array($state_id=>$state_value),$state_id,'id="select_state"',$this->input->post('select_state') ? $this->input->post('select_state') : $state_id); ?>
									 <span class="text-danger"><?php echo form_error('select_state'); ?></span>	
									</div> <!-- /controls -->		
								</div> <!-- /control-group -->
								
								<div class="control-group">											
									<label class="control-label" for="select_city">Choose City<span class="must">*</span></label>
									<div class="controls" id="select_country_div">
									<?php echo form_dropdown("select_city",array($city_id=>$city_value),$city_id,'id="select_city"'); ?>
									 <span class="text-danger"><?php echo form_error('select_city'); ?></span>	
									</div> <!-- /controls -->		
								</div> <!-- /control-group -->
								
								<div class="control-group">											
										<label class="control-label" for="select_area">Choose Area<span class="must"></span></label>
										<div class="controls" id="select_country_div">
										<?php echo form_dropdown("select_area",array($area_id=>$area_value),$area_id,'id="select_area"'); ?>
												 <span class="text-danger"><?php echo form_error('select_area'); ?></span>	
										</div> <!-- /controls -->		
									</div> <!-- /control-group -->
									
								
									<div class="control-group">											
										<label class="control-label" for="is_active"></label>
										<div class="controls">
										<label class="checkbox inline">
											<?php echo form_checkbox('is_active', '1', set_value('is_active', $this->input->post('is_active') ? $this->input->post('is_active') : $is_active)); ?> Active
                                        </label>
                                        </div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
										<div class="form-actions">
									<?php echo form_submit(array('class'=>'btn btn-primary','value'=>'Save','title'=>'Save')).'&nbsp;';
									echo anchor(base_url().ADMIN.'/hotels/'.$this->input->get('pagemode').'/'.$this->input->get('modestatus').'/'.$this->input->get('sortingfied').'/'.$this->input->get('sortype'),'Cancel',array('class'=>'btn','title'=>'Cancel')); ?>
									</div> <!-- /form-actions -->
									<input type="hidden" value="hotel_page" id="amenty_request_type">
								</fieldset>
							<?php echo form_close(); ?>
							</div>
						</div>
					</div> <!-- /widget-content -->
				</div> <!-- /widget -->
		    </div> <!-- /span8 -->
	      </div> <!-- /row -->	
	    </div> <!-- /container -->
	</div> <!-- /main-inner -->
</div> <!-- /main -->
