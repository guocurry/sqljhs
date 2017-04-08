<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="infoinc/conn.asp"-->
<!--#include file="infoinc/login.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>领艺后台系统 www.lycm.net.cn</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script language="javascript">
$(function(){	
	//导航切换
	$(".imglist li").click(function(){
		$(".imglist li.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
   window.location.href='pro_reg.asp'
  });
  $(".file").click(function(){
   window.location.href='pro_file_add.asp'
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
    <li><a href="#">首页</a></li>
    <li><a href="#">图片列表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    <div class="tools">
    	<ul class="toolbar">
       <li class="click"><span><img src="images/t01.png" /></span>添加</li>
        <li class="file"><span><img src="images/t01.png" /></span>批量</li>
        <li id="delshow"><span><img src="images/t03.png" /></span>删除</li>
        </ul>
    </div>
     <form id="delsuju" name="form1" method="post" action="?del=ok">
    
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from map order by id desc",conn,1,1
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
    
    <table class="imgtable">
    
    <thead>
    <tr>
    <th width="6%" class="delid"><input name="chkall" type="checkbox" id="chkall" value="select" onclick="CheckAll(this.form)" style="border:0" /><label for="chkall">全选</label></th>
    <th width="31%">所在地</th>
    <th width="40%">标题</th>
    <th width="16%">类型</th>
    <th width="7%">操作</th>
    </tr>
    </thead>
    
    <tbody>
<%do while not rs.eof and i<listnum
n=n+1
%>
    <tr>
    <td class="delid" ><input name="ID" type="checkbox" id="ID" value="<%=rs(0)%>" style="width:20px; height:20px;"/></td>
    <td class="imgtd"><%=rs("sszzcs")%> - <%=rs("ssszq")%><p style="margin:0px; padding:0px;"><%=rs("map")%></p></td>
    <td class="imgtd"><p><a href="/pshow.asp?id=<%=rs(0)%>" target="_blank" title="点击查看"><%=rs("ssmc")%></a></p><p>发布时间：<%=rs("addtime")%></p></td>
    <td><%select case rs("class")
	case 0
	response.Write "垃圾设施地图数据"
	case else
	response.Write "垃圾监管设施地图数据"
	end select%></td>
    <td><a href="pro_reg.asp?id=<%=rs(0)%>"><img src="images/t02.png" /></a></td>
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
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
      </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    
    
    </div>
    
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
<%if request.QueryString("del")="ok" then
if request.Form("ID")<>"" then
dim sql
sql="delete from [map] where id in ("&Request.Form("id")&")"
conn.Execute ( sql )
Response.Write("<script>alert(""删除成功！"");javascript:window.location.href='pro.asp';</script>")
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
	</script>
</body>
</html>
