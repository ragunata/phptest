<?php if(!empty($home_categories)):?>
<section id="moremenus" class="quick-menus">
				<div class="wrapper">
				    <h3 class="home-categories-title"><i class="fa fa-search"></i><i class="fa fa-quote-left"></i>Find By Cities<i class="fa fa-quote-right"></i></h3>
					<ul class="quick-menus-list">
					 <?php
					 foreach($home_cities as $cities):
					 $img_prp=array('src'=>base_url().'assets/images/spotlight-place-3.jpg','class'=>'image-home-list');
					 if(file_exists('./'.$cities['image_dir'].$cities['city_image']) && $cities['city_image']!="") 
					 {
					   $img_src = thumb(FCPATH.$cities['image_dir'].$cities['city_image'],'80','80','city_image');
					   $img_prp = array('src'=>base_url().$cities['image_dir'].'city_image/'.$img_src,'class'=>'image-home-list');
					 } 
					 ?>
						<li>
							<a href="<?php echo base_url().'search/'.url_title(strtolower($cities['name']));?>" title="<?php echo ucwords($cities['name']);?>">
								 <?php echo img($img_prp);?>
								<label><?php echo ucwords($cities['name']);?></label>
							</a>
						</li>
					<?php endforeach;?>						
					</ul>
				</div>
				<div class="wrapper">
					<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
					<!-- Home Page -->
					<ins class="adsbygoogle"
					style="display:block"
					data-ad-client="ca-pub-2739505616311307"
					data-ad-slot="6240737674"
					data-ad-format="auto"></ins>
					<script>
					(adsbygoogle = window.adsbygoogle || []).push({});
					</script>
		</div>
			</section>
<?php endif;?>