<div class="main">
	<div class="main-inner">
	    <div class="container">
	      <div class="row">
	      	<div class="span12">
	      		<div class="widget ">
	      			<div class="widget-header">
	      				<i class="icon-film"></i>
	      				<h3>Auctions - View</h3>
						<span class="create_new"><?php echo $this->breadcrumbs->show(); ?></span>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
						<div class="tabbable">
							<div class="tab-pane form-horizontal" id="formcontrols">
								<fieldset>
									<br/>
									<div class="widget-header listpadd" >Auctions Informations	<span class="create_new">
									<?php 
									if(isset($_GET['pagemode'])) {
											echo anchor(base_url().ADMIN.'/auctions/'.$this->input->get('pagemode').'/'.$this->input->get('modestatus').'/'.$this->input->get('sortingfied').'/'.$this->input->get('sortype'),'<i class="icon-step-backward "></i> &nbsp;&nbsp; Go Back');
										} else {
											echo anchor(base_url().ADMIN.'/dashboard','<i class="icon-step-backward "></i> &nbsp;&nbsp; Go Back');
										}
									//	pr($offers);
									?></span></div>
									<br/>
									<div class="control-group views1">											
										<label class="control-label" for="username">Offer Name :</label>
										<div class="controls views">
										<?php echo $offers['offer']['offer_name']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Offer Type :</label>
										<div class="controls views">
										<?php echo array_search($offers['offer']['offer_type'],array_flip($this->config->item('auctions_type'))); ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group views1">											
										<label class="control-label" for="username">MSRP :</label>
										<div class="controls views">
										<?php echo ' &#8364; '.$offers['offer']['msrp_price']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<?php
									if($offers['offer']['offer_type']==1) {
									?>
									<div class="control-group views1">											
										<label class="control-label" for="username">Offer Price :</label>
										<div class="controls views">
										<?php echo ' &#8364; '.$offers['offer']['offer_price']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<?php 
									} 
									else if($offers['offer']['offer_type']==2) {
									?>
									<div class="control-group views1">											
										<label class="control-label" for="username">Reduction Price(limit) :</label>
										<div class="controls views">
										<?php echo ' &#8364; '.$offers['offer']['reduction_price']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Current Price :</label>
										<div class="controls views">
										<?php echo ' &#8364; '.$offers['offer']['current_rate']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label" for="username">Time Interval :</label>
										<div class="controls views">
										<?php echo $offers['offer']['time_interval'].' hours'; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<?php 
									} else if($offers['offer']['offer_type']==3) {
									?>
									<div class="control-group views1">											
										<label class="control-label" for="username">Bidding Start Amount</label>
										<div class="controls views">
										<?php echo ' &#8364; '.$offers['offer']['bidding_start_amount']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="username">Current Bid Price :</label>
										<div class="controls views">
										<?php echo ' &#8364; '.$offers['offer']['current_rate']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<?php } ?>
									<div class="widget-header listpadd" >Period Details	</div>
									<br/>
									<div class="control-group views1">											
										<label class="control-label" for="username">Offer Start Date :</label>
										<div class="controls views">
										<?php echo date('d-m-Y h:i:s a',strtotime($offers['offer']['offer_start_date'])); ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Offer End Date :</label>
										<div class="controls views">
										<?php echo date('d-m-Y h:i:s a',strtotime($offers['offer']['offer_end_date'])); ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Booking Start Date :</label>
										<div class="controls views">
										<?php echo date('d-m-Y h:i:s a',strtotime($offers['offer']['booking_start_date'])); ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Booking End Date :</label>
										<div class="controls views">
										<?php echo date('d-m-Y h:i:s a',strtotime($offers['offer']['booking_end_date'])); ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="username">Cancel Last Date :</label>
										<div class="controls views">
										<?php echo date('d-m-Y h:i:s a',strtotime($offers['offer']['cancel_last_date'])); ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="username">Published Date :</label>
										<div class="controls views">
										<?php echo date('d-m-Y h:i:s a',strtotime($offers['offer']['modified'])); ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									
									<div class="widget-header listpadd" >Auction Specialites</div>
									<br/>
									<div class="control-group views1">											
										<label class="control-label" for="username">Amenities :</label>
										<div class="controls views">
										<?php 
										if(count($auction_amenities)) { 
											$arramenties =array();
											foreach($auction_amenities as $amenties_list) {
												$arramenties[] = $amenties_list['aminites_name'];
											}
											$expamenties = implode(", ",$arramenties);
											echo $expamenties;
										} else {
										echo "--";
										}
										?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label" for="username">Suitables for :</label>
										<div class="controls views">
										<?php 
										if(count($auction_suitables)) { 
											$arrsuitables =array();
											foreach($auction_suitables as $suitables_list) {
												$arrsuitables[] = $suitables_list['suitable_name'];
											}
											$expsuitables = implode(", ",$arrsuitables);
											echo $expsuitables;
										} else {
										echo "--";
										}
										?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="widget-header listpadd" >Hotel Informations	</div>
									<br/>
									<div class="control-group">											
										<label class="control-label" for="username">Hotel Name :</label>
										<div class="controls views">
										<?php echo $offers['offer']['hotel_name']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="widget-header listpadd" >Auction Images	</div>
									<br/>
									<div class="control-group">											
										<?php
										if(count($auction_images)) {
											foreach($auction_images as $images) {
												$imageval = array(
													  'src' => base_url().$images['image_dir'].$images['image_name'],
													  'alt' => $images['name'],
													  'width' => '150',
													  'height' => '150',
													  'title' => 'That was quite a night',
												);

												echo img($imageval).' &nbsp;&nbsp;';
											}
										} else {
											echo "<span style='color:red;'>No Auction images found.</span>";
										}
										?>			
									</div> <!-- /control-group -->
								</fieldset>
							</div>
						</div>
					</div> <!-- /widget-content -->
				</div> <!-- /widget -->
		    </div> <!-- /span8 -->
	      </div> <!-- /row -->	
	    </div> <!-- /container -->
	</div> <!-- /main-inner -->
</div> <!-- /main -->