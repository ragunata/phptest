<?php if( ! defined('BASEPATH')) exit('Direct Access not Allowed'); ?>
<div class="main">
	<div class="main-inner">
	    <div class="container">
	      <div class="row">
	      	<div class="span12">      		
	      		<div class="widget ">
	      			<div class="widget-header">
	      				<i class="icon-picture"></i>
	      				<h3><?php echo $indextitle; ?></h3>
						<?php 
						$pagestatus = $this->uri->segment(3) ? $this->uri->segment(3) : 'index';
						$pagingstatus = $this->uri->segment(4) ? $this->uri->segment(4) : '1';
						$fieldssort = $this->uri->segment(5) ? $this->uri->segment(5) : 'id';
						$ordersort = $this->uri->segment(6) ? $this->uri->segment(6) : 'desc';
						?>
						<span class="create_new"><?php echo anchor(base_url().ADMIN.'/hotel_banners/add/'.$this->uri->segment(7).'?pagemode='.$pagestatus.'&modestatus='.$pagingstatus.'&sortingfied='.$fieldssort.'&sortype='.$ordersort.'&hbpagemode='.$this->input->get('hbpagemode').'&hbmodestatus='.$this->input->get('hbmodestatus').'&hbsortingfied='.$this->input->get('hbsortingfied').'&hbsortype='.$this->input->get('hbsortype'),'Create',array('class'=>'btn btn-suc','title'=>'Create')); ?><?php echo anchor(base_url().ADMIN.'/hotels/'.$this->input->get('hbpagemode').'/'.$this->input->get('hbmodestatus').'/'.$this->input->get('hbsortingfied').'/'.$this->input->get('hbsortype'),'<i class="icon-step-backward "></i> &nbsp;&nbsp; Go Back'); ?></span>
	  				</div> <!-- /widget-header -->
					<div class="widget-content">
						<ul class="nav nav-tabs">
							<li <?php  if($this->uri->segment(3)=="" || $this->uri->segment(3)=="index") { ?>class="active" <?php } ?>><?php echo anchor(base_url().ADMIN.'/hotel_banners/index/1/id/asc/'.$this->uri->segment(7),'All'); ?></li>
							<li <?php if($this->uri->segment(3)=="active") { ?>class="active" <?php } ?>><?php echo anchor(base_url().ADMIN.'/hotel_banners/active/1/id/asc/'.$this->uri->segment(7),'Active'); ?></li>	
							<li <?php if($this->uri->segment(3)=="inactive") { ?>class="active" <?php } ?>><?php echo anchor(base_url().ADMIN.'/hotel_banners/inactive/1/id/asc/'.$this->uri->segment(7),'Inactive'); ?></li>
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
								$sort_img= img(base_url().'assets/img/admin/sort_desc.png');
							else
								$sort_img = img(base_url().'assets/img/admin/sort_asc.png');
								
							$sort_att = array('class'=>'sorting');
							$sort_def_img = img(base_url().'assets/img/admin/sort_both.png');
							 
						?>
						<div id="module-search" class="pull-right">
							<div class="quick-search-container">
								<div class="input-group input-group-sm">
								<?php 
								 echo form_open(base_url().ADMIN.'/hotel_banners/'.$pagestatus.'/'.$pagingstatus.'/'.$fieldssort.'/'.$order_seg.'/'.$this->uri->segment(7));
								 echo form_input(array('name'=>'keyword','class'=> 'span2 m-wrap','id'=>'name'),$keyword);
								 $submit_val = array('name' => 'search_submit', 'class' => 'btn btn-default', 'value' => 'Go!', 'title' => 'Go');
								?>
								<span class="input-group-btn go-search">	
								<?php echo form_submit($submit_val); ?>
								</span>
								<span class="input-group-btn go-search">	
									<?php 
									echo ' '.anchor(ADMIN.'/hotel_banners/'.$type.'/1/reset/'.$order_seg.'/'.$this->uri->segment(7), 'Clear' ,array('title'=>'Reset', 'class'=>'btn btn-sm btn-default'));
									?>
								</span>
								<?php
								echo form_close();
								?>
								</div>
							</div>
						</div>
						<!-- /widget -->
						<?php echo form_open(base_url().ADMIN.'/hotel_banners/bulkactions/'.$pagestatus.'/'.$pagingstatus.'?sortingfied='.$fieldssort.'&sortype='.$ordersort.'&hotel_id='.$this->uri->segment(7)); ?>
					  <div class="widget widget-table action-table">						
						<!-- /widget-header -->
						<div class="widget-content">
						  <table class="table table-striped table-bordered"  id="rowclick1">
							<thead>
							  <tr>
							   <th><?php echo form_checkbox(array('id'=>'selecctall','name'=>'selecctall')); ?></th>
								<th> <?php $sort_url = base_url().ADMIN.'/hotel_banners/'.$type.'/'.$page_num.'/name/'.$order.'/'.$this->uri->segment(7);   if($sort_seg == 'name') {  echo anchor($sort_url ,'Name'.$sort_img, $sort_att );  } else { echo anchor($sort_url,'Name'.$sort_def_img, $sort_att ); }?> </th>
								<th> <?php $sort_url = base_url().ADMIN.'/hotel_banners/'.$type.'/'.$page_num.'/priority/'.$order.'/'.$this->uri->segment(7);   if($sort_seg == 'priority') {  echo anchor($sort_url ,'Priority'.$sort_img, $sort_att );  } else { echo anchor($sort_url,'Priority'.$sort_def_img, $sort_att ); }?> </th>
								<th class="create-wt"> <?php $sort_url = base_url().ADMIN.'/hotel_banners/'.$type.'/'.$page_num.'/created/'.$order.'/'.$this->uri->segment(7);   if($sort_seg == 'created') {  echo anchor($sort_url ,'Created'.$sort_img, $sort_att );  } else { echo anchor($sort_url,'Created'.$sort_def_img, $sort_att ); }?> </th>
								<th class="td-actions">Image </th>
								<th class="td-actions">Status </th>
								<th class="td-actions new-items2">Actions </th>
							  </tr>
							</thead>
							<tbody>
							<?php 
							if(count($banners)) {
								foreach($banners as $vals) { $i++; 
							?>
							  <tr class="check-select">
								<td><?php echo form_checkbox(array('name'=>'checkall_box[]','class'=>'js-checkbox-all'),$vals['id']); ?></td>
								<td> <?php echo ucfirst($vals['name']); ?> </td>
								<td> <?php echo form_input(array('name'=>'priority'.$vals['id'],'class'=> 'span1 priority','id'=>'priority','maxlength'=>'2'),set_value('priority', $this->input->post('priority') ? $this->input->post('priority') : $vals['priority'])); ?> </td>
								<td> <?php echo mytimespan(strtotime($vals['created']),time()); ?> </td>
								<td class="td-actions">
								<?php
								if($vals['image_name']!="" && file_exists('./'.$vals['image_dir'].$vals['image_name'])) {
									$img_src = thumb(FCPATH.$vals['image_dir'].$vals['image_name'],'100','50','thumb_banners');
									$img_prp = array('src'=>base_url().$vals['image_dir'].'thumb_banners/'.$img_src,'alt'=>$vals['image_name'],'title'=>$vals['name']);
									echo img($img_prp);
								} else {
									echo img(base_url().'assets/img/admin/no-image.png');
								}
								?>
								</td>
								<td class="td-actions">
								<?php if($vals['is_deleted']!=1) {
								echo anchor(base_url().ADMIN.'/hotel_banners/disable/'.$this->uri->segment(7).'/'.$vals['id'].'/'.$pagestatus.'/'.$pagingstatus.'/'.$fieldssort.'/'.$order_seg,'<i class="btn-icon-only icon-ok"> </i>',array('class'=>'btn btn-small btn-success','title'=>'Active'));
								} else { 
								echo anchor(base_url().ADMIN.'/hotel_banners/enable/'.$this->uri->segment(7).'/'.$vals['id'].'/'.$pagestatus.'/'.$pagingstatus.'/'.$fieldssort.'/'.$order_seg,'<i class="btn-icon-only icon-remove"> </i>',array('class'=>'btn btn-danger btn-small','title'=>'Inactive'));
								?>
								<?php } ?></td>
								<td class="td-actions">
								<?php 
								echo anchor(base_url().ADMIN.'/hotel_banners/edit/'.$vals['id'].'?pagemode='.$pagestatus.'&modestatus='.$pagingstatus.'&sortingfied='.$fieldssort.'&sortype='.$ordersort.'&hbpagemode='.$this->input->get('hbpagemode').'&hbmodestatus='.$this->input->get('hbmodestatus').'&hbsortingfied='.$this->input->get('hbsortingfied').'&hbsortype='.$this->input->get('hbsortype'),'<i class="btn-icon-only icon-edit"> </i>',array('class'=>'btn btn-big','title'=>'Edit'));
								echo anchor(base_url().ADMIN.'/hotel_banners/delete/'.$vals['id'].'?pagemode='.$pagestatus.'&modestatus='.$pagingstatus.'&sortingfied='.$fieldssort.'&sortype='.$ordersort.'&hbpagemode='.$this->input->get('hbpagemode').'&hbmodestatus='.$this->input->get('hbmodestatus').'&hbsortingfied='.$this->input->get('hbsortingfied').'&hbsortype='.$this->input->get('hbsortype'),'<i class="btn-icon-only icon-trash"> </i>',array('class'=>'btn btn-big delete-con','title'=>'Delete'));
								?>
								</td>
							  </tr>
							<?php }
							} else { ?>
							<tr>
							<th colspan="7" class="norecordfound">No Records found.</th>
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
							echo form_dropdown('more_action_id',$this->config->item('bulkactions')+array('4'=>'Update Priority'),$this->input->post('type'),'id="MoreActionId" class="span2 js-more-action"'); 
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
