<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 

</head>

<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  
<div class="logintop">    
    <span>欢迎登录</span>
    <ul>
    <li><a href="/">回首页</a></li>
    </ul>    
    </div>
    <div class="loginbody">
    <span class="systemlogo"></span> 
    <div class="loginbox">
    <form id="logins" name="form1" method="post" action="lok.asp">
    <ul>
    <li><input name="name" type="text" class="loginuser" value="帐号" onclick="JavaScript:this.value=''"/></li>
    <li><input name="pwd" type="text" class="loginpwd" value="密码" onclick="JavaScript:this.value=''"/></li>
    <li><input name="" type="button" class="loginbtn" value="登录" id="login"  /></li>
    </ul>
    </form>
    
    </div>
    
    </div>
    
    
    
    <div class="loginbm">版权所有  2013   </div>
	
<script>
$(function(){
	$("#login").click(function(){
		if($(".loginuser").val()=="" || $(".loginpwd").val()==""){
			alert("请输入账号/密码");return false;
			}else{
				$("#logins").submit();
				}
		})
	})
</script>   
</body>
</html>
