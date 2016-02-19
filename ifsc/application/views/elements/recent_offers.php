<?php  if(!empty($users_offers)): ?>
<h2 class="recently_created"><?php echo ucwords($this->lang->line('recently created offers'));?></h2>
	         <div class="items-inner">
					<div class="row">
						<div class="items-list">
						<?php 
						foreach($users_offers as $offers):
						          if(!empty($offers['offer_banner_image_dir']) && !empty($offers['offer_banner_image_name']) && file_exists('./'.$offers['offer_banner_image_dir'].$offers['offer_banner_image_name'])):
									$img_src = thumb(FCPATH.$offers['offer_banner_image_dir'].$offers['offer_banner_image_name'],'301','338','recent_offer_banner');
									$banner_img_url = array('src'=>base_url().$offers['offer_banner_image_dir'].'recent_offer_banner/'.$img_src,'alt'=>$offers['offer_banner_image_name']);
									$item_img= $banner_img_url['src'];
									else:
									$item_img=base_url().'assets/img/assets/img/discount-img/item-1.jpg';
									endif;
						           if($offers['offer_type']==3):
									$type_text=ucwords($this->lang->line('bid now'));
									$price=$offers['current_rate'];
									$Percent_Off = percentage_off($offers['current_rate'],$offers['msrp_price']);
									$offer_class="item-up-rate";
									$offer_class1="bg-up-rate";
									$offer_class2='bg-transparent-up-rate';
									if($price==0):
									$Percent_Off = percentage_off($offers['bidding_start_amount'],$offers['msrp_price']);
									$price=$offers['bidding_start_amount'];
									endif;
									elseif($offers['offer_type']==2):
									$offer_class="item-slump-rate";
									$offer_class1="bg-slump-rate";
									$offer_class2='bg-transparent-slump-rate';
									$slump_price= slump_rate_price($offers['id'],$offers['msrp_price']);
									$Percent_Off = percentage_off($slump_price,$offers['msrp_price']);
									$price=$slump_price;
									else:
									$offer_class="item-discount-rate";
									$offer_class1="bg-discount-rate";
									$offer_class2="bg-transparent-discount-rate";
									$Percent_Off = percentage_off($offers['offer_price'],$offers['msrp_price']);
									$price=$offers['offer_price'];
									endif;
									$lstartDate = date_create(ConvertGMTToLocalTimezone(date('Y-m-d H:i:s'),$this->session->userdata('local_time_zone_name')));
									$lendDate = date_create($offers['booking_end_date']);
									$ldifferences = date_diff($lstartDate, $lendDate);
									$remain_Days_offers = 'data-days='.sprintf("%02s", $ldifferences->d)." ".'data-hours='.sprintf("%02s",$ldifferences->h).' '.'data-minutes='.sprintf("%02s",$ldifferences->i).' '.'data-seconds='.sprintf("%02s",$ldifferences->s);
						?>
							<div class="col-md-4">
								<a target="_blank" href="<?php echo base_url().'site_hotelusers/offer_view/'.url_title(strtolower($offers['offer_name'])).'/'.$offers['id'];?>">
									<div id="item-1" class="item item-small bg-light-2 box-rounded-full">
										<div class="item-content box-border-full">
											<div class="item-image" style="background-image: url('<?php echo $item_img;?>')"></div>
											<div class="item-top">
												<div class="item-price bg-fade-1 box-rounded-right">												
													<div class="item-amount">
														<strong><?php echo currency_convert($price);?></strong>
													</div>
													<div class="item-rate <?php echo $offer_class;?>"></div>
												</div>	
												<div class="item-discount bg-light-2 <?php echo $offer_class1;?> box-circle-full text-center">
													<strong><?php echo $Percent_Off.'%';?></strong>
												</div>
											</div>
											<div class="item-bottom bg-fade-1">
												<div class="item-caption text-center">
													<h5><strong><?php 
												if(!empty($offers['room_type'])):
												$room_type=explode(',',$offers['room_type']);
												echo ucwords($this->lang->line(strtolower($room_type[0])));
												endif;
												if(!empty($offers['room_view'])):
												$room_view=explode(',',$offers['room_view']);
												echo ",".ucwords($this->lang->line(strtolower($room_view[0])));
												endif;
												?></strong></h5>
												</div>
												<div class="item-details">
													<div class="col-md-6">
														<div class="item-info">
															<h6><strong><?php echo ucwords($this->lang->line('booking date'));?></strong></h6>
															<ul>
																<li><?php echo date('d.m.Y',strtotime($offers['offer_start_date']));?></li>
																<li>-</li>
																<li><?php echo date('d.m.Y',strtotime($offers['offer_end_date']));?></li>
															</ul>
														</div>
													</div>
													<div class="col-md-6">
														<div class="item-counter">
															<small><?php echo ucwords($this->lang->line('time left'));?></small>
															<div class="countdown-small" <?php echo $remain_Days_offers;?>></div>
														</div>
													</div>
													<div class="clearfix"></div>
												</div>
											</div>
											<div class="item-hover <?php echo $offer_class2; ?>">
												<div class="item-icon">
													<i class="icon-tag"></i>
												</div>
											</div>
										</div>
									</div>
								</a>
							</div>
							
							<?php endforeach;?>
						</div>
					</div>
				</div>
				<?php endif; ?>