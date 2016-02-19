<?php 
$_edit_id	= "";
$offer_name	= "";
$offer_type_id="";
$msrp_price ="";
$offer_price="";
$reduction_price="";
$price_limit="";
$bidding_start_amount="";
$time_interval="";
$booking_start_date="";
$booking_end_date="";
$offer_start_date="";
$offer_end_date="";
$cancel_date="";
$no_of_persons="";
$description = "";
$room_type_id = "";
$room_type_view_id = "";
$is_active="";
$price_comparisions="";
$hotel_id='';
if(isset($offers['offer'])) {
$offer 	= $offers['offer'];
$hotel_id=$offer['hotel_id'];
$_edit_id = $offer['id'];
$offer_name = $offer['offer_name'];
$offer_type_id = $offer['offer_type'];
$msrp_price = $offer['msrp_price'];
$offer_price=$offer['offer_price'];
$reduction_price=$offer['reduction_price'];
$price_limit=$offer['price_limit'];
$bidding_start_amount=$offer['bidding_start_amount'];
$time_interval=$offer['time_interval'];
$booking_start_date = $offer['booking_start_date'];
$booking_end_date = $offer['booking_end_date'];
$offer_start_date = $offer['offer_start_date'];
$offer_end_date = $offer['offer_end_date'];
$cancel_date = $offer['cancel_last_date'];
$no_of_persons=$offer['no_of_persons'];
$description = $offer['description'];
$room_type_id = $offer['room_types'];
$room_type_view_id = $offer['room_view_types'];
$is_active	= $offer['is_active'];
$price_comparisions=$offer['price_comparisions'];
} 
else 
{
$offers['amenities']="";
$offers['suitables']="";
}
 ?>
