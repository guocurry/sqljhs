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
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">修改信息</a></li>
    </ul>
    </div>
    
<div class="formbody">
 <%if request.QueryString("id")="" or not isnumeric(request.QueryString("id")) then%>   
  <div class="formtitle"><span>添加信息</span></div>
    <form id="form1" name="form1" method="post" action="?act=addok">
  <ul class="forminfo">
    <li>
      <label>帐号</label><input name="users" type="text" id="tt" class="dfinput" /></li>
       <li>
      <label>密码</label><input name="pwd" type="text" id="tt" class="dfinput" /> </li>
      <li>
      <label>类型</label><input name="types" type="radio" id="radio" value="1" checked="checked" />超级管理员  <input type="radio" name="types" id="radio" value="0" />编辑员
      </li>
      <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/>
         
         
      </li>
  </ul>
    </form>
<%else
set rs=server.createobject("adodb.recordset")
rs.open "select * from 68hudong_loginadmin where id="&request.QueryString("id"),conn,1,1
if not rs.eof and not rs.bof then%>
<div class="formtitle"><span>修改信息</span></div>
    <form id="form1" name="form1" method="post" action="?act=regok&id=<%=rs("id")%>">
  <ul class="forminfo">
    <li>
      <label>帐号</label><input name="users" type="text" id="tt" class="dfinput" value="<%=rs(0)%>" /></li>
       <li>
      <label>密码</label><input name="pwd" type="text" id="tt" class="dfinput" value="<%=rs(1)%>"/></li>
       <li>
      <label>类型</label><input name="types" type="radio" id="radio" value="1"<%if rs("type")=1 then%> checked="checked"<%end if%> />超级管理员  <input type="radio" name="types" id="radio" value="0" <%if rs("type")=0 then%> checked="checked"<%end if%>/>编辑员
      </li>
      <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/>
         
         
      </li>
  </ul>
    </form>
<%
end if
rs.close
set rs=nothing
end if%>
<%if request.QueryString("act")="regok" and request.Form("users")<>"" and request.Form("pwd")<>"" and request.QueryString("id")<>"" and isnumeric(request.QueryString("id")) then
set rs=server.createobject("adodb.recordset")
rs.open "select * from 68hudong_loginadmin where id="&request.QueryString("id"),conn,1,3
if not rs.eof then
rs(0)=request.Form("users")
rs(1)=request.Form("pwd")
rs("type")=request.Form("types")
rs.update
Response.Write("<script>alert('修改成功');window.location.href='admins.asp?id="&request.QueryString("id")&"';</script>")
else
response.Write "修改的内容不存在！"
end if
rs.close
set rs=nothing
end if
%>
<%if request.QueryString("act")="addok" and request.Form("users")<>"" and request.Form("pwd")<>"" then
set rsv=server.createobject("adodb.recordset")
rsv.open "select * from 68hudong_loginadmin ",conn,1,3
rsv.addnew
rsv(0)=request.Form("users")
rsv(1)=request.Form("pwd")
rsv(2)=now()
rsv("type")=request.Form("types")
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
  window.location.href="admin.asp";
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
  window.location.href="admins.asp";
});
});
</script>
<%conn.close
set conn=nothing%>
</body>
</html>
