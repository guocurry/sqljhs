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
    <li><a href="#">添加信息</a></li>
    </ul>
    </div>
    
<div class="formbody">
 <%if request.QueryString("id")="" or not isnumeric(request.QueryString("id")) then%>   
  <div class="formtitle"><span>添加信息</span></div>
    <form id="form1" name="form1" method="post" action="?act=addok">
  <ul class="forminfo">
    <li>
      <label>所属分类</label><div class="vocation"><select name="class" class="select2">
        <%set rvs=server.createobject("adodb.recordset")
rvs.open "select * from news_s_class",conn,1,1
if not rvs.eof and not rvs.bof then
while not rvs.eof%>
          <option value="<%=rvs(0)%>"<%if trim(request.QueryString("class"))=trim(rvs(0)) then%> selected="selected"<%end if%>><%=rvs(1)%></option>
<%rvs.movenext
wend
end if
rvs.close
set rvs=nothing%>

      </select></div></li>
    <li>
      <label>标题</label><input name="tt" type="text" id="tt" class="dfinput" /></li>
    <li><label>内容</label><textarea id="content1" name="info" cols="100" rows="8" style="width:80%;height:400px;visibility:hidden;">
</textarea></li>
<li>
      <label>时间</label><input name="sj" type="text" id="tt" value="<%=now()%>" class="dfinput" /></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/>
      
     
    </li>
  </ul>
    </form>
<%else
set rs=server.createobject("adodb.recordset")
rs.open "select * from news where news_id="&request.QueryString("id"),conn,1,1
if not rs.eof and not rs.bof then%>
<div class="formtitle"><span>修改信息</span></div>
    <form id="form1" name="form1" method="post" action="?act=regok&id=<%=rs(0)%>">
  <ul class="forminfo">
    <li>
      <label>所属分类</label><div class="vocation"><select name="class" class="select2">
         <%set rvs=server.createobject("adodb.recordset")
rvs.open "select * from news_s_class",conn,1,1
if not rvs.eof and not rvs.bof then
while not rvs.eof%>
          <option value="<%=rvs(0)%>"<%if trim(rs(6))=trim(rvs(0)) then%> selected="selected"<%end if%>><%=rvs(1)%></option>
<%rvs.movenext
wend
end if
rvs.close
set rvs=nothing%>

      </select></div></li>
    <li>
      <label>标题</label><input name="tt" type="text" id="tt" class="dfinput" value="<%=rs(1)%>" /></li>
    <li><label>内容</label><textarea id="content1" name="info" cols="100" rows="8" style="width:80%;height:400px;visibility:hidden;"><%=rs(2)%></textarea></li>
    <li>
      <label>时间</label><input name="sj" type="text" id="tt" value="<%=rs(3)%>" class="dfinput" /></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/>
      
     
    </li>
  </ul>
    </form>
<%
end if
rs.close
set rs=nothing
end if%>
<%if request.QueryString("act")="regok" and request.Form("class")<>"" and request.Form("tt")<>"" and request.QueryString("id")<>"" and isnumeric(request.QueryString("id")) then
set rs=server.createobject("adodb.recordset")
rs.open "select * from news where news_id="&request.QueryString("id"),conn,1,3
if not rs.eof then
	rs(1)=request.Form("tt")
	rs(2)=request.Form("info")
	rs(6)=request.Form("class")
	rs(3)=request.Form("sj")
rs.update
Response.Write("<script>alert('修改成功');window.location.href='gonglue_add.asp?id="&request.QueryString("id")&"';</script>")
else
response.Write "修改的内容不存在！"
end if
rs.close
set rs=nothing
end if
%>
<%if request.QueryString("act")="addok" and request.Form("class")<>"" and request.Form("tt")<>"" then
set rsv=server.createobject("adodb.recordset")
rsv.open "select * from news ",conn,1,3
rsv.addnew
	rsv(1)=request.Form("tt")
	rsv(2)=request.Form("info")
	rsv(3)=request.Form("sj")
	rsv(4)=1
	'rsv(5)=request.Form("news_color")
	rsv(6)=request.Form("class")
	'rsv("bid")=request.Form("CountryGroup")
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
  window.location.href="gonglue.asp";
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
  window.location.href="gonglue_add.asp?class=<%=request.Form("class")%>";
});
});
</script>
<%conn.close
set conn=nothing%>
</body>
</html>