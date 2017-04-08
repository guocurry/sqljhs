<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="infoinc/login.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>领艺后台系统 www.lycm.net.cn</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
function disp(n,txt){
		$("#lefttt").html("<span></span>"+txt);
		$(".leftmenu .leftnav").hide();
		$("#leftnav_"+n).show();
	}
</script>

</head>


<body style="background:#f0f9fd;">
	<div class="lefttop" id="lefttt"><span></span>领艺传媒</div>
    
    <dl class="leftmenu">
        <div id="leftnav_1" class="leftnav">
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>管理信息
    </div>
    	<ul class="menuson">
        <%if request.Cookies("68admin_net_lv")=1 then%>
        <li><cite></cite><a href="webmessage.asp" target="rightFrame">网站基本信息管理</a><i></i></li>
        <li><cite></cite><a href="admin.asp" target="rightFrame">后台帐号管理</a><i></i></li>
      
        <li><cite></cite><a href="page.asp" target="rightFrame">单页管理</a><i></i></li>
         <li><cite></cite><a href="page_class.asp" target="rightFrame">单页分类管理</a><i></i></li>
         <%end if%>
        </ul>    
    </dd>
    
    <dd>
   
    </dd> 
    </div>
    <div id="leftnav_2" style="display:none;" class="leftnav">
    	<dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>新闻管理
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="gonglue.asp" target="rightFrame">新闻管理</a><i></i></li>
        <li><cite></cite><a href="gonglue_class.asp" target="rightFrame">分类管理</a><i></i></li>
        </ul>    
    </dd>
    </div>
    
    <div id="leftnav_3" style="display:none;" class="leftnav">
    	<dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>用户管理
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="user.asp" target="rightFrame">用户管理</a><i></i></li>
        </ul>    
    </dd>
    </div>
    <div id="leftnav_6" style="display:none;" class="leftnav">
    	<dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>数据统计
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="zhuti.asp" target="rightFrame">主体管理</a><i></i></li>
        <li><cite></cite><a href="shuxing.asp" target="rightFrame">属性管理</a><i></i></li>
        <li><cite></cite><a href="tongji.asp" target="rightFrame">数据统计</a><i></i></li>
        </ul>    
    </dd>
    </div>
    <div id="leftnav_5" style="display:none;" class="leftnav">
    	 <dd><div class="title"><span><img src="images/leftico01.png" /></span>数据管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="user.asp" target="rightFrame">产品管理</a><i></i></li>
         <li><cite></cite><a href="users.asp" target="rightFrame">产品管理</a><i></i></li>
        
    </ul>
    
    </dd>  
    
    
     
    </div>
    <div id="leftnav_4" style="display:none;" class="leftnav">
    	 <dd><div class="title"><span><img src="images/leftico01.png" /></span>产品管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="pro.asp" target="rightFrame">设施信息</a><i></i></li>
        <li><cite></cite><a href="fzjc.asp" target="rightFrame">辅助决策</a><i></i></li>
        
    </ul>
    
    </dd>  
    
 
    </div>
    </dl>
    
</body>
</html>
