<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="lingyi/infoinc/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
id=request.QueryString("id")
if id="" or not isnumeric(id) then
oid=0
ttt="信息发布"
else
oid=id
set rst=server.createobject("adodb.recordset")
rst.open "select * from news_s_class where id="&id,conn,1,1
if not rst.eof and not rst.bof then
ttt=rst(1)&" - 信息发布"
else
ttt="信息发布"
end if
rst.close
set rst=nothing
end if
%>
<title><%=ttt%></title>
<link href="style/home.css" rel="stylesheet" type="text/css" />
<script src="script/jquery.js"></script><script src="layer/layer.js"></script><script src="script/lycm.min.js"></script>
</head>

<body>
<!--#include file="top.asp"-->
<div class="news_box box">
<%if request.QueryString("u")<>"" then%><div style="margin-bottom:8px;">搜索“<%=request.QueryString("u")%>”的结果如下：</div><%end if%>
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
    	 <%
 set rs=server.createobject("adodb.recordset")
if request.QueryString("u")="" then
if oid=0 then
rs.open "select * from news order by news_id desc ",conn,1,1
else
rs.open "select * from news where news_class="&oid&" order by news_id desc ",conn,1,1
end if
else
rs.open "select * from news where news_title like '%"&RemoveHTML(request.QueryString("u"))&"%' order by news_id desc ",conn,1,1
end if
if rs.eof and rs.bof then
response.Write "<div style='height:300px;'>暂无此类信息！</div>"
else
listnum=15
Rs.pagesize=listnum
page=Request("page")
if (page-Rs.pagecount) > 0 then
page=rs.pagecount
elseif page = "" or page < 1 then
page = 1
end if
rs.absolutepage=page
j=rs.recordcount
j=j-(page-1)*listnum
i=0
nn=request("page")
if nn="" then
n=0
else
nn=nn-1
n=listnum*nn
end if
do while not rs.eof and i<listnum
n=n+1%>
        <div class="news_list">
        	<a href="show.asp?id=<%=rs(0)%>&cid=<%=rs(6)%>"><%=rs(1)%></a>
            <p><%=formatdatetime(rs("news_time"),vbshortdate)%></p>
            <p class="lab"><%set rss=server.createobject("adodb.recordset")
rss.open "select * from news_s_class where id ="&rs(6),conn,1,1
if rss.eof and rss.bof then
response.Write "数据处理有误"
else
%>
<a href="news.asp?id=<%=rs(6)%>" style="background-color:<%=rss("yanse")%>"><%=rss(1)%></a>
<%end if
rss.close
set rss=nothing%></p>
        </div>
<%rs.movenext 
i=i+1 
j=j-1
loop%>
<div class="pagin">
   	   <div class="message">共<i class="blue"><%=rs.recordcount%></i>条记录，当前显示第&nbsp;<i class="blue"><%=page%>&nbsp;</i>页</div>
        <ul class="paginList">
        <% if page=1 then
		else%>
         <li class="paginItem"><a href="<%=filename%>?id=<%=id%>&page=1"><span class="pagepre">&nbsp;</span></a></li>
       <li class="paginItem"><a href="<%=filename%>?id=<%=id%>&page=<%=page-1%>"><%=page-1%></a></li>
        <%end if%>
        <% if rs.pagecount=1 then%>
                <%else%>
                <li class="paginItem current"><a href="javascript:;"><%=page%></a></li>
                <%end if%>
                <% if rs.pagecount-page <> 0 then %>
                <li class="paginItem"><a href="<%=filename%>?id=<%=id%>&page=<%=page+1%>"><%=page+1%></a></li>
               <li class="paginItem"><a href="<%=filename%>?id=<%=id%>&page=<%=page+1%>"><span class="pagenxt">&nbsp;</span></a></li>
        <!--
        <li class="paginItem more"><a href="javascript:;">...</a></li>
        -->
        <%end if%>
        <div class="cer"></div>
        </ul>
        <div class="cer"></div>
    </div>
 <%end if
 rs.close
 set rs=nothing%>
    </div>
    <div class="cer"></div>
</div>
<!--#include file="fot.asp"-->
<script>
window.onload=function(){
	$(".news_nav").height($(".news_info").height());
	}
</script>
<%conn.close
set conn=nothing%>
</body>
</html>
