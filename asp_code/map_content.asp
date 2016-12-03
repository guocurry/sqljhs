<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="lingyi/infoinc/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>垃圾地图</title>
<%jg=request.QueryString("jg")
lj=request.QueryString("lj")
if jg="" or not isnumeric(jg) then
jg=""

end if
if lj="" or not isnumeric(lj) then
lj=""

end if%>
<style type="text/css">*{margin:0px;   padding:0px;}body, button, input, select, textarea {   font: 12px/16px Verdana, Helvetica, Arial, sans-serif;}
#container{min-width:600px;min-height:767px;}.showboxtip a{ color:#900;}.showboxtip{ margin-top:15px;}.showboxtip p{ margin-top:10px;}.showboxtip img{ max-width:260px; max-height:160px;}
.showboxtip p.btn a{ display:block; height:30px; line-height:30px; text-align:center; text-decoration:none; font-family:"Microsoft YaHei UI"; background-color:#06C; color:#FFF; }
.showboxtip p.btn a:hover{ background-color:#F30;}
</style>
<script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp"></script>
<script>
function init() {
    var center = new qq.maps.LatLng(39.916527,116.397128);
    var map = new qq.maps.Map(document.getElementById("container"), {
        center: center,
        zoom:4
    });
    var infoWin = new qq.maps.InfoWindow({
        map: map
    });
    var latlngs = [<%if jg="" and lj="" then%><%else%><%set rs=server.createobject("adodb.recordset")
if jg="" and lj<>"" then
rs.open "select class,map,id from map where class=0 order by id desc",conn,1,1
else if jg<>"" and lj="" then
rs.open "select class,map,id from map where class=1 order by id desc",conn,1,1
else
rs.open "select map,id from map order by id desc",conn,1,1
end if
end if
if not rs.eof and not rs.bof then
while not rs.eof%>
        new qq.maps.LatLng(<%=rs("map")%>),
<%rs.movenext
wend
end if
rs.close
set rs=nothing%><%end if%>];
	var mes = [<%if jg="" and lj="" then%><%else%><%set rs=server.createobject("adodb.recordset")
if jg="" and lj<>"" then
rs.open "select class,ssmc,zp,sszzcs,ssszq,sslx,glbm,id from map where class=0 order by id desc",conn,1,1
else if jg<>"" and lj="" then
rs.open "select class,ssmc,zp,sszzcs,ssszq,sslx,glbm,id from map where class=1 order by id desc",conn,1,1
else
rs.open "select class,ssmc,zp,sszzcs,ssszq,sslx,glbm,id from map order by id desc",conn,1,1
end if
end if
if not rs.eof and not rs.bof then
while not rs.eof%>"<h3><%=rs("ssmc")%></h3><%if rs("zp")<>"" then%><p><img src='<%=rs("zp")%>'></p><%end if%><p>所在地区：<%=rs("sszzcs")%>-<%=rs("ssszq")%></p><p>设施类型：<%=rs("sslx")%></p><p>管理部门：<%=rs("glbm")%></p><p class='btn'><a href='/mapshow.asp?id=<%=rs("id")%>' target='_blank'>查看详细</a></p>",<%rs.movenext
wend
end if

rs.close
set rs=nothing%><%end if%>]
var ico = [<%if jg="" and lj="" then%><%else%><%set rs=server.createobject("adodb.recordset")
if jg="" and lj<>"" then
rs.open "select class,id from map where class=0 order by id desc",conn,1,1
else if jg<>"" and lj="" then
rs.open "select class,id from map where class=1 order by id desc",conn,1,1
else
rs.open "select class,id from map order by id desc",conn,1,1
end if
end if
if not rs.eof and not rs.bof then
while not rs.eof%><%if rs("class")=0 then%>0<%else%>1<%end if%>,<%rs.movenext
wend
end if

rs.close
set rs=nothing%><%end if%>]
    for(var i = 0;i < latlngs.length; i++) {
        (function(n){
            var marker = new qq.maps.Marker({
                position: latlngs[n],
				icon: '/images/lj'+ico[n]+'.png',
                map: map
            });
            qq.maps.event.addListener(marker, 'click', function() {
                infoWin.open();
                infoWin.setContent('<div class="showboxtip" style="white-space:'+
                'nowrap;"> ' +
                mes[n] + ' </div>');
                infoWin.setPosition(latlngs[n]);
            });
        })(i);
    }
}
</script>
</head>

<body onload="init();">
<div id="container"></div>
<%conn.close
set conn=nothing%>
</body>
</html>
