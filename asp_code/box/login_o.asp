<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
    <!--#include file="../lingyi/infoinc/conn.asp"-->
    <!--#include file="../lingyi/infoinc/md5.asp"-->
<%
zhanghao=request.Form("zhanghao")
password=request.Form("password")
if zhanghao="" or password="" then
response.Write "err"
else
set rs=server.createobject("adodb.recordset")
rs.open "select * from lj_huiyuan where zhanghao='"&zhanghao&"' and password='"&md5(password)&"'",conn,1,3
if not rs.eof and not rs.bof then
rs("logintime")=now()
rs.update
response.Cookies("laji_yonghu")=zhanghao
Response.Cookies("laji_yonghu").Expires= (now()+7)
response.Write "ok"
else
RESPONSE.Write "pass"
end if
rs.close
set rs=nothing
end if
conn.close
set conn=nothing
%>