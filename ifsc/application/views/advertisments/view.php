<?php
								   $my_adress=$result['address_line'];
								   if($result['address_line']!='')
								   {
									 if($result['area_name']!='' && $result['city_name']!='' && ($result['zip']!='' && $result['zip']!=0))
									 {
										 $my_adress =ucwords($result['address_line']).','.ucwords($result['area_name']).','.ucwords($result['city_name']).'-'.$result['zip'];
									 }
									 else if($result['area_name']=='' && $result['city_name']!='' && ($result['zip']!='' && $result['zip']!=0))
									 {
										 $my_adress =ucwords($result['address_line']).','.ucwords($result['city_name']).'-'.$result['zip'];
									 }
									 else if($result['area_name']!='' && $result['city_name']=='' && ($result['zip']!='' && $result['zip']!=0))
									 {
										 $my_adress =ucwords($result['address_line']).','.ucwords($result['area_name']).'-'.$result['zip'];
									 }
									 else if($result['area_name']!='' && $result['city_name']=='' && ($result['zip']!='' && $result['zip']!=0))
									 {
										 $my_adress =ucwords($result['address_line']).','.ucwords($result['area_name']).'-'.$result['zip'];
									 }
									  else if($result['area_name']=='' && $result['city_name']=='' && ($result['zip']!='' && $result['zip']!=0))
									 {
										 $my_adress =ucwords($result['address_line']).','.ucwords($result['areas']).'-'.$result['zip'];
									 }
									 else if($result['area_name']!='' && $result['city_name']!='')
							        {
						              $my_adress =ucwords($result['address_line']).','.ucwords($result['area_name']).','.ucwords($result['city_name']);
							        }
								   }
								   else
								   {
									 if($result['area_name']!='' && $result['city_name']!='' && ($result['zip']!='' && $result['zip']!=0))
									 {
										 $my_adress =ucwords($result['area_name']).','.ucwords($result['city_name']).'-'.$result['zip'];
									 }
									 else if($result['area_name']=='' && $result['city_name']!='' && ($result['zip']!='' && $result['zip']!=0))
									 {
										 $my_adress =ucwords($result['city_name']).'-'.$result['zip'];
									 }
									 else if($result['area_name']!='' && $result['city_name']=='' && ($result['zip']!='' && $result['zip']!=0))
									 {
										 $my_adress =ucwords($result['area_name']).'-'.$result['zip'];
									 }
									 else if($result['area_name']!='' && $result['city_name']=='' && ($result['zip']!='' && $result['zip']!=0))
									 {
										 $my_adress =ucwords($result['area_name']).'-'.$result['zip'];
									 }
									  else if($result['area_name']=='' && $result['city_name']=='' && ($result['zip']!='' && $result['zip']!=0))
									 {
										 $my_adress =ucwords($result['area_name']).'-'.$result['zip'];
									 }
									 else if($result['area_name']!='' && $result['city_name']!='')
							        {
						              $my_adress =ucwords($result['area_name']).','.ucwords($result['city_name']);
							        }   
								   }?>
