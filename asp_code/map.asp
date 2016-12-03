<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="lingyi/infoinc/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>垃圾地图</title>
<link href="style/home.css" rel="stylesheet" type="text/css" />
<script src="script/jquery.js"></script><script src="layer/layer.js"></script><script src="script/lycm.min.js"></script>
</head>

<body>
<!--#include file="top.asp"-->
<div class="map_wrap">
	<div class="map_wrap_nav left">
    	<h3>选择数据分类</h3>
        <ul>
        	<li><a href="javascript:;" onclick="loadmap(1)">垃圾监管设施数据</a></li>
            <li><a href="javascript:;" onclick="loadmap(2)" class="lj">垃圾设施数据</a></li>
        </ul>
    </div>
    <div class="map_wrap_content left">
    	<div class="map-wrap-box">
    	<div class="map_search"><input type="hidden" id="jg_num_s" value="" /><input type="hidden" id="lj_num_s" value="" />
        	<div class="map_search_box"><!--<input type="text" class="map_search_input" id="map_search_txt" placeholder="输入地区搜索" /><a href="#">搜索</a>
            --><a href="javascript:;" style="display:none;" onclick="hidemap(1)" title="点击取消此数据" id="jg_map_btn">垃圾监管设施 X</a><a id="lj_map_btn" style="display:none;" href="javascript:;" onclick="hidemap(2)" title="点击取消此数据">垃圾设施 X</a></div>
            <div class="cer"></div>
        </div>
        <%maps=request.QueryString()
		if maps="online" then
		maps="map_content.asp?jg=1"
		else
		maps="map_content.asp"
		end if%>
    	<div class="map_content"><iframe id="map_form" src="<%=maps%>" width="100%" height="800" frameborder="0"></iframe></div>
        </div>
    </div>
    <div class="cer"></div>
</div>
<!--#include file="fot.asp"-->
<script>
window.onload=function(){
	$(".map_wrap_nav").height($(".map_wrap_content").height());
	$(".map_wrap_content").width(document.body.offsetWidth-231);
	}
function loadmap(a){
	if(a==1){
	$("#jg_num_s").val(1);
	$("#jg_map_btn").show();
	$("#map_form").attr("src","map_content.asp?jg=1&lj="+$("#lj_num_s").val());
	}else{
	$("#lj_num_s").val(1);	
	$("#lj_map_btn").show();
	$("#map_form").attr("src","map_content.asp?jg="+$("#jg_num_s").val()+"&lj=1");
		}
	}
function hidemap(a){
	if(a==1){
	$("#jg_num_s").val("");
	$("#jg_map_btn").hide();
	$("#map_form").attr("src","map_content.asp?jg=&lj="+$("#lj_num_s").val());
	}else{
	$("#lj_num_s").val("");	
	$("#lj_map_btn").hide();
	$("#map_form").attr("src","map_content.asp?jg="+$("#jg_num_s").val()+"&lj=");
		}
	}
</script>
<%conn.close
set conn=nothing%>
</body>
</html>
