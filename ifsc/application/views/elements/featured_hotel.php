<div>
    <div class="items-list mobile-slider">
	   <?php 
	   foreach($featured_hotels as $hotels):
	   if(!empty($hotels['hotel_banner_image_dir']) && !empty($hotels['hotel_banner_name']) && file_exists('./'.$hotels['hotel_banner_image_dir'].$hotels['hotel_banner_name']))
	  {
	  $s_hotel_banner_img_src = thumb(FCPATH.$hotels['hotel_banner_image_dir'].$hotels['hotel_banner_name'],'370','420','home_hotel_banner');
      $img_url = array('src'=>base_url().$hotels['hotel_banner_image_dir'].'home_hotel_banner/'.$s_hotel_banner_img_src,'alt'=>$hotels['hotel_banner_name'],'title'=>$hotels['hotel_banner_name']);
	  $img_url=$img_url['src'];
	  }
	  else
	  {
	    $img_url =base_url().'assets/img/no-img-feature-hotel.jpg';
	  }
	   ?>
	   <div class="col-md-4">
		    <a href="<?php echo base_url().'home/hotel_details/'.url_title(strtolower($hotels['hotel_name'])).'/'.$hotels['id']; ?>">
			    <div class="item item-medium">
				  <div class="item-content box-rounded-full box-shadow-full">
				    <div class="item-image" style="background-image: url('<?php echo $img_url;?>')"></div>
					<div class="item-bottom bg-fade-1">
						<div class="item-caption text-center">
							<h4><strong><?php echo ucwords($this->lang->line('hotel'));?></strong> <?php echo " ".ucwords($this->lang->line($hotels['hotel_name']));?></h4>
								<span>
									<?php 
									    $rating_count=round($hotels['rating']);
										for($i=1;$i<=$rating_count;$i++):?>
										<i class="star-rated icon-star"></i>
										<?php endfor;
										for($i=1;$i<=5-$rating_count;$i++):?>
										<i class="star-unrated icon-star"></i>
							            <?php endfor;?>
											
						
								</span>
						</div>
						<div class="item-details">
							<div class="col-md-6">
								<i class="icon-location"></i> <?php echo ucwords($this->lang->line($hotels['city_name']));?><?php echo ",".ucwords($this->lang->line($hotels['c_name']));?>
							</div>
						    <div class="col-md-6 text-right">
					            <strong><?php echo number_format($hotels['offers_count']);?></strong> 
						        <?php echo ucfirst($this->lang->line('offers'));?>  
						    </div>
							<div class="clearfix"></div>
						</div>
					</div>
					<div class="item-hover bg-transparent-3">
						<div class="item-logo box-circle-full box-shadow-full">
						   <?php
									if(!empty($hotels['img_dir']) && !empty($hotels['profile_image']) && file_exists('./'.$hotels['img_dir'].$hotels['profile_image']))
			                         {
			                            $logo_src = thumb(FCPATH.$hotels['img_dir'].$hotels['profile_image'],'163','162','hotel_logo');
		                                $logo_img_url = array('src'=>base_url().$hotels['img_dir'].'hotel_logo/'.$logo_src,'alt'=>$hotels['profile_image'],'class'=>'box-circle-full');
			                          }
			                          else
			                          {
		                              $logo_img_url = array('class'=>'box-circle-full','src'=>base_url().'assets/img/home/avatar-1.png');
			                       }
								   echo img($logo_img_url);
								   ?>
						</div>
					</div>
									
				</div>
			</div>
		</a>
	</div>
	<?php endforeach;?>
	</div>
</div>