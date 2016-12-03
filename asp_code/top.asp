<div class="top">
	<div class="top_box box">
    	<div class="logo left"><img src="/images/logo.jpg" /></div>
        <%if request.Cookies("laji_yonghu")="" then%><div class="login right">
        	<a href="javascript:;" onClick="login()">会员登录</a><span>|</span><a href="javascript:;" onClick="regs()" class="regs">会员注册</a>
        </div><%else%><div class="logins right">
        	Hi，<%=request.Cookies("laji_yonghu")%><a href="/user/">个人中心</a><span>|</span><a href="/out.asp" class="regs">退出</a>
        </div><%end if%>
    </div>
</div>
<div class="nav">
	<div class="nav_box box">
    	<div class="nav_s left">
        	<ul>
            	<li><a href="/">首页</a></li>
                <li><a href="/news.asp">信息发布</a></li>
                <li><a href="/statistics.asp">数据统计</a></li>
                <li><a href="/fzjc.asp">辅助决策</a></li>
                <li><a href="/map.asp?online">在线监管</a></li>
                <li class="bottom"><a href="/map.asp">垃圾地图</a></li>
            </ul>
        </div>
      <div class="search right">
        	<div class="search_box">
        	  <input type="text" name="home_search" class="home_search left" placeholder="站内搜索" id="home_search" /><a href="javascript:;" onclick="searchs()" class="right">搜索</a>
       	  </div>
      </div>
    </div>
</div>
<script>
function searchs(){
	if($("#home_search").val()==""){
		alert("请输入关键词");
		}else{
			 window.location.href='/news.asp?u='+$("#home_search").val();
			}
	}
</script>