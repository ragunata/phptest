<section class="search-list-page">
    <div class="wrapper">
	    <?php   echo $this->load->view('bread_crumb');?>
			<div class="leftsection">
						 <?php   						
						 echo $this->load->view('banners/list_left_top_banner');
						 echo $this->load->view('categories/related_category');
						
						 ?>
			</div>
			<div class="middlesection">
				<div class="rev-list custom-review-list">
					<h3 class="header-title"><?php echo $search_header_title;?><span class="total-count"><?php echo ' ('.number_format($total_count).')';?></span></h2>
						<ul>
							<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
							<!-- dialbe new -->
							<ins class="adsbygoogle"
							style="display:inline-block;width:670px;height:90px"
							data-ad-client="ca-pub-2739505616311307"
							data-ad-slot="8765715278"></ins>
							<script>
							(adsbygoogle = window.adsbygoogle || []).push({});
							</script>
						  <?php
						   if(!empty($list['listings'])):
						   foreach($list['listings'] as $result):
						   $contact_number="Not Available";
						   if(isset($result['contact_number']) && $result['contact_number']!='')
						   {
							$contact_number=$result['contact_number'];   
						   }
						   $link=base_url().'business'.'/'.$result['id'].'/'.url_title(strtolower($result['add_name'])).'/'.url_title(strtolower($result['city_name']));
						   $image_list='';
						   if(!empty($image_list['image_url']) && file_exists('../..'.$image_list['image_url']))
						   {
							   $img_src = thumb(FCPATH.$image_list['image_url'],'205','122','list_thumb');
					           $image = array('src'=>base_url().$image_list['image_url'].'list_thumb/'.$img_src);
						   }
						   else
						   {
							   $image = array('src'=>base_url().'assets/img/list_logo.png');
						   }
						   
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
						         $my_adress =ucwords($result['address_line']).','.ucwords($result['area_name']).'-'.$result['zip'];
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
							   
							   
						   }
						   ?>
							<li>
								<h3 class="art-title"><a href="<?php echo $link;?>"><?php 
								echo highlight_text(ucwords($result['add_name']),$search_keyword);
								if($result['city_name']!=''){ echo " ,".$result['city_name'];}?></a></h3>
										
									<div class="art-image">
										<div class="art-image-in">
											<a href="<?php echo $link; ?>">
											<?php echo img($image);?>
											</a>
										</div>
									</div>
									<div class="art-text"><?php  $search_keyword=(isset($_GET['keyword']))?$_GET['keyword']:'';?>
									
										<?php if(!empty($result['owner'])):?>
										<p><i class="fa fa-user"></i> Owner :<?php echo ucwords($result['owner']);?></p>
										<?php endif;?>
										<p class="reviewby"><i class="fa fa-phone"></i> Contact : <a href="javascrip:void(0)">+ <?php echo $contact_number;?></a><span class="gmap">Map : <a href="<?php echo $link;?>"><i class="fa fa-map-marker"></i></a></span></p>
										<p><?php echo $my_adress;?></p>
										<div class="user-ratings">
											<ul>
											<?php 
											  $rating=($result['rating']!='')?$result['rating']:0;
											  for($i=$rating;$i>=1;$i--):
											  echo "<li class='rated'>".$i."Star</li>";
											  endfor;
											  for($i=5-$rating;$i>=1;$i--):
											  echo "<li>".$i."Star</li>";
											  endfor;
											?>
											</ul>
											<p><span><?php
                                             $list_rate_info=0;
											echo '('.$result['total_user_rated'].')';?></span> User Rated</p>
										</div>
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
								</li>
							<?php
							endforeach;
							else:?>
							<li class='no-list-sec'>
							   <img src="<?php echo base_url().'assets/img/sorry-no-img.png';?>">
							   <h3>No Results Found</h3>
							</li>
						<?php
							endif;
							?>
							</ul>
							<?php 
							echo $this->load->view('pagenation_links');
							if(empty($list['listings'])):
							echo $this->load->view('advertisments/related_list');
						    endif;
							?>
						</div>
					</div>
                     <?php
					 echo $this->load->view('banners/list_right_banner');
					?>
				</div>
			</section>
