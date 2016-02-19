<!doctype html>
<html lang="en">
 <head>
 <meta name="google-site-verification" content="LG_Fhar_yf4lLNu8kkUgciknljTtqGDcTEgLZK92-oQ" />
  <?php 
  $this->load->view('meta-keywords');
  $this->load->view('layouts/common-header'); 
  ?>
 </head>
 <body class="home">
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
	    $this->load->view('categories/home_category'); 
		$this->load->view('categories/home_cities'); 
		?>
		</section>
	  	<?php $this->load->view('layouts/footer'); ?>
	</div>
 </body>
</html>