<section class="search-detail-page">
				<div class="wrapper">
					<div class="breadcrumb">
						<ul>
							  <?php   echo $this->load->view('bread_crumb');?>
						</ul>
					</div>
					<div class="leftsection">
					  <?php 
					   echo $this->load->view('banners/view_left_banner');
					  echo $this->load->view('categories/related_category');
					 
					  ?>
					</div>
					<div class="middlesection">
						<div class="rev-list">
						<h3 class="header-title"><?php 		
						echo ucwords($result['name']).' ,'.ucwords($result['city_name']);?></h3>
							<ul>
								<li>
								<?php echo $this->load->view('banners/view_top_banner');?>
									<div class="art-image">
										<div class="art-image-in">
										   <?php
										   if(!empty($result['Banner']['image_url']) && file_exists('../..'.$result['Banner']['image_url']))
										   {
											   $img_src = thumb(FCPATH.$result['Banner']['image_url'],'770','520','detail_thumb');
											   $image = array('src'=>base_url().$result['Banner']['image_url'].'detail_thumb/'.$img_src);
										   }
										   else
										   {
											   $image = array('src'=>base_url().'assets/img/view_logo.png');
										   }?>
											<a href="#" class="view_page">
											<?php echo img($image);?>
											</a>
										
										</div>
										
										<div class="art-image-in">
										<ul class="detail-details">
									       <?php if(!empty($result['owner'])):?>
									        <li class="address"><i class="fa fa-user"></i>Contact Person : <?php echo ucwords($result['owner']);?></li>
											<?php endif;?>
											<li class="address"><i class="fa fa-location-arrow"></i>Location : <?php echo ucwords($my_adress);?></li>
											<?php if(!empty($result['contact_number'])):?>
											<li class="contactnum"><i class="fa fa-phone"></i>Contact Number : <?php echo $result['contact_number'];?></li>
											<?php endif;?>
											<?php if($result['email']!=''):?>
											<li class="enq-email"><i class="fa fa-envelope-o"></i><a href="mailto:<?php echo $result['email'];?>">Send Enquiry By Email</a></li>
											<?php endif;?>
											<li class="timing"><i class="fa fa-clock-o"></i><?php echo $result['working_start'];?> to <?php echo $result['working_end'];?> </li>
									       </ul>
										</div>	
										<?php  $link='http://'. $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];?>
											<span style="text-decoration:none;color:#000000;display:inline-block;cursor:pointer;" class="stButton">
										<a target="_blank" href="http://www.facebook.com/share.php?u=<?php echo $link;?>&title='<?php echo ucwords($result['add_name']);?>'"><span class="stLarge" style="background-image: url(<?php echo base_url().'assets/img/facebook_32.png'?>);">
										</span>
										</a>
										</span>
										<span style="text-decoration:none;color:#000000;display:inline-block;cursor:pointer;" class="stButton">
										<a href="http://twitter.com/intent/tweet?status=<?php echo ucwords($result['add_name']);?>+<?php echo $link;?>" target="_blank"><span class="stLarge" style="background-image: url(<?php echo base_url().'assets/img/twitter_32.png'?>);"></span></a>
										</span>
										<span style="text-decoration:none;color:#000000;display:inline-block;cursor:pointer;" class="stButton">
										<a href="http://www.linkedin.com/shareArticle?mini=true&url=<?php echo $link;?>&title=<?php echo ucwords($result['add_name']);?>&source=<?php echo base_url();?>" target="_blank"><span class="stLarge" style="background-image: url(<?php echo base_url().'assets/img/linkedin_32.png'?>);"></span></a>
										</span>
										<span style="text-decoration:none;color:#000000;display:inline-block;cursor:pointer;" class="stButton">
										<a href="https://plus.google.com/share?url=<?php echo $link;?>" target="_blank"><span class="stLarge" style="background-image: url(<?php echo base_url().'assets/img/googleplus_32.png'?>);"></span></a>
										</span>
                                      </div>				
									</div>
									<div class="art-text">
									<div class="related-links1">
										<ul class="detail-details">
										<?php
										if(!empty($business_data))
										{?>
											<h3 style="color: #fe4f00;">Business Listed Under</h3>
											<?php
											foreach($business_data as $datas)
											{
												$city_name=strtolower($datas['city_name']);
												$area_name=strtolower($datas['area_name']);
												$cat_name=strtolower($datas['category_name']);
												if($city_name!='' && $area_name!='' && $cat_name!='')
												{?>
													<li><i class="fa fa-link"></i><a href="<?php echo base_url().'category-search/'.url_title(strtolower($cat_name)).'/'.strtolower(url_title($city_name)).'/'.strtolower(url_title($area_name));?>" title="<?php echo ucwords($cat_name)." ".ucwords($area_name);?>"><?php echo ucwords($cat_name);?> in <?php echo ucwords($area_name)." ,".ucwords($city_name);?></a></li>
													
												<?php
												}
												else
												{
														if($cat_name!='' && $city_name!='')
												        {?>
													      <li><a href="<?php echo base_url().'category-search/'.url_title(strtolower($cat_name)).'/'.url_title(strtolower($city_name));?>" title="<?php echo ucwords($cat_name);?>"> in <?php echo ucwords($city_name);?></a></li>
														<?php
														}
													
												}
											}
										}?>	
									</ul>
									</div>
									
										<div class="user-ratings">
										<label>User Ratings : </label>
											<ul>
											 <?php
											  $rating=($result['rating']!='')?$result['rating']:0;
											  for($i=$rating;$i>=1;$i--):
											  echo "<li class='rated'>Star</li>";
											  endfor;
											  for($i=5-$rating;$i>=1;$i--):
											  echo "<li>Star</li>";
											  endfor;
											?>
											</ul>
										</div>
									
										<div class="about-description">
										<?php if(!empty($result['description'])):?>
										<h3>About <?php echo ucwords($result['name']);?>:</h3>
										<p><?php echo nl2br($result['description']);?></p>
										<?php endif;?>
										<?php echo $this->load->view('advertisments/map_view');?>
										</div>
										
			
										<div class="detail-review-section">
											<div class="review-title">
												<h2>Comments</h2>
												<?php 
												if($this->session->userdata('user_id')):?>
												<a title="Add Review" href="javascript:void(0);" class="addreview">Add Comments</a>
												<?php
												else:
												?>
										       <a href="<?php echo base_url().'user_login?add_review=1&redirect_url=http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];?>" title="Add Comments" class="add_review fancybox fancybox.ajax">Add Comments</a>
												<?php endif;?>
												<a title="Cancel" href="javascript:void(0);" class="cancelreview">Cancel</a>
											<?php echo $this->load->view('comments/add_comment');?>
											</div>
										<?php echo $this->load->view('comments/list_comment');?>
									</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="viewpage">
					<?php echo $this->load->view('banners/view_right_banner'); ?>
					</div>
				</div>
			</section>
			<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>