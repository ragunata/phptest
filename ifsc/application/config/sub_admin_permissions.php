<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$config['sub_admin_roles']	= array(
								   'user'		=> array('dashboard','edit_profile'),
								   'webusers'	=> array('index','add'),
								   'pages'		=> array('index','edit'),
								   'countries'	=> array('index'),
								   'states'		=> array('index'),
								   'cities'		=> array('index'),
								   'areas'		=> array('index'),
								);
$config['master_menus'] 	= array('countries'=>'Countries','states'=>'States','cities'=>'Cities',
								'areas'=>'Areas');