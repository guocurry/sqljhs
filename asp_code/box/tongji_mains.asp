<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%zhuti=request.Form("zhuti")
shuxing=request.Form("shuxing")
kaishi=request.Form("kaishi")
jieshu=request.Form("jieshu")
tjclass=request.Form("tjclass")
if len(zhuti)=1 then
if shuxing=3 or shuxing=4 then%>
<iframe src="/box/tongji_main_bing.asp?zhuti=<%=zhuti%>&shuxing=<%=shuxing%>&kaishi=<%=kaishi%>&jiesu=<%=jieshu%>" width="100%" frameborder="0" height="440px"></iframe>
<%else
if tjclass=2 and isnumeric(tjclass) then%>
<iframe src="/box/tongji_main_xian.asp?zhuti=<%=zhuti%>&shuxing=<%=shuxing%>&kaishi=<%=kaishi%>&jiesu=<%=jieshu%>" width="100%" frameborder="0" height="440px"></iframe>
<%else%>
<iframe src="/box/tongji_main.asp?zhuti=<%=zhuti%>&shuxing=<%=shuxing%>&kaishi=<%=kaishi%>&jiesu=<%=jieshu%>" width="100%" frameborder="0" height="440px"></iframe>
<%end if
end if
else
if tjclass=2 and isnumeric(tjclass) then%>
<iframe src="/box/tongji_main_xian.asp?zhuti=<%=zhuti%>&shuxing=<%=shuxing%>&kaishi=<%=kaishi%>&jiesu=<%=jieshu%>" width="100%" frameborder="0" height="440px"></iframe>
<%else%>
<iframe src="/box/tongji_main.asp?zhuti=<%=zhuti%>&shuxing=<%=shuxing%>&kaishi=<%=kaishi%>&jiesu=<%=jieshu%>" width="100%" frameborder="0" height="440px"></iframe>
<%end if%><%end if%>