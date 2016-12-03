<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#Include file="../lingyi/infoinc/conn.asp"--><!--#Include file="../lingyi/infoinc/md5.asp"-->
<%
zhanghao=request.Form("zhanghao")
password=request.Form("password")
passwords=request.Form("passwords")
passwordss=request.Form("passwordss")
if request.Cookies("laji_yonghu")="" then
response.Write "err"
else if passwords<>passwordss then
response.Write "pass"
else
set rs=server.createobject("adodb.recordset")
rs.open "select * from lj_huiyuan where zhanghao='"&request.Cookies("laji_yonghu")&"' and password='"&md5(password)&"'",conn,1,3
if not rs.eof and not rs.bof then
rs("password")=md5(passwords)
rs.update
response.Write "ok"
else
response.Write "err"
end if
rs.close
set rs=nothing
end if
end if
conn.close
set conn=nothing%>
