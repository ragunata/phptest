<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There area two reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router what URI segments to use if those provided
| in the URL cannot be matched to a valid route.
|
*/



/* Admin Paths */

//Activities
$route[ADMIN.'/activities'] = 'activities/index';
$route[ADMIN.'/activities/add'] = 'activities/add';
$route[ADMIN.'/activities/getActivities'] = 'activities/getActivities';
$route[ADMIN.'/activities/edit/(:any)'] = 'activities/edit/$1';
$route[ADMIN.'/activities/delete/(:any)'] = 'activities/delete/$1';//1 deleted id
$route[ADMIN.'/activities/bulkautions/(:any)/(:any)'] = 'activities/bulkautions/$1/$2';
$route[ADMIN.'/activities/enable/(:any)/(:any)/(:any)'] = 'activities/update_status/$1/enable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/activities/disable/(:any)/(:any)/(:any)'] = 'activities/update_status/$1/disable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/activities/(:any)'] = 'activities/index/$1';
$route[ADMIN.'/activities/(:any)/(:any)/(:any)'] = 'activities/index/$1/$2/$3';
//Activities

//Messages
$route[ADMIN.'/messages'] = 'messages/index';
$route[ADMIN.'/messages/add'] = 'messages/add';
$route[ADMIN.'/messages/reply'] = 'messages/reply';
$route[ADMIN.'/messages/view_reply/(:any)'] = 'messages/view/$1';
$route[ADMIN.'/messages/delete/(:any)'] = 'messages/delete/$1';//1 deleted id
$route[ADMIN.'/messages/(:any)'] = 'messages/index/$1';
$route[ADMIN.'/messages/(:any)/(:any)/(:any)'] = 'messages/index/$1/$2/$3';
//Messages

//currency 
$route[ADMIN.'/currencies'] = 'currencies/index';
$route[ADMIN.'/currencies/edit'] = 'currencies/edit';
$route[ADMIN.'/currencies/edit/(:any)'] = 'currencies/edit/$1';
$route[ADMIN.'/currencies/(:any)'] = 'currencies/index/$1';
$route[ADMIN.'/currency/enable/(:any)/(:any)/(:any)'] = 'currencies/update_status/$1/enable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/currency/disable/(:any)/(:any)/(:any)'] = 'currencies/update_status/$1/disable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/currencies/(:any)/(:any)/(:any)'] = 'currencies/index/$1/$2/$3';
$route[ADMIN.'/currencies/get'] = 'currencies/get';
//currency

//bids
$route[ADMIN.'/bids'] = 'bids/index';
$route[ADMIN.'/bids/edit'] = 'bids/edit';
$route[ADMIN.'/bids/edit/(:any)'] = 'bids/edit/$1';
$route[ADMIN.'/bids/(:any)'] = 'bids/index/$1';
$route[ADMIN.'/bids/enable/(:any)/(:any)/(:any)'] = 'bids/update_status/$1/enable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/bids/disable/(:any)/(:any)/(:any)'] = 'bids/update_status/$1/disable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/bids/(:any)/(:any)/(:any)'] = 'bids/index/$1/$2/$3';
$route[ADMIN.'/bids/get'] = 'bids/get';
$route[ADMIN.'/bid/view/(:any)'] = 'bids/view/$1';

//Countries
$route[ADMIN.'/countries'] = 'countries/index';
$route[ADMIN.'/countries/add'] = 'countries/add';
$route[ADMIN.'/countries/edit/(:any)'] = 'countries/edit/$1';
$route[ADMIN.'/countries/delete/(:any)'] = 'countries/delete/$1';//1 deleted id
$route[ADMIN.'/countries/bulkautions/(:any)/(:any)'] = 'countries/bulkautions/$1/$2';
$route[ADMIN.'/countries/enable/(:any)/(:any)/(:any)'] = 'countries/update_status/$1/enable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/countries/disable/(:any)/(:any)/(:any)'] = 'countries/update_status/$1/disable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/countries/(:any)'] = 'countries/index/$1';
$route[ADMIN.'/countries/(:any)/(:any)/(:any)'] = 'countries/location_list/$1/$2/$3';
$route[ADMIN.'/getcountries'] = 'countries/get';// Auto complete 
//Countries

