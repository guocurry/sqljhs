<!--#include file="weblo.asp"-->
<%
sub moderr()
response.Write "<a href='javascript:history.back(-1)' title=返回上一页>返回上一页</a>"
end sub
sub errbg()
response.Write "<img src='skins/images/err.gif' width='70' height='57' align='absmiddle' />"
end sub
sub okbg()
response.Write "<img src='skins/images/ok.gif' width='70' height='57' align='absmiddle' />"
end sub
sub warnbg()
response.Write "<img src='skins/images/warn.gif' width='70' height='57' align='absmiddle' />"
end sub
%>
