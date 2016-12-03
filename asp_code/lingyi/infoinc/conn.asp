<%
Response.CodePage=65001
Response.Charset="utf-8"
set conn=server.createobject("ADODB.CONNECTION")
ConnStr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("/lingyi/db/www.lycm.net.cn@#$%^&.asp") 
conn.open ConnStr
set rs=server.createobject("adodb.recordset")
rs.open "select * from 68_webmessage",conn,1,1
if not rs.eof and not rs.bof then
webname=rs("webname")
webkey=rs("keyword")
webcopy=rs("copy")
webinfo=rs("info")
weblogo=rs("logo")
end if
rs.close
set rs=nothing
Function RemoveHTML(strHTML)
Dim objRegExp, Match, Matches
Set objRegExp = New Regexp
objRegExp.IgnoreCase = True
objRegExp.Global = True
objRegExp.Pattern = "<.+?>"
Set Matches = objRegExp.Execute(strHTML)
For Each Match in Matches
strHtml=Replace(strHTML,Match.Value,"")
Next
RemoveHTML=strHTML
Set objRegExp = Nothing
End Function
SQL_injdata =":|;|>|<|--|sp_|xp_|\|dir|cmd|^|(|)|+|$|'|copy|format|and|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare"

SQL_inj = split(SQL_Injdata,"|")
If Request.QueryString<>"" Then
For Each SQL_Get In Request.QueryString
For SQL_Data=0 To Ubound(SQL_inj)
if instr(Request.QueryString(SQL_Get),Sql_Inj(Sql_DATA))>0 Then
Response.Write "No Found"
Response.end
end if
next
Next
End If


%>





