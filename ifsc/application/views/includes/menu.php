<div class="subnavbar">
  <div class="subnavbar-inner">
    <div class="container">
      <ul class="mainnav">
        <li class="<?php echo ($this->uri->segment(2) == 'dashboard') ? 'active' : ''; ?>"><?php echo anchor(base_url().ADMIN.'/dashboard', '<i class="icon-dashboard"></i><span>Dashboard</span>'); ?> </li>
		<?php if(sub_admin_menu_check('webusers')) { ?>
		<li class="<?php echo ($this->uri->segment(2) == 'users') ? 'active' : ''; ?>"><?php echo anchor(base_url().ADMIN.'/users', '<i class="icon-user"></i><span>Users</span>'); ?></li><?php } 
        if(sub_admin_menu_check('pages')) { ?>
		<li class="<?php echo ($this->uri->segment(2) == 'pages') ? 'active' : ''; ?>"><?php echo anchor(base_url().ADMIN.'/pages', '<i class="icon-credit-card "></i><span>Pages</span>'); ?> </li>
		<?php } $masters=$this->config->item('master_menus'); ?>
        <li id="whoimg" class="dropdown<?php if(in_array($this->uri->segment(2),array_keys($masters))) { echo ' active'; } ?>"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-briefcase"></i><span>Masters</span> <b class="caret"></b></a>
          <ul class="dropdown-menu" id="nav_menu">
			<?php foreach($masters as $maskey=>$masval) {
					if(sub_admin_menu_check($maskey)) { 
			?>
				<li class="<?php echo ($this->uri->segment(2) == $maskey) ? 'active' : ''; ?>"><?php echo anchor(base_url().ADMIN.'/'.$maskey, $masval); ?></li>
			<?php }	} ?>
		  </ul>
        </li>
		<?php $reports=array('user_logins'); 
		if(sub_admin_menu_check('user_logins')) { ?>
		<li id="whoreport" class="dropdown<?php if(in_array($this->uri->segment(2),$reports)) { echo ' active'; } ?>"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-list-alt"></i><span>Reports</span> <b class="caret"></b></a>
          <ul class="dropdown-menu" id="nav_menus">		 
			<li class="<?php echo ($this->uri->segment(2) == 'user_logins') ? 'active' : ''; ?>"><?php echo anchor(base_url().ADMIN.'/user_logins', 'User Logins'); ?></li>
		  </ul>
        </li>
		<?php }
        if(sub_admin_menu_check('contact_us')) { ?>
		<li class="<?php echo ($this->uri->segment(2) == 'contact_us') ? 'active' : ''; ?>"><?php echo anchor(base_url().ADMIN.'/contact_us', '<i class="icon-user"></i><span>Contact Us</span>'); ?> </li>
		<?php }
        if(sub_admin_menu_check('import_excel')) { ?>
		<li class="<?php echo ($this->uri->segment(2) == 'import_datas') ? 'active' : ''; ?>"><?php echo anchor(base_url().ADMIN.'/import_datas', '<i class="icon-user"></i><span>Import Excel</span>'); ?> </li>
		<?php }?>
      </ul>
    </div>
    <!-- /container --> 
  </div>
  <!-- /subnavbar-inner --> 
</div>