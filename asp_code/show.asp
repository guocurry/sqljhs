<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="lingyi/infoinc/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%id=request.QueryString("id")
if id="" or not isnumeric(id) then
response.Redirect "news.asp"
end if
set rs=server.createobject("adodb.recordset")
rs.open "select * from news where news_id="&id,conn,1,1
if not rs.eof and not rs.bof then%>
<title><%=rs(1)%> - 信息发布</title>
<link href="style/home.css" rel="stylesheet" type="text/css" />
<script src="script/jquery.js"></script><script src="layer/layer.js"></script><script src="script/lycm.min.js"></script>
</head>

<body>
<!--#include file="top.asp"-->
<div class="news_box box">
	<div class="news_nav left">
    	<ul>
<%set rst=server.createobject("adodb.recordset")
rst.open "select * from news_s_class order by id",conn,1,1
if not rst.eof and not rst.bof then
while not rst.eof%>
        	<li><a href="news.asp?id=<%=rst(0)%>" title="<%=rst(1)%>"><%=rst(1)%></a></li>
<%
rst.movenext
wend
end if
rst.close
set rst=nothing
%>        </ul>
    </div>
    <div class="news_info right">
    	<div class="news_show">
        	<h1><%=rs(1)%></h1>
            <p class="time"><%=formatdatetime(rs("news_time"),vbshortdate)%></p>
            <div class="news_infobox"><%=rs("news_content")%></div>
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
