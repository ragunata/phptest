<?php if(!empty($category_list)):?>
<div class="related-links">

							<h3>Related Categories</h3>
							<ul>
							<?php 
							foreach($category_list as $my_list):
							if(empty($cookie_city))
							{
								if(!empty($_GET['city']))
								{
									$cookie_city=strtolower($_GET['city']);
								}
								else if($this->uri->segment('1')=='search' && $this->uri->segment('2')!='')
								{
									$cookie_city=strtolower($this->uri->segment('2'));
								}
								else if($this->uri->segment('1')=='category-search' && $this->uri->segment('3')!='')
								{
									$cookie_city=strtolower($this->uri->segment('3'));
								}
								else if($this->uri->segment('1')=='mysearch' && $this->uri->segment('5')!='')
								{
									$cookie_city=strtolower($this->uri->segment('5'));
								}
								else
								{
								   $cookie_city="";
								}
							}
							?>
								<li><a href="<?php echo base_url().'category-search/'.url_title(strtolower($my_list['name'])).'/'.$cookie_city;?>" title="<?php echo ucwords($my_list['name']);?>"><?php echo ucwords($my_list['name']);?></a></li>
							<?php endforeach;?>
							</ul>
						</div>
<?php endif;?>