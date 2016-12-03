<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="../lingyi/infoinc/conn.asp"--><!--#include file="../lingyi/infoinc/md5.asp"-->
<%
zhanghao=request.Form("zhanghao")
password=request.Form("password")
passwords=request.Form("passwords")
xingming=request.Form("xingming")
danwei=request.Form("danwei")
dianhua=request.Form("dianhua")
youxiang=request.Form("youxiang")
if zhanghao="" or password="" or xingming="" or danwei="" or dianhua="" or youxiang="" then
response.Write "err"
else if password<>passwords then
response.Write "pass"
else
set rs=server.createobject("adodb.recordset")
rs.open "select * from lj_huiyuan where zhanghao='"&zhanghao&"'",conn,1,3
if not rs.eof and not rs.bof then
response.Write "zhanghao"
else
rs.addnew
rs("zhanghao")=zhanghao
rs("password")=md5(password)
rs("xingming")=xingming
rs("danwei")=danwei
rs("dianhua")=dianhua
rs("youxiang")=youxiang
rs("addtime")=now()
rs("logintime")=now()
rs.update
response.Cookies("laji_yonghu")=zhanghao
Response.Cookies("laji_yonghu").Expires= (now()+7)
response.Write "ok"
end if
rs.close
set rs=nothing
end if
end if
conn.close
set conn=nothing
%>