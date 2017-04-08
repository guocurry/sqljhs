<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
set conn=server.createobject("ADODB.CONNECTION")
ConnStr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("/lingyi/db/tongji.asp") 
conn.open ConnStr
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据统计</title>
<link href="style/home.css" rel="stylesheet" type="text/css" />
<script src="/sel_js/jquery-1.11.3.min.js"></script><script src="layer/layer.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/maps/modules/map.js"></script>
<script src="http://code.highcharts.com/maps/modules/data.js"></script>
<script src="http://code.highcharts.com/maps/modules/drilldown.js"></script>
<link rel="stylesheet" href="sel_css/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="http://sandbox.runjs.cn/uploads/rs/228/zroo4bdf/cn-china-by-peng8.js"></script>
<script src="sel_js/modernizr.min.js"></script><script src="script/statistics.js"></script><script src="script/lycm.min.js"></script>
</head>

<body>
<!--#include file="top.asp"-->
<div class="news_box box">
<div class="onpage">您现在的位置：<a href="/">首页</a> > 数据统计</div>
	<div class="news_nav left">
    	<ul>
        <li><a href="javascript:;" onclick="showmore()">选择多个主体统计</a></li>
        <%set rs=server.createobject("adodb.recordset")
rs.open "select top 15 * from zhuti where top=1 order by id",conn,1,1
if not rs.eof and not rs.bof then
while not rs.eof%>
        	<li><a href="javascript:;" onclick="zhuti_(<%=rs(0)%>)"><%=rs(1)%></a></li>
<%rs.movenext
wend
end if
rs.close
set rs=nothing%>
      </ul>
    </div>
    <div class="news_info right">
    	<div id="container" style="height: 500px; min-width: 310px; max-width: 800px; margin: 0 auto"></div>
    	<br>
    	<br>
        <div class="tj_search" id="tj_search_box" style="display:none;">Load Statistics Btn</div>
        <div class="cer"></div>
        <div class="zhuti_more" style="display:none;">
          
<%set rs=server.createobject("adodb.recordset")
rs.open "select * from zhuti order by id",conn,1,1
if not rs.eof and not rs.bof then
while not rs.eof%><a more=1><%=rs(1)%></a>
<%rs.movenext
wend
end if
rs.close
set rs=nothing%>
      </div>
        <div class="tj_sbox" id="tj_sbox" style="min-height:440px;">
        <div style="text-align:center; color:#999; display:none;"><img src="images/loading.gif" width="40" /><p>统计数据加载中</p></div></div>
    </div>
    <div class="cer"></div>
</div>
<script>
$(function(){
	$(".zhuti_more a").click(function(){
		var mores=$(this).attr("more");
		if($(this).attr("more")=="1"){
		$(this).attr("more","2");
		$(this).addClass("on");
			}else{
		$(this).attr("more","1");
		$(this).removeClass("on");
			}
	})
	$.post("box/tongji_search.asp",{},
    function(data,status){
        if(status=="success"){
		  $("#tj_search_box").html(data);
        }
        else{
          layer.msg("统计失败，请稍后重试！");
        }
    });
	$.post("/box/tongji_main.asp?kaishi=<%=year(date())-5%>&jiesu=<%=year(date())%>",{},
    function(data,status){
     if(status=="success"){
		$("#tj_sbox").html(data);
		 }else{layer.msg("统计失败，请稍后重试！");}
    });
	})window.onload=function(){
	if($(".news_nav").height()>$(".news_info").height()){
		$(".news_info").height($(".news_nav").height());
		}else{
		$(".news_nav").height($(".news_info").height());	
			}
	}
</script>

