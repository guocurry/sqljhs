<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="infoinc/Conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
<%
userip = Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
If userip = "" Then
userip = Request.ServerVariables("REMOTE_ADDR")
Private Function getIP()
Dim strIPAddr
If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" OR InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), "unknown") > 0 Then
strIPAddr = Request.ServerVariables("REMOTE_ADDR")
ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",") > 0 Then
strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",")-1) 
ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";") > 0 Then 
strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";")-1) 
Else 
strIPAddr = Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
End If 
getIP = Trim(Mid(strIPAddr, 1, 30)) 
End Function
end if
UserName=Replace(Request.Form("Name"), "'", "''")
UserPwd=request.Form("Pwd")
CheckCode = Trim(Request.Form("CheckCode"))
set rs=server.createobject("adodb.recordset") 
rs.open "select * from 68hudong_loginadmin where users='"&UserName& "' and pwd='"&UserPwd&"'",conn,1,3  
If rs.eof or rs.bof then 
Response.Write("<script language=javascript>alert('帐号密码错误!');history.go(-1);document.login.Name.focus();</script>")

else 
response.Cookies("68admin_net_name")=rs("users") 
response.Cookies("68admin_net_lv")=rs("type")
'session("AdminIp")=getIP()
'session("AdminNum")=rs("User_Fq")
rs("logintime")=now()
'rs("User_Ip")=getIP()
'rs("User_Fq")=rs("User_Fq")+1
rs.update
rs.close
response.Redirect("main.asp")
End If
%>
</body>
</html>
