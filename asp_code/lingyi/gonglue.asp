<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="infoinc/login.asp"-->
<!--#include file="infoinc/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>领艺后台系统 www.lycm.net.cn</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
 window.location.href='gonglue_add.asp'
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>新闻管理</li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="click"><span><img src="images/t01.png" /></span>添加</li>
        <li id="delshow"><span><img src="images/t03.png" /></span>删除</li>
        </ul>
        
        
         <ul class="toolbar1">
        搜索：<input name="" id="suser" type="text" class="scinput" style="margin-right:10px;" /><input name="" type="button" class="scbtn" value="查询" id="searchbtn"/>
        </ul> 
    
    </div>
<form id="delsuju" name="form1" method="post" action="?del=ok">    
 <%
 set rs=server.createobject("adodb.recordset")
 if request.QueryString("u")="" then
 rs.open "select * from news order by news_id desc ",conn,1,1
 else
rs.open "select * from news where news_title like '%"&request.QueryString("u")&"%' order by news_id desc ",conn,1,1
end if
if rs.eof and rs.bof then
response.Write "暂无此类信息！"
else
listnum=20
Rs.pagesize=listnum
page=Request("page")
if (page-Rs.pagecount) > 0 then
page=rs.pagecount
elseif page = "" or page < 1 then
page = 1
end if
rs.absolutepage=page
j=rs.recordcount
j=j-(page-1)*listnum
i=0
nn=request("page")
if nn="" then
n=0
else
nn=nn-1
n=listnum*nn
end if%>
    <table class="tablelist">
    	<thead>
    	<tr>
        <th width="7%"><input name="chkall" type="checkbox" id="chkall" value="select" onclick="CheckAll(this.form)" style="border:0" /><label for="chkall">全选</label></th>
        <th width="9%">编号<i class="sort"><img src="images/px.gif" /></i></th>
        <th width="58%">标题</th>
        <th width="14%">分类</th>
        <th width="12%">操作</th>
        </tr>
        </thead>
        <tbody>
<%do while not rs.eof and i<listnum
n=n+1%>
        <tr>
        <td><input name="id" type="checkbox" value="<%=rs(0)%>" /></td>
        <td><%=rs(0)%></td>
        <td><%=rs(1)%></td>
        <td><%set rss=server.createobject("adodb.recordset")
rss.open "select * from news_s_class where id ="&rs(6),conn,1,1
if rss.eof and rss.bof then
response.Write "数据处理有误"
else
response.Write rss(1)
end if
rss.close
set rss=nothing%></td>
        <td><a href="gonglue_add.asp?id=<%=rs(0)%>" class="tablelink">修改</a></td>
        </tr> 
<%rs.movenext 
i=i+1 
j=j-1
loop%>       
        </tbody>
    </table>
    
   
     <div class="pagin">
   	   <div class="message">共<i class="blue"><%=rs.recordcount%></i>条记录，当前显示第&nbsp;<i class="blue"><%=page%>&nbsp;</i>页</div>
        <ul class="paginList">
        <% if page=1 then
		else%>
         <li class="paginItem"><a href="<%=filename%>?top=<%=top%>&zt=<%=zt%>&sh=<%=sh%>&pp=<%=clpp%>&cx=<%=clcx%>&cxing=<%=clcxing%>&page=1"><span class="pagepre"></span></a></li>
       <!--<a href="<%=filename%>?cid=<%=request.QueryString("cid")%>&page=<%=page-1%>"><strong>&lt;&lt;</strong></a> <a href="<%=filename%>?cid=<%=request.QueryString("cid")%>&page=<%=page-1%>"><b>[<%=page-1%>]</b></a>-->
        <%end if%>
        <% if rs.pagecount=1 then%>
                <%else%>
                <li class="paginItem current"><a href="javascript:;"><%=page%></a></li>
                <%end if%>
                <% if rs.pagecount-page <> 0 then %>
                <li class="paginItem"><a href="<%=filename%>?top=<%=top%>&zt=<%=zt%>&sh=<%=sh%>&pp=<%=clpp%>&cx=<%=clcx%>&cxing=<%=clcxing%>&page=<%=page+1%>"><%=page+1%></a></li>
               <li class="paginItem"><a href="<%=filename%>?top=<%=top%>&zt=<%=zt%>&sh=<%=sh%>&pp=<%=clpp%>&cx=<%=clcx%>&cxing=<%=clcxing%>&page=<%=page+1%>"><span class="pagenxt"></span></a></li>
        <!--
        <li class="paginItem more"><a href="javascript:;">...</a></li>
        -->
        <%end if%>
        </ul>
    </div>
 <%end if
 rs.close
 set rs=nothing%>
</form>    
    
 <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/delicon.png" /></span>
        <div class="tipright">
        <p>是否确认删除勾选数据？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    
    
    </div>
<%if request.QueryString("del")="ok" then
if request.Form("ID")<>"" then
dim sql
sql="delete from [news] where news_id in ("&Request.Form("id")&")"
conn.Execute ( sql )
Response.Write("<script>alert(""删除成功！"");javascript:window.location.href='gonglue.asp';</script>")
else
response.Write "<script>alert('请选择需要删除的ID');</script>"
end if
end if%>   
<script type="text/javascript">
	$('.imgtable tbody tr:odd').addClass('odd');
	$("#delshow").click(function(){
		//
		$(".tip").show();
		})
	$(".sure").click(function(){
		$("#delsuju").submit();
		})
	function CheckAll(form)  {
  for (var i=0;i<form.elements.length;i++)    {
    var e = form.elements[i];
    if (e.name != 'chkall')       e.checked = form.chkall.checked; 
   }
  }
    $("#searchbtn").click(function(){
	  if($("#suser").val()!=""){
		  window.location.href='gonglue.asp?u='+$("#suser").val();
		  }else{alert('请输入搜索关键词');}
	  })
	</script>    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
