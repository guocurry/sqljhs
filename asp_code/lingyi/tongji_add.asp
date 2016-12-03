<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="infoinc/login.asp"-->
<%
set conn=server.createobject("ADODB.CONNECTION")
ConnStr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("/lingyi/db/tongji.asp") 
conn.open ConnStr
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>领艺后台系统 www.lycm.net.cn</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script src="color/jquery.min.js"></script>
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
	<link rel="stylesheet" href="color/bootstrap.min.css">
	<script src="color/bootstrap.min.js"></script>
	<script src="color/jquery.minicolors.js"></script>
	<link rel="stylesheet" href="color/jquery.minicolors.css">
<script>
		$(document).ready( function() {
			
            $('.demo').each( function() {
				$(this).minicolors({
					control: $(this).attr('data-control') || 'hue',
					defaultValue: $(this).attr('data-defaultValue') || '',
					inline: $(this).attr('data-inline') === 'true',
					letterCase: $(this).attr('data-letterCase') || 'lowercase',
					opacity: $(this).attr('data-opacity'),
					position: $(this).attr('data-position') || 'bottom left',
					change: function(hex, opacity) {
						if( !hex ) return;
						if( opacity ) hex += ', ' + opacity;
						try {
							console.log(hex);
						} catch(e) {}
					},
					theme: 'bootstrap'
				});
                
            });
			
		});
	</script>
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">添加</a></li>
    </ul>
    </div>
    
<div class="formbody">
 <%if request.QueryString("id")="" or not isnumeric(request.QueryString("id")) then%>   
  <div class="formtitle"><span>添加信息</span></div>
    <form id="form1" name="form1" method="post" action="?act=addok">
  <ul class="forminfo">
    <li><label>主体</label><div class="vocation"><select name="zhuti" class="select2">
        <%set rvs=server.createobject("adodb.recordset")
rvs.open "select * from zhuti",conn,1,1
if not rvs.eof and not rvs.bof then
while not rvs.eof%>
          <option value="<%=rvs(0)%>"<%if trim(request.QueryString("zhuti"))=trim(rvs(0)) then%> selected="selected"<%end if%>><%=rvs(1)%></option>
<%rvs.movenext
wend
end if
rvs.close
set rvs=nothing%>

      </select></div></li>
	<li><label>属性数据</label><div class="vocation"><select name="shuxing" class="select1">
        <%set rvs=server.createobject("adodb.recordset")
rvs.open "select * from shuxing",conn,1,1
if not rvs.eof and not rvs.bof then
while not rvs.eof%>
          <option value="<%=rvs(0)%>"<%if trim(request.QueryString("shuxing"))=trim(rvs(0)) then%> selected="selected"<%end if%>><%=rvs(1)%>(<%=rvs("danwei")%>)</option>
<%rvs.movenext
wend
end if
rvs.close
set rvs=nothing%>

      </select></div></li>
      <li><label>年份</label><div class="vocation"><select name="nianfen" class="select2">
      <%for i=1991 to year(date())%>
          <option value="<%=i%>"<%if i=year(date()) then%> selected="selected"<%end if%>><%=i%></option>
          <%next%>
      </select></div></li>
      <li><label>数据内容</label><input name="info" value="" type="text" id="tt" class="dfinput" /></li>
    <li><label>&nbsp;</label><input name="" id="addbut" type="button" class="btn" value="确认保存"/>
      
     
    </li>
  </ul>
    </form>
<%else
set rs=server.createobject("adodb.recordset")
rs.open "select * from statistical where id="&request.QueryString("id"),conn,1,1
if not rs.eof and not rs.bof then%>
<div class="formtitle"><span>修改信息</span></div>
    <form id="form1" name="form1" method="post" action="?act=regok&id=<%=rs(0)%>">
  <ul class="forminfo">
     <li><label>主体</label><div class="vocation"><select name="zhuti" class="select2">
        <%set rvs=server.createobject("adodb.recordset")
rvs.open "select * from zhuti",conn,1,1
if not rvs.eof and not rvs.bof then
while not rvs.eof%>
          <option value="<%=rvs(0)%>"<%if trim(rs("zhuti"))=trim(rvs(0)) then%> selected="selected"<%end if%>><%=rvs(1)%></option>
<%rvs.movenext
wend
end if
rvs.close
set rvs=nothing%>

      </select></div></li>
	<li><label>属性数据</label><div class="vocation"><select name="shuxing" class="select1">
        <%set rvs=server.createobject("adodb.recordset")
rvs.open "select * from shuxing",conn,1,1
if not rvs.eof and not rvs.bof then
while not rvs.eof%>
          <option value="<%=rvs(0)%>"<%if trim(rs("shuxing"))=trim(rvs(0)) then%> selected="selected"<%end if%>><%=rvs(1)%>(<%=rvs("danwei")%>)</option>
<%rvs.movenext
wend
end if
rvs.close
set rvs=nothing%>

      </select></div></li>
      <li><label>年份</label><div class="vocation"><select name="nianfen" class="select2">
      <%for i=1991 to year(date())%>
          <option value="<%=i%>"<%if i=rs("nianfen") then%> selected="selected"<%end if%>><%=i%></option>
          <%next%>
      </select></div></li>
      <li><label>数据内容</label><input name="info" value="<%=rs("info")%>" type="text" id="tt" class="dfinput" /></li>
    <li><label>&nbsp;</label><input name="" id="addbut" type="button" class="btn" value="确认保存"/>
      
     
    </li>
  </ul>
    </form>
<%
end if
rs.close
set rs=nothing
end if%>
<%if request.QueryString("act")="regok" and request.Form("info")<>"" and request.QueryString("id")<>"" and isnumeric(request.QueryString("id")) then
set rs=server.createobject("adodb.recordset")
rs.open "select * from statistical where id="&request.QueryString("id"),conn,1,3
if not rs.eof and not rs.bof then
rs("info")=request.Form("info")
rs("zhuti")=request.Form("zhuti")
rs("shuxing")=request.Form("shuxing")
rs("nianfen")=request.Form("nianfen")
rs.update
Response.Write("<script>alert('修改成功');javascript:history.go(-1);</script>")
else
response.Write "修改的内容不存在！"
end if
rs.close
set rs=nothing
end if
%>
<%if request.QueryString("act")="addok" and request.Form("info")<>"" then
set rs=server.createobject("adodb.recordset")
rs.open "select * from statistical",conn,1,3
rs.addnew
rs("info")=request.Form("info")
rs("zhuti")=request.Form("zhuti")
rs("shuxing")=request.Form("shuxing")
rs("nianfen")=request.Form("nianfen")
rs.update
%>
<script>$(function(){$(".tip").fadeIn(200);})</script>
<%
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
	if($("#info").val()=="" || $("#zhuti").val()==""){
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
  window.location.href="tongji.asp";
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
  window.location.href="tongji_add.asp?zhuti=<%=request.Form("zhuti")%>&shuxing=<%=request.Form("shuxing")%>";
});
});
</script>
<%conn.close
set conn=nothing%>
</body>
</html>
