<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="infoinc/conn.asp"-->
<!--#include file="infoinc/login.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="/">首页</a></li>
    </ul>
    </div>
    
    <div class="mainindex">
    
    
    <div class="welinfo">
    <span><img src="images/sun.png" alt="天气" /></span>
    <b><%=request.Cookies("68admin_net_name")%>你好，欢迎使用信息管理系统</b>
    </div>
    
    <div class="welinfo">
    <span><img src="images/time.png" alt="时间" /></span>
    <i>现在的时间是：<%=now()%></i>
    </div>
    <div class="xline"></div>
    <div class="box"></div>
    
    </div>
</body>
</html>