//States
$route[ADMIN.'/states'] = 'states/index';
$route[ADMIN.'/states/add'] = 'states/add';
$route[ADMIN.'/states/edit/(:any)'] = 'states/edit/$1';
$route[ADMIN.'/getstates'] = 'states/get'; // Auto complete 
$route[ADMIN.'/states/delete/(:any)'] = 'states/delete/$1';//1 deleted id
$route[ADMIN.'/getstates/(:any)'] = 'states/get_states_by_country/$1'; // Auto complete 
$route[ADMIN.'/states/bulkautions/(:any)/(:any)'] = 'states/bulkautions/$1/$2';
$route[ADMIN.'/states/enable/(:any)/(:any)/(:any)'] = 'states/update_status/$1/enable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/states/disable/(:any)/(:any)/(:any)'] = 'states/update_status/$1/disable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/states/(:any)'] = 'states/index/$1';
$route[ADMIN.'/states/(:any)/(:any)/(:any)'] = 'states/location_list/$1/$2/$3';
//States

//Cities
$route[ADMIN.'/cities'] = 'cities/index';
$route[ADMIN.'/cities/add'] = 'cities/add';
$route[ADMIN.'/cities/edit/(:any)'] = 'cities/edit/$1';
$route[ADMIN.'/getcities'] = 'cities/get';// Auto complete 
$route[ADMIN.'/cities/delete/(:any)'] = 'cities/delete/$1';//1 deleted id
$route[ADMIN.'/getcities/(:any)'] = 'cities/get_cities_by_state/$1'; // Auto complete 
$route[ADMIN.'/cities/bulkautions/(:any)/(:any)'] = 'cities/bulkautions/$1/$2';
$route[ADMIN.'/cities/enable/(:any)/(:any)/(:any)'] = 'cities/update_status/$1/enable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/cities/disable/(:any)/(:any)/(:any)'] = 'cities/update_status/$1/disable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/cities/en_featured/(:any)/(:any)/(:any)'] = 'cities/update_featured/$1/featured/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/cities/en_unfeatured/(:any)/(:any)/(:any)'] = 'cities/update_featured/$1/unfeatured/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/cities/en_start_your/(:any)/(:any)/(:any)'] = 'cities/update_en_start_your/$1/featured/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/cities/en_unstart_your/(:any)/(:any)/(:any)'] = 'cities/update_en_start_your/$1/unfeatured/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/cities/(:any)'] = 'cities/index/$1';
$route[ADMIN.'/cities/(:any)/(:any)/(:any)'] = 'cities/location_list/$1/$2/$3';
//Cities
$route[ADMIN.'/city_view/view/(:any)'] = 'cities/view/$1';
//Areas
$route[ADMIN.'/areas'] = 'areas/index';
$route[ADMIN.'/areas/add'] = 'areas/add';
$route[ADMIN.'/areas/edit/(:any)'] = 'areas/edit/$1';
$route[ADMIN.'/areas/delete/(:any)'] = 'areas/delete/$1';//1 deleted id
$route[ADMIN.'/getareas/(:any)'] = 'areas/get_areas_by_city/$1'; // Auto complete 
$route[ADMIN.'/areas/bulkautions/(:any)/(:any)'] = 'areas/bulkautions/$1/$2';
$route[ADMIN.'/areas/enable/(:any)/(:any)/(:any)'] = 'areas/update_status/$1/enable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/areas/disable/(:any)/(:any)/(:any)'] = 'areas/update_status/$1/disable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/areas/(:any)'] = 'areas/index/$1';
$route[ADMIN.'/areas/(:any)/(:any)/(:any)'] = 'areas/location_list/$1/$2/$3';/**/
//Areas

//Admin user befor login
$route[ADMIN] = 'user/index';
$route[ADMIN.'/signup'] = 'user/signup';
$route[ADMIN.'/create_member'] = 'user/create_member';
$route[ADMIN.'/login'] = 'user/index';
$route[ADMIN.'/logout'] = 'user/logout';
$route[ADMIN.'/forgotpassword'] = 'user/forgotpassword_form';
$route[ADMIN.'/reset/(:any)'] = 'user/resetpassword/$1';
$route[ADMIN.'/resetpassword'] = 'user/updatepassword';


