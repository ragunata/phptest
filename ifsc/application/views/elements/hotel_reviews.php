<?php
if($this->session->userdata('user_type')==3)
{
$report_based_class="report-open";
$report_url="javascript:void(0)";
}
else if($this->session->userdata('user_type')==2)
{
$report_based_class="";
$report_url="javascript:void(0)";
}
else
{
$report_based_class='';
$report_url=base_url().'login'.'?ref=report-offer&redirect_url='.base_url(uri_string());
}
?>
<h6><?php echo ucwords($this->lang->line('hotel reviews'));?></h6>
<div id="reviews">
							   <div class="host-reviews">
								  <div class="reviews-sites text-center">
									<ul class="tabber-tabs">
										<li class="col-md-4">
											<div class="sites-display">
												<a href="#tab_1">
													<div class="display-arrow tabber-arrow">
														<i class="icon-arrow-down5"></i>
													</div>
													<div class="display-logo logo-hobitel"></div>
												</a>
												<div class="display-parameter bg-light-2 box-rounded-full box-shadow-inset">
												<div class="parameter-bar parameter-orange" style="width:<?php echo $offers_detail['rating'] * 20;?>%;"></div>
												</div>
												<strong><?php echo $offers_detail['rating'];?></strong> / 5.0
											</div>
										</li>
										<li class="col-md-4">
											<div class="sites-display">
												<a href="#tab_2">
													<div class="display-arrow tabber-arrow">
														<i class="icon-arrow-down5"></i>
													</div>
													<div class="display-logo logo-tripadvisor"></div>
												</a>
												<div class="display-parameter bg-light-2 box-rounded-full box-shadow-inset">
													<div class="parameter-bar parameter-green" style="width:95%"></div>
												</div>
												<strong>5.7</strong> / 6.0
											</div>
										</li>
										<li class="col-md-4">
											<div class="sites-display">
												<a href="#tab_3">
													<div class="display-arrow tabber-arrow">
														<i class="icon-arrow-down5"></i>
													</div>
													<div class="display-logo logo-holidaycheck"></div>
												</a>
												<div class="display-parameter bg-light-2 box-rounded-full box-shadow-inset">
													<div class="parameter-bar parameter-red" style="width:8.3%;"></div>
												</div>
												<strong>0.5</strong> / 6.0
											</div>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div id="tab_1" class="tabber-box">
									<ul class="reviews-comments">
									   <?php 
									   if(!empty($hotel_reviews)):
									   $count=0;
									   foreach($hotel_reviews as $reviews):
									   $alt_class="reviews-left";
									   $count=$count+1;
									   if($count%2==0):
									   $alt_class="reviews-right";
									   endif;
									   ?>
										<li>
										<div class="reviews-user <?php echo $alt_class;?> text-center">							
											<div class="reviews-avatar box-circle-full box-border-full">
											<?php 
											if(!empty($r['image_dir']) && !empty($reviews['profile_image']) && file_exists('./'.$reviews['image_dir'].$reviews['profile_image'])):
						                    $img_src = thumb(FCPATH.$reviews['image_dir'].$reviews['profile_image'],'78','78','review_profile_image');
	                                       $review_img = array('src'=>base_url().$reviews['image_dir'].'review_profile_image/'.$img_src,'class'=>"box-circle-full");
					                        else:
						                    $review_img=array('src'=>base_url().'assets/img/home/avatar-2.png', 'class'=>"box-circle-full");
						                   endif;
						                   echo img($review_img);?>
												</div>
												<div class="reviews-rating">
													<ul class="user-rating">
													   <?php
													   $rating=round($reviews['rating']);
													    for($i=1;$i<=$rating;$i++):
													    ?>
														<li class="icon-rating-small small-rating-on"></li>
														<?php 
														endfor;
														for($i=1;$i<=5-$rating;$i++):?>
														<li class="icon-rating-small small-rating-off"></li>
														<?php endfor;?>			
													</ul>
													<div class="clearfix"></div>
													<small><a data-ui-review-type="<?php echo $reviews['id'];?>"  data-ui-request-type="3" data-ui-offer-type="0" data-ui-hotel-type="<?php echo $reviews['hotel_id'];?>" href="<?php echo $report_url;?>" class="<?php echo $report_based_class;?>"><i class="icon-flag"></i> <?php echo ucwords($this->lang->line('report review'));?></a></small>
												</div>
											</div>
											<div class="reviews-commentbox reviews-right bg-light-2 box-rounded-full">
												<div class="reviews-commenttext bg-light-1 box-shadow-full">
													<h5 class="bg-light-1">&quot;<?php echo ucwords($this->lang->line(strtolower($reviews['title'])));?>&quot; <div class="reviews-name">
													<?php
											   echo ucwords($this->lang->line('posted by'))." ".ucwords($this->lang->line($reviews['first_name']))." ".$this->lang->line('on') ." ".date('d.m.Y',strtotime($reviews['created']));	
													?>
													</div></h5>
												<?php 
												if(!empty($reviews['comments'])):?>
													<p><i class="commentbox-pro icon-plus2"></i><?php echo $this->lang->line($reviews['comments']).'...';?></p>
												<?php 
												endif;
												if(!empty($reviews['negative_comments'])):
												?>
													<p><i class="commentbox-contra icon-minus2"></i><?php echo $this->lang->line($reviews['negative_comments']).'...';?></p>
													<!--<p class="text-right"><a href="#">show more</a></p>-->
												<?php endif;?>
												</div>
											</div>
											<div class="clearfix"></div>
										</li>
										<?php
										endforeach;
										else:?>
									    <p class="text-center"><?php echo ucwords($this->lang->line('no review found!'));?></p>
										<?php endif;?>
									</ul>
								</div>
								<div id="tab_2" class="tabber-box">
									<ul class="reviews-comments">
										<li>
											<div class="reviews-user reviews-left text-center">									
												<div class="reviews-avatar box-circle-full box-border-full">
													<img class="box-circle-full" src="<?php echo base_url().'assets/img/discount-img/avatar-2.png';?>">
												</div>
												<div class="reviews-rating">
													<ul class="user-rating">
														<li class="icon-rating-small small-rating-on"></li>
														<li class="icon-rating-small small-rating-on"></li>
														<li class="icon-rating-small small-rating-on"></li>
														<li class="icon-rating-small small-rating-on"></li>
														<li class="icon-rating-small small-rating-off"></li>
														<li class="icon-rating-small small-rating-off"></li>													
													</ul>
													<div class="clearfix"></div>
													<small><a href="#">Report Review</a></small>
												</div>
											</div>
											<div class="reviews-commentbox reviews-right bg-light-2 box-rounded-full">
												<div class="reviews-commenttext bg-light-1 box-shadow-full">
													<h5 class="bg-light-1">&quot;Very convernient&quot; <div class="reviews-name">Posted by LianaXharra on 05.01.2015</div></h5>											
													<p>This hotel is conveniently located. From the airport the S-Bahn 8 costs 12 Euro & takes about 30 minutes, and it arrives the lower level. I had a regular room (paid through Airmiles), it was clean, well maintained and its large windows facing the back of the building overlooking a landscaped yard. Very quiet room, no noise from the neighbouring units, or the hallway...</p>
													<p class="text-right"><a href="#">show more</a></p>
												</div>
											</div>
											<div class="clearfix"></div>
										</li>
									</ul>
								</div>
								<div id="tab_3" class="tabber-box">
									<p class="text-center"><?php echo ucwords($this->lang->line('no review found')).'!';?></p>
								</div>
							</div>
						</div>