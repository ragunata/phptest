<?php if( ! defined('BASEPATH')) exit('Direct Access not Allowed'); ?>
<div class="main">
	<div class="main-inner">
	    <div class="container">
	      <div class="row">
	      	<div class="span12">      		
	      		<div class="widget ">
	      			<div class="widget-header">
	      				<i class="icon-fire"></i>
	      				<h3><?php echo $indextitle; ?></h3>
						<?php 
						$pagestatus = $this->uri->segment(3) ? $this->uri->segment(3) : 'index';
						$pagingstatus = $this->uri->segment(4) ? $this->uri->segment(4) : '1';
						$fieldssort = $this->uri->segment(5) ? $this->uri->segment(5) : 'id';
						$ordersort = $this->uri->segment(6) ? $this->uri->segment(6) : 'desc';
						?>
						<span class="create_new"><?php echo anchor(base_url().ADMIN.'/amenties/add?pagemode='.$pagestatus.'&modestatus='.$pagingstatus.'&sortingfied='.$fieldssort.'&sortype='.$ordersort,'Create',array('class'=>'btn btn-suc','title'=>'Create')); ?></span>
	  				</div> <!-- /widget-header -->
					<div class="widget-content">
						<ul class="nav nav-tabs">
							<li <?php if($this->uri->segment(3)=="" || $this->uri->segment(3)=="index") { ?>class="active" <?php } ?>><?php echo anchor(base_url().ADMIN.'/amenties','All'); ?></li>
							<li <?php if($this->uri->segment(3)=="active") { ?>class="active" <?php } ?>><?php echo anchor(base_url().ADMIN.'/amenties/active','Active'); ?></li>	
							<li <?php if($this->uri->segment(3)=="inactive") { ?>class="active" <?php } ?>><?php echo anchor(base_url().ADMIN.'/amenties/inactive','Inactive'); ?></li>
								<li <?php if($this->uri->segment(3)=="new") { ?>class="active" <?php } ?>><?php echo anchor(base_url().ADMIN.'/amenties/new','New Request'); ?></li>
						</ul>
						<?php 
							if($this->session->flashdata('flash_message')){
								echo $this->session->flashdata('flash_message');
							  }
						?>
						<?php
						/******** Pagination count ***********/ 
							$page_num = (int)$this->uri->segment(4);
						 if($page_num==0) { $page_num=1; }
							$i = ($page_num -1 ) * $per_page; 
							$order_seg = $this->uri->segment(6,"asc"); 
						 if($order_seg == "asc") $order = "desc"; else $order = "asc";
							$sort_seg = $this->uri->segment(5);
							if($order == 'asc')
								$sort_img= img('assets/img/admin/sort_desc.png');
							else
								$sort_img = img('assets/img/admin/sort_asc.png');
								
							$sort_att = array('class'=>'sorting');
							$sort_def_img = img('assets/img/admin/sort_both.png');
						?>
						<div id="module-search" class="pull-right col-md-4">
							<div class="quick-search-container">
								<div class="input-group input-group-sm">
								<?php 
								 echo form_open(ADMIN.'/amenties/'.$type.'/1');
								 echo form_input(array('name'=>'keyword','class'=> 'span2 m-wrap','id'=>'name'),$keyword);
								 $submit_val = array('name' => 'search_submit', 'class' => 'btn btn-default', 'value' => 'Go!', 'title' => 'Go');
								?>
								<span class="input-group-btn go-search">	
								<?php echo form_submit($submit_val);
								echo ' '.anchor(ADMIN.'/amenties/'.$type.'/1/reset', 'Clear' ,array('title'=>'Clear', 'class'=>'btn btn-sm btn-default'));
								?>
								</span>
								<?php echo form_close(); ?>
								</div>
							</div>
						</div>
						<!-- /widget -->
					<?php echo form_open(base_url().ADMIN.'/amenties/bulkautions/'.$pagestatus.'/'.$pagingstatus.'?sortingfied='.$fieldssort.'&sortype='.$ordersort); ?>
					  <div class="widget widget-table action-table">
						<!-- /widget-header -->
						<div class="widget-content">
						  <table class="table table-striped table-bordered" id="rowclick1">
							<thead>
							  <tr>
							   <?php 
							   if($this->uri->segment(3) !="new") { ?>
								<th><?php echo form_checkbox(array('id'=>'selecctall','name'=>'selecctall')); ?></th>
								<?php
								}?>
								<th><?php $sort_url = base_url().ADMIN.'/amenties/'.$type.'/'.$page_num.'/name/'.$order;   if($sort_seg == 'name') {  echo anchor($sort_url ,'Name'.$sort_img, $sort_att );  } else { echo anchor($sort_url,'Name'.$sort_def_img, $sort_att ); }?></th>
								   <?php 
							   if($this->uri->segment(3) !="new") { ?>
								<th><?php $sort_url = base_url().ADMIN.'/amenties/'.$type.'/'.$page_num.'/hotel_mapped_count/'.$order;   if($sort_seg == 'hotel_mapped_count') {  echo anchor($sort_url ,'Hotel Mapped'.$sort_img, $sort_att );  } else { echo anchor($sort_url,'Hotel Mapped'.$sort_def_img, $sort_att ); }?></th>
								<th><?php $sort_url=base_url().ADMIN.'/amenties/'.$type.'/'.$page_num.'/offer_mapped_count/'.$order;   if($sort_seg == 'offer_mapped_count') {  echo anchor($sort_url ,'Offer Mapped'.$sort_img, $sort_att );  } else { echo anchor($sort_url,'Offer Mapped'.$sort_def_img, $sort_att ); }?></th>
								<?php
								}
								else
								{?>
								<th>Hotel Name</th>
								<?php 
								}?>
								<th class="create-wt"><?php $sort_url = base_url().ADMIN.'/amenties/'.$type.'/'.$page_num.'/created/'.$order;   if($sort_seg == 'created') {  echo anchor($sort_url ,'Created'.$sort_img, $sort_att );  } else { echo anchor($sort_url,'Created'.$sort_def_img, $sort_att ); }?> </th>
								<th class="td-actions">Status </th>
								<th class="td-actions new-items2">Actions </th>
							  </tr>
							</thead>
							<tbody>
							<?php 
							if(count($amenities)) {
								foreach($amenities as $vals) { $i++; 
							?>
							  <tr class="check-select">
							  	 <?php  if($this->uri->segment(3) !="new") { ?>
								<td><?php echo form_checkbox(array('name'=>'checkall_box[]','class'=>'js-checkbox-all'),$vals['id']); ?></td>
								<?php
								}?>
								<td> <?php echo ucfirst($vals['name']); ?> </td>
								<?php
								if($this->uri->segment(3) !="new") { ?>
								<td> <?php echo $vals['hotel_mapped_count']; ?> </td>
								<td> <?php echo $vals['offer_mapped_count']; ?> </td>
								<?php
								}
								else
								{?>
								<td> <?php echo $vals['hotel_name']; ?> </td>
								<?php
								}?>
								<td> <?php echo mytimespan(strtotime($vals['created']),time()); ?> </td>
								<td class="td-actions">
								<?php
								if($vals['is_active']==1) {
								echo anchor(base_url().ADMIN.'/amenties/disable/'.$vals['id'].'/'.$pagestatus.'/'.$pagingstatus.'?sortingfied='.$fieldssort.'&sortype='.$ordersort,'<i class="btn-icon-only icon-ok"> </i>',array('class'=>'btn btn-small btn-success','title'=>'Active'));
								} 
								else if($vals['is_active']==2) {
								echo anchor(base_url().ADMIN.'/amenties/new-request/'.$vals['id'].'/'.$pagestatus.'/'.$pagingstatus.'?sortingfied='.$fieldssort.'&sortype='.$ordersort.'&request_type='.$vals['request_type'].'&hotel_id='.$vals['hotel_id'].'&request_id='.$vals['request_id'],'<i class="btn-icon-only icon-remove"> </i>',array('class'=>'btn btn-small btn-danger','title'=>'New Request'));
								} 
								else { 
								echo anchor(base_url().ADMIN.'/amenties/enable/'.$vals['id'].'/'.$pagestatus.'/'.$pagingstatus.'?sortingfied='.$fieldssort.'&sortype='.$ordersort,'<i class="btn-icon-only icon-remove"> </i>',array('class'=>'btn btn-danger btn-small','title'=>'Inactive'));
								?>
								<?php } ?></td>
								<td class="td-actions">
								<?php 
								echo anchor(base_url().ADMIN.'/amenties/edit/'.$vals['id'].'?pagemode='.$pagestatus.'&modestatus='.$pagingstatus.'&sortingfied='.$fieldssort.'&sortype='.$ordersort,'<i class="btn-icon-only icon-edit"> </i>',array('class'=>'btn btn-big','title'=>'Edit'));
								echo anchor(base_url().ADMIN.'/amenties/delete/'.$vals['id'].'?pagemode='.$pagestatus.'&modestatus='.$pagingstatus.'&sortingfied='.$fieldssort.'&sortype='.$ordersort,'<i class="btn-icon-only icon-trash"> </i>',array('class'=>'btn btn-big delete-con','title'=>'Delete'));
								?>
								</td>
							  </tr>
							<?php }
							} else { ?>
							<tr>
							<th colspan="8" class="norecordfound">No Record Found</th>
							</tr>
							<?php } ?>
							</tbody>
						  </table>
						</div>
						<!-- /widget-content --> 
					  </div>
						<!-- /Multi Actions --> 
					 <div class="actions">
						<div class="multi-actions">
							<?php
						  if($this->uri->segment(3) !="new") { 
							echo form_dropdown('more_action_id',$this->config->item('bulkactions'),$this->input->post('offer_type'),'id="MoreActionId" class="span2 js-more-action"'); 
							}
							?>
						</div>
						<div class="hob-paging"><?php echo '<div class="pagination" style="float:right;">'.$this->pagination->create_links().'</div>'; ?></div>
					 </div>
						<!-- /Multi Actions -->
					<?php echo form_close(); ?>
					</div> <!-- /widget-content -->
				</div> <!-- /widget -->
	      	</div> <!-- /span8 -->
	      </div> <!-- /row -->
	    </div> <!-- /container -->
	</div> <!-- /main-inner -->
</div> <!-- /main -->
