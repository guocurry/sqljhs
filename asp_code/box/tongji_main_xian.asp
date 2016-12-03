<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%set conn=server.createobject("ADODB.CONNECTION")
ConnStr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("/lingyi/db/tongji.asp") 
conn.open ConnStr
zhuti=request("zhuti")
shuxing=request("shuxing")
kaishi=request("kaishi")
jieshu=request("jiesu")
if kaishi="" then
kaishi=year(date())-5
end if
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
	var t_title="<%=shuxing_tt%>";
	var t_small_title="<%=kaishi%> - <%=jieshu%>";
	var t_danwei="<%=shuxing_danwei%>"
	var t_ytitle="<%=shuxing_danwei%>";
	var t_nianfen=[<%for i=kaishi to jieshu%>'<%=i%>',<%next%>] ;
    var options = ({
        chart: {
            type: 'spline',
            renderTo:'container'
        },
		title: {
            text:t_title
        },
        subtitle: {
            text: t_small_title
        },
        xAxis: {
            categories:t_nianfen,
            labels:{
            	enabled:true
            }
        },
        yAxis: {
            title: {
                text: t_danwei
            },
            labels: {
                formatter: function() {
                    return this.value
                },
                enabled:true
            },
            gridLineWidth:1
        },
        credits:{
        	  enabled: false
        },
        tooltip: {
            crosshairs: true,
            shared: true
        },
        legend:{
        	enabled:true
        },
        plotOptions: {
            spline: {
                marker: {
                    radius: 4,
                    lineColor: '#666666',
                    lineWidth: 1
                },
                animation:false
            }
        },
        series: [<%set rs=server.createobject("adodb.recordset")
		if zhuti="" or not isnumeric(zhuti) or zhuti=0 then
rs.open "select top 15 * from zhuti where top=1 order by id",conn,1,1
else
rs.open "select * from zhuti where id in("&zhuti&")",conn,1,1
end if
if not rs.eof and not rs.bof then
while not rs.eof%>{
            name: '<%=rs(1)%>', 
            data: [<%for i=kaishi to jieshu
			set rss=server.createobject("adodb.recordset")
rss.open "select * from statistical where nianfen ="&i&" and shuxing in("&shuxing&") and zhuti="&rs(0)&" order by id desc",conn,1,1
if not rss.eof and not rss.bof then
%><%=rss("info")%>,<%else
response.Write "0,"
end if
rss.close
set rss=nothing
next%>] //数组或JSON，如：data:[0, 5, 3, 5]，或data: [{name: 'Point 1',y: 0}, {name: 'Point 2',y: 5}] 
        },<%rs.movenext
		wend
		end if
		rs.close
		set rs=nothing%>], 
        credits: { 
            enabled: false
        }, 
        exporting: { 
            enabled: false 
        }, 
    });
    
    var chart = new Highcharts.Chart(options);
    
    var creditsEnabled = false;
    var legendEnabled  = false;
    var xLabelsEnabled = false;
    var yLabelsEnabled = false;
    var yTitleEnabled  = "Temperature";
    var yGridLinesEnabled = 1;
 
    
    $("button.update").click(function(){
    	var target = $(this).attr("target"); 
    	   	
    	if(target == "credits") {
    		options.credits.enabled = creditsEnabled;
    		creditsEnabled = !creditsEnabled;
    	}
    	
    	if(target == "legend") {
    		options.legend.enabled = legendEnabled;
    		legendEnabled = !legendEnabled;
    	}
    	
    	if(target == "xLabels") {
    		options.xAxis.labels.enabled = xLabelsEnabled;
    		xLabelsEnabled = !xLabelsEnabled;
    	}
    	
    	if(target == "yLabels") {
    		options.yAxis.labels.enabled = yLabelsEnabled;
    		yLabelsEnabled = !yLabelsEnabled;
    	}
    	
    	if(target == "yTitle") {
    		options.yAxis.title.text = (yTitleEnabled=="Temperature" ? null : 'Temperature');
    		yTitleEnabled = (yTitleEnabled=="Temperature" ? null : 'Temperature');
    	}
    	
    	if(target == "gridLines") {
    		options.yAxis.gridLineWidth = (yGridLinesEnabled==1 ? 0 :1);
    		yGridLinesEnabled = (yGridLinesEnabled==1 ? 0 :1);
    	}
    	
    	
    	chart = new Highcharts.Chart(options);
    	
    });
    
});
		</script>
        </body>
</html>
<%conn.close
set conn=nothing%>

