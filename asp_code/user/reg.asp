<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#Include file="../lingyi/infoinc/conn.asp"-->
<%
zhanghao=request.Form("zhanghao")
xingming=request.Form("xingming")
danwei=request.Form("danwei")
dianhua=request.Form("dianhua")
youxiang=request.Form("youxiang")
if request.Cookies("laji_yonghu")="" then
response.Write "err"
else
set rs=server.createobject("adodb.recordset")
rs.open "select * from lj_huiyuan where zhanghao='"&request.Cookies("laji_yonghu")&"'",conn,1,3
if not rs.eof and not rs.bof then
rs("xingming")=xingming
rs("danwei")=danwei
rs("dianhua")=dianhua
rs("youxiang")=youxiang
rs.update
response.Write "ok"
else
response.Write "err"
end if
rs.close
set rs=nothing
end if
conn.close
set conn=nothing%>