//Admin user general paths
$route[ADMIN.'/dashboard'] = 'user/dashboard';
$route[ADMIN.'/settings'] = 'user/settings';
$route[ADMIN.'/settings/update'] = 'user/settings_update';
$route[ADMIN.'/change_password'] = 'user/change_password';
$route[ADMIN.'/edit_profile'] = 'user/edit_profile';
$route[ADMIN.'/calendar_events'] = 'user/calendar_events';
$route[ADMIN.'/add_events'] = 'user/add_events';
$route[ADMIN.'/edit_events/(:any)'] = 'user/edit_events/$1';
//users change password
$route[ADMIN.'/(:any)/change_password/(:any)'] = 'user/other_change_password/';

//hotel users
$route[ADMIN.'/hotels'] = 'hotelusers/index';

$route[ADMIN.'/hotel_banners/add/(:any)'] = 'hotelusers/banners_add/$1';
$route[ADMIN.'/hotel_banners/view/(:any)'] = 'hotelusers/view/$1';
$route[ADMIN.'/hotel_banners/edit/(:any)'] = 'hotelusers/banners_edit/$1';
$route[ADMIN.'/hotels/bulkautions/(:any)/(:any)'] = 'hotelusers/bulkautions/$1/$2';

$route[ADMIN.'/hotel_banners/enable/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)'] = 'hotelusers/update_banner_status/$1/$2/enable/$3/$4/$5/$6';//$2-status,$3-page no
$route[ADMIN.'/hotel_banners/disable/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)'] = 'hotelusers/update_banner_status/$1/$2/disable/$3/$4/$5/$6';//$2-status,$3-page no

$route[ADMIN.'/hotel_banners/(:any)/(:any)/(:any)/(:any)/(:any)'] = 'hotelusers/banners/$1/$2/$3/$4/$5';
$route[ADMIN.'/hotel_banners/bulkactions/(:any)/(:any)'] = 'hotelusers/banner_bulkactions/$1/$2';

$route[ADMIN.'/hotels/add'] = 'hotelusers/add';
$route[ADMIN.'/hotels/update'] = 'hotelusers/update';
$route[ADMIN.'/hotels/edit/(:any)'] = 'hotelusers/edit/$1';
$route[ADMIN.'/hotels/view/(:any)'] = 'hotelusers/hotel_view/$1';
$route[ADMIN.'/hotels/enable/(:any)/(:any)/(:any)'] = 'hotelusers/update_status/$1/enable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/hotels/disable/(:any)/(:any)/(:any)'] = 'hotelusers/update_status/$1/disable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/hotels/approve/(:any)/(:any)/(:any)'] = 'hotelusers/update_approve_status/$1/approve/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/hotels/disapprove/(:any)/(:any)/(:any)'] = 'hotelusers/update_approve_status/$1/disapprove/$2/$3';//$2-status,$3-pageno
$route[ADMIN.'/hotels/delete/(:any)'] = 'hotelusers/delete/$1';
$route[ADMIN.'/hotel_banners/delete/(:any)'] = 'hotelusers/delete_banner/$1';
$route[ADMIN.'/hotels/(:any)'] = 'hotelusers/index/$1'; //$1 = page number
$route[ADMIN.'/hotels/(:any)/(:any)/(:any)'] = 'hotelusers/index/$1/$2/$3';
//hotel users

