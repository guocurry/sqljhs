<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%set conn=server.createobject("ADODB.CONNECTION")
ConnStr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("/lingyi/db/tongji.asp") 
conn.open ConnStr%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
zhuti=request.Form("zhuti")
fubiaoti=request.Form("fubiaoti")
s_title=request.Form("s_title")
s_title=request.Form("s_title")
%>
<title>统计图表</title>
<script src="/sel_js/jquery-1.11.3.min.js"></script>

</head>

<body>
<div id="container">
            <div class="demo" id="highcharts"></div>
</div>
        <script src="/box/js/highcharts.js"></script>
        <script src="/box/js/modules/exporting.js"></script>
        <script type="text/javascript">
    $(function() { 
	var t_title="垃圾停机";
	var t_small_title="副标题";
	var t_danwei="万吨"
	var t_ytitle="123";
	var t_nianfen=[ '2005', '2006', '2007', '2008', '2009', '2010','2011', '2012', '2013', '2014', '2015', '2016','2005', '2006', '2007', '2008', '2009', '2010','2011', '2012', '2013', '2014', '2015', '2016' ] ;
    $('#highcharts').highcharts({ 
        chart: { 
            type: 'column' 
        }, 
        title: {
            text: t_title
        }, 
        subtitle: {
            text: t_small_title
        }, 
        xAxis: {
            categories: t_nianfen
        }, 
        yAxis: {
            min: 0, 
            title: {
                text:t_ytitle 
            } 
        }, 
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>', 
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' + '<td style="padding:0"><b>{point.y:.1f} '+t_danwei+'</b></td></tr>', 
            footerFormat: '</table>', 
            shared: true, 
            useHTML: true 
        }, 
        plotOptions: { //数据点选项 
            column: { 
                pointPadding: 0.2, 
                borderWidth: 0 
            } 
        }, 
        series: [{ //数据列选项 
            name: '全国', 
            data: [49.9, 71.5, 106.4, 129.2,49.9, 71.5, 106.4, 129.2,49.9, 71.5, 106.4, 129.2,49.9, 71.5, 106.4, 129.2,49.9, 71.5, 106.4, 129.2,49.9, 71.5, 106.4, 129.2] //数组或JSON，如：data:[0, 5, 3, 5]，或data: [{name: 'Point 1',y: 0}, {name: 'Point 2',y: 5}] 
        }], 
        credits: { 
            enabled: false
        }, 
        exporting: { 
            enabled: false 
        }, 
    }); 
});
        </script>
<%conn.close
set conn=nothing%>
</body>
</html>
