<?php if( ! defined('BASEPATH')) exit('Direct Access not Allowed'); ?>
<div class="main">
	<div class="main-inner">
	    <div class="container">
	      <div class="row">
	      	<div class="span12">      		
	      		<div class="widget ">
	      			<div class="widget-header">
	      				<i class="icon-user-md"></i>
	      				<h3><?php echo $indextitle; ?></h3>
						<?php 
						$pagestatus = $this->uri->segment(3) ? $this->uri->segment(3) : 'index';
						$pagingstatus = $this->uri->segment(4) ? $this->uri->segment(4) : '1';
						$fieldssort = $this->uri->segment(5) ? $this->uri->segment(5) : 'id';
						$ordersort = $this->uri->segment(6) ? $this->uri->segment(6) : 'desc';
						?>
						<span class="create_new"><?php echo anchor(base_url().ADMIN.'/hotels/add?pagemode='.$pagestatus.'&modestatus='.$pagingstatus.'&sortingfied='.$fieldssort.'&sortype='.$ordersort,'Create',array('class'=>'btn btn-suc','title'=>'Create')); ?></span>
	  				</div> <!-- /widget-header -->
					<div class="widget-content">
						<ul class="nav nav-tabs">
							<li <?php if($this->uri->segment(3)=="" || $this->uri->segment(3)=="index") { ?>class="active" <?php } ?>><?php echo anchor(base_url().ADMIN.'/hotels','All'); ?></li>
							<li <?php if($this->uri->segment(3)=="active") { ?>class="active" <?php } ?>><?php echo anchor(base_url().ADMIN.'/hotels/active','Active'); ?></li>	
							<li <?php if($this->uri->segment(3)=="inactive") { ?>class="active" <?php } ?>><?php echo anchor(base_url().ADMIN.'/hotels/inactive','Inactive'); ?></li>
							<li <?php if($this->uri->segment(3)=="hotel_request") { ?>class="active" <?php } ?>><?php echo anchor(base_url().ADMIN.'/hotels/hotel_request','New Hotel Request'); ?></li>
						</ul>
					<?php if( count($hotels)) {
					/*Excel export*/
					$excel_att = array('id' => 'top_user_report_excel', 'target'=>'_blank');
					echo form_open(ADMIN.'/hotels', $excel_att);
					$excel_submit = array('name' => 'excel_export', 'class' => 'btn btn-primary report_excel', 'value' => 'Export', 'title' => 'Export');
					?>
					<input type="hidden" name="tab-type" value="<?php echo $type;?>">
					<?php
					echo form_submit($excel_submit);		
					echo form_close();	
					/*Excel End*/
					 } 
					if($this->session->flashdata('flash_message')){
						echo $this->session->flashdata('flash_message');
					}
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
							 echo form_open(ADMIN.'/hotels/'.$type.'/1');
						?>
							<div  id="module-search" class="pull-right">
							<div class="quick-search-containers">
								<div class="input-group input-group-sm">
									<?php 
									 echo form_input(array('name'=>'keyword','class'=> 'span2 m-wrap','id'=>'name'),$keyword);
									 $submit_val = array('name' => 'submit-search', 'class' => 'btn btn-default', 'value' => 'Go!', 'title' => 'Go');
									?>
									<span class="input-group-btn go-search">	
									<?php echo form_submit($submit_val);
									echo ' '.anchor(ADMIN.'/hotels/'.$type.'/1/reset', 'Clear' ,array('title'=>'Clear', 'class'=>'btn btn-sm btn-default'));
									?>
									</span>
									
								</div>
							</div>
							<small class="pull-right"><a href="#" class="advanced-search-toggle<?php echo $this->uri->segment(2) ;?>">+ Advanced Search</a></small>
						</div>

						<div class="clearfix"></div>

						<div class="advenced_search_container row" id="advenced_search_container" <?php echo isset($advanced_searchs) ? '' : 'style="display:none"'; ?>>
							<div class="col-md-12 col-sm-12 col-xs-12">
								
								<div class="col-md-3 col-sm-4">
									<div class="form-group form-group-advenced-search">
										<label class="control-label" for="title">Hotel Name</label>
										<?php echo form_input(array('name'=>'hotel_name','class'=> 'span3','placeholder'=>'Hotel Name'),$this->input->post('hotel_name')); ?>
									</div>	
								</div>
								
								<div class="col-md-3 col-sm-4">
									<div class="form-group form-group-advenced-search">
										<label class="control-label" for="title">Email Id</label>
										<?php echo form_input(array('name'=>'email','class'=> 'span3 m-wrap','placeholder'=>'Email id'),$this->input->post('email')); ?>
									</div>	
								</div>
								
								<div class="col-md-3 col-sm-4">
									<div class="form-group form-group-advenced-search">
										<label class="control-label" for="price">Plan Type</label>
										
										<?php $selected = ($this->input->post('filter')) ? $this->input->post('filter') : ""	;  
										
										echo form_dropdown('filter',array(''=>'Select Type') + $plan_types,$selected,"id='filter'");  //echo form_dropdown('filter',array(''=>'Select Type')+$this->config->item('hotel_plan_type'),$this->input->post('filter'),'id="filter" class="span3"'); ?>
									</div>	
								</div>
								<div class="col-md-3 col-sm-4">
									<div class="form-group form-group-advenced-search">
										<label class="control-label" for="phone">Description</label>
										<?php echo form_input(array('name'=>'description','class'=> 'span3 m-wrap','placeholder'=>'Description'),$this->input->post('description')); ?>
									</div>	
								</div> 
								<div class="col-md-3 col-sm-4">
									<div class="form-group form-group-advenced-search">
										<label class="control-label" for="phone">Registered From</label>
										<?php echo form_input(array('placeholder'=>'YYYY-MM-DD','name'=>'checkin','class'=> 'span3','id'=>'checkin'),$this->input->post('checkin')); ?>
									</div>	
								</div> 
								<div class="col-md-3 col-sm-4">
									<div class="form-group form-group-advenced-search">
										<label class="control-label" for="phone">To</label>
										<?php echo form_input(array('placeholder'=>'YYYY-MM-DD','name'=>'checkout','class'=> 'span3','id'=>'checkout'),$this->input->post('checkout')); ?>
									</div>	
								</div> 
								
							   
								<div class="clearfix"></div>
								<div class="advance-btn">
								<?php 
								 $data_submit = array('name' => 'submit-advanced-search', 'class' => 'btn btn-sm btn-primary', 'value' => 'Submit', 'title' => 'Submit');
								echo form_submit($data_submit).' | ';
								echo anchor(ADMIN.'/hotels/'.$type.'/1/reset', 'Clear' ,array('title'=>'Clear', 'class'=>'btn btn-sm btn-default'));
								?>
								</div>
							</div>
						</div>
						<?php echo form_close(); ?>
						<!-- /widget -->
						
						
						<!--<div id="module-search" class="pull-right col-md-4">
							<div class="quick-search-container">
								<div class="input-group input-group-sm">
								<?php 
								 echo form_open(ADMIN.'/hotels/'.$type.'/1');
								 echo form_input(array('name'=>'keyword','class'=> 'span2 m-wrap','id'=>'name'),$keyword);
								 $submit_val = array('name' => 'search_submit', 'class' => 'btn btn-default', 'value' => 'Go!', 'title' => 'Go');
								?>
								<span class="input-group-btn go-search">	
								<?php echo form_submit($submit_val); 
								echo ' '.anchor(ADMIN.'/hotels/'.$type.'/1/reset', 'Clear' ,array('title'=>'Reset', 'class'=>'btn btn-sm btn-default'));
								?>
								</span>
								<?php
								echo form_close();
								?>
								</div>
							</div>
						</div>-->
						<!-- /widget -->
					<?php echo form_open(base_url().ADMIN.'/hotels/bulkautions/'.$pagestatus.'/'.$pagingstatus.'?sortingfied='.$fieldssort.'&sortype='.$ordersort); ?>
					  <div class="widget widget-table action-table">
						<!-- /widget-header -->
						<div class="widget-content">
						  <table class="table table-striped table-bordered action-chng-tbl" id="rowclick1">
							<thead>
							  <tr>
								<th><?php echo form_checkbox(array('id'=>'selecctall','name'=>'selecctall')); ?></th>
								<th> <?php $sort_url = base_url().ADMIN.'/hotels/'.$type.'/'.$page_num.'/name/'.$order;   if($sort_seg == 'name') {  echo anchor($sort_url ,'Hotel'.$sort_img, $sort_att );  } else { echo anchor($sort_url,'Hotel'.$sort_def_img, $sort_att ); }?></th>	
								<th> <?php $sort_url = base_url().ADMIN.'/hotels/'.$type.'/'.$page_num.'/email/'.$order;   if($sort_seg == 'email') {  echo anchor($sort_url ,'Email'.$sort_img, $sort_att );  } else { echo anchor($sort_url,'Email'.$sort_def_img, $sort_att ); }?> </th>
								<th class="create-wt"> <?php $sort_url = base_url().ADMIN.'/hotels/'.$type.'/'.$page_num.'/created/'.$order;   if($sort_seg == 'created') {  echo anchor($sort_url ,'Created'.$sort_img, $sort_att );  } else { echo anchor($sort_url,'Created'.$sort_def_img, $sort_att ); }?> </th>
								<th class="td-actions">Status </th>
								<th class="td-actions">Approved</th>
								<th class="td-actions">Email Verified</th>
								<th class="td-actions">Banners</th>
								<th class="td-actions">Actions </th>
							  </tr>
							</thead>
							<tbody>
							<?php //print_r($hotels);die;
							if(count($hotels)) {
								foreach($hotels as $vals) { $i++; 
							?>
							  <tr class="check-select">
								<td><?php echo form_checkbox(array('name'=>'checkall_box[]','class'=>'js-checkbox-all'),$vals['id']); ?></td>
								<td> <?php echo ucfirst($vals['name']); ?> </td>
								<td> <?php echo $vals['email']; ?> </td>
								<td> <?php echo mytimespan(strtotime($vals['created']),time()); ?> </td>
								
								<td class="td-actions">
								<?php 
								$pagestatus = $this->uri->segment(3) ? $this->uri->segment(3) : 'index';
								$pagingstatus = $this->uri->segment(4) ? $this->uri->segment(4) : '1';
								if($vals['is_active']==1) {
								echo anchor(base_url().ADMIN.'/hotels/disable/'.$vals['id'].'/'.$pagestatus.'/'.$pagingstatus,'<i class="btn-icon-only icon-ok"> </i>',array('class'=>'btn btn-small btn-success','title'=>'Active'));
								} else { 
								echo anchor(base_url().ADMIN.'/hotels/enable/'.$vals['id'].'/'.$pagestatus.'/'.$pagingstatus,'<i class="btn-icon-only icon-remove"> </i>',array('class'=>'btn btn-danger btn-small','title'=>'Inactive'));
								?>
								<?php } ?></td>
								
								<td class="td-actions">
								<?php 
								$pagestatus = $this->uri->segment(3) ? $this->uri->segment(3) : 'index';
								$pagingstatus = $this->uri->segment(4) ? $this->uri->segment(4) : '1';
								if($vals['is_approved']==1) {
									echo '<i class="btn-icon-only icon-ok" title="Approved"> </i>';
								} else { 
									$apclass = $vals['viewed_count']>0 ? 'btn btn-warning btn-small' : 'btn btn-warning approve_hotel btn-small';
								echo anchor(base_url().ADMIN.'/hotels/approve/'.$vals['id'].'/'.$pagestatus.'/'.$pagingstatus,'<i class="btn-icon-only icon-remove"> </i>',array('class'=>$apclass,'title'=>'Waiting for Apporval'));
								?>
								<?php } ?></td>
								<td class="td-actions">
								<?php
								if($vals['is_email_confirmed']==1) {
								echo '<i class="btn-icon-only icon-ok" title="Verified"> </i>';
								} else { 
								echo '<i class="btn-icon-only icon-remove" title="Not Verified"> </i>';
								} ?></td>
								<td class="td-actions">
								<?php
								echo anchor(base_url().ADMIN.'/hotel_banners/index/1/id/desc/'.$vals['id'].'?hbpagemode='.$pagestatus.'&hbmodestatus='.$pagingstatus.'&hbsortingfied='.$fieldssort.'&hbsortype='.$ordersort,'<i class="btn-icon-only icon-list-alt"> </i>',array('class'=>'btn btn-big','title'=>'View Banners'));
								?>
								</td>
								<td class="td-actions nw-td-actions">
								<?php 
								echo anchor(base_url().ADMIN.'/hotels/view/'.$vals['id'].'?pagemode='.$pagestatus.'&modestatus='.$pagingstatus.'&sortingfied='.$fieldssort.'&sortype='.$ordersort,'<i class="btn-icon-only icon-list-alt"> </i>',array('class'=>'btn btn-big','title'=>'View'));
								echo anchor(base_url().ADMIN.'/hotels/edit/'.$vals['id'].'?pagemode='.$pagestatus.'&modestatus='.$pagingstatus.'&sortingfied='.$fieldssort.'&sortype='.$ordersort,'<i class="btn-icon-only icon-edit"> </i>',array('class'=>'btn btn-big','title'=>'Edit'));
								echo anchor(base_url().ADMIN.'/hotels/change_password/'.$vals['id'].'?pagemode='.$pagestatus.'&modestatus='.$pagingstatus.'&sortingfied='.$fieldssort.'&sortype='.$ordersort,'<i class="btn-icon-only icon-key"> </i>',array('class'=>'btn btn-big','title'=>'Change Password'));
								?>
								</td>
							  </tr>
							<?php }
							} else { ?>
							<tr>
							<th colspan="9" class="norecordfound">No Record Found</th>
							</tr>
							<?php } ?>
							</tbody>
						  </table>
						</div>
						<!-- /widget-content --> 
					  </div>
						<!-- /Multi Actions --> 
						<div class="actions">
						<?php if($type!="hotel_request") { ?>
							<div class="multi-actions">
							<?php
							echo form_dropdown('more_action_id',$this->config->item('bulkactions'),$this->input->post('offer_type'),'id="MoreActionId" class="span2 js-more-action"'); 
							?>
							</div>
						<?php } ?>
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
<script src="assets/js/admin/jquery.datetimepicker.js"></script>
<script>
$("#checkin").datepicker({
	  dateFormat: "yy-mm-dd",
	  yearRange: '-3:+3',
      defaultDate: "+1w",
      numberOfMonths: 1,
	  maxDate: new Date(),
	  changeMonth: true,
	  changeYear: true,
      onClose: function(selectedDate) {
        $("#checkout").focus();
      }
    });
 $("#checkout").datepicker({
	  beforeShow : function(){ 
			$( this ).datepicker('option','minDate', $('#checkin').val() );
	  },
	  dateFormat: "yy-mm-dd",
	  yearRange: '-3:+3',
     maxDate: new Date(),
      defaultDate: "+1w",
      numberOfMonths: 1,
	  changeMonth: true,
	  changeYear: true,
    });
</script>