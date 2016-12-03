<%
dim Sdcms_Root,Sdcms_DataFile,Sdcms_DataName,Sdcms_DataType,Sdcms_SqlHost,Sdcms_SqlData,Sdcms_SqlUser,Sdcms_SqlPass,Is_sql,Connstr,Conn,now_xueyuan
	Sdcms_SqlHost="118.244.206.78"
	Sdcms_SqlData="diyache"
	Sdcms_SqlUser="sa"
    Sdcms_SqlPass="vlvkhzyspsh"
Is_sql=Sdcms_DataType
	ConnStr="Provider=Sqloledb;User ID="&Sdcms_SqlUser&";Password="&Sdcms_SqlPass&";Initial CataLog="&Sdcms_SqlData&";Data Source="&Sdcms_SqlHost&";"
Set Conn=Server.CreateObject("ADODB.Connection")
Conn.Open ConnStr
IF Err Then
	Echo "err"
	Closedb
	Err.Clear
	Died
End If
sub CloseConn()
	conn.close
	set conn=nothing
end sub

weiurl="http://wx.lycm.net.cn"
%>