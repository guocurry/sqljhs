<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="../lingyi/infoinc/conn.asp"--><!--#include file="yz.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<%id=request.QueryString
if id="" then
nav="home"
else
nav="reg"
end if
%>
<link href="../style/home.css" rel="stylesheet" type="text/css" />
<link href="style/home.css" rel="stylesheet" type="text/css" />
<script src="../script/jquery.js"></script><script src="../layer/layer.js"></script>
</head>

<body>
<!--#include file="../top.asp"-->
<div class="user_box box">
	<div class="user_box_nav left">
    	<ul>
        	<li<%if nav="home" then%> class="onhome"<%end if%>><a href="/user/">修改信息</a></li>
            <li<%if nav="reg" then%> class="onhome"<%end if%>><a href="/user/?regpassword">修改密码</a></li>
            <li><a href="/out.asp">退出登录</a></li>
        </ul>
    </div>
    <div class="user_box_info right">
    <%set rs=server.createobject("adodb.recordset")
rs.open "select * from lj_huiyuan where zhanghao='"&request.Cookies("laji_yonghu")&"'",conn,1,1
if not rs.eof and not rs.bof then%>
   	  <form id="form1" name="form1" method="post" action="">
      <%if nav="home" then%>
       <h2 style="margin-bottom:20px;">修改信息</h2>
   	    <table width="100%" border="0" cellpadding="10" cellspacing="0">
   	      <tr>
   	        <td width="15%" align="right">用户名：</td>
   	        <td width="85%"><input name="zhanghao" type="text" class="zhuce_input" id="zhanghao" value="<%=rs("zhanghao")%>" readonly="readonly" /></td>
          </tr>
   	      <tr>
   	        <td align="right">真实姓名：</td>
   	        <td><input name="xingming" type="text" class="zhuce_input" id="xingming" maxlength="4" value="<%=rs("xingming")%>" /></td>
          </tr>
   	      <tr>
   	        <td align="right">工作单位：</td>
   	        <td><input type="text" name="danwei" class="zhuce_input" id="danwei" value="<%=rs("danwei")%>" /></td>
          </tr>
   	      <tr>
   	        <td align="right">联系电话：</td>
   	        <td><input name="dianhua" type="text" class="zhuce_input" id="dianhua" maxlength="11" value="<%=rs("dianhua")%>" /></td>
          </tr>
   	      <tr>
   	        <td align="right">邮箱：</td>
   	        <td><input type="text" name="youxiang" class="zhuce_input" id="youxiang" value="<%=rs("youxiang")%>" /></td>
          </tr>
   	      <tr>
   	        <td align="right">&nbsp;</td>
   	        <td><div class="reg_btns"><a href="javascript:;" class="zc_btn" onclick="reg()">修改信息</a><a href="javascript:;" class="zc_btns">修改中，请等待</a></div></td>
          </tr>
   	      <tr>
   	        <td align="right">&nbsp;</td>
   	        <td>&nbsp;</td>
          </tr>
   	      <tr>
   	        <td align="right">&nbsp;</td>
   	        <td>&nbsp;</td>
          </tr>
        </table>
        <%else%>
        <h2 style="margin-bottom:20px;">修改密码</h2>
        <table width="100%" border="0" cellpadding="10" cellspacing="0">
   	      <tr>
   	        <td width="15%" align="right">用户名：</td>
   	        <td width="85%"><input name="zhanghao" type="text" class="zhuce_input" id="zhanghao" value="<%=rs("zhanghao")%>" readonly="readonly" /></td>
          </tr>
   	      <tr>
   	        <td align="right">原始密码：</td>
   	        <td><input name="password" type="password" class="zhuce_input" id="password" /></td>
          </tr>
   	      <tr>
   	        <td align="right">新密码：</td>
   	        <td><input type="password" name="passwords" class="zhuce_input" id="passwords" /></td>
          </tr>
   	      <tr>
   	        <td align="right">确认密码：</td>
   	        <td><input name="passwordss" type="password" class="zhuce_input" id="passwordss" /></td>
          </tr>
   	      <tr>
   	        <td align="right">&nbsp;</td>
   	        <td><div class="reg_btns"><a href="javascript:;" class="zc_btn" onclick="regs()">修改密码</a><a href="javascript:;" class="zc_btns">修改中，请等待</a></div></td>
          </tr>
   	      <tr>
   	        <td align="right">&nbsp;</td>
   	        <td>&nbsp;</td>
          </tr>
   	      <tr>
   	        <td align="right">&nbsp;</td>
   	        <td>&nbsp;</td>
          </tr>
        </table>
        <%end if%>
  	  </form>
     <%else
	 response.Write "用户信息读取失败"
	 end if
	 rs.close
	 set rs=nothing%>
    </div>