<script>
$(function () {
    Highcharts.setOptions({
        lang:{
            drillUpText:"返回 > {series.name}"
        }
    });

    var data = Highcharts.geojson(Highcharts.maps['countries/cn/custom/cn-all-china']),small = $('#container').width() < 400;

    // 给城市设置随机数据
    $.each(data, function (i) {
        this.drilldown = this.properties['drill-key'];
        this.value = i;
        this.value1 = i;
    });
	function getPoint(e){
		console.log(e.point.name);
	}
	function getShow(e){
		alert(1);
	}
    //初始化地图
    $('#container').highcharts('Map', {
        chart : {
			spacingBottom:30,	 
            events: {
                drilldown: function (e) {
                    var dkey=e.point.properties["drill-key"];
                    if (!e.seriesOptions && dkey != "bei_jing" && dkey != "shang_hai" && dkey != "tian_jin" && dkey != "chong_qing") {
                        var chart = this;
                        chart.showLoading('<i class="icon-spinner icon-spin icon-3x"></i>');
                        // 加载城市数据
                        $.ajax({
                            type: "GET",
                            url: "http://data.hcharts.cn/jsonp.php?filename=GeoMap/json/"+ e.point.drilldown+".geo.json",
                            contentType: "application/json; charset=utf-8",
                            dataType:'jsonp',
                            crossDomain: true,
                            success: function(json) {
                                data = Highcharts.geojson(json);						 
                                $.each(data, function (i) {
                                    this.value = i;
									this.events={};
									this.events.click=getPoint;
                                });
                                chart.hideLoading();

                                chart.addSeriesAsDrilldown(e.point, {
                                    name: e.point.name,
                                    data: data,
									events:{
										show:function(){
											alert(1);
										}
									},
                                    dataLabels: {
                                        enabled: true,
                                        format: '{point.name}'
                                    }
                                });
                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {

                            }
                        });
                    }
                    this.setTitle(null, { text: cname });
                },
                drillup: function () {
                    this.setTitle(null, { text: '中国' });
                }
            }
        },
		tooltip: { 
			formatter:function(){
				var htm="垃圾清运量<br/>";
				if(this.point.drilldown){
				    htm+=this.point.properties["cn-name"];
				}else{
					 htm+=this.point.name;
				}
				htm+=":"+this.point.value + " 吨<br/>";

                htm+="垃圾清运量1:"+this.point.value1 + " 吨<br/>";
				return htm; 
			}
		},
        credits:{
			href:"javascript:goHome()",
            text:""
        },
        title : {
            text : '统计信息'
        },
        subtitle: {
            text: '中国',
            floating: true,
            align: 'right',
            y: 50,
            style: {
                fontSize: '16px'
            }
        },

        legend: small ? {} : {
					 // enabled: false,
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle'
        },
        colorAxis: {
            min: 0,
            minColor: '#E6E7E8',
            maxColor: '#005645',
					labels:{
						style:{
								"color":"red","fontWeight":"bold"
						}
					}
        },

        mapNavigation: {
            enabled: true,
            buttonOptions: {
                verticalAlign: 'bottom'
            }
        },

        plotOptions: {
            map: {
                states: {
                    hover: {
                        color: '#EEDD66'
                    }
                }
            }
        },

        series : [{
            data : data,
            name: '中国',
            dataLabels: {
                enabled: true,
                format: '{point.properties.cn-name}'
            }
        }],

        drilldown: {
					
            activeDataLabelStyle: {
                color: '#FFFFFF',
                textDecoration: 'none',
                textShadow: '0 0 3px #000000'
            },
            drillUpButton: {
                relativeTo: 'spacingBox',
                position: {
                    x: 0,
                    y: 60
                }
            }
        }
    });
});

var base64EncodeChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";  
var base64DecodeChars = new Array(  
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63,  
    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1,  
    -1,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,  
    15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1,  
    -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,  
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1);  


function base64decode(str) {  
    var c1, c2, c3, c4;  
    var i, len, out;  
  
    len = str.length;  
    i = 0;  
    out = "";  
    while(i < len) {  
    /* c1 */  
    do {  
        c1 = base64DecodeChars[str.charCodeAt(i++) & 0xff];  
    } while(i < len && c1 == -1);  
    if(c1 == -1)  
        break;  
  
    /* c2 */  
    do {  
        c2 = base64DecodeChars[str.charCodeAt(i++) & 0xff];  
    } while(i < len && c2 == -1);  
    if(c2 == -1)  
        break;  
  
    out += String.fromCharCode((c1 << 2) | ((c2 & 0x30) >> 4));  
  
    /* c3 */  
    do {  
        c3 = str.charCodeAt(i++) & 0xff;  
        if(c3 == 61)  
        return out;  
        c3 = base64DecodeChars[c3];  
    } while(i < len && c3 == -1);  
    if(c3 == -1)  
        break;  
  
    out += String.fromCharCode(((c2 & 0XF) << 4) | ((c3 & 0x3C) >> 2));  
  
    /* c4 */  
    do {  
        c4 = str.charCodeAt(i++) & 0xff;  
        if(c4 == 61)  
        return out;  
        c4 = base64DecodeChars[c4];  
    } while(i < len && c4 == -1);  
    if(c4 == -1)  
        break;  
    out += String.fromCharCode(((c3 & 0x03) << 6) | c4);  
    }  
    return out;  
}  
function goHome(){
	window.open("http://www.peng8.net/");
}
function getGithub()
{
		$.getJSON("https://api.github.com/repos/peng8/GeoMap/contents/json/bei_jing.geo.json", function(data){
		console.log(base64decode(data.content));
});
		
}

</script>

<!--#include file="fot.asp"-->
<%conn.close
set conn=nothing%>
</body>
</html>
