<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="lingyi/infoinc/conn.asp"-->
<%
Dim sqmc,sqsf,sqcs,sqrk,sqlx,sqmj,rjlj,rlj,nlj,sqrk_s,sqldmj,sqcyljbl,sqkhsljbl,sqqtljbl,sqcyljrscl,sqkhsljrscl,sqqtljrscl,sjzfljflyy,sqglzljflyy,sqjmljflyy
sqmc=request.Form("sqmc")
sqsf=request.Form("sqsf")
sqcs=request.Form("sqcs")
sqrk=request.Form("sqrk")
sqlx=request.Form("sqlx")
sqmj=request.Form("sqmj")
rjlj=request.Form("rjlj")
rlj=request.Form("rlj")
nlj=request.Form("nlj")
sqrk_s=request.Form("sqrk_s")
sqldmj=request.Form("sqldmj")
sqcyljbl=request.Form("sqcyljbl")
sqkhsljbl=request.Form("sqkhsljbl")
sqqtljbl=request.Form("sqqtljbl")
sqcyljrscl=request.Form("sqcyljrscl")
sqkhsljrscl=request.Form("sqkhsljrscl")
sqqtljrscl=request.Form("sqqtljrscl")
sjzfljflyy=request.Form("sjzfljflyy")
sqglzljflyy=request.Form("sqglzljflyy")
sqjmljflyy=request.Form("sqjmljflyy")
set rs=server.createobject("adodb.recordset")
rs.open "select * from fzjc",conn,1,3
rs.addnew
rs(1)=sqmc
rs(2)=sqsf
rs(3)=sqcs
rs(4)=sqrk
rs(5)=sqrk_s
rs(6)=sqlx
rs(7)=sqmj
rs(8)=sqldmj
rs(9)=rjlj
rs(10)=rlj
rs(11)=nlj
rs(12)=sqcyljbl
rs(13)=sqkhsljbl
rs(14)=sqqtljbl
rs(15)=sqcyljrscl
rs(16)=sqkhsljrscl
rs(17)=sqqtljrscl
rs(18)=sjzfljflyy
rs(19)=sqglzljflyy
rs(20)=sqjmljflyy
rs(21)=now()
rs.update
response.Write("ok")
rs.close
set rs=nothing
conn.close
set conn=nothing%>