//web users
$route[ADMIN.'/users'] = 'webusers/index';
$route[ADMIN.'/users/add'] = 'webusers/add';
$route[ADMIN.'/users/update'] = 'webusers/update';
$route[ADMIN.'/users/update/(:any)'] = 'webusers/update/$1';
$route[ADMIN.'/users/delete/(:any)'] = 'webusers/delete/$1';
$route[ADMIN.'/users/edit/(:any)'] = 'webusers/edit/$1';
$route[ADMIN.'/users/view/(:any)'] = 'webusers/view/$1';
$route[ADMIN.'/users/bulkautions/(:any)/(:any)'] = 'webusers/bulkautions/$1/$2';
$route[ADMIN.'/users/enable/(:any)/(:any)/(:any)'] = 'webusers/update_status/$1/enable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/users/disable/(:any)/(:any)/(:any)'] = 'webusers/update_status/$1/disable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/users/approve/(:any)/(:any)/(:any)'] = 'webusers/update_approve_status/$1/approve/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/users/disapprove/(:any)/(:any)/(:any)'] = 'webusers/update_approve_status/$1/disapprove/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/users/delete/(:any)'] = 'hotelusers/delete/$1';
$route[ADMIN.'/users/(:any)'] = 'webusers/index/$1';
//web users

//Subadmin
$route[ADMIN.'/subadmin'] = 'subadmin/index';
$route[ADMIN.'/subadmin/add'] = 'subadmin/add';
$route[ADMIN.'/subadmin/update'] = 'subadmin/update';
$route[ADMIN.'/subadmin/update/(:any)'] = 'subadmin/update/$1';
$route[ADMIN.'/subadmin/delete/(:any)'] = 'subadmin/delete/$1';
$route[ADMIN.'/subadmin/edit/(:any)'] = 'subadmin/edit/$1';
$route[ADMIN.'/subadmin/view/(:any)'] = 'subadmin/view/$1';
$route[ADMIN.'/subadmin/bulkautions/(:any)/(:any)'] = 'subadmin/bulkautions/$1/$2';
$route[ADMIN.'/subadmin/enable/(:any)/(:any)/(:any)'] = 'subadmin/update_status/$1/enable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/subadmin/disable/(:any)/(:any)/(:any)'] = 'subadmin/update_status/$1/disable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/subadmin/approve/(:any)/(:any)/(:any)'] = 'subadmin/update_approve_status/$1/approve/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/subadmin/disapprove/(:any)/(:any)/(:any)'] = 'subadmin/update_approve_status/$1/disapprove/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/subadmin/delete/(:any)'] = 'hotelusers/delete/$1';
$route[ADMIN.'/subadmin/(:any)'] = 'subadmin/index/$1';
//Subadmin

//amenities
$route[ADMIN.'/amenties'] = 'amenities/index';
$route[ADMIN.'/amenties/add'] = 'amenities/add';
$route[ADMIN.'/amenties/getAmenties'] = 'amenities/getAmenties';
$route[ADMIN.'/amenties/edit/(:any)'] = 'amenities/edit/$1';
$route[ADMIN.'/amenties/delete/(:any)'] = 'amenities/delete/$1';//1 deleted id
$route[ADMIN.'/amenties/bulkautions/(:any)/(:any)'] = 'amenities/bulkautions/$1/$2';
$route[ADMIN.'/amenties/enable/(:any)/(:any)/(:any)'] = 'amenities/update_status/$1/enable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/amenties/new-request/(:any)/(:any)/(:any)'] = 'amenities/update_status/$1/new-request/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/amenties/disable/(:any)/(:any)/(:any)'] = 'amenities/update_status/$1/disable/$2/$3';//$2-status,$3-page no
$route[ADMIN.'/amenties/(:any)'] = 'amenities/index/$1';
$route[ADMIN.'/amenties/(:any)/(:any)/(:any)'] = 'amenities/index/$1/$2/$3';
//amenities

$route[ADMIN.'/comments'] = 'comments/index';
$route[ADMIN.'/comments/getReports'] = 'comments/getReports';
$route[ADMIN.'/comments/delete/(:any)'] = 'comments/delete/$1';//1 deleted id
$route[ADMIN.'/comments/bulkautions/(:any)/(:any)'] = 'comments/bulkautions/$1/$2';
$route[ADMIN.'/comments/(:any)'] = 'comments/index/$1';
$route[ADMIN.'/comments/(:any)/(:any)/(:any)'] = 'comments/index/$1/$2/$3';
$route[ADMIN.'/comment_view/view/(:any)'] = 'comments/view/$1';
$route[ADMIN.'/comment_delete/delete/(:any)'] = 'comments/delete/$1';
$route[ADMIN.'/comments_enable/enable/(:any)/(:any)/(:any)'] = 'comments/update_status/$1/enable/$2/$3';
$route[ADMIN.'/comments_enable/disable/(:any)/(:any)/(:any)'] = 'comments/update_status/$1/disable/$2/$3';


