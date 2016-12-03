<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
response.Cookies("laji_yonghu")=""
Response.Cookies("laji_yonghu").Expires= (now()-1)
response.Redirect "/"
%>