<?php if( ! defined('BASEPATH')) exit('Direct Access not Allowed'); ?>
    <div class="container top">
      <ul class="breadcrumb">
        <li>
          <a href="<?php echo site_url("admin"); ?>" title="Admin">
            <?php echo ucfirst($this->uri->segment(1));?>
          </a> 
          <span class="divider">/</span>
        </li>
        <li>
          <a href="<?php echo site_url("admin").'/'.$this->uri->segment(2); ?>" title="Banners">
            <?php echo ucfirst($this->uri->segment(2));?>
          </a> 
          <span class="divider">/</span>
        </li>
        <li class="active">
          <a href="#" title="View">View</a>
        </li>
      </ul>
      
      <div class="page-header">
        <h2>
          View - <?php echo ucfirst($this->uri->segment(2));?>
        </h2>
      </div>
       
      <?php
      //form data
      	$attributes = array('class' => 'form-horizontal', 'id' => '');

      //form validation
      echo validation_errors();
      echo form_open(ADMIN.'/banners/view/'.$this->uri->segment(4).'', $attributes);
      ?>
        <fieldset>

	  <div class="control-group">
            <label for="inputError" class="control-label">Banner Name :</label>
            <div class="controls">
              <?php echo $banner[0]['name']; ?>
            </div>
          </div>

	   <div class="control-group">
            <label for="inputError" class="control-label">Description :</label>
            <div class="controls">
              <?php echo $banner[0]['description']; ?>
            </div>
          </div>

	  <div class="control-group">
            <label for="inputError" class="control-label">Banner Image :</label>
            <div class="controls">
		<img title="<?php echo $banner[0]['name']; ?>" height="200" width="200" src="<?php echo base_url();?>assets/images/admin_images/banners/<?php echo $banner[0]['image'] ?>">
            </div>
          </div>

          <div class="control-group">
            <label for="inputError" class="control-label">Status :</label>
            <div class="controls">
		<?php if($banner[0]['is_active']==1){ echo "Active"; }else { echo "Inactive"; } ?>
            </div>
          </div>
         
          <div class="view_btn">
            <a href="<?php echo base_url(); ?>index.php/admin/banners"  title="Back" class="btn" >Back</a>
          </div>
        </fieldset>

      <?php echo form_close(); ?>

    </div>
     
