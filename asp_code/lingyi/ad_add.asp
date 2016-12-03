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
});
</script>
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">AD</a></li>
    </ul>
    </div>
    
<div class="formbody">
 <%if request.QueryString("id")="" or not isnumeric(request.QueryString("id")) then%>   
  <div class="formtitle"><span>添加信息</span></div>
    <form id="form1" name="form1" method="post" action="?act=addok">
  <ul class="forminfo">
    <li>
      <label>位置描述</label><input name="ms" type="text" id="tt" class="dfinput" /></li>
       <li>
      <label>说明文字</label><input name="title" type="text" id="tt" class="dfinput" /></li>
             <li>
      <label>广告类型</label><input name="class" type="radio" id="radio" value="0"<%if request.QueryString("class")<>"1" and request.QueryString("class")<>"2" then%> checked="checked"<%end if%> />
      图片
      <input type="radio" name="class" id="radio1" value="1" <%if request.QueryString("class")="1" then%> checked="checked"<%end if%>/>
      自定义代码
      <input type="radio" name="class" id="radio2" value="2" <%if request.QueryString("class")="2" then%> checked="checked"<%end if%>/>
      banner</li>
      <li>
       <li>
      <label>链接地址</label><input name="link" value="http://" type="text" id="tt" class="dfinput" /></li>
      <li>
      <label>图片</label><input name="logo" type="text" class="dfinput" id="img" value="" size="70">              
<input type="button" id="image" class="btn" value="选择图片" /></li>
    <li>
      <label>自定义代码</label><textarea name="daima" class="maiche_input" style="width:600px; height:60px; margin-left:1px;" id="chezhushuoming" placeholder="自定义拓展广告代码"></textarea></li>
   
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
    <li>说明：如选择【图片】类型，直接上传图片，填写链接地址即可。<br />如选择【自定义代码】模式，请在自定义代码区域填写代码即可！系统自动识别显示。</li>
  </ul>
    </form>
<%else
set rs=server.createobject("adodb.recordset")
rs.open "select * from ad where id="&request.QueryString("id"),conn,1,1
if not rs.eof and not rs.bof then%>
<div class="formtitle"><span>修改信息</span></div>
    <form id="form1" name="form1" method="post" action="?act=regok&id=<%=rs(0)%>">
   <ul class="forminfo">
    <li>
      <label>位置描述</label><input name="ms" type="text" id="tt" class="dfinput" value="<%=rs("tt")%>" /></li>
       <li>
      <label>说明文字</label><input name="title" type="text" id="tt" class="dfinput" value="<%=rs("title")%>"/></li>
             <li>
      <label>广告类型</label><input name="class" type="radio" id="radio" value="0"<%if rs("type")=0 then%> checked="checked"<%end if%> />
      图片
      <input type="radio" name="class" id="radio1" value="1" <%if rs("type")=1 then%> checked="checked"<%end if%>/>
      自定义代码
      <input type="radio" name="class" id="radio2" value="2" <%if rs("type")=2 then%> checked="checked"<%end if%>/>
      banner</li>
      <li>
       <li>
      <label>链接地址</label><input name="link" value="<%=rs("link")%>" type="text" id="tt" class="dfinput" /></li>
      <li>
      <label>图片</label><input name="logo" type="text" class="dfinput" id="img" value="<%=rs(3)%>" size="70">              
<input type="button" id="image" class="btn" value="选择图片" /></li>
    <li>
      <label>自定义代码</label><textarea name="daima" class="maiche_input" style="width:600px; height:60px; margin-left:1px;" id="chezhushuoming" placeholder="自定义拓展广告代码"><%=rs("info")%></textarea></li>
   
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
    <li>说明：如选择【图片】类型，直接上传图片，填写链接地址即可。<br />如选择【自定义代码】模式，请在自定义代码区域填写代码即可！系统自动识别显示。</li>
  </ul>
    </form>
<%
end if
rs.close
set rs=nothing
end if%>
<%if request.QueryString("act")="regok" and request.QueryString("id")<>"" and isnumeric(request.QueryString("id")) then
set rs=server.createobject("adodb.recordset")
rs.open "select * from ad where id="&request.QueryString("id"),conn,1,3
if not rs.eof then
rs(1)=request.Form("title")
rs(2)=request.Form("link")
rs(3)=request.Form("logo")
rs("tt")=request.Form("ms")
rs("info")=request.Form("daima")
rs("type")=request.Form("class")
rs.update
Response.Write("<script>alert('修改成功');window.location.href='ad_add.asp?id="&request.QueryString("id")&"';</script>")
else
response.Write "修改的内容不存在！"
end if
rs.close
set rs=nothing
end if
%>
<%if request.QueryString("act")="addok" then
set rsv=server.createobject("adodb.recordset")
rsv.open "select * from ad",conn,1,3
rsv.addnew
rsv(1)=request.Form("title")
rsv(2)=request.Form("link")
rsv(3)=request.Form("logo")
rsv("tt")=request.Form("ms")
rsv("info")=request.Form("daima")
rsv("type")=request.Form("class")
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
	if($("#bid").val()=="" || $("#tt").val()==""){
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
  window.location.href="ad.asp";
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
  window.location.href="ad_add.asp?class=<%=request.Form("class")%>";
});
});
</script>
<%conn.close
set conn=nothing%>
</body>
</html>
