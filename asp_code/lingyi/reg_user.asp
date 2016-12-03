<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="infoinc/conn.asp"-->
<!--#include file="infoinc/login.asp"-->
<!--#include file="infoinc/md5.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>领艺后台系统 www.lycm.net.cn</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script src="../laydate/laydate.js"></script>
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
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">用户管理</a></li>
    </ul>
    </div>
    
<div class="formbody">
 <%if request.QueryString("id")="" or not isnumeric(request.QueryString("id")) then%>   
  <div class="formtitle"><span>添加信息</span></div>
    <form id="form1" name="form1" method="post" action="?act=addok">
  <ul class="forminfo">
    <li><label>所属品牌</label><div class="vocation"><select name="bid" class="select2">
    <%set rss=server.createobject("adodb.recordset")
rss.open "select * from pinpai order by py,id ",conn,1,1
if not rss.eof and not rss.bof then
while not rss.eof%><option value="<%=rss(0)%>"<%if trim(request.QueryString("pp"))=trim(rss(0)) then%> selected="selected"<%end if%>><%=rss(2)%>&nbsp;&nbsp;<%=rss(1)%></option><%rss.movenext
wend
end if
rss.close
set rss=nothing%>
    </select></div></li>
    <li><label>车系名称</label><input name="tt" type="text" id="tt" class="dfinput" /></li>
    <li><label>所属级别</label><div class="vocation"><select name="jibie" class="select2">
    <%set rss=server.createobject("adodb.recordset")
rss.open "select * from jibie order by id ",conn,1,1
if not rss.eof and not rss.bof then
while not rss.eof%><option value="<%=rss(0)%>"<%if trim(request.QueryString("jibie"))=trim(rss(0)) then%> selected="selected"<%end if%>><%=rss(1)%></option><%rss.movenext
wend
end if
rss.close
set rss=nothing%>
    </select></div></li>
    <li><label>&nbsp;</label><input name="" id="addbut" type="button" class="btn" value="确认保存"/>
      
     
    </li>
  </ul>
    </form>
<%else
set rs=server.createobject("adodb.recordset")
rs.open "select * from lj_huiyuan where id="&request.QueryString("id"),conn,1,1
if not rs.eof and not rs.bof then%>
<div class="formtitle"><span>修改信息</span></div>
    <form id="form1" name="form1" method="post" action="?act=regok&id=<%=rs(0)%>">
  <ul class="forminfo">
    <li><label>账号</label><input name="zhanghao" type="text" class="dfinput" id="zhanghao" value="<%=rs("zhanghao")%>" readonly="readonly" /></li>
    <li><label>密码</label><input name="mima" value="" type="text" id="tt" class="dfinput" /> 注意：不修改密码，此处请不要填写！</li>
    <li><label>邮箱</label><input name="email" value="<%=rs("youxiang")%>" type="text" id="tt" class="dfinput" /></li>
    <li><label>电话</label><input name="tel" value="<%=rs("dianhua")%>" type="text" id="tel" class="dfinput" /></li>
   <li><label>姓名</label><input name="xingming" value="<%=rs("xingming")%>" type="text" id="xingming" class="dfinput" /></li>
    <li><label>工作单位</label><input name="danwei" value="<%=rs("danwei")%>" type="text" id="danwei" class="dfinput" /></li>
    <li><label>&nbsp;</label><input name="" id="addbut" type="button" class="btn" value="确认保存"/>
      
     
    </li>
  </ul>
    </form>
<%
end if
rs.close
set rs=nothing
end if%>
<%if request.QueryString("act")="regok" and request.Form("zhanghao")<>"" and request.Form("tel")<>"" and request.QueryString("id")<>"" and isnumeric(request.QueryString("id")) then
set rs=server.createobject("adodb.recordset")
rs.open "select * from lj_huiyuan where id="&request.QueryString("id"),conn,1,3
if not rs.eof and not rs.bof then
rs("youxiang")=request.Form("email")
rs("dianhua")=request.Form("tel")
rs("xingming")=request.Form("xingming")
rs("danwei")=request.Form("danwei")
if request.Form("mima")<>"" then
rs("password")=md5(request.Form("mima"))
end if
rs.update
Response.Write("<script>alert('修改成功');javascript:history.go(-1);</script>")

else
Response.Write("<script>alert('修改的用户不存在');javascript:history.go(-1);</script>")
end if
rs.close
set rs=nothing
end if
%>
<%if request.QueryString("act")="addok" and request.Form("bid")<>"" and request.Form("tt")<>"" then
set rs=server.createobject("adodb.recordset")
rs.open "select * from chexi ",conn,1,3
rs.addnew
rs("tt")=request.Form("tt")
rs("bid")=request.Form("bid")
rs("jibie")=request.Form("jibie")
rs.update
Response.Write("<script>alert('添加成功');javascript:window.location.href='car_chexi_add.asp?pp="&request.Form("bid")&"';</script>")
rs.close
set rs=nothing
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
	if($("#zhanghao").val()=="" || $("#tel").val()==""){
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
  window.location.href="car_pinpai.asp";
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});
});
function showvip(val){
	if(val==2){
		$("#viptime").show();
		}else{
			$("#viptime").hide();
			}
	}
</script>
<%conn.close
set conn=nothing%>
</body>
</html>
