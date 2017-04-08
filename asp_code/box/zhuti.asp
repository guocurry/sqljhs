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
<title>主体</title>
<style>body{ font-family:"Microsoft YaHei UI"}
.checkbox{ width:110px; float:left; margin-top:10px;}
.checkbtn a{ display:block; height:30px; text-align:center; line-height:30px; background-color:#06F; color:#FFF; text-decoration:none; margin-top:20px;}</style>
<script src="../script/jquery.js"></script>
<script src="../layer/layer.js"></script>
<script src="../sel_js/bootstrap.min.js"></script>
<script src="../sel_css/bootstrap/bootstrap.min.css"></script>
</head>

<body>
<div class="row">
    <div class="tj_class_box col-sm-2" style=" margin-bottom:5px;">统计图样式：
      <input class="col-sm-1" name="tongjiclass" type="radio" id="zztj" value="1"  checked="checked" onclick="class_(1)" />
      <label class="col-sm-4" for="zztj">柱状统计图</label>
       <input class="col-sm-1" type="radio" name="tongjiclass" id="xztj" value="2" onclick="class_(2)" />
      <label class="col-sm-4" for="xztj">线状统计图</label>
    </div>
</div>
<table width="100%" border="0">
  <tr>
    <td width="34%">属性数据：
      <p><select name="shuxing" id="shuxing">
       <%set rs=server.createobject("adodb.recordset")
rs.open "select * from shuxing order by id",conn,1,1
if not rs.eof and not rs.bof then
while not rs.eof%><option value="<%=rs(0)%>"><%=rs(1)%></option>
<%rs.movenext
wend
end if
rs.close
set rs=nothing%>
        
    </select></p></td>
    <td width="33%">开始年份：<p><select name="kaishi" id="kaishi">
       <%for i=1991 to year(date())%><option value="<%=i%>"<%if i=year(date())-2 then%> selected="selected"<%end if%>><%=i%></option>
<%next%>
        
    </select></p></td>
    <td width="33%">结束年份：<p><select name="jieshu" id="jieshu">
      <%for i=1991 to year(date())%><option value="<%=i%>"<%if i=year(date()) then%> selected="selected"<%end if%>><%=i%></option>
<%next%>
        
    </select></p></td>
  </tr>
</table>
<%set rs=server.createobject("adodb.recordset")
rs.open "select top 15 * from zhuti where top=1 order by id",conn,1,1
if not rs.eof and not rs.bof then
while not rs.eof%>
<div class="checkbox"><input name="zhuti" type="checkbox" id="checkbox<%=rs(0)%>" value="<%=rs(0)%>" />
<label for="checkbox<%=rs(0)%>"><%=rs(1)%></label></div>
<%
rs.movenext
wend
end if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
<div style="clear:both;"></div>
<div class="checkbtn"><a href="javascript:;" onclick="tongji()">开始统计</a></div>
<script>
var index = parent.layer.getFrameIndex(window.name);
function tongji(){
	
	text = $("input:checkbox[name='zhuti']:checked").map(function(index,elem) {
			return $(elem).val();
		}).get().join(',');
		if(text==""){alert('请至少选择一个主体');}else{
		$.post("/box/tongji_mains.asp",{zhuti:text,shuxing:$("#shuxing").val(),kaishi:$("#kaishi").val(),jieshu:$("#jieshu").val(),tjclass:$("input[name=tongjiclass]:checked").val()},
   function(data,status){
     if(status=="success"){
         parent.$("#zhuti_more").show();
		 parent.$("#tj_sbox").html(data);
//         parent.$("#tj_sbox").html(data);
         parent.$("#container").hide();
         
		 parent.layer.close(index);
		 }else{$("#tj_sbox").html("加载失败，请稍后重试");}
   });
		}
	}
</script>
</body>
</html>
