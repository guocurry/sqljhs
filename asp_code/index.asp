<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="lingyi/infoinc/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=webname%></title>
<link href="style/home.css" rel="stylesheet" type="text/css" />
<script src="script/jquery.js"></script><script src="layer/layer.js"></script><script src="script/lycm.min.js"></script>
</head>

<body onload="init()">
<!--#include file="top.asp"-->
<div class="banner"></div>
<div class="body_show box">
	<div class="body_box left">
    <div class="body_box_main xxfb_box">
    	<ul>
        <%set rs=server.createobject("adodb.recordset")
rs.open "select top 8 * from news order by news_id desc",conn,1,1
if not rs.eof and not rs.bof then
while not rs.eof%>
        	<li><span class="href"><a href="show.asp?id=<%=rs(0)%>" title="<%=rs(1)%>"><%=rs(1)%></a></span><span><%=month(rs("news_time"))%>-<%=day(rs("news_time"))%></span></li>
<%
rs.movenext
wend
end if
rs.close
set rs=nothing
%>
        </ul>
    </div>
    <div class="body_box_title">信息发布<span>News</span></div>
    </div>
    <div class="body_box right sjtj">
    <div class="body_box_main"><a href="/statistics.asp"><img src="images/tj.gif" /></a></div>
    <div class="body_box_title">数据统计<span>Statistics</span></div>
    </div>
    <div class="cer"></div>
    <div class="body_box left fzjc">
    <div class="body_box_main xxfb_box">
        <ul>
        <%set rs=server.createobject("adodb.recordset")
rs.open "select top 8 * from fzjc order by news_id desc",conn,1,1
if not rs.eof and not rs.bof then
while not rs.eof%>
            <li><span class="href"><a href="show.asp?id=<%=rs(0)%>" title="<%=rs(1)%>"><%=rs(1)%></a></span><span><%=month(rs("news_time"))%>-<%=day(rs("news_time"))%></span></li>
<%
rs.movenext
wend
end if
rs.close
set rs=nothing
%>
        </ul>
    </div>
    <div class="body_box_title">辅助决策<span>Assist Decision</span></div>
    </div>
    <div class="body_box right map">
    <div class="body_box_main" id="map" style="height:230px;"></div>
    <div class="body_box_title">垃圾地图<span>Garbage Map</span></div>
    </div>
    <div class="cer"></div>
</div>
<script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp"></script>
<script>
var citylocation,map,marker = null;
var init = function() {
    var center = new qq.maps.LatLng(39.916527,116.397128);
    map = new qq.maps.Map(document.getElementById('map'),{
        center: center,
        zoom: 13
    });
    citylocation = new qq.maps.CityService({
        complete : function(result){
            map.setCenter(result.detail.latLng);
        }
    });
    citylocation.searchLocalCity();
}
</script>
<!--#include file="fot.asp"-->
<%conn.close
set conn=nothing%>
</body>
</html>