//plans
$route[ADMIN.'/plans'] = 'plans/index';
$route[ADMIN.'/plans/edit/(:any)'] = 'plans/edit/$1';
//plans

//pages
$route[ADMIN.'/site_maps'] = 'site_maps/index';
$route[ADMIN.'/site_maps/category'] = 'site_maps/category';
//pages

#site Maps
$route[ADMIN.'/pages'] = 'pages/index';
$route[ADMIN.'/pages/edit/(:any)'] = 'pages/edit/$1';
$route[ADMIN.'/pages/(:any)'] = 'pages/index/$1';
$route[ADMIN.'/pages/(:any)/(:any)/(:any)'] = 'pages/index/$1/$2/$3';

//User Logins
$route[ADMIN.'/user_logins'] = 'user_logins/index';
$route[ADMIN.'/user_logins/delete/(:any)'] = 'user_logins/delete/$1';//1 deleted id
$route[ADMIN.'/user_logins/bulkautions/(:any)/(:any)'] = 'user_logins/bulkautions/$1/$2';
$route[ADMIN.'/user_logins/(:any)'] = 'user_logins/index/$1';
$route[ADMIN.'/user_logins/(:any)/(:any)/(:any)'] = 'user_logins/index/$1/$2/$3';
//User Logins


$route[ADMIN.'/orders'] = 'orders/index';
$route[ADMIN.'/orders/view/(:any)'] = 'orders/view/$1'; //$1 = page number
$route[ADMIN.'/orders/(:any)'] = 'orders/index/$1';
$route[ADMIN.'/orders/(:any)/(:any)/(:any)'] = 'orders/index/$1/$2/$3';

/* End Admin Paths */


/* Site Paths */
$route['forgot_password'] = 'home/forgot_password';
$route['reset_password/(:any)'] = 'home/reset_password';
$route['login'] = 'home/register/$1';
$route['user_login'] = 'home/login/$1';
$route['register'] = 'home/register/$1';
$route['users/verify/(:any)'] = 'home/verify/$1';
$route['google_login'] = 'site_webusers/google_login';
$route['logout'] = 'home/logout';
$route['signup'] = 'home/register';
$route['facebook'] = 'home/facebook';
$route['twitter'] = 'home/twitter';
$route['googleplus'] = 'home/googleplus';
$route['privacy-policy'] = 'home/get_pages';
$route['terms-and-conditions'] = 'home/get_pages';
$route['about-us'] = 'home/get_pages';
$route['contact-us'] = 'home/contact_us';
$route['my_profile'] = 'home/my_profile';

#Advertisment
$route[ADMIN.'/advertisments'] = 'advertisments/index';
$route[ADMIN.'/advertisments/getReports'] = 'advertisments/getReports';
$route[ADMIN.'/advertisments/delete/(:any)'] = 'advertisments/delete/$1';//1 deleted id
$route[ADMIN.'/advertisments/bulkautions/(:any)/(:any)'] = 'advertisments/bulkautions/$1/$2';
$route[ADMIN.'/advertisment_view/view/(:any)'] = 'advertisments/view/$1';
$route[ADMIN.'/advertisment_delete/delete/(:any)'] = 'advertisments/delete/$1';
$route[ADMIN.'/advertisment_enable/enable/(:any)/(:any)/(:any)'] = 'advertisments/update_status/$1/enable/$2/$3';
$route[ADMIN.'/advertisment_enable/disable/(:any)/(:any)/(:any)'] = 'advertisments/update_status/$1/disable/$2/$3';
$route[ADMIN.'/advertisment_edit/edit/(:any)'] = 'advertisments/edit/$1';
$route[ADMIN.'/advertisments/edit/(:any)'] = 'advertisments/edit/$1';
$route[ADMIN.'/advertisments/(:any)'] = 'advertisments/index/$1';
$route[ADMIN.'/advertisments/(:any)/(:any)/(:any)'] = 'advertisments/index/$1/$2/$3';
#Categories
$route[ADMIN.'/categories'] = 'categories/index';
$route[ADMIN.'/categories/getReports'] = 'categories/getReports';
$route[ADMIN.'/categories/delete/(:any)'] = 'categories/delete/$1';//1 deleted id
$route[ADMIN.'/categories/bulkautions/(:any)/(:any)'] = 'categories/bulkautions/$1/$2';
$route[ADMIN.'/category_view/view/(:any)'] = 'categories/view/$1';
$route[ADMIN.'/category_delete/delete/(:any)'] = 'categories/delete/$1';
$route[ADMIN.'/category_enable/enable/(:any)/(:any)/(:any)'] = 'categories/update_status/$1/enable/$2/$3';
$route[ADMIN.'/category_enable/disable/(:any)/(:any)/(:any)'] = 'categories/update_status/$1/disable/$2/$3';
$route[ADMIN.'/categories/add'] = 'categories/add';
$route[ADMIN.'/categories/edit/(:any)'] = 'categories/edit/$1';
$route[ADMIN.'/categories/(:any)'] = 'categories/index/$1';
$route[ADMIN.'/categories/(:any)/(:any)/(:any)'] = 'categories/index/$1/$2/$3';




