<!doctype html>
<html lang="en">
<head>
 <?php 
  $this->load->view('meta-keywords');
  $this->load->view('layouts/common-header'); 
?>
 </head>
<?php
$body_class="result-detail";
if($this->router->fetch_class()=="listings" && $this->router->fetch_method()=="index")
{
$body_class="result-list"; 
}
?>
 <body class="<?php echo $body_class;?>">
<?php
if($this->config->item('is_live_site'))
{?>
 <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-72207540-1', 'auto');
  ga('send', 'pageview');

</script>
<?php
}?>
	<div class="container">	
		<?php $this->load->view('layouts/header'); ?>
		<section class="home-container">
		<?php 
		$this->load->view('home_search');
		echo $main_content;
		?>
		</section>
	  	<?php $this->load->view('layouts/footer'); ?>
	</div>
 </body>
</html>
