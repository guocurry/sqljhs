<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="lingyi/infoinc/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>辅助决策</title>
<link href="style/home.css" rel="stylesheet" type="text/css" />
<script src="script/jquery.js"></script><script src="layer/layer.js"></script><script src="script/lycm.min.js"></script><script src="city.js"></script>><script src="math.js"></script>
<style>
.b1tt{ font-size:14px; font-weight:bold;}
.b1tt span,.b1t{ color:#F00;}
.tbsm{padding: 8px;background-color: #FFF8F0;border-radius: 4px;color: #4D2E00; border: 1px solid #FFF1E3; margin-bottom:15px;}
.input{ height:26px; line-height:26px; padding-left:5px; width:240px; border:1px solid #ccc; border-radius:2px; font-family:"Microsoft YaHei UI";}
.select{ height:30px; border-radius:2px; border:1px solid #ccc; font-family:"Microsoft YaHei UI"; padding-left:10px; padding-right:5px;}
.fzjc_wrap h3{ margin-bottom:15px;}
.radion_s{ font-size:14px; margin-right:15px;}
.nextbtn{ width:240px; height:36px; line-height:32px; font-family:"Microsoft YaHei UI"; border:1px  solid #090; cursor:pointer; background-color:#090; color:#FFF; border-radius:2px;}
.next_wrap{ text-align:center; display:none;}
.next_wrap span{ font-size:16px; display:block; margin-bottom:25px; background-color:#eaeaea; padding:10px;}
.next_wrap a{ display:inline-block; height:30px; line-height:30px; background-color:#e1e1e1; border-radius:2px; color:#333; margin-right:20px; margin-left:20px; min-width:160px; padding-left:10px; padding-right:10px;}#jieguo_show,.jieguo_s{ background-color:#F4F4F4; border:1px solid #eaeaea; padding:10px; border-radius:4px;}
.next_wrap a:hover{ background-color:#090; color:#FFF;}#jieguo_show h3,.jieguo_s h3{ color:#06F; text-align:center;}
</style>
</head>

<body>
<!--#include file="top.asp"-->
<div class="news_box box">
<div class="onpage">您现在的位置：<a href="/">首页</a> > 辅助决策</div>
<div class="fzjc_wrap" style="background-color:#FFF; padding:10px;">
<div class="tbsm">填表说明：红色星号(*)为必填项。</div>
<form id="form1" name="form1" method="post" action="">
<div id="juce1">
<h3>社区垃圾管理决策支持数据</h3>
<table width="100%" border="0" cellpadding="10" cellspacing="0">
	  <tr>
	    <td width="20%" class="b1tt b1t" align="right">社区名称<span>*</span></td>
	    <td width="80%"><input type="text" class="input" name="sqmc" id="sqmc" /> 请录入您社区的名称</td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt b1t">社区所在城市<span>*</span></td>
	    <td><select name="selectp" id="sqsf" class="select" onChange="selectcityarea('selectp','selectc','form1');">
		<option value="0" selected>选择省份</option>
		</select>
		<select name="selectc" class="select" id="sqcs">
		<option value="0" selected>选择城市</option>
		</select>
		</td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt b1t">社区人口<span>*</span></td>
	    <td><select name="sqrk_type" id="sqrk_type" class="select">
	        <option value="1" selected="selected">人口数</option>
	        <option value="2">户数</option>
          </select>
	      <input type="text" class="input" name="sqrk" id="sqrk" /> 
        请录入您社区的实际居住人口或户数</td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt b1t">社区类型<span>*</span></td>
	    <td><input name="sqlx" type="radio" class="radio" id="sqlx_1" value="塔楼" checked="checked" />
        <label class="radion_s" for="sqlx_1">塔楼</label><input type="radio" name="sqlx" id="sqlx_2" value="板楼" />
        <label class="radion_s" for="sqlx_2">板楼</label><input type="radio" name="sqlx" id="sqlx_3" value="平房" />
        <label class="radion_s" for="sqlx_3">平房</label></td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt b1t">社区面积<span>*</span></td>
	    <td><input type="text" class="input" name="sqmj" onkeyup="value=value.replace(/[^\d.]/g,'')" id="sqmj" onkeypress="jsldmj(this.value)" /> 平方米</td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt">社区绿地面积</td>
	    <td><input type="text" class="input" name="sqldmj" onkeyup="value=value.replace(/[^\d.]/g,'')" id="sqldmj" /> 平方米</td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt">人均垃圾产生量</td>
	    <td><input type="text" class="input" name="rjljscl" onkeyup="value=value.replace(/[^\d.]/g,'');sqrlj(this.value)" id="rjljscl" /> 千克/人/日</td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt">社区日垃圾产生量</td>
	    <td><input type="text" class="input" name="sqrljscl" onkeyup="value=value.replace(/[^\d.]/g,'');sqnlj(this.value)" id="sqrljscl" /> 千克/日</td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt">社区年垃圾产生量</td>
	    <td><input type="text" class="input" name="sqnljscl" onkeyup="value=value.replace(/[^\d.]/g,'')" id="sqnljscl" /> 吨/年</td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt">社区厨余垃圾比例</td>
	    <td><input type="text" class="input" name="sqcyljbl" value="65" onkeyup="value=value.replace(/[^\d.]/g,'');cyljbl(this.value)" id="sqcyljbl" /> %</td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt">社区可回收垃圾比例</td>
	    <td><input type="text" class="input" name="sqkhsljbl" value="10" onkeyup="value=value.replace(/[^\d.]/g,'');khsljbl(this.value)" id="sqkhsljbl" /> %</td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt">社区其他垃圾比例</td>
	    <td><input type="text" class="input" name="sqqtljbl" value="25" onkeyup="value=value.replace(/[^\d.]/g,'');qtljbl(this.value)" id="sqqtljbl" /> %</td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt">社区厨余垃圾日产生量</td>
	    <td><input type="text" class="input" name="sqcyljrscl" onkeyup="value=value.replace(/[^\d.]/g,'')" id="sqcyljrscl" /> 千克/日</td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt">社区可回收垃圾日产生量</td>
	    <td><input type="text" class="input" name="sqkhsljrscl" onkeyup="value=value.replace(/[^\d.]/g,'')" id="sqkhsljrscl" /> 千克/日</td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt">社区其他垃圾日产生量</td>
	    <td><input type="text" class="input" name="sqqtljrscl" onkeyup="value=value.replace(/[^\d.]/g,'')" id="sqqtljrscl" /> 千克/日</td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt b1t">上级政府垃圾分类意愿<span>*</span></td>
	    <td><select name="sjzfljflyy" id="sjzfljflyy" class="select">
	        <option value="1" selected="selected">积极</option>
	        <option value="2">中性</option>
            <option value="3">反对</option>
          </select></td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt b1t">社区管理者垃圾分类意愿<span>*</span></td>
	    <td><select name="sqglzljflyy" id="sqglzljflyy" class="select">
	        <option value="1" selected="selected">积极</option>
	        <option value="2">中性</option>
            <option value="3">反对</option>
          </select></td>
      </tr>
	  <tr>
	    <td align="right" class="b1tt b1t">社区居民垃圾分类意愿<span>*</span></td>
	    <td><select name="sqjmljflyy" id="sqjmljflyy" class="select">
	        <option value="1" selected="selected">积极</option>
	        <option value="2">中性</option>
            <option value="3">反对</option>
          </select></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td><input type="button" value="下一步" id="next_btn" class="nextbtn" /></td>
      </tr>
    </table>
</div>
<script>
function sqnlj(a){
	$("#sqnljscl").val((a/100)*(sqrk*a));
	}
	
function cyljbl(a){
	
	var t=$("#sqrk_type").val();
	var r=$("#sqrk").val();
	if(t==2){
	sqrk=r*3	
	}else{
	sqrk=r	
	}
	var c=$("#sqrljscl").val();
	$("#sqcyljrscl").val((a/100)*(sqrk*c));
	}
function khsljbl(a){
	
	var t=$("#sqrk_type").val();
	var r=$("#sqrk").val();
	if(t==2){
	sqrk=r*3	
	}else{
	sqrk=r	
	}
	var c=$("#sqrljscl").val();
	$("#sqkhsljrscl").val((a/100)*(sqrk*c));
}
function qtljbl(a){
	
	var t=$("#sqrk_type").val();
	var r=$("#sqrk").val();
	if(t==2){
	sqrk=r*3	
	}else{
	sqrk=r	
	}
	var c=$("#sqrljscl").val();
	$("#sqqtljrscl").val((a/100)*(sqrk*c));
}
function sqrlj(a){
	var t=$("#sqrk_type").val();
	var r=$("#sqrk").val();
	if(t==2){
	sqrk=r*3	
	}else{
	sqrk=r	
	}
var sqcyljbl=$("#sqcyljbl").val();
var sqkhsljbl=$("#sqkhsljbl").val();
var sqqtljbl=$("#sqqtljbl").val();
$("#sqrljscl").val(sqrk*a);
$("#sqnljscl").val(((sqrk*a)*365)/1000);
//chuyu
$("#sqcyljrscl").val((sqcyljbl/100)*(sqrk*a));
$("#sqkhsljrscl").val((sqkhsljbl/100)*(sqrk*a));
$("#sqqtljrscl").val((sqqtljbl/100)*(sqrk*a));
	//2=r*3
	//sqrljscl
	}
function go_(id){
	$("#juce2 .next_wrap").hide();
	$("#yiyuan_"+id).show();
	}
	//结果展示页面

var schemas=[0,0,0,0,0,0,0,0,0];
function setSchema(index,status) {
    schemas[index]=status;
    //alert(schemas[index]);
}

function show_(id){
	$("#juce2").hide();
	$("#jieguo").show();
	if(id==1){$("#jieguo_show").html('<h3>不进行垃圾分类</h3>');}
	else if(id==2){
		$("#jieguo_show").html('<h3>进行垃圾分类收集，垃圾分类收集方式为：</h3>');
	}
	else{
		//caclSchema();
		var project=[0,0,0,0];
		if ((schemas[2]>0||schemas[3]>0)&&schemas[7]>0&&schemas[8]>0) {
			//alert("生化处理机处理");
			project[0]=1;
		}

		if (schemas[4]>0&&schemas[7]>0&&schemas[8]>0) {
			//alert("简易堆肥处理");
			project[1]=1;
		}

		if (schemas[5]>0&&schemas[7]>0) {
			//alert("破碎后下水道排放");
			project[2]=1;
		}

		if (schemas[6]>0) {
			//alert("由市政管理部门收运处理");
			project[3]=1;
		}
		$("#jieguo_show").hide();
		for(i=0;i<project.length;i++)
		{
		//var jisuan_=$("#jisuan_").val();
		var index=i+1;
		if (project[i]>0)
		$("#jisuan_"+index).show();
		//$("#jieguo_show").html(id);

		$("#jieguo_jj").show();
		$("#jieguo_hj").show();
		$("#jieguo_sh").show();
		}
	}
}

function jisuan_(a){
	$("#jisuan_").val(a);
	}
</script>
<div id="jieguo" style="display:none;">
	<table width="100%" border="0" cellpadding="10" cellspacing="0">
	  <tr>
	    <td width="17%" class="b1tt b1t" align="right">社区名称：</td>
	    <td width="33%"><div id="sqmc_show"></div></td>
	    <td width="20%" align="right" class="b1tt b1t" >社区所在城市：</td>
	    <td width="30%"><div id="sqszcs_show"></div></td>
      </tr>
	
	  <tr>
	    <td align="right" class="b1tt b1t">社区人口：</td>
	    <td><div id="sqrk_show"></div></td>
	    <td align="right" class="b1tt b1t">社区类型：</td>
	    <td><div id="sqlx_show"></div></td>
      </tr>
	  
	  <tr>
	    <td align="right" class="b1tt b1t">社区面积：</td>
	    <td><div id="sqmj_show"></div></td>
	    <td align="right" class="b1tt">人均垃圾产生量：</td>
	    <td><div id="rjljcsl_show"></div></td>
      </tr>

	  <tr>
	    <td align="right" class="b1tt">社区日垃圾产生量：</td>
	    <td><div id="sqrljcsl_show"></div></td>
	    <td align="right" class="b1tt">社区年垃圾产生量：</td>
	    <td><div id="sqnljcsl_show"></div></td>
      </tr>
    </table>
    <div id="jieguo_show"></div>
    <div id="jisuan_1" class="jieguo_s" style="display:none;">
    	<h3>生化处理机处理</h3>
        <div><%set rs=server.createobject("adodb.recordset")
rs.open "select * from page where page_id=22",conn,1,1
if not rs.eof and not rs.bof then
response.Write rs(2)
end if
rs.close
set rs=nothing%></div>
    </div>
    <div id="jisuan_2" class="jieguo_s" style="display:none;">
    	<h3>简易堆肥处理</h3>
        <div><%set rs=server.createobject("adodb.recordset")
rs.open "select * from page where page_id=23",conn,1,1
if not rs.eof and not rs.bof then
response.Write rs(2)
end if
rs.close
set rs=nothing%></div>
    </div>
    <div id="jisuan_3" class="jieguo_s" style="display:none;">
    	<h3>破碎后下水道排放</h3>
        <div>
<%set rs=server.createobject("adodb.recordset")
rs.open "select * from page where page_id=24",conn,1,1
if not rs.eof and not rs.bof then
response.Write rs(2)
end if
rs.close
set rs=nothing%></div>
    </div>
    <div id="jisuan_4" class="jieguo_s" style="display:none;">
    	<h3>由市政管理部门收运处理</h3>
        <div><%set rs=server.createobject("adodb.recordset")
rs.open "select * from page where page_id=25",conn,1,1
if not rs.eof and not rs.bof then
response.Write rs(2)
end if
rs.close
set rs=nothing%></div>
    </div>
    <div id="jieguo_jj" style="display:none;">
	<table width="100%" border="0" cellpadding="10" cellspacing="0">
	  <tr>
	    <td width="17%" class="b1tt b1t" align="right">设备费：</td>
	    <td width="33%"><div id="sbf_show"></div></td>
	    <td width="20%" align="right" class="b1tt b1t" >清运费：</td>
	    <td width="30%"><div id="qyf_show"></div></td>
      </tr>
	
	  <tr>
	    <td align="right" class="b1tt b1t">垃圾房面积(平方米)：</td>
	    <td><div id="sqrk_show"></div></td>
	    <td align="right" class="b1tt b1t">垃圾房投资(万元)：</td>
	    <td><div id="sqlx_show"></div></td>
      </tr>
	  
	  <tr>
	    <td align="right" class="b1tt b1t">总投资(万元)：</td>
	    <td><div id="sqmj_show"></div></td>
      </tr>

	  <tr>
	    <td align="right" class="b1tt">社区日垃圾产生量：</td>
	    <td><div id="sqrljcsl_show"></div></td>
	    <td align="right" class="b1tt">社区年垃圾产生量：</td>
	    <td><div id="sqnljcsl_show"></div></td>
      </tr>
    </table>
	</div>
	<div id="jieguo_hj" style="display:none;">
	<table width="100%" border="0" cellpadding="10" cellspacing="0">
	  <tr>
	    <td width="17%" class="b1tt b1t" align="right">减量化率：</td>
	    <td width="33%"><div id="sqmc_show"></div></td>
	    <td width="20%" align="right" class="b1tt b1t" >资源化率：</td>
	    <td width="30%"><div id="sqszcs_show"></div></td>
      </tr>
	  
	  <tr>
	    <td align="right" class="b1tt b1t">堆肥年产生量：</td>
	    <td><div id="sqmj_show"></div></td>
	    <td align="right" class="b1tt">堆肥年效益：</td>
	    <td><div id="rjljcsl_show"></div></td>
      </tr>
	  
	  <tr>
	    <td align="right" class="b1tt b1t">碳排放消减：</td>
	    <td><div id="sqmj_show"></div></td>
	    <td align="right" class="b1tt">堆肥年效益：</td>
	    <td><div id="rjljcsl_show"></div></td>
      </tr>

	  <tr>
	    <td align="right" class="b1tt">社区日垃圾产生量：</td>
	    <td><div id="sqrljcsl_show"></div></td>
	    <td align="right" class="b1tt">社区年垃圾产生量：</td>
	    <td><div id="sqnljcsl_show"></div></td>
      </tr>
    </table></div>
    <div id="jieguo_sh" style="display:none;">
	<table width="100%" border="0" cellpadding="10" cellspacing="0">
	  <tr>
	    <td width="17%" class="b1tt b1t" align="right">管理人员数：</td>
	    <td width="33%"><div id="sqmc_show"></div></td>
	    <td width="20%" align="right" class="b1tt b1t" >资源化率：</td>
	    <td width="30%"><div id="sqszcs_show"></div></td>
      </tr>
    </table></div>
</div>
<input type="hidden" id="jisuan_" value="0" />
<div id="juce2">
    <div class="next_wrap" id="yiyuan_1">
    	<span>是否计划实施垃圾分类收集？</span>
        <a href="javascript:;" onclick="go_(2);setSchema(0,1)">是</a><a href="javascript:;" onclick="show_(1);setSchema(0,0)">否</a>
    </div>
    <div class="next_wrap" id="yiyuan_2">
    	<span>请选择计划实施的垃圾分类收集方式</span>
        <a href="javascript:;" onclick="show_(2);setSchema(1,1)">可回收垃圾、其它垃圾</a><a href="javascript:;" onclick="go_(3);setSchema(1,0)">可回收垃圾、厨余垃圾、其它垃圾</a>
    </div>
     <div class="next_wrap" id="yiyuan_3">
    	<span>是否有垃圾处理房？</span>
        <a href="javascript:;" onclick="go_(9);jisuan_(1);setSchema(2,1)">是</a><a href="javascript:;" onclick="go_(4);setSchema(2,0)">否</a>
    </div>
     <div class="next_wrap" id="yiyuan_4">
    	<span>是否可新建垃圾处理房？</span>
        <a href="javascript:;" onclick="go_(9);jisuan_(1);setSchema(3,1)">是</a><a href="javascript:;" onclick="go_(5);setSchema(3.0)">否</a>
    </div>
    <div class="next_wrap" id="yiyuan_5">
    	<span>是否有可用于垃圾处理的闲置用地？</span>
        <a href="javascript:;" onclick="go_(9);jisuan_(2);setSchema(4,1)">是</a><a href="javascript:;" onclick="go_(6);setSchema(4,0)">否</a>
    </div>
    <div class="next_wrap" id="yiyuan_6">
    	<span>社区用户是否愿意接受下水改造？</span>
        <a href="javascript:;" onclick="go_(9);jisuan_(3);setSchema(5,1)">是</a><a href="javascript:;" onclick="go_(7);setSchema(5,0)">否</a>
    </div>
    <div class="next_wrap" id="yiyuan_7">
    	<span>环卫部门是否负责收集厨余垃圾？</span>
        <a href="javascript:;" onclick="show_(3);jisuan_(4);setSchema(6,1)">是</a><a href="javascript:;" onclick="show_(2);setSchema(6,0)">否</a>
    </div>
    <div class="next_wrap" id="yiyuan_9">
    	<span>是否有有购买和运行设备的资金？</span>
        <a href="javascript:;" onclick="go_(10);setSchema(7,1)">是</a><a href="javascript:;" onclick="go_(5);setSchema(7,0)">否</a>
    </div>
    <div class="next_wrap" id="yiyuan_10">
    	<span>是否有足够的安全防护距离？</span>
        <a href="javascript:;" onclick="show_(3);setSchema(8,1)">是</a><a href="javascript:;" onclick="go_(5);setSchema(8,0)">否</a>
    </div>
</div>
</form>
</div>
</div>
<script>
$(function(){
	$("#next_btn").click(function(){
		var sqmc=$("#sqmc").val();
		var sqsf=$("#sqsf").val();
		var sqcs=$("#sqcs").val();
		var sqrk=$("#sqrk").val();
		var sqlx=$("input[name=sqlx]").val();
		var sqmj=$("#sqmj").val();
		var rjlj=$("#rjljscl").val();
		var rlj=$("#sqrljscl").val();
		var nlj=$("#sqnljscl").val();
		var sqrk_s=$("#sqrk_type").val();
		var sqldmj=$("#sqldmj").val();
		var sqcyljbl=$("#sqcyljbl").val();
		var sqkhsljbl=$("#sqkhsljbl").val();
		var sqqtljbl=$("#sqqtljbl").val();
		var sqcyljrscl=$("#sqcyljrscl").val();
		var sqkhsljrscl=$("#sqkhsljrscl").val();
		var sqqtljrscl=$("#sqqtljrscl").val();
		var sjzfljflyy=$("#sjzfljflyy").val();
		var sqglzljflyy=$("#sqglzljflyy").val();
		var sqjmljflyy=$("#sqjmljflyy").val();
		if(sqrk_s==2){
			sqrk=sqrk*3;
		}
		if(sqmc==""){
			layer.alert('请输入社区名称');
		}else if(sqsf==0 || sqcs==0){
			layer.alert('请选择社区所在地');
		}else if(sqrk==""){
			layer.alert('请输入社区人口');
		}else if(sqmj==""){
			layer.alert('请输入社区面积');
		}else{
			$.post("/fzjctj.asp",{sqmc:sqmc,sqsf:sqsf,sqcs:sqcs,sqrk:sqrk,sqlx:sqlx,sqmj:sqmj,rjlj:rjlj,rlj:rlj,nlj:nlj,sqrk_s:sqrk_s,sqldmj:sqldmj,sqcyljbl:sqcyljbl,sqkhsljbl:sqkhsljbl,sqqtljbl:sqqtljbl,sqcyljrscl:sqcyljrscl,sqkhsljrscl:sqkhsljrscl,sqqtljrscl:sqqtljrscl,sjzfljflyy:sjzfljflyy,sqglzljflyy:sqglzljflyy,sqjmljflyy:sqjmljflyy},
   function(data,status){
     if(status=="success"){
		if(data=="err"){
			layer.alert('请检查所填项');
			}else{
			var sbf=sqrk*0.2/4;
			sbf=Fractional(sbf);
			var qyf=nlj*56/10000;
			qyf=Fractional(qyf);
			$("#sqmc_show").html(sqmc);
			$("#sqszcs_show").html(sqsf+" "+sqcs);
			$("#sqrk_show").html(sqrk);
			$("#sqlx_show").html(sqlx);
			$("#sqmj_show").html(sqmj+" m²");
			$("#rjljcsl_show").html(rjlj+" kg");
			$("#sqrljcsl_show").html(rlj+" kg");
			$("#sqnljcsl_show").html(nlj+" 吨");
			$("#sbf_show").html(sbf+" 万元");
			$("#qyf_show").html(qyf+" 万元");
			$("#juce1").hide();
			$("#juce2").show();
			$(".tbsm").hide();
			$("#yiyuan_1").show();
			}
		 }else{layer.msg('提交失败,请稍后重试', {icon: 2});}
   });
			
			}
		})
	})
first("selectp","selectc","form1",0,0);
function jsldmj(a){
	$("#sqldmj").val(a*0.35);
	}
</script>
<!--#include file="fot.asp"-->
</body>
<%conn.close
set conn=nothing%>
</html>
