<?php
 if(!empty($recent_search)):?>
<section class="hotelsearch-history">
	<div class="search-historyinner">
		<div class="search-historyhead">
			<h2><?php echo strtoupper($this->lang->line('your recent search history'));?></h2>
		</div>
		<div class="recent-historylist">
			<ul>
			<?php foreach($recent_search as $offers):
			   $time_left=gettimeleft($offers['booking_end_date'],$this->session->userdata('local_time_zone_name'));
				if(!empty($offers['offer_banner_image_dir']) && !empty($offers['offer_banner_image_name']) && file_exists('./'.$offers['offer_banner_image_dir'].$offers['offer_banner_image_name'])) {
							$banner_img_src = thumb(FCPATH.$offers['offer_banner_image_dir'].$offers['offer_banner_image_name'],'220','321','view_search_offer');
							$banner_img_url = array('src'=>base_url().$offers['offer_banner_image_dir'].'view_search_offer/'.$banner_img_src,'alt'=>$offers['offer_banner_image_name'],'title'=>$offers['offer_banner_image_name']);
					} else {
						$banner_img_url=array('src'=>base_url().'assets/img/offer2.jpg');
					}		
					if($offers['offer_type']==1) {
						$class="blue-badge";
						$Percent_Off = 1 - ( $offers['offer_price'] / $offers['msrp_price']);
						$Percent_Off = round($Percent_Off * 100);
						$price=number_format($offers['offer_price']);
					} else if($offers['offer_type']==2) {
						$class="orange-badge";
						$slump_price= slump_rate_price($offers['id'],$offers['msrp_price']);
						$Percent_Off = 1 - ($slump_price /$offers['msrp_price']);
						$Percent_Off = round($Percent_Off * 100);
						$price= number_format($slump_price);
					} else {
						$class="green-badge";
						$price=number_format($offers['current_rate']);
						if($price==0) {
							$price=number_format($offers['bidding_start_amount']);
						}
					}
				?>
				<li>
			<a href="<?php echo base_url().'home/offer_view/'.url_title($offers['offer_name']).'/'.$offers['id'];?>">
			<div class="history-list-inner">
			  <div class="hover-overlay"></div>
						<?php echo img($banner_img_url); ?>
						<span class="offer-badge <?php echo $class;?>">
							<label class="time-offer">
							<?php if($offers['offer_type'] !=3) { ?>
							<strong><?php echo $Percent_Off;?>%</strong> OFFER
						  <?php } else {
						   echo "Bid Now";
							} ?>
							</label>
						</span>
						<div class="center-cont">
							<p><?php echo $this->lang->line($offers['offer_name']);?></p>
						</div>
						<div class="bottom-cont">
							<p class="bottom-cont-left"><?php echo ucwords($this->lang->line('time left'));?><br/>
							<span class="bids-time"><?php echo $time_left;?></span>
							</p>
							<span class="bottom-cont-right"><?php echo currency_convert($price);?></span>
						</div>
					</div>
					</a>
				</li>
				<?php endforeach; ?>
			</ul>
		</div>
	</div>
</section>
<?php endif;?>