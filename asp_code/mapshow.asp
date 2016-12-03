<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="lingyi/infoinc/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%id=request.QueryString("id")
if id="" or not isnumeric(id) then
response.Redirect "map.asp"
end if
set rs=server.createobject("adodb.recordset")
rs.open "select * from map where id="&id,conn,1,1
if not rs.eof and not rs.bof then%>
<title><%=rs("ssmc")%> - 垃圾地图</title>
<link href="style/home.css" rel="stylesheet" type="text/css" />
<script src="script/jquery.js"></script><script src="layer/layer.js"></script><script src="script/lycm.min.js"></script>
<style>.map_content_show{ margin-top:20px; margin-bottom:20px;}.map_content_show b{ font-size:14px;}</style>
</head>

<body>
<!--#include file="top.asp"-->
<div class="news_box box">
	
    <div class="news_info" style="width:960px;">
    	<div class="news_show">
        	<h1><%=rs("ssmc")%></h1>
            <p class="time"><%=formatdatetime(rs("addtime"),vbshortdate)%></p>
            <div class="map_content_show">
            	  <table width="100%" border="0" cellpadding="10" cellspacing="0">
            	    <tr>
            	      <td width="18%" align="right"><b>设施类型：</b></td>
            	      <td width="34%"><%=rs("sslx")%></td>
                      <%if rs("class")=1 then%>
            	      <td width="19%" align="right"><b>设施技术路线：</b></td>
            	      <td width="29%"><%=rs("sslx")%></td>
          	      	<%end if%>
                  </tr>
            	    <tr>
            	      <td align="right"><b>设施所在城市：</b></td>
            	      <td><%=rs("sszzcs")%></td>
            	      <td width="19%"  align="right"><b>设施所在地区：</b></td>
            	      <td width="29%"><%=rs("ssszq")%></td>
          	      </tr>
            	    <tr>
            	      <td align="right"><b>管理部门：</b></td>
            	      <td><%=rs("glbm")%></td>
            	      <td align="right"></td>
            	      <td>&nbsp;</td>
          	      </tr>
            	    <tr>
            	      <td align="right"><b>运营商：</b></td>
            	      <td><%=rs("yys")%></td>
                      <%if rs("class")=1 then%>
            	      <td align="right"><b>运营商电话：</b></td>
            	      <td><%=rs("yysdh")%></td>
                      <%end if%>
          	      </tr>
            	    <tr>
            	      <td align="right"><b>处理能力：</b></td>
            	      <td><%=rs("clnl")%></td>
            	      <td align="right"><b>建成年份：</b></td>
            	      <td><%=rs("jcnf")%></td>
          	      </tr>
            	    <tr>
            	      <td align="right"><b>使用年限：</b></td>
            	      <td><%=rs("synx")%></td>
            	      <td align="right"><b>占地面积：</b></td>
            	      <td><%=rs("zdmj")%></td>
          	      </tr>
            	    <tr>
            	      <td align="right"><b>照片：</b></td>
            	      <td><%if rs("zp")<>"" then%><a href="<%=rs("zp")%>" target="_blank"><img src="<%=rs("zp")%>" style="max-width:300px;max-height:200px;" /></a><%end if%></td>
            	      <td align="right"><b>卫星影像：</b></td>
            	      <td><%if rs("wxyx")<>"" then%><a href="<%=rs("wxyx")%>" target="_blank"><img src="<%=rs("wxyx")%>" style="max-width:300px;max-height:200px;" /></a><%end if%></td>
          	      </tr>
                  <%if rs("class")=1 then%>
            	    <tr>
            	      <td align="right"><b>管理员姓名：</b></td>
            	      <td>&nbsp;</td>
            	      <td align="right"><b>管理员电话：</b></td>
            	      <td>&nbsp;</td>
          	      </tr>
            	    <tr>
            	      <td align="right"><b>处理量：</b></td>
            	      <td>&nbsp;</td>
            	      <td align="right"><b>运行情况：</b></td>
            	      <td>&nbsp;</td>
          	      </tr>
            	    <tr>
            	      <td align="right"><b>监控摄像头：</b></td>
            	      <td>&nbsp;</td>
            	      <td>&nbsp;</td>
            	      <td>&nbsp;</td>
          	      </tr>
<%end if%>
          	    </table>
            </div>
      </div>
    </div>
    <div class="cer"></div>
</div>
<!--#include file="fot.asp"-->
<script>
window.onload=function(){
	$(".news_nav").height($(".news_info").height());
	}
</script>
<%
else
response.Write "参数有误，或没有此信息！"
end if
rs.close
set rs=nothing
conn.close
set conn=nothing%>
</body>
</html>
