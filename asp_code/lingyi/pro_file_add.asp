<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="infoinc/conn.asp"-->
<!--#include file="infoinc/login.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>领艺后台系统 www.lycm.net.cn</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 190  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
<link rel="stylesheet" href="webedit/themes/default/default.css" />
<script charset="utf-8" src="webedit/kindeditor.js"></script>
<script charset="utf-8" src="webedit/lang/zh_CN.js"></script>
<script charset="utf-8" src="webedit/plugins/code/prettify.js"></script>
<script>
KindEditor.ready(function(K) {
        var editor = K.editor({
                                                  
        uploadJson : 'webedit/asp/upload_json.asp',
        fileManagerJson : 'webedit/asp/file_manager_json.asp',
        allowFileManager : true

        });
        K('#image').click(function() {
                editor.loadPlugin('image', function() {
                        editor.plugin.imageDialog({
								
								 imageUrl : K('#img').val(),
                                clickFn : function(txt12, title, width, height, border, align) {
                                        K('#img').val(txt12);
                                        editor.hideDialog();
                                }
							
                            
                        });
                });
        });
		K('#images').click(function() {
                editor.loadPlugin('image', function() {
                        editor.plugin.imageDialog({
								
								 imageUrl : K('#imgs').val(),
                                clickFn : function(txt12, title, width, height, border, align) {
                                        K('#imgs').val(txt12);
                                        editor.hideDialog();
                                }
							
                            
                        });
                });
        });
});
</script>
<style>#mapshow{min-width:600px;
	min-height:767px;}</style>
<script charset="utf-8" src="webedit/kindeditor.js"></script>
	<script charset="utf-8" src="webedit/lang/zh_CN.js"></script>
	<script charset="utf-8" src="webedit/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[id="content1"]', {
				cssPath : 'webedit/plugins/code/prettify.css',
				uploadJson : 'webedit/asp/upload_json.asp',
				fileManagerJson : 'webedit/asp/file_manager_json.asp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
    <script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp"></script>
<script>
function init() {
    var map = new qq.maps.Map(document.getElementById("mapshow"),{
        center: new qq.maps.LatLng(39.916527,116.397128),
        zoom: 13
    });
    //添加监听事件   获取鼠标单击事件
    qq.maps.event.addListener(map, 'click', function(event) {
      $("#map_num").val(event.latLng.getLat() + ', ' +
        event.latLng.getLng());
$("#map_in").val(event.latLng.getLat() + ', ' +
        event.latLng.getLng());
       var marker=new qq.maps.Marker({
                position:event.latLng, 
                map:map
          });    
      qq.maps.event.addListener(map, 'click', function(event) {
            marker.setMap(null);      
    });
    });
}
var map_nums=1;
function show_map(){
	$("#mapshow").show();
	$("#hidemapbtn").show();
	$("#showmapbtn").hide();
	}
function hide_map(){
	if($("#map_num").val()==""){
		alert("您还没有标记地图");
		}else{
	$("#mapshow").hide();
	$("#hidemapbtn").hide();
	$("#showmapbtn").show();
	}
}
</script>
</head>

<body onload="init()">
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">地图</a></li>
    </ul>
    </div>
<div class="formbody">
 <%if request.QueryString("id")="" or not isnumeric(request.QueryString("id")) then%>   
  <div class="formtitle"><span>添加信息</span></div>
    <form id="form1" name="form1" method="post" action="?act=addok">
  <ul class="forminfo">
  <li style="margin-bottom:30px;">说明：如有监管设施，请选择“垃圾监管设施数据”，带“<font color="#FF0000">*</font>”号为监管设施所填数据。<p>　　　如选择“垃圾设施地图数据”，则带“<font color="#FF0000">*</font>”号的数据将不予显示！</p></li>
  <li>
      <label>数据类型</label><div class="vocation"><select name="class" onchange="showclass(this.value)" class="select2">
          <option value="0">垃圾设施地图数据</option>
          <option value="1">垃圾监管设施数据</option>
      </select></div></li>
      <li><input type="hidden" id="map_in" class="map" name="map" >
  <li><label>设施名称</label><input name="ssmc" type="text" id="ssmc" class="dfinput" value=""/></li>
     <li>
      <label>设施类型</label><div class="vocation"><select name="sslx" onchange="showclass(this.value)" class="select2">
          <option value="卫生填埋">卫生填埋</option>
          <option value="简易填埋">简易填埋</option>
          <option value="焚烧">焚烧</option>
          <option value="好氧生物处理">好氧生物处理</option>
          <option value="厌氧生物处理">厌氧生物处理</option>
          <option value="资源再生">资源再生</option>
          <option value="其它">其它</option>
      </select></div></li>
      <li>
      <label><font color="#FF0000">*设施技术路线</font></label><div class="vocation"><select name="ssjslx" onchange="showclass(this.value)" class="select2">
          <option value="反应器型好氧生物处理">反应器型好氧生物处理</option>
          <option value="太阳能生物处理">太阳能生物处理</option>
          <option value="其它">其它</option>
      </select></div></li>
	<li><label>地理坐标</label><input name="map" type="text" disabled="disabled" class="dfinput" id="map_num" value=""/> <a href="javascript:;" id="showmapbtn" onclick="show_map()">请在地图上选择标记</a>
    <a href="javascript:;" id="hidemapbtn" style="display:none;" onclick="hide_map()">关闭地图显示</a></li>
    <div id="mapshow" style="display:none;">map</div> 
       <li><label>设施所在城市</label><input name="ssszcs" type="text" id="tt" class="dfinput" value=""/></li>
       <li><label>设施所在的区</label><input name="ssszq" type="text" id="tt" class="dfinput" value=""/></li>
       <li><label>管理部门</label><input name="glbm" type="text" id="tt" class="dfinput" value=""/></li>
       <li><label>运营商</label><input name="yys" type="text" id="tt" class="dfinput" value=""/></li>
       <li><label><font color="#FF0000">*运营商电话</font></label><input name="yysdh" type="text" id="tt" class="dfinput" value=""/></li>
       <li><label>处理能力</label><input name="clnl" type="text" id="tt" class="dfinput" value=""/></li>
       <li><label>建成年份</label><input name="jcnf" type="text" id="tt" class="dfinput" value=""/></li>
       <li><label>使用年限</label><input name="synx" type="text" id="tt" class="dfinput" value=""/></li>
       <li><label>占地面积</label><input name="zdmj" type="text" id="tt" class="dfinput" value=""/></li>      
      <li>
      <label>照片</label><input name="zp" type="text" class="dfinput" id="img" value="" size="70">              
