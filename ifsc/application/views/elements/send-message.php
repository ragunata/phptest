<?php 
$error_message=ucfirst($this->lang->line('please enter the message'));?>
<div id="message-offer-layer" class="bg-transparent-1">
			<div class="container">						
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<div class="message-layer-box">
							<div id="language" class="layer-inner bg-light-1 box-rounded-full">	
								<a class="message-layer-close box-rounded-bottom" href="#"><i class="icon-cross"></i></a>
								<form action="#" class="js-send-mess-form" id="js-send-message" method="post">					
									<div class="col-md-12">
										<div class="layer-padding">
											<div class="box-divider text-center">
												<h6 class="divider-text bg-light-1"><?php echo ucwords($this->lang->line('message'));?></h6>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<label><?php echo ucwords($this->lang->line('to'));?></label>
										<div class="input-row bg-light-2 box-rounded-full">
										<span>@ <?php echo ucwords($this->lang->line($offers_detail['display_name']));?></span>
										</div>
									</div>
									<div class="col-md-6">
									<label><?php echo ucwords($this->lang->line('message'));?></label>
										<div class="input-row bg-light-2 box-rounded-full">
											<textarea rows="3" class="send-message-offer"></textarea>
										<span class="error-abuse abuse-msg-error message-error"></span>
										<span class="js-error-mess" style="display:none;"><?php echo $error_message;?></span>
										</div>
			
										<div class="clearfix"></div>
									</div>
									<div class="col-md-6">
									<label></label>
									   <input type="checkbox" name="is_high_important"><?php echo " ".ucwords($this->lang->line('high important'));?>
										<div class="clearfix"></div>
									</div>
									  <input type="hidden" name="hotel_id" value="<?php echo $offers_detail['hotel_id'];?>">
									<div class="col-md-4 col-md-offset-4">
										<div class="input-row bg-light-2 box-rounded-full">
											<input class="input-submit submit-green box-rounded-full" type="submit" value="<?php echo ucwords($this->lang->line('send'));?>">
										</div>
										<div class="input-row bg-light-2 box-rounded-full">
											<input type="button" value="<?php echo ucwords($this->lang->line('cancel'));?>" class="js-message-send-close input-submit  submit-green box-rounded-full">
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