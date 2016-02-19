<?php if(!empty($gallery)):?>
<h6><?php echo ucwords($this->lang->line('hotel photos'));?></h6>
	<div id="gallery">
		<div class="host-gallery">
	 <?php 
	   $count=0;$total_count=count($gallery);$n_count=0;
	   foreach($gallery as $g):$n_count++;$count=$count+1;if($count%10==0):$count=1;endif;
	   if($count==1 || $count==2):$w='80';$h='100';endif;
	   if($count==3):$w='176';$h='216';endif;
	   if($count==4):$w='272';$h='216';endif;
	   if($count==5 || $count==6):$w='272';$h='100';endif;
	   if($count==7):$w='272';$h='100';endif;
	   if($count==8 || $count==9):$w='128';$h='100';endif;
	   if($count==2 || $count==6 || $count==9):$all_class="thumb-small";endif;
	   if($count==1):$all_class="thumb-small";?><div class="col-md-2"><?php endif;
	   if($count==3):$all_class="thumb-large";?><div class="col-md-4"><?php endif;
	   if($count==4):$all_class="thumb-large";?><div class="col-md-6"><?php endif;
	   if($count==5):$all_class="thumb-small";?><div class="col-md-6"><?php endif; 
	   if($count==7):$all_class="thumb-large";?><div class="col-md-3"><?php endif;
	   if($count==8):$all_class="thumb-small";?><div class="col-md-3"><?php endif;
	   if(!empty($g['image_dir'])&& !empty($g['image_name']) && file_exists('./'.$g['image_dir'].$g['image_name'])):
	   $img_src = thumb(FCPATH.$g['image_dir'].$g['image_name'],$w,$h,'hotel_gallery');
	   $gallery_url = array('src'=>base_url().$g['image_dir'].'hotel_gallery/'.$img_src,'alt'=>$g['name']);
	   $gallery_url_s=base_url().$g['image_dir'].'/'.$g['image_name'];
	   else:
	   $gallery_url_s=base_url().'assets/img/home/hotel_thumb-6.jpg';
       $gallery_url=array('src'=>base_url().'assets/img/home/hotel_thumb-6.jpg');
	   endif;
	   ?>
        <div class="col-md-12">
	        <div class="gallery-thumbs <?php echo $all_class;?> bg-light-2 box-rounded-full">
		        <a class="fancybox-link" rel="gallery-group" href="<?php echo $gallery_url_s;?>" data-caption="<?php echo ucwords($this->lang->line(strtolower($g['name'])));?>">
		            <div class="thumb-image box-border-full" style="background-image: url('<?php echo $gallery_url['src'];?>');">
						<div class="overlay-gloss"></div>
						<div class="overlay-hover box-shadow-inset"></div>
					</div>
				</a>
			</div>
	   </div>
	 <?php  
	 if(($total_count == $n_count && $count==1) || ($count==2)):?></div> <?php endif; 
	 if($count==3):?></div><?php endif;
	 if($count==4):?></div><?php endif;
	 if(($total_count == $n_count && $count==5) || ($count==6)):?></div><?php endif;
	 if($count==7):?></div><?php endif;
	 if(($total_count == $n_count && $count==8 )|| ($count==9)):?></div><?php endif;
	 endforeach;
	 ?>
	        <div class="clearfix"></div>
		</div>
</div>
<?php endif;?>