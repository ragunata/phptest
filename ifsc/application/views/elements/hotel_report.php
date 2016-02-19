<?php if(isset($sort_type))
{
$sort_type=$sort_type;
}
else
{
$sort_type="asc";
}
?>
<div class="activebid-table">
	<div class="activebid-table-mobile">
		<div class="activetable-head">
			<ul>
				<li class="js-ajax-report-sort">
					<div class="activebid-cell activebid-col1">
			       <span><?php echo strtoupper($this->lang->line('date'));?></span>
					</div>
					<div class="activebid-cell activebid-col2">
  <span class="offer-filter" id="total_amount" rel="<?php echo $sort_type;?>"><?php echo strtoupper($this->lang->line('revenue'));?></span>
					</div>
					<div class="activebid-cell activebid-col3">
	<span class="offer-filter" id="bookings_count" rel="<?php echo $sort_type;?>"><?php echo strtoupper($this->lang->line('bookings'));?></span>
					</div>
					<div class="activebid-cell activebid-col4">
  <span class="offer-filter" id="slump_rate_count" rel="<?php echo $sort_type;?>"><?php echo strtoupper($this->lang->line('slump rate'));?></span>
					</div>
					<div class="activebid-cell activebid-col5">
   <span class="offer-filter" id="discounts_count" rel="<?php echo $sort_type;?>"><?php echo strtoupper($this->lang->line('discounts'));?></span>
					</div>
					<div class="activebid-cell activebid-col6">
	<span class="offer-filter" id="bids_count" rel="<?php echo $sort_type;?>"><?php echo strtoupper($this->lang->line('bids'));?></span>
					</div>
				</li>
			</ul>
		</div>
		
		<div class="activetable-body verti-scroll">
			<ul>
			<?php	
                $total_amount=0;$bookings_count=0;
		        $dis_count=0;$slump_count=0;$bids_count=0; 	
                if($reports):			
			    foreach($reports as $r):
			    $total_amount=$total_amount+$r['total_amount'];
				$bookings_count=$bookings_count+$r['bookings_count'];
				$dis_count=$dis_count+$r['discounts_count'];
				$slump_count=$slump_count+$r['slump_rate_count'];
				$bids_count=$bids_count+$r['bids_count'];
				?>
				<li>
					<div class="activebid-cell activebid-col1">
						<span><?php
                        if(isset($filter_type) && $filter_type=="year")
						{
						echo date('M,Y',strtotime($r['today_date']));
						}
						else
						{
							echo date('d,M Y',strtotime($r['today_date']));
						}
						?></span>
					</div>
					<div class="activebid-cell activebid-col2">
						<span><?php echo currency_convert($r['total_amount']);?></span>
					</div>
					<div class="activebid-cell activebid-col3">
						<span><?php echo number_format($r['bookings_count']);?></span>
					</div>
					<div class="activebid-cell activebid-col4">
						<span><?php echo number_format($r['slump_rate_count']);?></span>
					</div>
					<div class="activebid-cell activebid-col5">
						<span><?php echo number_format($r['discounts_count']);?></span>
					</div>
					<div class="activebid-cell activebid-col6">
						<span><?php echo number_format($r['bids_count']);?></span>
					</div> 
				</li>
			   <?php endforeach;
			   else:?>
			  	<div class="no-offer-image" style="text-align:center"><span>Sorry</span></div>
		        <p><?php echo ucwords($this->lang->line("no records found")); ?></p>  
			<?php   endif; ?>
			</ul>
		</div>
		
	</div>
	</div>	
	
	<div class="reports-bottom">
		<ul>
			<li>
				<span><?php echo currency_convert($total_amount);?></span>
				<?php echo ucwords($this->lang->line('total revenue made'));?>
			</li>
			<li><span><?php echo number_format($bookings_count);?></span>
				<?php echo ucwords($this->lang->line("total no. of bookings"));?>
			</li>
				<li class="slump-created"><span><?php echo number_format($slump_count);?></span>
				<?php echo ucwords($this->lang->line("slump rate created"));?>
			</li>
			<li class="discount-created"><span><?php echo number_format($dis_count);?></span>
				<?php echo ucwords($this->lang->line("discount created"));?>
			</li>
			<li class="bids-created"><span><?php echo number_format($bids_count);?></span>
				<?php echo ucwords($this->lang->line("bids created"));?>
			</li>
		</ul>
	</div>
	