<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="infoinc/conn.asp"-->
<!--#include file="infoinc/login.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>领艺后台系统 www.lycm.net.cn</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">网站基本信息管理</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>网站基本信息</span>
      
      
    </div>
    <%
	set rs=server.createobject("adodb.recordset")
rs.open "select * from 68_webmessage",conn,1,1
if not rs.eof and not rs.bof then
	%>
    <form id="form1" name="form1" method="post" action="?act=ok">
    <ul class="forminfo">
    <li><label>网站名称</label><input type="text" name="webname" class="dfinput" maxlength="200" value="<%=rs(2)%>" /><i>名称不能超过200个字符</i></li>
    <li><label>关键字</label><input name="keyword" type="text" class="dfinput" value="<%=rs(0)%>" /><i>多个关键字用,隔开</i></li>
    <li><label>网站描述</label><textarea name="info" cols="" rows="" class="textinput" style="height:60px;"><%=rs("info")%></textarea></li>
    
    <li><label>网站版权</label><textarea name="copy" cols="" rows="" class="textinput" style="height:60px;"><%=rs(3)%></textarea></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
    </ul>
    </form>
    <%
	end if
	rs.close
	set rs=nothing
	%>
</div>
<%
if request.QueryString("act")="ok" then
set rsv=server.createobject("adodb.recordset")
rsv.open "select * from 68_webmessage",conn,1,3
rsv(0)=request.Form("keyword")
'rsv(1)=request.Form("logo")
rsv(2)=request.Form("webname")
rsv(3)=request.Form("copy")
rsv("info")=request.Form("info")
rsv.update
rsv.close
set rsv=nothing
Response.Write("<script>alert(""修改成功！"");javascript:window.location.href='webmessage.asp';</script>")
end if
%>
</body>
</html>
<%conn.close
set conn=nothing%>
