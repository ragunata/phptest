<div class="main">
	<div class="main-inner">
	    <div class="container">
	      <div class="row">
	      	<div class="span12">
	      		<div class="widget ">
	      			<div class="widget-header">
	      				<i class="icon-user-md"></i>
	      				<h3>Hotel - View</h3>
						<span class="create_new"><?php echo $this->breadcrumbs->show(); ?></span>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
						<div class="tabbable">
							<div class="tab-pane form-horizontal" id="formcontrols">
								<fieldset>
									<br/>
									<div class="widget-header listpadd" >Basic Informations	<span class="create_new">
									<?php if(isset($_GET['pagemode'])) {
												echo anchor(base_url().ADMIN.'/hotels/'.$this->input->get('pagemode').'/'.$this->input->get('modestatus').'/'.$this->input->get('sortingfied').'/'.$this->input->get('sortype'),'<i class="icon-step-backward "></i> &nbsp;&nbsp; Go Back');
											} else {
												echo anchor(base_url().ADMIN.'/dashboard','<i class="icon-step-backward "></i> &nbsp;&nbsp; Go Back');
											} ?></span></div>
									<br/>
									<div class="control-group views1">											
										<label class="control-label" for="username">Hotel name :</label>
										<div class="controls views">
										<?php echo $hotels['profile']['name']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Email :</label>
										<div class="controls views">
										<?php echo $hotels['profile']['email']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Display Name :</label>
										<div class="controls views">
										<?php echo '@'.$hotels['profile']['display_name']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Hotel class :</label>
										<div class="controls views">
										<?php if(!empty($hotels['profile']['class'])) { echo $hotels['profile']['class']; } else { echo $this->config->item('not_available'); } ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Hotel Status :</label>
										<div class="controls views">
										<?php  if($hotels['profile']['is_active']==1) { echo '<i class="btn-icon-only btn-success">Active</i>'; } else { echo '<i class="btn-icon-only btn-danger">Inactive</i>'; } ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="username">Registered Date :</label>
										<div class="controls views">
										<?php  echo date('d-M-Y',strtotime($hotels['profile']['created'])); ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="widget-header listpadd" >Contact Informations :</div>
									<br/>
									<div class="control-group views1">											
										<label class="control-label" for="username">Telephone Number :</label>
										<div class="controls views">
										<?php if(!empty($hotels['profile']['telephone_number'])) { echo $hotels['profile']['telephone_number']; } else { echo $this->config->item("not_available");} ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="username">Mobile Number :</label>
										<div class="controls views">
										<?php if(!empty($hotels['profile']['mobile_number'])) { echo $hotels['profile']['mobile_number']; } else { echo $this->config->item("not_available");} ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="username">Address :</label>
										<div class="controls views">
										<?php if(!empty($hotels['profile']['address'])) { echo nl2br($hotels['profile']['address']); } else { echo $this->config->item("not_available");} ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="widget-header listpadd" >Social Accounts :</div>
									<br/>
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Facebook :</label>
										<div class="controls views">
										<?php if(!empty($hotels['profile']['facebook_url'])) { echo $hotels['profile']['facebook_url']; } else { echo $this->config->item("not_available");} ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="username">Skype :</label>
										<div class="controls views">
										<?php if(!empty($hotels['profile']['skype_name'])) { echo $hotels['profile']['skype_name']; } else {echo $this->config->item("not_available"); } ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="username">Twitter :</label>
										<div class="controls views">
										<?php if(!empty($hotels['profile']['twitter_url'])) { echo $hotels['profile']['twitter_url']; } else {echo $this->config->item("not_available"); } ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									
									<div class="widget-header listpadd" >Hotel Features</div>
									<br/>
									<div class="control-group views1">											
										<label class="control-label" for="username">Amenities :</label>
										<div class="controls views">
										<?php 
										if(count($hotels['amenities'])) { 
											$arramenties =array();
											foreach($hotels['amenities'] as $amenties_list) {
												$arramenties[] = $amenties_list->name;
											}
											$expamenties = implode(", ",$arramenties);
											echo $expamenties;
										} else {
											echo $this->config->item("not_available");
										}
										?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group views1">											
										<label class="control-label" for="username">Suitable for :</label>
										<div class="controls views">
										<?php 
										if(count($hotels['suitables'])) { 
											$arrsuitables =array();
											foreach($hotels['suitables'] as $suitables_list) {
												$arrsuitables[] = $suitables_list->name;
											}
											$expsuitables = implode(", ",$arrsuitables);
											echo $expsuitables;
										} else {
											echo $this->config->item("not_available");
										}
										?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group views1">											
										<label class="control-label" for="username">Description :</label>
										<div class="controls views">
										<?php if(!empty($hotels['profile']['description'])) { echo nl2br($hotels['profile']['description']); } else { echo $this->config->item("not_available");} ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label" for="username">Web Site Url:</label>
										<div class="controls views">
										<?php if(!empty($hotels['profile']['hotel_url'])) 
										{ 
										echo "<a href=".$hotels['profile']['hotel_url']." target='_blank'>".$hotels['profile']['hotel_url']."</a>"; 
										}
										else 
										{ 
										echo $this->config->item("not_available");
										} ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="widget-header listpadd" >Plan Details</div>
									<br/>
									<div class="control-group views1">											
										<label class="control-label" for="username">Hotel plan :</label>
										<div class="controls views">
										<?php echo $hotels['profile']['plan']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<?php
									if($hotels['profile']['plan_start_date']!="0000-00-00") {
									?>
									<div class="control-group views1">											
										<label class="control-label" for="username">Plan Activate Date :</label>
										<div class="controls views">
										<?php if($hotels['profile']['plan_start_date']!="0000-00-00") { echo date('d-M-Y',strtotime($hotels['profile']['plan_start_date'])); } else { echo $this->config->item("not_available");} ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Plan Expiry Date :</label>
										<div class="controls views">
										<?php echo date('d-M-Y',strtotime($hotels['profile']['plan_expiry_date'])); ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Auction Limit :</label>
										<div class="controls views">
										<?php echo $hotels['profile']['auction_limit']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<?php } ?>
									<div class="control-group">											
										<label class="control-label" for="username">Plan Status :</label>
										<div class="controls views">
										<?php if($hotels['profile']['plan_start_date']!="0000-00-00") { echo '<i class="btn-icon-only btn-success">Active</i>'; } else { echo '<i class="btn-icon-only btn-danger">Not Activated/Expired</i>'; } ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="widget-header listpadd" >Profile Image :</div>
									<br/>
									<div class="control-group">
									
									
									<?php 
									  if(file_exists('./'.$hotels['profile']['image_dir'].$hotels['profile']['profile_image']) && $hotels['profile']['profile_image']!="") {
									  ?>
									  <div><br/>
									   <?php
									   $img_src = thumb(FCPATH.$hotels['profile']['image_dir'].$hotels['profile']['profile_image'],'100','100','thumb_profile');
									   $img_prp = array('src'=>base_url().$hotels['profile']['image_dir'].'thumb_profile/'.$img_src,'alt'=>$hotels['profile']['profile_image'],'title'=>$hotels['profile']['name']);
									   echo img($img_prp);
									   ?>
									  </div>
									<?php } else {
									echo '<span style="color:red;">'.$this->config->item("not_available").'</span>';
									}  ?>
									
									</div> <!-- /control-group -->
									
									<div class="widget-header listpadd" >SEO Informations :</div>
									<br/>
									<div class="control-group views1">											
										<label class="control-label" for="username">Meta Description :</label>
										<div class="controls views">
										<?php if(!empty($hotels['profile']['meta_description'])) { echo nl2br($hotels['profile']['meta_description']); } else { echo $this->config->item("not_available");} ?>
										
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label" for="username">Meta Keywords :</label>
										<div class="controls views">
										<?php if(!empty($hotels['profile']['meta_keywords'])) { echo nl2br($hotels['profile']['meta_keywords']); } else { echo $this->config->item("not_available");} ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									
										<div class="widget-header listpadd" >Hotel Locations:</div>
									<br/>
									<div class="control-group views1">											
										<label class="control-label" for="username">Preferred Country:</label>
										<div class="controls views">
										
										<?php if(!empty($hotels['profile']['preferred_country'])) { echo $hotels['profile']['preferred_country']; } else { echo $this->config->item("not_available");} ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Preferred State:</label>
										<div class="controls views">
										<?php if(!empty($hotels['profile']['preferred_state'])) { echo $hotels['profile']['preferred_state']; } else { echo $this->config->item("not_available");} ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Preferred City:</label>
										<div class="controls views">
										<?php if(!empty($hotels['profile']['preferred_city'])) { echo $hotels['profile']['preferred_city']; } else { echo $this->config->item("not_available");} ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Preferred Area:</label>
										<div class="controls views">
										<?php if(!empty($hotels['profile']['preferred_area'])) { echo $hotels['profile']['preferred_area']; } else { echo $this->config->item("not_available");} ?>
										</div> <!-- /controls -->				
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
