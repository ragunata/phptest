<div id="report-offer-layer" class="bg-transparent-1">
			<div class="container">						
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<div class="report-layer-box">
							<div id="language" class="layer-inner bg-light-1 box-rounded-full">	
								<a class="report-layer-close box-rounded-bottom" href="#"><i class="icon-cross"></i></a>
								<form action="#" class="report-abuse-form" id="js-report-abuse" method="post">					
									<div class="col-md-12">
										<div class="layer-padding">
											<div class="box-divider text-center">
												<h6 class="divider-text bg-light-1"><?php echo ucwords($this->lang->line('report offer'));?></h6>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<label><?php echo ucwords($this->lang->line('abuse type'));?></label>
										<div class="input-row bg-light-2 box-rounded-full">
										<?php echo form_dropdown("select_abuse",array(""=>"Select Type")+$abuse_type,$this->input->post('select_abuse') ? $this->input->post('select_abuse') : '','class="input-select"','id="js-select-abuse"'); ?>
										<span data-type-message="<?php echo ucwords($this->lang->line('please select abuse type'));?>" class="error-abuse abuse-type-error"></span>
										</div>
									</div>
									<div class="col-md-6">
									<label><?php echo ucwords($this->lang->line('message'));?></label>
										<div class="input-row bg-light-2 box-rounded-full">
											<textarea rows="3" class="abuse-message"></textarea>
										<span data-abuse-message="<?php echo ucwords($this->lang->line('please enter message'));?>" class="error-abuse abuse-msg-error"></span>
										</div>
			
										<div class="clearfix"></div>
									</div>
									<div class="col-md-4 col-md-offset-4">
										<div class="input-row bg-light-2 box-rounded-full">
											<input class="input-submit submit-green box-rounded-full" type="submit" value="OK">
										</div>
										<div class="input-row bg-light-2 box-rounded-full">
											<input type="button" value="<?php echo ucwords($this->lang->line('cancel'));?>" class="js-report-close input-submit submit-green box-rounded-full">
										</div>
									</div>									
								</form>	
								<div class="clearfix"></div>
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>