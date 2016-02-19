<?php 
if($this->agent->is_mobile()) { ?>
	<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">
	<meta name="viewport" content="initial-scale = 1.0, user-scalable = no">
	<meta name="apple-mobile-web-app-capable" content="yes" />
<?php } else{ $meta_keys = admin_settings_initialize('meta_words'); ?>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="description" content="<?php echo $meta_keys['description']; ?>"/>
	<meta name="keywords" content="<?php echo $meta_keys['Keywords']; ?>"/>
	<meta name="HandheldFriendly" content="true" />
	<meta name="MobileOptimized" content="320" /> 
<?php } ?>
<title class="common-title"><?php echo admin_settings_initialize('sitename').' - '.$title; ?></title>
<link rel="shortcut icon" type="image/x-icon" href="<?php echo base_url(); ?>assets/img/favicon.ico">
<script>
var cfg = {"cfg":{"admin_path_absolute":"<?php echo base_url().ADMIN.'/'; ?>","path_absolute":"<?php echo base_url(); ?>"}};
</script>