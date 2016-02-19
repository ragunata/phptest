<?php
$latitude=$offers_detail['city_lat'];
if(!empty($offers_detail['latitude'])):
$latitude=$offers_detail['latitude'];
endif;
$longitude=$offers_detail['city_long'];
if(!empty($offers_detail['longitude'])):
$longitude=$offers_detail['longitude'];
endif;
?>
	<h6><?php echo ucwords($this->lang->line('hotel location'));?></h6>
							<div class="host-location">
								<div class="col-md-8">
									<ul class="location-address">
										<li><i class="icon-directions"></i> Marienplatz 17a</li>
										<li><i class="icon-location"></i> 80322 Munich</li>
										<?php if($offers_detail['country_name']):?>
										<li><i class="icon-earth"></i> <?php echo ucwords($this->lang->line(strtolower($offers_detail['country_name'])));?></li>
                                        <?php endif;?> 										
									</ul>
								</div>
								<?php 
								if($offers_detail['miles_location'] && $offers_detail['miles_from']):?>	
								<div class="col-md-4">
									<p class="text-right"><span class="location-distance box-rounded-full"><i class="icon-compass"></i> <strong><?php echo $offers_detail['miles_from'].$this->lang->line('km');?></strong></span><?php echo " ".ucfirst($this->lang->line('from'))." ".ucwords($this->lang->line(strtolower($offers_detail['miles_location'])));?></p>
								</div>
								<?php  endif; ?>
								<div class="clearfix"></div>
								<div class="location-map bg-light-2 box-rounded-full">
									<div class="map-display box-border-full">
									    <?php
										if(!empty($offers_detail['hotel_logo_name']) && !empty($offers_detail['hotel_logo_img_dir']) && file_exists('./'.$offers_detail['hotel_logo_img_dir'].$offers_detail['hotel_logo_name'])):
										$hotel_logo_img_src = thumb(FCPATH.$offers_detail['hotel_logo_img_dir'].$offers_detail['hotel_logo_name'],'60','60','map_logo');
										$hotel_logo_url = array('src'=>base_url().$offers_detail['hotel_logo_img_dir'].'map_logo/'.$hotel_logo_img_src,'alt'=>$offers_detail['hotel_logo_name']);
										$map_logo=$hotel_logo_url['src'];
										else:
										$map_logo=base_url().'assets/img/discount-img/avatar-1.png';
										endif;
										?>
										<div id="map_canvas" data-title="<?php echo ucwords($this->lang->line(strtolower($offers_detail['hotel_name'])));?>" data-image="<?php echo $map_logo;?>" data-lat="<?php echo $latitude;?>" data-lng="<?php echo $longitude;?>"></div>	
									</div>
								</div>
							</div>