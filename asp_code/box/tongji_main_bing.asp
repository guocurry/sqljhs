<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%set conn=server.createobject("ADODB.CONNECTION")
ConnStr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("/lingyi/db/tongji.asp") 
conn.open ConnStr
zhuti=request("zhuti")
shuxing=request("shuxing")
kaishi=request("kaishi")
if kaishi="" then
kaishi=year(date())-5
end if
jieshu=request("jiesu")
if jieshu="" then
jieshu=year(date())
end if
for i=kaishi to jieshu
nianfen=nianfen&i&","
next
if shuxing="" or not isnumeric(shuxing) then
set rs=server.createobject("adodb.recordset")
rs.open "select top 1 * from shuxing order by id",conn,1,1
if not rs.eof and not rs.bof then
shuxing=rs(0)
shuxing_tt=rs(1)
shuxing_danwei=rs(2)
end if
rs.close
set rs=nothing
else
set rs=server.createobject("adodb.recordset")
rs.open "select top 1 * from shuxing where id="&shuxing,conn,1,1
if not rs.eof and not rs.bof then
shuxing=rs(0)
shuxing_tt=rs(1)
shuxing_danwei=rs(2)
end if
rs.close
set rs=nothing
end if
%>



































































































































































































































































































<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<script src="/sel_js/jquery-1.11.3.min.js"></script>
<body>
<style>.demo{ font-family:"Microsoft YaHei UI"}</style>
<div id="container">
            <div class="demo" id="highcharts"><div style="text-align:center; color:#999;"><img src="images/loading.gif" width="40" /><p>统计数据加载中</p></div></div>
</div>
        <script src="/box/js/highcharts.js"></script>
        <script src="/box/js/modules/exporting.js"></script>
        <script type="text/javascript">
$(function () {

    $(document).ready(function () {

        // Build the chart
        $('#container').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: '<%=shuxing_tt%>'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true
                    },
                    showInLegend: true
                },
            },
            series: [<%set rs=server.createobject("adodb.recordset")
		if zhuti="" or not isnumeric(zhuti) or zhuti=0 then
rs.open "select top 1 * from zhuti where top=1 order by id",conn,1,1
else
rs.open "select * from zhuti where id in("&zhuti&")",conn,1,1
end if
if not rs.eof and not rs.bof then%>{
                name: '<%=rs(1)%>',
                colorByPoint: true,
                data: [<%for i=kaishi to jieshu
				set rss=server.createobject("adodb.recordset")
rss.open "select * from statistical where nianfen ="&i&" and shuxing in("&shuxing&") and zhuti="&rs(0)&" order by id desc",conn,1,1
if not rss.eof and not rss.bof then%>{
                    name: '<%=i%>',
                    y: <%=rss("info")%>
                },<%else%>{
                    name: '<%=i%>',
                    y: 0
                },
				<%end if
				rss.close
				set rss=nothing
				next%>]
            }<%end if
				rs.close
				set rs=nothing%>],credits: { 
            enabled: false
        }, 
        exporting: { 
            enabled: false 
        },
        });
    });
});
		</script>
        </body>
</html>
<%conn.close
set conn=nothing%>

