<div class="main">
	<div class="main-inner">
	    <div class="container">
	      <div class="row">
	      	<div class="span12">
	      		<div class="widget ">
	      			<div class="widget-header">
	      				<i class="icon-film"></i>
	      				<h3>Bidders - View</h3>
						<span class="create_new"><?php echo $this->breadcrumbs->show(); ?></span>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
						<div class="tabbable">
							<div class="tab-pane form-horizontal" id="formcontrols">
								<fieldset>
									<br/>
									<div class="widget-header listpadd" >Basic Informations	<span class="create_new">
									<?php 
									if(isset($_GET['pagemode'])) {
											echo anchor(base_url().ADMIN.'/bids/'.$this->input->get('pagemode').'/'.$this->input->get('modestatus').'/'.$this->input->get('sortingfied').'/'.$this->input->get('sortype'),'<i class="icon-step-backward "></i> &nbsp;&nbsp; Go Back');
										} else {
											echo anchor(base_url().ADMIN.'/dashboard','<i class="icon-step-backward "></i> &nbsp;&nbsp; Go Back');
										}
									?></span></div>
									<br/>
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Hotel Name :</label>
										<div class="controls views">
										<?php
										echo $get_basic_info['hotel_name']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group views1">											
										<label class="control-label" for="username">Offer Name :</label>
										<div class="controls views">
										<?php
										echo $get_basic_info['offer_name']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group views1">											
										<label class="control-label" for="username">MSRP :</label>
										<div class="controls views">
										<?php echo $get_basic_info['msrp_price']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
										<div class="control-group views1">											
										<label class="control-label" for="username">Bidding Start Amount :</label>
										<div class="controls views">
										<?php
										echo $get_basic_info['bidding_start_amount']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
										<div class="control-group views1">											
										<label class="control-label" for="username">Current Bid Amount :</label>
										<div class="controls views">
										<?php
										echo $get_basic_info['current_rate']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
						
									<div class="widget-header listpadd" >Bid Details	</div>
									<br/>
									<div class="widget-content">
              <table class="table table-striped table-bordered">
                <thead>
                  <tr>
				    <th>Bid Date</th>
					<th>Bidder Name</th>
                    <th> Bidding Amount </th>
                    <th class="td-actions"> Status </th>
                  </tr>
                </thead>
                <tbody>
				<?php
					if(count($bidders)) {
						foreach($bidders as $vals){
				?>
					<tr>
						<td><?php echo date('d-m-Y h:i:s a',strtotime($vals['created']));?></td>
						<td style="width:150px;"><?php echo $vals['display_name']; ?></td>
						<td style="width:150px;"><?php echo $vals['bid_value']; ?></td>
						<td class="td-actions">
					    <?php 
						echo array_search($vals['bid_status'],array_flip($this->config->item('bid_status')));					
						?>
						</td>
					</tr>
				<?php }	 } else {
				?>
					<tr>
						<td colspan="3" style="text-align:center;color:red;">No Bidders Found</td>
					</tr>
				<?php
					}
				?>
                </tbody>
              </table>
            </div>	
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