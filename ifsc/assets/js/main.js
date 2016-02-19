function __cfg(c) {
	 return(cfg && cfg.cfg && cfg.cfg[c]) ? cfg.cfg[c]: false;
}

function reset($_this)
{
	
	$_this.closest('form').find("input[type=text], textarea").val("");
    $_this.closest('form').find("input,textarea").each(function() 
	{
	  $_this.next('span').remove();
	});	 	
}
function alert_notification(type,message)
{
	 var object1 = {
		'message'   :message,
		'position'  :'top right',
		'inEffect'  :'slideTop',
		'clearAll'  :true,
		'sticky'       :true,
        'closeOnClick'  :true,
        'closeButton'   :true
	};
	
	if(type=="success"){
		var object2 = {
		'theme'   :'colorful',
		'delay'   :'4000',
		'content' :{
					   bgcolor:"#afd136",
					   bg_colorcode:'#fff',
					   message:message
					},
		};
	} else if(type=="error"){
		var object2 = {
		'theme'   :'colorful',
		'content' :{
					   bgcolor:"#E3434B",
					   bg_colorcode:'#fff',
					   message:message
					},
		};
	}else{
		var object2 = {
		'theme'   :'awesome ok',
		'content' :{					   
                        message:message,
                        info:'',
                        icon:'fa fa-check-square-o'
					},
		};
	}
	$.extend( object1, object2 );
	$.amaran( object1 );
}

function checkWindowSize() 
{
    var width = $(window).width(),
    new_class = width > 1680 ? 'wlarge':
                width > 1600 ? 'w1680' :
                width > 1440 ? 'w1600' :
                width > 1400 ? 'w1440' :
                width > 1366 ? 'w1400' :
                width > 1280 ? 'w1366' :
                width > 1152 ? 'w1280' :
                width > 1024 ? 'w1152' :
				width <= 1024 ? 'wsmall' : '';
    $(document.body).removeClass('wlarge w1680 w1600 w1440 w1400 w1366 w1280 w1152 wsmall').addClass(new_class);	
}

function scrollToTop() 
{
	$('html, body').animate({scrollTop: 0}, 1000);
}

