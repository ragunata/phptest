<?php if(!empty($recent_offers)) { ?>
<div id="slide4" class="hotel-offersection">
	<div class="hotel-offers">
		<div class="hoteloffer-head">
			<h2><?php echo count($recent_offers).' '.strtoupper($this->lang->line("offers available now"));?></h2>
			<?php if(!empty($offers_sold)) {?>
			<div class="hoteloffer-headright">
				<p>
					<span><?php echo count($offers_sold);?> <?php echo ucwords($this->lang->line("offer sold"));?></span> <?php echo ucwords($this->lang->line("in last 3 months")); ?>
				</p>
			</div><?php }?>
		</div>
		<div class="hotel-offerlists">
			<ul class="scroll">
				<?php
				foreach($recent_offers as $offers) {
					if(!empty($offers['offer_banner_image_dir']) && !empty($offers['offer_banner_image_name']) && file_exists('./'.$offers['offer_banner_image_dir'].$offers['offer_banner_image_name'])) {
							$latest_banner_img_src = thumb(FCPATH.$offers['offer_banner_image_dir'].$offers['offer_banner_image_name'],'250','360','view_recent_offer');
							$latest_banner_img_url = array('src'=>base_url().$offers['offer_banner_image_dir'].'view_recent_offer/'.$latest_banner_img_src,'alt'=>$offers['offer_banner_image_name'],'title'=>$offers['offer_banner_image_name']);
					} else {
						$latest_banner_img_url=array('src'=>base_url().'assets/img/offer2.jpg');
					}		
					if($offers['offer_type']==1) {
						$class="blue-badge";
						$Percent_Off = 1 - ( $offers['offer_price'] / $offers['msrp_price']);
						$Percent_Off = round($Percent_Off * 100);
						$price=$offers['offer_price'];
					} else if($offers['offer_type']==2) {
						$class="orange-badge";
						$slump_price= slump_rate_price($offers['id'],$offers['msrp_price']);
						$Percent_Off = 1 - ($slump_price /$offers['msrp_price']);
						$Percent_Off = round($Percent_Off * 100);
						$price=$slump_price;
					} else {
						$class="green-badge";
						$price=$offers['current_rate'];
						if($price==0) {
							$price=$offers['bidding_start_amount'];
						}
					}
				?>
				<li>
				<a href="<?php echo base_url().'home/offer_view/'.url_title($offers['offer_name']).'/'.$offers['id'];?>" title="<?php echo $this->lang->line($offers['hotel_name']);?>">
					<div class="offer-list-inner">
						<div class="hover-overlay"></div>
							  <?php  echo img($latest_banner_img_url);?>
						<span class="offer-badge <?php echo $class;?>">
							<label class="time-offer">
								<?php if($offers['offer_type'] !=3) { ?>
										<strong><?php echo $Percent_Off;?> %</strong><?php echo strtoupper($this->lang->line('offer'));?>
								<?php } else {
									echo ucwords($this->lang->line('bid now'));
									  } 
								?>
							</label>
						</span>
						<div class="center-cont">
							<p><?php echo $this->lang->line($offers['offer_name']);?></p>
						</div>
						<div class="bottom-cont">
							<p class="bottom-cont-left"></p>
							<span class="bottom-cont-right"> <?php echo currency_convert($price);?></span>
						</div>
					</div>
					</a>
				</li>
				<?php } ?>
			</ul>
		</div>
	</div>
</div>
<?php } ?>