#Main Categories
$route[ADMIN.'/main_category'] = 'main_categories/index';
$route[ADMIN.'/main_category/getReports'] = 'main_categories/getReports';
$route[ADMIN.'/main_category/delete/(:any)'] = 'main_categories/delete/$1';//1 deleted id
$route[ADMIN.'/main_category/bulkautions/(:any)/(:any)'] = 'main_categories/bulkautions/$1/$2';
$route[ADMIN.'/main_category_view/view/(:any)'] = 'main_categories/view/$1';
$route[ADMIN.'/main_category_delete/delete/(:any)'] = 'main_categories/delete/$1';
$route[ADMIN.'/main_category_enable/enable/(:any)/(:any)/(:any)'] = 'main_categories/update_status/$1/enable/$2/$3';
$route[ADMIN.'/main_category_enable/disable/(:any)/(:any)/(:any)'] = 'main_categories/update_status/$1/disable/$2/$3';
$route[ADMIN.'/main_category/add'] = 'main_categories/add';
$route[ADMIN.'/main_category/edit/(:any)'] = 'main_categories/edit/$1';
$route[ADMIN.'/main_category/(:any)'] = 'main_categories/index/$1';
$route[ADMIN.'/main_category/(:any)/(:any)/(:any)'] = 'main_categories/index/$1/$2/$3';


#Contact Us
$route[ADMIN.'/contact_us'] = 'contactus/index';
$route[ADMIN.'/contact_us/delete/(:any)'] = 'contactus/delete/$1';//1 deleted id
$route[ADMIN.'/contact_us/bulkautions/(:any)/(:any)'] = 'contactus/bulkautions/$1/$2';
$route[ADMIN.'/contact_us/view/(:any)'] = 'contactus/view/$1';
$route[ADMIN.'/contact_us/delete/(:any)'] = 'contactus/delete/$1';
$route[ADMIN.'/contact_us/(:any)'] = 'contactus/index/$1';
$route[ADMIN.'/contact_us/(:any)/(:any)/(:any)'] = 'contactus/index/$1/$2/$3';


#Import Datas
$route[ADMIN.'/import_datas'] = 'import_datas/index';


#Listings
$route['business/(:any)/(:any)'] = 'listings/view/$1/$2';
$route['business/(:any)/(:any)/(:any)'] = 'listings/view/$1/$2/$3';
$route['business/(:any)/(:any)/(:any)'] = 'listings/view/$1/$2/$3';
$route['search/(:any)/(:any)'] = 'listings/index/$1/$2';
$route['search/(:any)'] = 'listings/index/$1';
$route['category-search/(:any)/(:any)'] = 'listings/index/$1/$2';
$route['category-search/(:any)'] = 'listings/index/$1';
$route['default_controller'] = "welcome";
$route['404_override'] = '';
$route['register-your-business']='listings/add';
$route['home-search/(:any)'] = 'listings/index/$1';


?>