$(document).ready(function()
{
	
	$('#home-search').livequery('submit',function(){
		
	var city_id=$('#home-city').val();
    var area_id=$('#home-area').val();
	if(city_id=='' || city_id==0)
	{
	    alert_notification('error','Please Select City..!');
        return false;		
	}
	});
	jQuery('.primary-menu ul').slicknav({
		prependTo:'.slicknav_menu'
	});
	// Remove banner
	$('.remove-add').click(function() {
		$('.landing-add').slideUp("slow", function() { $('.landing-add').remove();});
	});
	
	//Select box script
	$('select').livequery(function(){
		$('select').selectric({
			disableOnMobile:false
		});
	});
	$('select').livequery(function(){
		$('.mobile-select').selectric({
			disableOnMobile:false,
			onChange: function(element) {
            $(element).change();
			},
		});
	});	
	
	
	//loginpopup
	var ajax_data=1;
	$(".fancybox").fancybox({		
		openEffect	: 'fade',
		closeEffect	: 'fade',
		type		: 'ajax',
		helpers		: {
			title	: false
		},
		beforeLoad: function ()
		{
		 var new_url=__cfg('path_absolute')+"home/user_auth_check/";
		 var ajax_data;
         $.ajax({
					type: "post",
					url: new_url,
					type:'POST',
					dataType: 'json',
					success: function(data)
					{
					 if(data.status=='1')
					 {
					   ajax_data=0;
					   window.location.href = __cfg('path_absolute'); 
					   return false;
					 }
					},
				});
		    if(ajax_data==0)
			{
			 return false;
			}
        },
		afterShow: function(){
			$('.login-inner .input:first').find('input[type="text"]').focus();
		}
	});
	//registrationpopup
	var ajax_data=1;
	$(".fancybox1").fancybox({
		openEffect	: 'fade',
		closeEffect	: 'fade',
		type		: 'ajax',		
		beforeLoad: function ()
		{
		 var new_url=__cfg('path_absolute')+"home/user_auth_check/";
		 var ajax_data;
         $.ajax({
					type: "post",
					url: new_url,
					type:'POST',
					dataType: 'json',
					success: function(data)
					{
					 if(data.status=='1')
					 {
					   ajax_data=0;
					   window.location.href = __cfg('path_absolute'); 
					   return false;
					 }
					},
				});
		    if(ajax_data==0)
			{
			 return false;
			}
        },
		helpers		: {
			title	: false
		}
	});

	$('.header-user a').click(function(){
		$('.notify-list').hide();
		$('.header-user ul').slideToggle();
		window.location.href=$(this).attr('href');
		return false;
	});
	$('body').click(function(){
		$('.header-user ul').hide();
	});
	
	$('.last a[href^="#"]').on('click', function(event) {
		var target = $($(this).attr('href') );
		if( target.length ) {
			event.preventDefault();
			$('html, body').animate({
			scrollTop: target.offset().top
			}, 1200);
		}
	});
	
	$('.addreview').click(function(){
		$(this).hide();
		$('.addcomments').show();
		$('.cancelreview').show();
	});
	$('.cancelreview').click(function(){
		$('.login-error').empty();
		$(this).hide();
		$('.addcomments').hide();
		$('.addreview').show();
	});
	
	$('.cancel-button').livequery('click',function(){
	parent.$.fancybox.close();	
	return false;	
	});
	$('.reset-button').livequery('click',function(){
     $(this).closest('form').find("input[type=text], textarea").val("");
     $(this).closest('form').find("input,textarea").each(function() {
		$(this).next('span').remove();
	 });	 
	 return false;	
	});
	
	
	$('#user-add-comment').livequery('submit',function(){
		var url=$("#user-add-comment").attr('action');
		var $this=$(this);
		$.ajax({
			type: "POST",
			url: url,
			data:$("#user-add-comment").serialize(),
			datatype:"json",
			success: function(data){
				var data=jQuery.parseJSON(data);
				if(data.status=="error") 
				{
					$("#user-add-comment input").each(function() {
						$(this).next('span').remove();
					});
					$("#custom_error").html('');
					if(data.sts=="custom_err")
					{
						alert_notification('error',data.msg);
					}
					else
					{
						
						$("#user-add-comment input").each(function() {
							$(this).next('span').remove();
					    	});
							$("#user-add-comment textarea").each(function() {
							$(this).next('span').remove();
					    	});
						$.each(data.errorfields,function(key, value){
							var error="<span class='login-error'>"+value.error+"</span>";
						  	$this.find("[name="+value.field+"]").after(error);
						});
						alert_notification('error','Please complete the mandatory fields..!');
					}
				}
				else
				{
					$("#user-add-comment input").each(function() {
							$(this).next('span').remove();
					});
					location.reload(true);
				}				
			}
		});
		return false;
	});
	
	
	$('#forgotpassword_url').livequery('submit',function(){
		var url=$("#forgotpassword_url").attr('action');
		var $this=$(this);
		$.ajax({
			type: "POST",
			url: url,
			data:$("#forgotpassword_url").serialize(),
			datatype:"json",
			success: function(data){
				var data=jQuery.parseJSON(data);
				if(data.status=="error") 
				{
					$("#forgotpassword_url input").each(function() {
						$(this).next('span').remove();
					});
					$("#custom_error").html('');
					if(data.sts=="custom_err")
					{
						alert_notification('error',data.msg);
					}
					else
					{
						
						$("#forgotpassword_url input").each(function() {
							$(this).next('span').remove();
					    	});
						$.each(data.errorfields,function(key, value){
							var error="<span class='login-error'>"+value.error+"</span>";
						  	$this.find("[name="+value.field+"]").after(error);
						});
						alert_notification('error','Please complete the mandatory fields..!');
					}
				}
				else
				{
					$("#forgotpassword_url input").each(function() {
							$(this).next('span').remove();
					});
					parent.$.fancybox.close();	
					window.location.href=data.url;
				}				
			}
		});
		return false;
	});
	
	
	$('#new_login_form_url').livequery('submit',function(){
		var url=$("#new_login_form_url").attr('action');
		var $this=$(this);
		$.ajax({
			type: "POST",
			url: url,
			data:$("#new_login_form_url").serialize(),
			datatype:"json",
			success: function(data){
				var data=jQuery.parseJSON(data);
				if(data.status=="error") 
				{
					$("#new_login_form_url input").each(function() {
						$(this).next('span').remove();
					});
					$("#custom_error").html('');
					if(data.sts=="custom_err")
					{
						alert_notification('error',data.msg);
					}
					else
					{
						
						$("#new_login_form_url input").each(function() {
							$(this).next('span').remove();
					    	});
						$.each(data.errorfields,function(key, value){
							var error="<span class='login-error'>"+value.error+"</span>";
						  	$this.find("[name="+value.field+"]").after(error);
						});
						alert_notification('error','Invalid Credentails.Please Try Again..!');
					}
				}
				else
				{
					$("#new_login_form_url input").each(function() {
							$(this).next('span').remove();
					});
					parent.$.fancybox.close();	
					window.location.href=data.url;
				}				
			}
		});
		return false;
	});
		
	$('#reset_form_url').livequery('submit',function(){
		var url=$("#reset_form_url").attr('action');
		var $this=$(this);
		$.ajax({
			type: "POST",
			url: url,
			data:$("#reset_form_url").serialize(),
			datatype:"json",
			success: function(data){
				var data=jQuery.parseJSON(data);
				if(data.status=="error") 
				{
					$("#reset_form_url input").each(function() {
						$(this).next('span').remove();
					});
					$("#custom_error").html('');
					if(data.sts=="custom_err")
					{
						alert_notification('error',data.msg);
					}
					else
					{
						
						$("#reset_form_url input").each(function() {
							$(this).next('span').remove();
					    	});
						$.each(data.errorfields,function(key, value){
							var error="<span class='login-error'>"+value.error+"</span>";
						  	$this.find("[name="+value.field+"]").after(error);
						});
						alert_notification('error','Invalid Credentails.Please Try Again');
					}
				}
				else
				{
					$("#reset_form_url input").each(function() {
							$(this).next('span').remove();
					});	
					window.location.href=data.url;
				}				
			}
		});
		return false;
	});
	
	$('#login_form_url').livequery('submit',function(){
		var url=$("#login_form_url").attr('action');
		var $this=$(this);
		$.ajax({
			type: "POST",
			url: url,
			data:$("#login_form_url").serialize(),
			datatype:"json",
			success: function(data){
				var data=jQuery.parseJSON(data);
				if(data.status=="error") 
				{
					$("#login_form_url input").each(function() {
						$(this).next('span').remove();
					});
					$("#custom_error").html('');
					if(data.sts=="custom_err")
					{
						$("#custom_error").addClass('login-error');
						$("#custom_error").html(data.msg+"<br/>");
					}
					else
					{
						
						$("#login_form_url input").each(function() {
							$(this).next('span').remove();
					    	});
						$.each(data.errorfields,function(key, value){
							var error="<span class='login-error'>"+value.error+"</span>";
						  	$this.find("[name="+value.field+"]").after(error);
						});
						alert_notification('error','Please complete the required fields.');
					}
				}
				else
				{
					$("#login_form_url input").each(function() {
							$(this).next('span').remove();
					});
					parent.$.fancybox.close();	
					alert_notification('success',data.msg);
				}				
			}
		});
		return false;
	});
	
	
	$('#new_change_form_url').livequery('submit',function(){
		
		var url=$("#new_change_form_url").attr('action');
		var $this=$(this);
		$.ajax({
			type: "POST",
			url: url,
			data:$("#new_change_form_url").serialize(),
			datatype:"json",
			success: function(data)
			{
				var data=jQuery.parseJSON(data);
				if(data.status=="error") 
				{
					$("#new_change_form_url input").each(function() {
						$(this).next('span').remove();
					});
					$("#custom_error").html('');
					if(data.sts=="custom_err")
					{
						var error="<span class='login-error'>"+data.error_msg+"</span>";
						$this.find("[name='old_password']").after(error);
						alert_notification('error',data.msg);
						return false;
					}
					else
					{
						
						$("#new_change_form_url input").each(function() {
							$(this).next('span').remove();
					    	});
						$.each(data.errorfields,function(key, value){
							var error="<span class='login-error'>"+value.error+"</span>";
						  	$this.find("[name="+value.field+"]").after(error);
						});
						alert_notification('error','Please Complete the mandatory fields..');
					}
				}
				else
				{
					$("#new_change_form_url input,textarea").each(function() {
							$(this).next('span').remove();
							if(!$(this).hasClass('no-change'))
							{
							$(this).val('');
							}
							
					});
					alert_notification('success',data.msg);
					
				}				
			}
		});
		return false;
	});
	
	
	$('#new_profile_form_url').livequery('submit',function(){
		var url=$("#new_profile_form_url").attr('action');
		var $this=$(this);
		var form = $('#new_profile_form_url')[0]; 
        var formData = new FormData(form);
        formData.append('name', $('#name').val());
		formData.append('contact_number',$('#contact_number').val());
		formData.append('email', $('#email').val());
		formData.append('image', $('input[type=file]')[0].files[0]); 

		$.ajax({
			type: "POST",
			url: url,
			data:formData,
			datatype:"json",
			contentType: false,
            processData: false,
			success: function(data){
				var data=jQuery.parseJSON(data);
				if(data.status=="error") 
				{
					$("#new_profile_form_url input").each(function() {
						$(this).next('span').remove();
					});
					$("#custom_error").html('');
					if(data.sts=="custom_err")
					{
						var error="<span class='login-error'>"+data.error_msg+"</span>";
						$this.find("[name='profile_image']").after(error);
						alert_notification('error',data.msg);
						return false;
					}
					else
					{
						
						$("#new_profile_form_url input").each(function() {
							$(this).next('span').remove();
					    	});
						$.each(data.errorfields,function(key, value){
							var error="<span class='login-error'>"+value.error+"</span>";
						  	$this.find("[name="+value.field+"]").after(error);
						});
						alert_notification('error','Please Complete the mandatory fields..');
					}
				}
				else
				{
					$("#new_profile_form_url input,textarea").each(function() {
							$(this).next('span').remove();
					});
					alert_notification('success',data.msg);
					
				}				
			}
		});
		return false;
	});

	
	
	
	$('#contact_form_url').livequery('submit',function(){
		var url=$("#contact_form_url").attr('action');
		var $this=$(this);
		$.ajax({
			type: "POST",
			url: url,
			data:$("#contact_form_url").serialize(),
			datatype:"json",
			success: function(data){
				var data=jQuery.parseJSON(data);
				if(data.status=="error") 
				{
					$("#contact_form_url input").each(function() {
						$(this).next('span').remove();
					});
					$("#custom_error").html('');
					if(data.sts=="custom_err")
					{
						alert_notification('error',data.msg);
					}
					else
					{
						
						$("#contact_form_url input").each(function() {
							$(this).next('span').remove();
					    	});
						$.each(data.errorfields,function(key, value){
							var error="<span class='login-error'>"+value.error+"</span>";
						  	$this.find("[name="+value.field+"]").after(error);
						});
						alert_notification('error','Please Complete the mandatory fields..');
					}
				}
				else
				{
					$("#contact_form_url input,textarea").each(function() {
							$(this).next('span').remove();
					});
					alert_notification('success',data.msg);
					$("#contact_form_url")[0].reset();
					
				}				
			}
		});
		return false;
	});
	
	
	$('#home-city').livequery('change',function(){
	var city_id=$('#home-city option:selected').text();
	if(city_id!='')
	{
		var url=__cfg('path_absolute')+"home/get_city_based_area?city="+city_id;
	   $.ajax({
			type: "POST",
			url: url,
			data:city_id,
			datatype:"json",
			success: function(data){
				var res="";
				var data=jQuery.parseJSON(data);
				$.each(data,function(key, value){
					res+="<option value='"+key+"'>"+value+"</option>"
				});
				$('#home-area').html(res);
                $('#home-area').selectric('refresh');
			}
		});	
     return false;
	}
    else
	{
		
		 return false;
	}		
	});
		
	$('#business_form_url').livequery('submit',function(){
		var url=$("#business_form_url").attr('action');
		var $this=$(this);
		$.ajax({
			type: "POST",
			url: url,
			data:$("#business_form_url").serialize(),
			datatype:"json",
			success: function(data)
			{
				var data=jQuery.parseJSON(data);
				if(data.status=="error") 
				{
					$("#business_form_url input").each(function() {
						$(this).next('span').remove();
					});
					$("#custom_error").html('');
					if(data.sts=="custom_err")
					{
						$("#custom_error").addClass('login-error');
						$("#custom_error").html(data.msg+"<br/>");
					}
					else
					{
						
						$("#business_form_url input").each(function() {
							$(this).next('span').remove();
					    	});
						$.each(data.errorfields,function(key, value){
							var error="<span class='login-error'>"+value.error+"</span>";
						  	$this.find("[name="+value.field+"]").after(error);
						});
						alert_notification('error','Please complete the required fields.');
					}
				}
				else
				{
					$("#business_form_url input").each(function() {
							$(this).next('span').remove();
					});
					alert_notification('success',data.msg);
					reset($this);
				}				
			}
		});
		return false;
	});
	
	
	$("#home-list").on("keyup",function()
	{
        var city_name=$('#home-city').val();
        var area_name=$('#home-area').val();
		
		$(this).autocomplete({
			source: __cfg('path_absolute')+'home/get_litings?city='+city_name+'&area='+area_name,
				select: function(event, ui) {
					if(ui.item.type=='cat')
					{
						$('#category_id').val(ui.item.id);
					}
					if(ui.item.type=='list_detail')
					{
						window.location.href=ui.item.url;
					}
			}
		}).data( "ui-autocomplete" )._renderItem = function( ul, item ){
			var inner_html = '<a id="'+ item.id +'"  href="javascript:void(0)">' + item.label + '</a>';
			return $("<li></li>")
			.data( "item.autocomplete", item )
			.append(inner_html)
			.appendTo( ul );
		}
	});

});
