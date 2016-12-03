<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员登录</title>
<script src="../script/jquery.js"></script><script src="../layer/layer.js"></script>
<style>
body,td,th {font-family: "微软雅黑";font-size: 14px;}
a{ text-decoration:none;}
.zhuce_input{width: 250px;height: 26px;border: 1px solid #CCC; padding-left:5px; font-family:"微软雅黑"; font-size:14px;}
.reg_btns a{ display:block; width:255px; height:36px; background-color:#060; color:#FFF; line-height:36px; text-align:center; font-size:14px;}
.reg_btns a:hover{ background-color:#F30;}
.reg_box_login{height: 120px;border-left-width: 1px;border-left-style: solid;border-left-color: #DDD; padding-left:20px; padding-right:10px;}
.reg_box_login a.reg_login{ display:block; height:30px; line-height:30px; text-align:center; color:#FFF; background-color:#999;}
.reg_box_login p{ font-size:12px; color:#999;}
.reg_box_login a.reg_login:hover{ background-color:#060; color:#FFF;}
.reg_btns a.zc_btns{display:block; width:255px; height:36px; background-color:#060; color:#FFF; line-height:36px; text-align:center; font-size:14px; background-color:#999; cursor:wait;}
</style>
</head>

<body>
<form id="form1" name="form1" method="post" action="">
  <table width="100%" border="0" cellpadding="10" cellspacing="0">
    <tr>
      <td width="23%" align="right">帐号：</td>
      <td width="30%"><input name="zhanghao" type="text" class="zhuce_input" id="zhanghao" maxlength="12" /></td>
      <td width="47%" rowspan="8"><div class="reg_box_login"><p>登录会员，享受更多服务！</p><h3>没有有帐号？赶紧注册</h3><a href="javascript:;" onclick="regs()" class="reg_login">会员注册</a></div></td>
    </tr>
    <tr>
      <td align="right">密码：</td>
      <td><input name="password" type="password" class="zhuce_input" id="password" maxlength="12" /></td>
    </tr>
    <tr>
      
    </tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td><div class="reg_btns"><a href="javascript:;" class="zc_btn" onclick="login()">登录会员</a><a href="javascript:;" class="zc_btns">注册中，请等待</a></div></td>
    </tr>
  </table>
</form>
<script>
$(function(){$(".zc_btns").hide();})
function login(){
	if($("#zhanghao").val()=="" || $("#zhanghao").val().length>12 || $("#zhanghao").val().length<6){
		layer.tips('请输入帐号','#zhanghao',{tips:[2,'#F30']});
		}else if($("#password").val()==""){
		layer.tips('请输入密码','#password',{tips:[2,'#F30']});	
		}else{
			$(".zc_btn").hide();
			$(".zc_btns").show();
			/////////
			$.post("/box/login_o.asp",{zhanghao:$("#zhanghao").val(),password:$("#password").val()},
   function(data,status){
     if(status=="success"){
		if(data=="err"){
			layer.msg("登录信息不完整，请检查！");
			$(".zc_btn").show();
			$(".zc_btns").hide();
			}else if(data=="zhanghao"){
			layer.tips('用户名不存在','#zhanghao',{tips:[2,'#F30']});	
			 $(".zc_btn").show();
			$(".zc_btns").hide();
				}
		else if(data=="pass"){
			layer.tips('用户名/密码不正确','#password',{tips:[2,'#F30']});	
			 $(".zc_btn").show();
			$(".zc_btns").hide();
			 }else{
			layer.msg('登录成功，正在跳转');
		parent.location.reload();
		//_top.window.location.href='/users/';
			}
		 }else{layer.msg("登录失败，请稍后重试！"); $(".zc_btn").show();
			$(".zc_btns").hide();}
   });
			/////////
			}
	}
	
function regs (){
	var index=parent.layer.getFrameIndex(window.name);
	parent.layer.open({
    type: 2,
	title:'会员注册',
    area: ['610px', '500px'],
    fix: false, //不固定
	scrollbar: false,
    content: '/box/regs.asp',
});
parent.layer.close(index);
	}
</script>
</body>
</html>
