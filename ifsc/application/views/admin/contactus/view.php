<div class="main">
	<div class="main-inner">
	    <div class="container">
	      <div class="row">
	      	<div class="span12">
	      		<div class="widget ">
	      			<div class="widget-header">
	      				<i class="icon-user"></i>
	      				<h3>Contact Us - View</h3>
						<span class="create_new"><?php echo $this->breadcrumbs->show(); ?></span>
	  				</div> 
					<div class="widget-content">
						<div class="tabbable">
							<div class="tab-pane form-horizontal" id="formcontrols">
								<fieldset>
									<br/>
									<div class="widget-header listpadd" >Basic Informations	<span class="create_new"><?php 
									if(isset($_GET['pagemode'])) {
										echo anchor(base_url().ADMIN.'/contact_us/'.$this->input->get('pagemode').'/'.$this->input->get('modestatus').'/'.$this->input->get('sortingfied').'/'.$this->input->get('sortype'),'<i class="icon-step-backward "></i> &nbsp;&nbsp; Go Back'); 
										} else {
												echo anchor(base_url().ADMIN.'/dashboard','<i class="icon-step-backward "></i> &nbsp;&nbsp; Go Back');
										} ?></span></div>
									<br/>
									<div class="control-group views1">											
										<label class="control-label" for="username">Name :</label>
										<div class="controls views">
										<?php echo ucwords($contactus['name']); ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group views1">											
										<label class="control-label" for="username">Email :</label>
										<div class="controls views">
										<?php echo $contactus['email']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group views1">											
										<label class="control-label" for="username">Posted Date :</label>
										<div class="controls views">
											<?php  echo date('d-M-Y',strtotime($contactus['created'])); ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
	                       
						   	<div class="control-group views1">											
										<label class="control-label" for="username">Title :</label>
										<div class="controls views">
												<?php echo $contactus['title']; ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
	                       
						   
						   	<div class="control-group views1">											
										<label class="control-label" for="username">Posted Date :</label>
										<div class="controls views">
											<?php echo nl2br($contactus['message']); ?>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
	                       
						   
									<div class="widget-header listpadd" >Contact Informations	</div>
									
									<div class="control-group views1">											
										<label class="control-label" for="username">Mobile Number :</label>
										<div class="controls views">
										<?php echo $contactus['contact_number'];?>
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