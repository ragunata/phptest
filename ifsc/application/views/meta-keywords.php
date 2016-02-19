<?php
if(isset($meta_keywords) && isset($meta_des) ):
$meta_keywords=$meta_keywords;
$meta_des=$meta_des;
else:
$meta_datas=admin_settings_initialize('meta_words');
$meta_keywords=$meta_datas['Keywords'];
$meta_desr=$meta_datas['description'];
endif;
$meta_title=(isset($title_of_layout) && $title_of_layout!='')?$title_of_layout:$meta_keywords;	
$meta_des=(isset($title_of_description) && $title_of_description!='')?$title_of_description:$meta_desr;	
?>
<title><?php echo $meta_title;?></title>  
<meta property="og:title" content="<?php echo $title_of_layout;?>" />
<meta property="og:type" content="Sharing Widgets" />
<meta property="og:url" content="<?php  echo 'http://'. $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];?>"/>
<meta property="og:image" content="<?php echo base_url().'assets/img/view_logo.png';?>"/>
<meta name="keywords" content="<?php echo $meta_keywords;?>"/>
<meta name="description" content="<?php echo $meta_des;?>"/>
<?php
if(isset($meta_rating) && $meta_rating!='')
{?>
<meta name="rating" content="<?php echo $meta_rating;?>"/>
<?php
}?>