<?php
$data = $data[0];
$result = @unserialize($data['setting_fields']);
?>
<div class="main">
	<div class="main-inner">
	    <div class="container">
	      <div class="row">
	      	<div class="span12">
	      		<div class="widget ">
	      			<div class="widget-header">
	      				<i class="icon-wrench"></i>
	      				<h3>General Settings</h3>
						<span class="create_new"><?php echo $this->breadcrumbs->show(); ?></span>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
						<div class="tabbable">
							<div class="tab-pane" id="formcontrols">
							<?php
							$attributes = array('class' => 'form-horizontal', 'id' => 'edit-profile');
							echo form_open(ADMIN.'/settings/'.$this->uri->segment(4).'', $attributes);
							?>
							<?php 
							if($this->session->flashdata('flash_message')){
								if($this->session->flashdata('flash_message') == 'updated')
								{
								  echo '<div class="alert alert-success">';
									echo '<button data-dismiss="alert" class="close" type="button">×</button>';
									echo '<strong>Well done!</strong> Settings updated with success.';
								  echo '</div>';       
								}else{
								  echo '<div class="alert alert-error">';
									echo '<a class="close" data-dismiss="alert">×</a>';
									echo '<strong>Oh snap!</strong> change a few things up and try submitting again.';
								  echo '</div>';          
								}
							  }
							?>
								<fieldset>
									<div class="widget-header" style="padding-left:10px;" >Basic Informations	</div>
									<br/>
									<div class="control-group">											
										<label class="control-label" for="username">Website Name</label>
										<div class="controls">
										<?php echo form_input(array('name'=>'site_name','value'=>set_value('site_name', $this->input->post('site_name') ? $this->input->post('site_name') : $data['sitename']),'class'=> 'span3','id'=>'site_name') ); ?>
										<span class="text-danger"><?php echo form_error('site_name'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="firstname">Support Email ID</label>
										<div class="controls">
											<?php echo form_input(array('name'=>'fields[email_address]','value'=>set_value('fields[email_address]', $this->input->post('fields[email_address]') ? $this->input->post('fields[email_address]') : $result['email_address']),'class'=> 'span3','id'=>'email_address') );?>
											<span class="text-danger"><?php echo form_error('fields[email_address]'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="lastname">Contact No</label>
										<div class="controls">
											<?php echo form_input(array('name'=>'fields[contact]','value'=>set_value('fields[contact]', $this->input->post('fields[contact]') ? $this->input->post('fields[contact]') : $result['contact']),'class'=> 'span2','id'=>'contact','maxlength'=>12) ); ?>
											<span class="text-danger"><?php echo form_error('fields[contact]'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="email">Back end Paging</label>
										<div class="controls">
											<?php echo form_input(array('name'=>'fields[back_pagination]','value'=>set_value('fields[back_pagination]', $this->input->post('fields[back_pagination]') ? $this->input->post('fields[contact]') : $result['back_pagination']),'class'=> 'span1','id'=>'back_pagination','maxlength'=>2) ); ?>
											<span class="text-danger"><?php echo form_error('fields[back_pagination]'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="control-group">											
										<label class="control-label" for="password1">Front end Paging</label>
										<div class="controls">
											<?php echo form_input(array('name'=>'fields[front_pagination]','value'=>set_value('fields[front_pagination]', $this->input->post('fields[front_pagination]') ? $this->input->post('fields[contact]') : $result['front_pagination']),'class'=> 'span1','id'=>'front_pagination','maxlength'=>2) ); ?>
											<span class="text-danger"><?php echo form_error('fields[front_pagination]'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
																		
									<br />
									<div class="widget-header" style="padding-left:10px;" >Payment Information	</div>
									<br />
									<div class="control-group">											
										<label class="control-label" for="lastname">Paypal Email</label>
										<div class="controls">
											<?php  echo form_input(array('name'=>'fields[paypal_email]','value'=>set_value('fields[paypal_email]', $this->input->post('fields[paypal_email]') ? $this->input->post('fields[paypal_email]') : $result['paypal_email']),'class'=> 'span3','id'=>'paypal_email') ); ?>
											<span class="text-danger"><?php echo form_error('fields[paypal_email]'); ?></span>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="widget-header" style="padding-left:10px;" >SEO Settings	</div>
									<br />
									<div class="control-group">											
										<label class="control-label" for="lastname">Meta keywords</label>
										<div class="controls">
											<textarea class="span3" name="fields[Keywords]"><?php echo $result['Keywords']?></textarea>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label" for="lastname">Meta Description</label>
										<div class="controls">
											<textarea class="span3" name="fields[description]"><?php echo $result['description']?></textarea>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
										
									<div class="form-actions">
										<button type="submit" class="btn btn-primary">Save</button> 
										<?php echo anchor(base_url().ADMIN.'/dashboard','Cancel',array('class'=>'btn')); ?>
									</div> <!-- /form-actions -->
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
