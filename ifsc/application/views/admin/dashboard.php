<?php 
$ok = "Yes";
if($ok=="No") {
?>
<div class="main">
  <div class="main-inner">
    <div class="container">
	<?php 
if($this->session->flashdata('flash_message')){
	echo $this->session->flashdata('flash_message');
}
?>
      <div class="row">
        <div class="span6">
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Today's Statistics</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="widget big-stats-container">
                <div class="widget-content">
                  <h6 class="bigstats">Today Active status following few modules as given below like Total Logins(Hotels,Users),Orders Count,Sign up Users,Today Published Auctions.</h6>
                  <div id="big_stats" class="cf">
                    <div class="stat" title="Sign In"><i class="icon-signin" ></i> <span class="value"><?php echo $today_logins; ?></span> </div>
                    <!-- .stat -->
                    
                    <div class="stat" title="Orders"> <i class="icon-shopping-cart"></i> <span class="value"><?php echo $today_orders; ?></span> </div>
                    <!-- .stat -->
                    
                    <div class="stat" title="Sign Up"> <i class="icon-group"></i> <span class="value"><?php echo $today_signups; ?></span> </div>
                    <!-- .stat -->
                    
                    <div class="stat" title="Published Auctions"> <i class="icon-bullhorn"></i> <span class="value"><?php echo $today_publish_offers; ?></span> </div>
                    <!-- .stat --> 
                  </div>
                </div>
                <!-- /widget-content --> 
                
              </div>
            </div>
          </div>
          <!-- /widget -->
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Events</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div id='calendar'>
			  
              </div>
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget -->
          <div class="widget">
            <div class="widget-header"> <i class="icon-file"></i>
              <h3> Messages</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
			<?php if(count($recent_messages)){ ?>
              <ul class="messages_layout">
				<?php foreach($recent_messages as $msgVals) { 
						if($msgVals['user_type']==2) { $classmsg='from_user left'; $paths='hotels'; } else if($msgVals['user_type']==3) { $classmsg='by_myself left'; $paths='users';  }
				?>
                <li class="<?php echo $classmsg; ?>">
				<?php
				if(!empty($msgVals['image_dir']) && !empty($msgVals['profile_image']) && file_exists('./'.$msgVals['image_dir'].$msgVals['profile_image']))  {
					$img_src = thumb(FCPATH.$msgVals['image_dir'].$msgVals['profile_image'],'50','50','admin_inbox');
					$img_prp = array('src'=>base_url().$msgVals['image_dir'].'admin_inbox/'.$img_src,'alt'=>$msgVals['profile_image']); 
				} else {
					$img_prp=array('src'=>base_url().'assets/img/hotel-admin/avatar2.png','title'=>'No Image Found');
				}
				echo anchor(base_url().ADMIN.'/'.$paths.'/view/'.$msgVals['user_id'], img($img_prp), array('class' => 'avatar')); ?></a>
                  <div class="message_wrap"> <span class="arrow"></span>
                    <div class="info"> <a class="name"><?php echo '@'.$msgVals['display_name']; ?></a> <span class="time">1 hour ago</span>
                      <div class="options_arrow">
                        <div class="dropdown pull-right"> <a class="dropdown-toggle " id="dLabel" role="button" data-toggle="dropdown" data-target="#" href="#"> <i class=" icon-caret-down"></i> </a>
                          <ul class="dropdown-menu " role="menu" aria-labelledby="dLabel">
                            <li><a href="javascript:void(0);" class="rep_msg" id="reply_msg_<?php echo $msgVals['id'];?>"><i class=" icon-share-alt icon-large"></i> Reply</a></li>
                            <li><!--<a href="javascript:void(0);" id="delete_msg_<?php echo $msgVals['id'];?>"><i class=" icon-trash icon-large"></i> Delete</a>--></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="text"> <?php echo substr($msgVals['message'],0,240); if(strlen($msgVals['message'])>240) { echo "...";echo anchor(base_url().ADMIN.'/messages/view_reply/'.$msgVals['id'].'?pagemode=index',' view more',array('class'=>'','title'=>'View/Reply')); }  ?> </div>
                  </div>
				  <input type="hidden" name="to_user" id="to_user_<?php echo $msgVals['id'];?>" value=<?php echo $msgVals['user_id'];?> >
				  <div class="replay_hide replay_txt_<?php echo $msgVals['id'];?>">
				  </div>
				  <span class="text-danger" id="shw_<?php echo $msgVals['id'];?>" style="display:none;"><label class="error">Please enter the Message</label></span>
				  <span class="text-danger" id="shw_suc_<?php echo $msgVals['id'];?>" style="display:none;"><label class="success">Message sent Successfully.</label></span>
                </li>
				
				<?php } ?>
				
              </ul>
			<?php } else { ?>
			<div style="padding:10px;color:red;text-align:center;">No Recent Messages Found</div>
			<?php } ?>
			
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget --> 
        </div>
        <!-- /span6 -->
        <div class="span6">
          <div class="widget">
            <div class="widget-header"> <i class="icon-bookmark"></i>
              <h3>Important Shortcuts</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="shortcuts">
			  <?php 
				echo anchor(base_url().ADMIN.'/subadmin', '<i class="shortcut-icon icon-star"></i><span class="shortcut-label">Sub Admin</span>',array('class'=>'shortcut')); 
				echo anchor(base_url().ADMIN.'/hotels', '<i class="shortcut-icon icon-user-md"></i><span class="shortcut-label">Hotels</span>',array('class'=>'shortcut'));
				echo anchor(base_url().ADMIN.'/user_logins', '<i class="shortcut-icon icon-signal"></i><span class="shortcut-label">Login History</span>',array('class'=>'shortcut'));
				echo anchor(base_url().ADMIN.'/messages', '<i class="shortcut-icon icon-envelope-alt"></i><span class="shortcut-label">Messages</span>',array('class'=>'shortcut'));
				echo anchor(base_url().ADMIN.'/users', '<i class="shortcut-icon icon-user"></i><span class="shortcut-label">Users</span>',array('class'=>'shortcut'));
				echo anchor(base_url().ADMIN.'/orders', '<i class="shortcut-icon icon-shopping-cart"></i><span class="shortcut-label">Orders</span>',array('class'=>'shortcut'));
				echo anchor(base_url().ADMIN.'/banners', '<i class="shortcut-icon icon-picture"></i><span class="shortcut-label">Banners</span>',array('class'=>'shortcut'));
				echo anchor(base_url().ADMIN.'/auctions', '<i class="shortcut-icon icon-tag"></i><span class="shortcut-label">Auctions</span>',array('class'=>'shortcut'));
			  ?>
				</div>
              <!-- /shortcuts --> 
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget -->
          <div class="widget">
            <div class="widget-header"> <i class="icon-cloud"></i>
              <h3> Auction Chart Datas</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <canvas id="area-chart" class="chart-holder" height="250" width="538"> </canvas>
              <!-- /area-chart --> 
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget -->
          <div class="widget widget-table action-table">
            <div class="widget-header"> <i class="icon-random"></i>
              <h3>Recent Published Auctions</h3>
			  <?php if(count($recent_auctions)) { echo anchor(base_url().ADMIN.'/auctions','VIEW ALL',array('class'=>'dash_more','title'=>'Auctions')); } ?>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <table class="table table-striped table-bordered">
                <thead>
                  <tr>
                    <th> Auction Name </th>
                    <th> Hotel </th>
                    <th class="td-actions"> Action </th>
                  </tr>
                </thead>
                <tbody>
				<?php
					if(count($recent_auctions)) {
						foreach($recent_auctions as $vals){
				?>
					<tr>
						<td><?php if(strlen($vals['offer_name'])>55) { $more = "..."; } else { $more=""; } 
						echo anchor(base_url().ADMIN.'/auctions/view/'.$vals['id'],substr($vals['offer_name'],0,55).$more,array('class'=>'','title'=>'View Offer Details')); ?></td>

						<td style="width:150px;"><?php if(strlen($vals['hotel_name'])>55) { $mores = "..."; } else { $mores=""; } 
						echo anchor(base_url().ADMIN.'/hotels/view/'.$vals['hotel_id'],substr($vals['hotel_name'],0,55).$mores,array('class'=>'','title'=>'View Hotel Details')); ?></td>
						<td class="td-actions">
						<?php
							echo anchor(base_url().ADMIN.'/auctions/view/'.$vals['id'],'<i class="btn-icon-only icon-list-alt"> </i>',array('class'=>'btn btn-big','title'=>'View'));
						?>
						</td>
					</tr>
				<?php }	 } else {
				?>
					<tr>
						<td colspan="3" style="text-align:center;color:red;">No Recent Published Auction Found</td>
					</tr>
				<?php
					}
				?>
                </tbody>
              </table>
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget --> 
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Recent Booked Orders</h3>
			  <?php if(count($recent_orders)) { echo anchor(base_url().ADMIN.'/orders','VIEW ALL',array('class'=>'dash_more','title'=>'Orders')); } ?>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
			<?php if(count($recent_orders)) { ?>
              <ul class="news-items">
			  <?php foreach($recent_orders as $recVals) { ?>
                <li>
                  <div class="news-item-date"> <span class="news-item-day"><?php echo date('d',strtotime($recVals['created'])); ?></span> <span class="news-item-month"><?php echo date('M, Y',strtotime($recVals['created'])); ?></span> </div>
                  <div class="news-item-detail"> <a href="http://www.egrappler.com/thursday-roundup-40/" class="news-item-title" target="_blank"><?php if(strlen($recVals['offer_name'])>55) { $more = "..."; } else { $more=""; } 
						echo anchor(base_url().ADMIN.'/auctions/view/'.$recVals['offer_id'],substr($recVals['offer_name'],0,55).$more,array('class'=>'','title'=>'View Offer Details')); ?></a>
                    <p class="news-item-preview"> Above offer was posted by the hotel <?php echo anchor(base_url().ADMIN.'/hotels/view/'.$recVals['hotel_id'],$recVals['hotel_name'],array('class'=>'','title'=>'View Offer Details')); ?>, and this offer was purchased by the user   @<?php echo anchor(base_url().ADMIN.'/users/view/'.$recVals['user_id'],$recVals['display_name'],array('class'=>'','title'=>'View Offer Details')); ?>. The order amount was <span class="amount_bold">&euro; <?php echo $recVals['amount']; ?></span>.</p> To view more details <?php echo anchor(base_url().ADMIN.'/orders/view/'.$recVals['id'],'Click Here',array('class'=>'','title'=>'View Order Details')); ?> 
                  </div>
                </li>
			  <?php } ?>
              </ul>
			<?php } else { ?>
			<div style="padding:10px;color:red;text-align:center;">No Recent Booked Orders Found</div>
			<?php } ?>
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget -->
        </div>
        <!-- /span6 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /main-inner --> 
</div>
<script src="assets/js/admin/excanvas.min.js"></script> 
<script src="assets/js/admin/chart.min.js" type="text/javascript"></script> 
<script language="javascript" type="text/javascript" src="assets/js/admin/full-calendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="assets/js/admin/base.js"></script> 
<script>  
	var lineChartData = {
		labels: ["Aug 14", "Sep 14", "Oct 14", "Nov 14", "Dec 14", "Jan 15", "Feb 15"],
		datasets: [
			{
				fillColor: "rgba(220,220,220,0.5)",
				strokeColor: "rgba(220,220,220,1)",
				pointColor: "rgba(220,220,220,1)",
				pointStrokeColor: "#fff",
				data: [65, 59, 90, 81, 56, 55, 40]
			},
			{
				fillColor: "rgba(151,187,205,0.5)",
				strokeColor: "rgba(151,187,205,1)",
				pointColor: "rgba(151,187,205,1)",
				pointStrokeColor: "#fff",
				data: [28, 48, 40, 19, 96, 27, 100]
			},
			{
				fillColor: "rgba(151,187,205,0.5)",
				strokeColor: "rgba(151,187,205,1)",
				pointColor: "rgba(151,187,205,1)",
				pointStrokeColor: "#fff",
				data: [58, 18, 20, 19, 96, 57, 500]
			}
		]

	};

    var myLine = new Chart(document.getElementById("area-chart").getContext("2d")).Line(lineChartData);
	
    $(document).ready(function() {
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        var calendar = $('#calendar').fullCalendar({
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
          },
          selectable: true,
          selectHelper: true,
          select: function(start, end, allDay) {
			var title = prompt('Event Title:');
			var startDate = new Date(start).toISOString().slice(0, 10);
			var endDate = new Date(end).toISOString().slice(0, 10);
			if($.trim(title)!=""){
				$.ajax({
					type:"POST",
					url:__cfg('admin_path_absolute')+'add_events',
					data:"title="+title+"&start_date="+startDate+"&end_date="+endDate,
					dataType:'json',
					success: function(output){
						calendar.fullCalendar('renderEvent',
							{
							  id:output.id,
							  title: title,
							  start: start,
							  end: end,
							  allDay: allDay
							},
							true 
						);
					}
				});
			}
            calendar.fullCalendar('unselect');
          },
          editable: false,
          events: {
			url: __cfg('admin_path_absolute')+'calendar_events',
			error: function() {
				$('#script-warning').show();
				}
			},
			eventClick: function(event, element) {
				var title = prompt('Event Title:',event.title);
				if($.trim(title)!=""){
					$.ajax({
						type:"POST",
						url:__cfg('admin_path_absolute')+'edit_events/'+event.id,
						data:"title="+title,
						dataType:'json',
						success: function(output){
							event.title=output.title;
							$('#calendar').fullCalendar('updateEvent', event);
						}
					});
				}
			}
        });
    });
    </script>
<?php } else { ?>
<div class="main">
	<div class="main-inner">
		<div class="container">
		<?php echo anchor(base_url().ADMIN, img(base_url().'assets/img/admin/under_construction.png'), array('class' => 'brand')); ?>
		</div>
	</div>
</div>
<?php } ?>
