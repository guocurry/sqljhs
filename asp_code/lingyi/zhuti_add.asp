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
    <li><label>主体名称</label><input name="tt" type="text" id="tt" class="dfinput" /></li>
   <li>
      <label>主页显示</label><div class="vocation"><select name="class" class="select2">
      <option value="1">显示</option>
          <option value="0" selected="selected">不显示</option>
      </select></div></li>
      <li>至多显示15条</li>
    <li><label>&nbsp;</label><input name="" id="addbut" type="button" class="btn" value="确认保存"/>
      
     
    </li>
  </ul>
    </form>
<%else
set rs=server.createobject("adodb.recordset")
rs.open "select * from zhuti where id="&request.QueryString("id"),conn,1,1
if not rs.eof and not rs.bof then%>
<div class="formtitle"><span>修改信息</span></div>
    <form id="form1" name="form1" method="post" action="?act=regok&id=<%=rs(0)%>">
  <ul class="forminfo">
    <li><label>分类名称</label><input name="tt" value="<%=rs(1)%>" type="text" id="tt" class="dfinput" /></li>
   <li>
      <label>主页显示</label><div class="vocation"><select name="class" class="select2">
      <option value="1"<%if rs("top")=1 then%> selected="selected"<%end if%>>显示</option>
          <option value="0"<%if rs("top")=0 then%> selected="selected"<%end if%>>不显示</option>
      </select></div></li>
      <li>至多显示15条</li>
    <li><label>&nbsp;</label><input name="" id="addbut" type="button" class="btn" value="确认保存"/>
      
     
    </li>
  </ul>
    </form>
<%
end if
rs.close
set rs=nothing
end if%>
<%if request.QueryString("act")="regok" and request.Form("tt")<>"" and request.QueryString("id")<>"" and isnumeric(request.QueryString("id")) then
set rs=server.createobject("adodb.recordset")
rs.open "select * from zhuti where id="&request.QueryString("id"),conn,1,3
if not rs.eof and not rs.bof then
rs(1)=request.Form("tt")
rs("top")=request.Form("class")
rs.update
Response.Write("<script>alert('修改成功');javascript:history.go(-1);</script>")
else
response.Write "修改的内容不存在！"
end if
rs.close
set rs=nothing
end if
%>
<%if request.QueryString("act")="addok" and request.Form("tt")<>""  then
set rs=server.createobject("adodb.recordset")
rs.open "select * from zhuti",conn,1,3
rs.addnew
rs(1)=request.Form("tt")
rs("top")=request.Form("class")
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
	if($("#tt").val()==""){
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
  window.location.href="zhuti.asp";
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});
});
</script>
<%conn.close
set conn=nothing%>
</body>
</html>
