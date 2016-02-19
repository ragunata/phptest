<?php
$followed_class="follow_error";
$follow_title1=ucfirst($this->lang->line('follow'));
$follow_title2=ucfirst($this->lang->line('unfollow'));
$follow_mess1=ucfirst($this->lang->line('are you sure you want to follow this hotel ?'));
$follow_mess2=ucfirst($this->lang->line('are you sure you want to unfollow this hotel ?'));
$like_title1=ucfirst($this->lang->line('hotel like'));
$like_title2=ucfirst($this->lang->line('hotel unlike'));
$like_mess1=ucfirst($this->lang->line('are you sure you want to like this hotel ?'));
$like_mess2=ucfirst($this->lang->line('are you sure you want to unlike this hotel ?'));
if($follow_check):
$followed_class="follow_success";
endif;
if($this->session->userdata('user_type')==3):
$user_based_class="js-webuser-hotel-follow";
$follow_url=base_url().'add_follows/'.$offers_detail['hotel_id'];
$user_like_class="js-webuser-like";
$like_url=base_url().'add_likes/'.$offers_detail['hotel_id'];
elseif($this->session->userdata('user_type')==2):
$user_based_class="js-hoteluser-hotel-follow";
$follow_url="javascript:void(0);";
$user_like_class="js-hoteluser-like";
$like_url="#";
else:
$follow_url=base_url().'login'.'?ref=follow-hotel&redirect_url='.base_url(uri_string()).'&&hotel_id='.$offers_detail['hotel_id'];
$user_based_class="";
$user_like_class="";
$like_url=base_url().'login'.'?ref=like-hotel&&redirect_url='.base_url(uri_string()).'&&hotel_id='.$offers_detail['hotel_id'];
endif;	 
if($like_check==1)
{
$liked_class="hotel-unlike";
}
else if($like_check==2)
{
$liked_class="hotel-like";
}
else
{
$liked_class="hotel-like";
}
?>
<div class="host-logo">								
								<?php
								if(!empty($offers_detail['hotel_logo_name']) && !empty($offers_detail['hotel_logo_img_dir']) && file_exists('./'.$offers_detail['hotel_logo_img_dir'].$offers_detail['hotel_logo_name'])):
								$hotel_logo_img_src = thumb(FCPATH.$offers_detail['hotel_logo_img_dir'].$offers_detail['hotel_logo_name'],'50','50','hotel_logo');
								$hotel_logo_url = array('class'=>'box-circle-full','src'=>base_url().$offers_detail['hotel_logo_img_dir'].'hotel_logo/'.$hotel_logo_img_src,'alt'=>$offers_detail['hotel_logo_name']);
								else:
								$hotel_logo_url=array('class'=>'box-circle-full','src'=>base_url().'assets/img/discount-img/avatar-1.png');
								endif;
								echo img($hotel_logo_url); 
								?>
								</div>
								<div class="host-address">
									<h5 class="bg-light-1 text-center"><strong><?php echo ucwords($this->lang->line('hotel'));?></strong> <?php echo ucwords($this->lang->line(strtolower($offers_detail['hotel_name'])));?></h5>
									<p class="text-center">
									<?php 
									 if(!empty($offers_detail['rating'])):
									    for($i=1;$i<=round($offers_detail['rating']);$i++):?>   
										<i class="star-rated icon-star"></i>
									<?php 
									endfor;
									for($i=1;$i<=5-round($offers_detail['rating']);$i++):?>
										<i class="unstar-rated icon-star"></i>
									<?php 
									endfor;
									endif;
									?>
									</p>
									<ul class="text-center">
									<?php if(!empty($offers_detail['address'])):?>
										<li><?php echo $offers_detail['address'];?></li>
									<?php
									endif;
									if(!empty($offers_detail['phone_code']) && !empty($offers_detail['telephone_number'])): ?>
										<li><i class="icon-phone"></i><?php echo "+".$offers_detail['phone_code'];?> / <?php echo $offers_detail['telephone_number'];?></li>
								     <?php 	
									 endif;
										if($offers_detail['hotel_url']):?>
										<li><i class="icon-link"></i> <a  target='_blank' href="<?php echo $offers_detail['hotel_url'];?>"><?php 
										echo $offers_detail['hotel_url'];?></a></li>
										<?php endif;?>
									</ul>
								</div>
								   <?php
										$text='review';
										if($review_count > 1):
										$text='reviews';
										endif;
										$title=num_Format($review_count)." ".ucwords($this->lang->line($text));
										if($review_check):
										if($review_count > 1):
										$title=ucwords($this->lang->line("your and"))." ".num_Format($review_count-1)." ".ucwords($this->lang->line('others'))." ".ucwords($this->lang->line($text));
										endif;
										endif;?>
									<div class="host-stats">
										<a class="col-md-4 bg-light-3 box-border-top" href="#" title="<?php echo $title;?>">
											<div class="stats-icon bg-light-1 box-circle-full box-border-full">
												<div class="icon-rating-large large-rating-off"></div>
												<?php if($review_check):?>
												<div class="box-checked box-circle-full">
													<i class="icon-checkmark"></i>
												</div>
											<?php endif;?>
											</div>
											<p class="text-center  box-border-bottom"><strong><?php echo $review_count;?></strong></p>
											<div class="stats-label bg-light-1">
												<small><?php echo ucfirst($this->lang->line('review'));?></small>
											</div>
										</a>
										<?php
										$text='follow';
										if($follow_count > 1):
										$text='follows';
										endif;
										$title=num_Format($follow_count)." ".ucwords($this->lang->line($text));
										if($follow_check):
										if($follow_count > 1):
										$title=ucwords($this->lang->line("your and"))." ".num_Format($follow_count-1)." ".ucwords($this->lang->line('others'))." ".ucwords($this->lang->line($text));
										else:
										$title=num_Format($follow_count)." ".ucwords($this->lang->line($text));
										endif;
										endif;
										?>
										<a data-ui-title="<?php echo $follow_title2;?>" data-ui-title1="<?php echo $follow_title1;?>" data-ui-mess1="<?php echo $follow_mess1;?>" data-ui-mess2="<?php echo $follow_mess2;?>" class="<?php echo $user_based_class;?> col-md-4 bg-light-3 box-border-top <?php echo $followed_class;?>" href="<?php echo $follow_url;?>" title="<?php echo $title;?>">
											<div class="stats-icon bg-light-1 box-circle-full box-border-full">
												<div class="icon-follow-large large-follow-off"></div>
												<?php if($follow_check): $display="display:block;"; else:$display="display:none;"; endif;?>
												<div class="js-follow-iconic box-checked box-circle-full" style="<?php echo $display;?>">
													<i class="icon-checkmark"></i>
												</div>
											</div>
											<p class="text-center box-border-bottom"><strong class="js-follow-count-display"><?php echo $follow_count;?></strong></p>
											<div class="stats-label bg-light-1">
												<small><?php echo ucfirst($this->lang->line('follow'));?></small>
											</div>
										</a>
										<?php 
										$text='like';
										if($like_count > 1):
										$text='likes';
										endif;
										$title=num_Format($like_count)." ".ucwords($this->lang->line($text));
										if($like_check):
										if($like_count > 1):
										$title=ucfirst($this->lang->line("your and"))." ".num_Format($like_count-1)." ".ucwords($this->lang->line('others'))." ".ucwords($this->lang->line($text));
										endif;
										endif;
										?>
										<a data-ui-title="<?php echo $like_title2;?>" data-ui-title1="<?php echo $like_title1;?>" data-ui-mess1="<?php echo $like_mess1;?>" data-ui-mess2="<?php echo $like_mess2;?>" class="<?php echo $user_like_class;?> col-md-4 bg-light-3 box-border-top <?php echo $liked_class;?>" href="<?php echo $like_url;?>" title="<?php echo $title;?>">
											<div class="stats-icon bg-light-1 box-circle-full box-border-full">
												<div class="icon-recommends-large large-recommends-off"></div>
                                             <?php if($like_check): $display="display:block;"; else:$display="display:none;"; endif;?>
												<div class="js-like-iconic box-checked box-circle-full" style="<?php echo $display;?>">
												<i class="icon-checkmark"></i>
												</div>
											</div>
											<p class="text-center box-border-bottom"><strong class="js-like-count-display"><?php echo $like_count;?></strong></p>
											<div class="stats-label bg-light-1">
												<small><?php echo ucfirst($this->lang->line('like'));?></small>
											</div>
										</a>
										<div class="clearfix"></div>
									</div>