<input type="button" id="image" class="btn" value="选择图片" /></li>
 <li>
      <label>卫星影像</label><input name="wxyx" type="text" class="dfinput" id="imgs" value="" size="70">              
<input type="button" id="images" class="btn" value="选择图片" /></li>
<li><label><font color="#FF0000">*管理员姓名</font></label><input name="glyxm" type="text" id="tt" class="dfinput" value=""/></li> 
<li><label><font color="#FF0000">*管理员电话</font></label><input name="glydh" type="text" id="tt" class="dfinput" value=""/></li> 
<li><label><font color="#FF0000">*处理量</font></label><input name="cll" type="text" id="tt" class="dfinput" value=""/></li> 
 <li>
      <label><font color="#FF0000">*运行情况</font></label><div class="vocation"><select name="yxqk" onchange="showclass(this.value)" class="select2">
          <option value="正常运行">正常运行</option>
          <option value="设备故障">设备故障</option>
          <option value="暂停运行">暂停运行</option>
      </select></div></li>
<li><label><font color="#FF0000">*监控摄像头</font></label><input name="jksxtxh" type="text" id="tt" class="dfinput" value=""/></li>
   
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
    
  </ul>
    </form>
<%if request.QueryString("act")="addok" then
set rsv=server.createobject("adodb.recordset")
rsv.open "select * from map",conn,1,3
rsv.addnew
rsv("class")=request.Form("class")
rsv("ssmc")=request.Form("ssmc")
rsv("sslx")=request.Form("sslx")
rsv("ssjslx")=request.Form("ssjslx")
rsv("map")=request.Form("map")
rsv("sszzcs")=request.Form("ssszcs")

rsv("ssszq")=request.Form("ssszq")
rsv("glbm")=request.Form("glbm")
rsv("yys")=request.Form("yys")
rsv("yysdh")=request.Form("yysdh")
rsv("clnl")=request.Form("clnl")
rsv("jcnf")=request.Form("jcnf")
rsv("synx")=request.Form("synx")
rsv("zdmj")=request.Form("zdmj")
rsv("zp")=request.Form("zp")
rsv("wxyx")=request.Form("wxyx")
rsv("glyxm")=request.Form("glyxm")
rsv("glydh")=request.Form("glydh")
rsv("cll")=request.Form("cll")
rsv("yxqk")=request.Form("yxqk")
rsv("jksxtxh")=request.Form("jksxtxh")
rsv.update
rsv.close
set rsv=nothing
%><script>$(function(){$('.tip').fadeIn(200)});</script><%
end if
%>
</div>
 <div class="tip" id="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>数据添加成功</p>
        <cite>您可以进行以下操作</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="继续添加" />&nbsp;
        <input name="" type="button"  class="cancel" value="返回管理" />
        </div>
    
    </div> 
<script>
$("#addbut").click(function(){
	if($("#map_num").val()=="" || $("#ssmc").val()==""){
		alert("信息不完整");
		}else{
			$("#form1").submit();
			}
	})
$(document).ready(function(){
  function showtip(){
  $(".tip").fadeIn(200);
  };
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
  window.location.href="pro.asp";
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
  window.location.href="pro_reg.asp?class=<%=request.Form("class")%>";
});
});
</script>
    <script>
    function showclass(vals){
		$(".classshow").hide();
		$(".class_"+vals).show();
		}
    </script>
<%conn.close
set conn=nothing%>
</body>
</html>
