<?php if( ! defined('BASEPATH')) exit('Direct Access not Allowed'); ?> 
<div class="main">
	<div class="main-inner">
	    <div class="container">
	      <div class="row">
	      	<div class="span12">
	      		<div class="widget ">
	      			<div class="widget-header">
	      				<i class="icon-picture"></i>
	      				<h3>Banners - Add</h3>
						<span class="create_new"><?php echo $this->breadcrumbs->show(); ?></span>
	  				</div> <!-- /widget-header -->
					
  					<div class="widget-content">
					<div class="tabbable">
						<div class="tab-pane" id="formcontrols">
						<?php
							$attributes = array('class' => 'form-horizontal', 'id' => 'add_banners');
							//echo validation_errors();
							echo form_open_multipart(ADMIN.'/banners/add?pagemode='.$this->input->get('pagemode').'&modestatus='.$this->input->get('modestatus').'&sortingfied='.$this->input->get('sortingfied').'&sortype='.$this->input->get('sortype'), $attributes);
						?>  
							<fieldset>         <div class="controls"><span class="must">“All fields are mandatory”</span> </div></br>
							  	<div class="control-group">
									<label for="name" class="control-label">Banner Name <span class="must">*</span></label>
									<div class="controls">
									  <?php echo form_input(array('name'=>'name','class'=> 'span3','id'=>'name'),$this->input->post('name')); ?>
									  <span class="text-danger"><?php echo form_error('name'); ?></span>
									</div>
								</div>
								<div class="control-group">
									<label for="images" class="control-label">Banner Image <span class="must">*</span><br /></label>
									<div class="controls">
									  <?php echo form_upload(array('name'=>'image','id'=>'images')); ?></br>
									  <span>( jpg, jpeg, png, gif only ) Size : 1024X300</span>
									  <span class="text-danger"><?php echo form_error('image'); ?></span>
									  <!--<span class="help-inline">Woohoo!</span>-->
									</div>
				  				</div>
								<div class="control-group">
									<label for="priority" class="control-label">Priority <span class="must">*</span></label>
									<div class="controls">
									  <?php echo form_input(array('name'=>'priority','class'=> 'span1','id'=>'priority','maxlength'=>'2'),$this->input->post('priority')); ?> 
									  <span><abbr title="This is helps you which banner image come first in the site">What's this ?</abbr></span>
									  <span class="text-danger"><?php echo form_error('priority'); ?></span>
									</div>
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
									<?php echo form_submit(array('class'=>'btn btn-primary','value'=>'Save','title'=>'Save')).'&nbsp;';
									echo anchor(base_url().ADMIN.'/banners/'.$this->input->get('pagemode').'/'.$this->input->get('modestatus').'/'.$this->input->get('sortingfied').'/'.$this->input->get('sortype'),'Cancel',array('class'=>'btn','title'=>'Cancel')); ?>
							  </div>
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
