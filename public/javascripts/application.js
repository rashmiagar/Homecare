// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//= require jquery
//= require bootstrap
document.write('<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>');


function validateChangePassword()
{
var x=document.forms["change_password_form"]["old_password"].value;
if (x==null || x=="")
  {
  alert("PLease enter the old password");
  return false;
  }


var y=document.forms["change_password_form"]["new_password"].value;
if (y==null || y=="")
  {
  alert("PLease enter the new password");
  return false;
  }

var z=document.forms["change_password_form"]["confirm_password"].value;
if (z==null || z=="")
  {
  alert("PLease enter confirmation password");
  return false;
  }

//var x=document.forms["change_password_form"]["confirm_password"].value;
//var y=document.forms["change_password_form"]["new_password"].value;
if (z!=y)
  {
  alert("New password does not match confirm password");
  return false;
  }
 if(x==y)
  {
  alert("New password cannot be same as old password. Please choose a different password.");
  return false;
  }

 
}

function validateLogin()
{
  //alert("hello");
var x=document.forms["login_form"]["username"].value;
//alert(x);
if (x==null || x=="")
  {
  alert("Please enter the username !!! ");
  return false;
  }


var y=document.forms["login_form"]["password"].value;
if (y==null || y=="")
  {
  alert("Please enter the password !!!");
  return false;
  } 
}


