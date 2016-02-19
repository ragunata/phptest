<?php
echo '<?xml version="1.0" encoding="UTF-8"?>';
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'; 
foreach($results as $keys=>$datas)
{
$city_name=strtolower($datas['city_name']);
$area_name=strtolower($datas['area_name']);
$cat_name=strtolower($datas['category_name']);
if($city_name!='' && $area_name!='' && $cat_name!='')
{
$link=base_url().'category-search/'.url_title(strtolower($cat_name)).'/'.strtolower(url_title($city_name)).'/'.strtolower(url_title($area_name));	
}
else
{
	if($cat_name!='' && $city_name!='')
	{
	
      $link=base_url().'category-search/'.url_title(strtolower($cat_name)).'/'.url_title(strtolower($city_name));	
	}
}
if($link!='')
{
  echo '<url>';
  echo'<loc>'.$link.'</loc>';
  echo'</url>';  
}		
}
echo'</urlset>';