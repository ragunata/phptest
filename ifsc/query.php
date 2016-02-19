<?php
$con=mysqli_connect("localhost","root","","indiabe");
$query="Select * from advertisements ORDER BY id";
$rs=mysqli_query($con,$query);
$count=0;
while($result=mysqli_fetch_assoc($rs))
{
    $count=$count+1;
	$listId=$result['id'];
	$categoryId=$result['category_id'];
	$category=explode(',',$categoryId);
	foreach($category as $key=>$cat)
	{
	 	$cat_query="SELECT * FROM `categories` WHERE id='".$cat."'";
	    $cat_rs=mysqli_query($con,$cat_query);
		while($result1=mysqli_fetch_assoc($cat_rs))
       {
		   if($result1['parent']!=0)
		   {
			$update_query='UPDATE `advertisements` SET `main_category_id`='.$result1['parent'].' WHERE id='.$listId;
            mysqli_query($con,$update_query);			
		   }   
	   }
	}
	echo $count;
	echo "<br/>";
	echo "<br/>";
}