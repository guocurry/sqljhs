<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="infoinc/login.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>领艺后台系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})
})	
</script>
</head>

<body style="background:url(images/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="lingyi.asp" target="_parent"><img src="images/logo.png" title="系统首页" /></a>
    </div>
        
    <ul class="nav">
    <li><a href="lingyi.asp" target="rightFrame" class="selected" onclick="parent.leftFrame.disp(1,'工作台');"><img src="images/icon01.png" title="工作台" /><h2>工作台</h2></a></li>
    <li><a href="gonglue.asp" target="rightFrame" onclick="parent.leftFrame.disp(2,'信息管理');"><img src="images/icon02.png" title="信息管理" /><h2>信息管理</h2></a></li>
   <%if request.Cookies("68admin_net_lv")=1 then%> <li><a href="user.asp"  target="rightFrame" onclick="parent.leftFrame.disp(3,'用户管理');"><img src="images/icon03.png" title="用户管理" /><h2>用户管理</h2></a></li><%end if%>
    <li><a href="tongji.asp" target="rightFrame" onclick="parent.leftFrame.disp(6,'数据统计');"><img src="images/icon05.png" title="数据统计" /><h2>数据统计</h2></a></li>
    <li><a href="pro.asp"  target="rightFrame"  onclick="parent.leftFrame.disp(4,'数据管理');"><img src="images/icon04.png" title="数据管理" /><h2>数据管理</h2></a></li><!--
    <li><a href="tab.html"  target="rightFrame"><img src="images/icon06.png" title="系统设置" /><h2>系统设置</h2></a></li>-->
    </ul>
            
    <div class="topright">    
    <ul>

    <li><a href="lout.asp" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span><%=request.Cookies("68admin_net_name")%></span>
   <i>欢迎你&nbsp;&nbsp;</i>
   <!--<b></b>-->
    </div>    
    
    </div>
</body>
</html>