<div class="main">
	<div class="main-inner">
	    <div class="container">
	      <div class="row">
	      	<div class="span12">
	      		<div class="widget ">
	      			<div class="widget-header">
	      				<i class="icon-film"></i>
	      				<h3>Auctions - Edit</h3>
						<span class="create_new"><?php echo $this->breadcrumbs->show(); ?></span>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
						<div class="tabbable">
							<div class="tab-pane" id="formcontrols">
							<?php
							$attributes = array('class' => 'form-horizontal', 'id' => 'add_offers');
							if($_edit_id!='')
							{
							echo form_open_multipart(ADMIN.'/auctions/edit/'.$_edit_id.'?pagemode='.$this->input->get('pagemode').'&modestatus='.$this->input->get('modestatus').'&sortingfied='.$this->input->get('sortingfied').'&sortype='.$this->input->get('sortype'), $attributes);
							}
							else
							{
							echo form_open(ADMIN.'/auctions/add/'.$this->uri->segment(4).'', $attributes);
							}
							?>
								<fieldset>
									<div class="widget-header" style="padding-left:10px;" >Basic Informations	</div>
									<br/>
									<div class="control-group">											
										<label class="control-label" for="username">Offer Name</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'offer_name','value'=>set_value('offer_name', $this->input->post('offer_name') ? $this->input->post('offer_name') : $offer_name),'class'=> 'span3','id'=>'offer_name') ); ?>
										<span class="text-danger"><?php echo form_error('offer_name'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="username">Offer Type</label>
										<div class="controls">
										<?php
										echo form_dropdown('offer_type',array(''=>'Select Type')+$this->config->item('auctions_type'),$this->input->post('offer_type') ? $this->input->post('offer_type') : $offer_type_id,'disabled="disabled"','id="offer_type"'); ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="username">MSRP</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'msrp_price','value'=>set_value('msrp_price', $this->input->post('msrp_price') ? $this->input->post('msrp_price') : $msrp_price),'class'=> 'span3','id'=>'msrp_price'),$this->input->post('msrp_price')); ?>
										<span class="text-danger"><?php echo form_error('msrp_price'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<?php if($offer_type_id==1):?>
									<div class="control-group">											
										<label class="control-label" for="username">Offer Price</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'offer_price','class'=> 'span3','id'=>'offer_price','value'=>set_value('offer_price', $this->input->post('offer_price') ? $this->input->post('offer_price') : $offer_price)),$this->input->post('offer_price')); ?>
										<span class="text-danger"><?php echo form_error('offer_price'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<?php endif;?>
									<?php if($offer_type_id==2):?>
									<div class="control-group">											
										<label class="control-label" for="username">Start Price</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'bidding_start_amount','class'=> 'span3','id'=>'bidding_start_amount','value'=>set_value('bidding_start_amount', $this->input->post('bidding_start_amount') ? $this->input->post('bidding_start_amount') : $bidding_start_amount)),$this->input->post('bidding_start_amount')); ?>
											<span class="text-danger"><?php echo form_error('bidding_start_amount'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
										<div class="control-group">											
										<label class="control-label" for="username">Final Price</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'price_limit','class'=> 'span3','id'=>'price_limit','value'=>set_value('price_limit', $this->input->post('price_limit') ? $this->input->post('price_limit') : $price_limit)),$this->input->post('price_limit')); ?>
											<span class="text-danger"><?php echo form_error('price_limit'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="username">Reduction Price</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'reduction_price','class'=> 'span3','id'=>'reduction_price','value'=>set_value('reduction_price', $this->input->post('reduction_price') ? $this->input->post('reduction_price') : $reduction_price)),$this->input->post('reduction_price')); ?>
											<span class="text-danger"><?php echo form_error('reduction_price'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label" for="username">For Every</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'time_interval','class'=> 'span3','readonly'=>'readonly','id'=>'time_interval','value'=>set_value('time_interval', $this->input->post('time_interval') ? $this->input->post('time_interval') : $time_interval)),$this->input->post('time_interval')); ?>
											<span class="text-danger"><?php echo form_error('time_interval'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<?php endif;?>
									<?php if($offer_type_id==3):?>
										<div class="control-group">											
										<label class="control-label" for="username">Bidding Start Amount</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'bidding_start_amount','class'=> 'span3','id'=>'bidding_start_amount','value'=>set_value('bidding_start_amount', $this->input->post('bidding_start_amount') ? $this->input->post('bidding_start_amount') : $bidding_start_amount)),$this->input->post('bidding_start_amount')); ?>
									<span class="text-danger"><?php echo form_error('bidding_start_amount'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
											
											
									<?php endif;?>
									<div class="widget-header" style="padding-left:10px;" >Period Informations</div>
									<br/>
									<div class="control-group">											
										<label class="control-label" for="username">Check In</label>
										<div class="controls">
										<?php echo form_input(array('readonly'=>'readonly','placeholder'=>'yy-mm-dd','name'=>'offer_start_date','class'=> 'span3','id'=>'checkin','value'=>set_value('offer_start_date', $this->input->post('offer_start_date') ? $this->input->post('offer_start_date') : $offer_start_date)),$this->input->post('offer_start_date')); ?>
										<span class="text-danger"><?php echo form_error('offer_start_date'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="username">Check Out</label>
										<div class="controls">
										<?php echo form_input(array('readonly'=>'readonly','placeholder'=>'yy-mm-dd','name'=>'offer_end_date','class'=> 'span3','id'=>'checkout','value'=>set_value('offer_end_date', $this->input->post('offer_end_date') ? $this->input->post('offer_end_date') : $offer_end_date)),$this->input->post('offer_end_date')); ?>
										<span class="text-danger"><?php echo form_error('offer_end_date'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label" for="username">Booking Start Date</label>
										<div class="controls">
										<?php echo form_input(array('readonly'=>'readonly','placeholder'=>'yy-mm-dd','name'=>'booking_start_date','class'=> 'span3','id'=>'booking_start_date','value'=>set_value('booking_start_date', $this->input->post('booking_start_date') ? $this->input->post('booking_start_date') : $booking_start_date)),$this->input->post('booking_start_date')); ?>
										<span class="text-danger"><?php echo form_error('booking_start_date'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="username">Booking End Date</label>
										<div class="controls">
										<?php echo form_input(array('readonly'=>'readonly','placeholder'=>'yy-mm-dd','name'=>'booking_end_date','class'=> 'span3','id'=>'booking_end_date','value'=>set_value('booking_end_date', $this->input->post('booking_end_date') ? $this->input->post('booking_end_date') : $booking_end_date)),$this->input->post('booking_end_date')); ?>
											<span class="text-danger"><?php echo form_error('booking_end_date'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="username">Cancel Last Date</label>
										<div class="controls">
										<?php echo form_input(array('readonly'=>'readonly','name'=>'cancel_last_date','class'=> 'span3','id'=>'cancel_last_date','value'=>set_value('cancel_last_date', $this->input->post('cancel_last_date') ? $this->input->post('cancel_last_date') : $cancel_date)),$this->input->post('cancel_last_date')); ?>
									<span class="text-danger"><?php echo form_error('cancel_last_date'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="widget-header" style="padding-left:10px;" >Offer Specilities</div>
									<br/>
									<div class="control-group genre">											
										<label class="control-label" for="amenities">Ameneties</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'amenities','class'=> 'span3','id'=>'amenities'),$this->input->post('amenities')); ?>
										<span class="text-danger"><?php echo form_error('amenities_id[]'); ?></span>
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
										<?php } else 
										{
										//print_r($hotel_users['amenities']);die;?>
										<div class="auctions-outer">
											<div class="">
												<ul id="carousel">	
												<?php
												if(count($re_amenities)) {
													foreach($re_amenities as $amentiesVals) { ?>
													<li><span class="auctionadd"><?php echo $amentiesVals->name; ?><a title="close" rel="<?php echo $amentiesVals->id; ?>" class="amenties_close" id="close_<?php echo $amentiesVals->id; ?>" href="#">close</a></span></li>
												<?php } } 
												else if(count($auctions['amenities'])) {
													foreach($auctions['amenities'] as $amentiesVals) { ?>
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
											else if(count($auctions['amenities'])) {
												foreach($auctions['amenities'] as $amentieshidden) { ?>
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
												else if(count($auctions['amenities'])) {
													foreach($auctions['amenities'] as $amentiesVals) { 
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
											else if(count($auctions['amenities'])) 
											{
												foreach($auctions['amenities'] as $amentieshidden) 
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
										<span class="text-danger"><?php echo form_error('suitables_id[]'); ?></span>
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
												else if(count($auctions['suitables'])) {
													foreach($auctions['suitables'] as $suitablesVals) { ?>
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
										else if(count($auctions['suitables'])) {
											foreach($auctions['suitables'] as $suitableshidden) { ?>
										<input id="suitables_<?php echo $suitableshidden->suit_id; ?>" class="txtoption" type="hidden" value="<?php echo $suitableshidden->suit_id; ?>" name="suitables_id[]">
										<?php } } ?>
										</div>
										<?php } ?>
										
									</div> <!-- /control-group -->	
									<div class="control-group">			
	
										<label class="control-label" for="username">Number of Persons</label>
										<div class="controls">
										<?php 
										$persons=array();
										foreach(range('1',$this->config->item('no_of_persons')) as $ranges):
										$persons[$ranges]=$ranges;
										endforeach;
										echo form_dropdown('no_of_persons',array(''=>'Select No Of Persons')+$persons,$this->input->post('no_of_persons') ? $this->input->post('no_of_persons') : $no_of_persons,'id="no_of_persons"'); ?>
										<span class="text-danger"><?php echo form_error('no_of_persons'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">
										<label class="control-label" for="select_country">Room Types<span class="must">*</span></label>
										<div class="controls" id="select_country_div">
										<?php echo form_multiselect("room_types[]",array(""=>"Select Room Types")+$room_types,$this->input->post('room_types') ? $this->input->post('room_types') : explode(',',$room_type_id),'id="room_types"'); ?>								
										<span class="text-danger"><?php echo form_error('room_types[]'); ?></span>	
										</div> <!-- /controls -->		
									</div> <!-- /control-group -->
									
									<div class="control-group">
										<label class="control-label" for="select_country">Room View Types<span class="must">*</span></label>
										<div class="controls" id="select_country_div">
										<?php echo form_multiselect("room_view_types[]",array(""=>"Select Room View Types")+$room_view_types,$this->input->post('room_view_types') ? $this->input->post('room_view_types') : explode(',',$room_type_view_id),'id="room_view_types"'); ?>								
										<span class="text-danger"><?php echo form_error('room_view_types[]'); ?></span>	
										</div> <!-- /controls -->		
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="username">Description</label>
										<div class="controls">
										<?php echo form_textarea(array('name'=>'description','class'=> 'span5','id'=>'description','value'=>set_value('description', $this->input->post('description') ? $this->input->post('description') : $description)),$this->input->post('description')); ?>
										<span class="text-danger"><?php echo form_error('description'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
								<div class="widget-header" style="padding-left:10px;" >Compare Price</div>
									<br/>
						<div class="control-group">
						<?php 
						if(isset($_POST['fields'])) {
				         $prices_vals = $_POST['fields'];
						} else {
						  $prices_vals = @unserialize($price_comparisions);
						}
			             $i=4; $k=1;
			            foreach($this->config->item('price_comparision') as $comp_key=>$compval): 
			            if($i%4==0):
						$j=1; 
						 echo "<div class='compareright-row'>"; 
						else:
						$j++;
						endif;?>
				
				<label class="control-label control-label-custom" for="<?php echo "comps_".$comp_key; ?>"><?php echo $compval; ?></label>
				<div class="controls">
					<input type="text" class='span1 num_accept compare_price' id="<?php echo "comps_".$comp_key; ?>" maxlength="5" name="fields[<?php echo 'site_'.$comp_key; ?>]" value="<?php echo $prices_vals['site_'.$comp_key]; ?>" />
				</div>
			<?php 
			if($j%4==0 || (count($this->config->item('price_comparision'))%4 != 0 && count($this->config->item('price_comparision'))==$k)) 
				{  
				echo "</div>"; 
				
				} 
				$i++; $k++;
            endforeach;
			?>
			</div>
									
									<div class="control-group">											
										<label class="control-label" for="username"></label>
										<div class="controls">
										<label class="checkbox inline">
											<?php echo form_checkbox('is_active', '1', TRUE); ?> Active
                                        </label>
                                        </div> <!-- /controls -->				
									</div> <!-- /control-group -->
										
									<div class="form-actions">
										<button type="submit" class="btn btn-primary">Save</button> 
										<?php echo anchor(base_url().ADMIN.'/auctions','Cancel',array('class'=>'btn')); ?>
									</div> <!-- /form-actions -->
								</fieldset>
									<input type="hidden" value="<?php echo $hotel_id;?>" id="js_hotel_id">
									<input type="hidden" value="offer_page" id="amenty_request_type">
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
<script src="assets/js/admin/jquery.datetimepicker.js"></script>
<script>
$("#checkin").datetimepicker({
      minDate: 'D',
      dateFormat: "dd/mm/yy",
      defaultDate: "+1w",
      numberOfMonths: 1,
	  changeMonth: true,
	  changeYear: true,
	  minDate: 0,
      onClose: function(selectedDate) {
        $("#checkout").datetimepicker("option", "minDate", selectedDate);
        $("#checkout").focus();
      }
    });
 $("#checkout").datetimepicker({
      minDate: '+1D',
      dateFormat: "dd/mm/yy",
      defaultDate: "+1w",
      numberOfMonths: 1,
	  minDate: 0,
	  changeMonth: true,
	  changeYear: true,
    });
$("#booking_start_date").datetimepicker({
      minDate: 'D',
      dateFormat: "dd/mm/yy",
      defaultDate: "+1w",
      numberOfMonths: 1,
	  changeMonth: true,
	  changeYear: true,
	  minDate: 0,
      onClose: function(selectedDate) {
        $("#booking_end_date").datetimepicker("option", "minDate", selectedDate);
      }
    });
$("#booking_end_date").datetimepicker({
      minDate: '+1D',
      dateFormat: "dd/mm/yy",
      defaultDate: "+1w",
      numberOfMonths: 1,
	  minDate: 0,
	  changeMonth: true,
	  changeYear: true,
    });
$("#cancel_last_date").datetimepicker({
      minDate: 0,
    });
$("#time_interval").datetimepicker({
      timepickerScrollbar:false,
				timepicker:true,
				datepicker:false,
				closeOnDateSelect:0,
				format:'H'
});
</script>