</div>
<script>
$(function(){$(".zc_btns").hide();})
function regs(){
	if($("#password").val()==""){
		layer.tips('请输入原始密码','#password',{tips:[2,'#F30']});
	}else if($("#passwords").val()==""){
		layer.tips('请输入新密码','#passwords',{tips:[2,'#F30']});
	}else if($("#passwordss").val()==""){
		layer.tips('请输入确认密码','#passwordss',{tips:[2,'#F30']});
	}else if($("#passwordss").val()!=$("#passwords").val()){
		layer.tips('两次新密码输入不一致','#passwordss',{tips:[2,'#F30']});
	}else{
		$(".zc_btn").hide();
		$(".zc_btns").show();
		/////////
			$.post("regs.asp",{zhanghao:$("#zhanghao").val(),password:$("#password").val(),passwords:$("#passwords").val(),passwordss:$("#passwordss").val()},
   function(data,status){
     if(status=="success"){
		if(data=="err"){
		layer.tips('原始密码不正确','#password',{tips:[2,'#F30']});
			$(".zc_btn").show();
			$(".zc_btns").hide();
			}else if(data=="pass"){
				layer.tips('两次新密码输入不一致','#passwordss',{tips:[2,'#F30']});$(".zc_btn").show();
			$(".zc_btns").hide();
				}else{
			layer.msg('修改成功');$(".zc_btn").show();
			$(".zc_btns").hide();$("#password").val("");$("#passwords").val("");$("#passwordss").val("");
			}
		 }else{layer.msg("修改失败，请稍后重试！"); $(".zc_btn").show();
			$(".zc_btns").hide();}
   });
			/////////
		}
	}
function reg(){
	if($("#xingming").val()==""){
		layer.tips('请输入真实姓名','#xingming',{tips:[2,'#F30']});
	}else if($("#danwei").val()==""){
		layer.tips('请输入工作单位','#danwei',{tips:[2,'#F30']});
	}else if($("#dianhua").val()=="" || $("#dianhua").val().length!=11){
		layer.tips('请输入电话','#dianhua',{tips:[2,'#F30']});
	}else if($("#youxiang").val()==""){
		layer.tips('请输入邮箱','#youxiang',{tips:[2,'#F30']});
	}else{
		$(".zc_btn").hide();
		$(".zc_btns").show();
		/////////
			$.post("reg.asp",{zhanghao:$("#zhanghao").val(),xingming:$("#xingming").val(),danwei:$("#danwei").val(),dianhua:$("#dianhua").val(),youxiang:$("#youxiang").val()},
   function(data,status){
     if(status=="success"){
		if(data=="err"){
			layer.msg("注册信息不完整，请检查！");
			$(".zc_btn").show();
			$(".zc_btns").hide();
			}else{
			layer.msg('修改成功');$(".zc_btn").show();
			$(".zc_btns").hide();
			}
		 }else{layer.msg("修改失败，请稍后重试！"); $(".zc_btn").show();
			$(".zc_btns").hide();}
   });
			/////////
		}
	}
</script>
<%conn.close
set conn=nothing%>
</body>
</html>
