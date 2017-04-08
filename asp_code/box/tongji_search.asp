<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
    <%
set conn=server.createobject("ADODB.CONNECTION")
ConnStr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("/lingyi/db/tongji.asp") 
conn.open ConnStr
%>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <style>
            .selectpicker .btn span:first-child {
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                width: 130px;
            }
        </style>
        <div class="tj_class_box" style="text-align:right; margin-bottom:5px;">统计图样式：
            <input name="tongjiclass" type="radio" id="zztj" value="1" checked="checked" onclick="class_(1)" />
            <label for="zztj">柱状统计图</label>
            <input type="radio" name="tongjiclass" id="xztj" value="2" onclick="class_(2)" />
            <label for="xztj">线状统计图</label>
        </div>
        <div class="tj_search_box">
            <h2>主体</h2>
            <div id="bts-ex-4" class="selectpicker" data-live="true" data-clear="true"> <a href="#" class="clear"><span class="fa fa-times"></span><span class="sr-only">Cancel the selection</span></a>
                <button data-id="prov" type="button" class="btn btn-lg btn-block btn-default dropdown-toggle"> <span class="placeholder">选择主体</span> <span class="caret"></span> </button>
                <div class="dropdown-menu">
                    <div class="live-filtering" data-clear="true" data-autocomplete="true" data-keys="true">
                        <label class="sr-only" for="input-bts-ex-4">搜索主体</label>
                        <div class="search-box">
                            <div class="input-group"> <span class="input-group-addon" id="search-icon3">
											<span class="fa fa-search"></span> <a href="#" class="fa fa-times hide filter-clear"><span class="sr-only">Clear filter</span></a> </span>
                                <input type="text" placeholder="搜索主体" id="input-bts-ex-4" class="form-control live-search" aria-describedby="search-icon3" tabindex="1" /> </div>
                        </div>
                        <div class="list-to-filter">
                            <ul class="list-unstyled">
                                <%set rs=server.createobject("adodb.recordset")
rs.open "select * from zhuti order by id",conn,1,1
if not rs.eof and not rs.bof then
while not rs.eof%>
                                    <li onClick="zhuti_(<%=rs(0)%>)" class="filter-item items" data-filter="<%=rs(1)%>" data-value="<%=rs(0)%>">
                                        <%=rs(1)%>
                                    </li>
                                    <%rs.movenext
wend
end if
rs.close
set rs=nothing%>
                            </ul>
                            <div class="no-search-results">
                                <div class="alert alert-warning" role="alert"><i class="fa fa-warning margin-right-sm"></i>没有 <strong>'<span></span>'</strong></div>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="zhuti_num" name="bts-ex-4" value="0"> </div>
        </div>
        <div class="tj_search_box">
            <h2>属性数据</h2>
            <div id="bts-ex-5" class="selectpicker" data-live="true" data-clear="true"> <a href="#" class="clear"><span class="fa fa-times"></span><span class="sr-only">Cancel the selection</span></a>
                <button data-id="prov" type="button" class="btn btn-lg btn-block btn-default dropdown-toggle"> <span class="placeholder">选择属性</span> <span class="caret"></span> </button>
                <div class="dropdown-menu">
                    <div class="live-filtering" data-clear="true" data-autocomplete="true" data-keys="true">
                        <label class="sr-only" for="input-bts-ex-5">搜索</label>
                        <div class="search-box">
                            <div class="input-group"> <span class="input-group-addon" id="search-icon3">
											<span class="fa fa-search"></span> <a href="#" class="fa fa-times hide filter-clear"><span class="sr-only">Clear filter</span></a> </span>
                                <input type="text" placeholder="搜索" id="input-bts-ex-5" class="form-control live-search" aria-describedby="search-icon3" tabindex="1" /> </div>
                        </div>
                        <div class="list-to-filter">
                            <ul class="list-unstyled">
                                <%set rs=server.createobject("adodb.recordset")
rs.open "select * from shuxing order by id",conn,1,1
if not rs.eof and not rs.bof then
while not rs.eof%>
                                    <li onClick="shuxing_(<%=rs(0)%>)" class="filter-item items" data-filter="<%=rs(1)%>" data-value="<%=rs(0)%>">
                                        <%=rs(1)%>
                                    </li>
                                    <%rs.movenext
wend
end if
rs.close
set rs=nothing%>
                            </ul>
                            <div class="no-search-results">
                                <div class="alert alert-warning" role="alert"><i class="fa fa-warning margin-right-sm"></i>没有 <strong>'<span></span>'</strong></div>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="shuxing_num" name="bts-ex-5" value="1"> </div>
        </div>
        <div class="tj_search_box">
            <h2>开始年份</h2>
            <div id="bts-ex-3" class="selectpicker" data-clear="true"> <a href="#" class="clear"><span class="fa fa-times"></span><span class="sr-only">Cancel the selection</span></a>
                <button data-id="prov" type="button" class="btn btn-lg btn-block btn-default dropdown-toggle"> <span class="placeholder">2011</span> <span class="caret"></span> </button>
                <div class="dropdown-menu">
                    <ul class="list-unstyled" style="max-height:300px; overflow:hidden; overflow-y:auto;">
                        <%for i=1991 to year(date())%>
                            <li onClick="kaishi_(<%=i%>)" class="items<%if i=2011 then%> selected<%end if%>" data-value="<%=i%>">
                                <%=i%>
                            </li>
                            <%next%>
                    </ul>
                </div>
                <input type="hidden" name="bts-ex-3" id="kaishi_num" value="2011"> </div>
        </div>
        <div class="tj_search_box">
            <h2>结束年份</h2>
            <div id="bts-ex-2" class="selectpicker" data-clear="true"> <a href="#" class="clear"><span class="fa fa-times"></span><span class="sr-only">Cancel the selection</span></a>
                <button data-id="prov" type="button" class="btn btn-lg btn-block btn-default dropdown-toggle"> <span class="placeholder"><%=year(date())%></span> <span class="caret"></span> </button>
                <div class="dropdown-menu">
                    <ul class="list-unstyled" style="max-height:300px; overflow:hidden; overflow-y:auto;" id="jiesu_year">
                        <%for i=1991 to year(date())%>
                            <li onClick="jieshu_(<%=i%>)" class="items<%if i=2016 then%> selected<%end if%>" data-value="<%=i%>">
                                <%=i%>
                            </li>
                            <%next%>
                    </ul>
                </div>
                <input type="hidden" name="bts-ex-2" id="jieshu_num" value="<%=year(date())%>"> </div>
        </div>
        <script>
            function class_(a) {
                $("#tj_sbox").html('<div style="text-align:center; color:#999;"><img src="images/loading.gif" width="40" /><p>统计数据加载中</p></div>');
                var zhuti = $("#zhuti_num").val();
                var shuxing = $("#shuxing_num").val();
                var kaishi = $("#kaishi_num").val();
                var jieshu = $("#jieshu_num").val();
                var tjclass = $("input[name=tongjiclass]:checked").val();
                /////////
                $.post("/box/tongji_mains.asp", {
                    zhuti: zhuti
                    , shuxing: shuxing
                    , kaishi: kaishi
                    , jieshu: jieshu
                    , tjclass: a
                }, function (data, status) {
                    if (status == "success") {
                        $("#tj_sbox").html(data);
                    }
                    else {
                        $("#tj_sbox").html("加载失败，请稍后重试");
                    }
                });
                /////////
            }

            function zhuti_(a) {
                $("#tj_sbox").html('<div style="text-align:center; color:#999;"><img src="images/loading.gif" width="40" /><p>统计数据加载中</p></div>');
                var shuxing = $("#shuxing_num").val();
                var kaishi = $("#kaishi_num").val();
                var jieshu = $("#jieshu_num").val();
                var tjclass = $("input[name=tongjiclass]:checked").val();
                /////////
                $.post("/box/tongji_mains.asp", {
                    zhuti: a
                    , shuxing: shuxing
                    , kaishi: kaishi
                    , jieshu: jieshu
                    , tjclass: tjclass
                }, function (data, status) {
                    if (status == "success") {
                        $("#tj_sbox").html(data);
                    }
                    else {
                        $("#tj_sbox").html("加载失败，请稍后重试");
                    }
                });
                /////////
            }

            function shuxing_(a) {
                var zhuti = $("#zhuti_num").val();
                var shuxing = $("#shuxing_num").val();
                var kaishi = $("#kaishi_num").val();
                var jieshu = $("#jieshu_num").val();
                var tjclass = $("input[name=tongjiclass]:checked").val();
                $("#tj_sbox").html('<div style="text-align:center; color:#999;"><img src="images/loading.gif" width="40" /><p>统计数据加载中</p></div>');
                var shuxing = $("#shuxing_num").val();
                var kaishi = $("#kaishi_num").val();
                var jieshu = $("#jieshu_num").val();
                var shuxingget = "";
                /////////
                if (shuxing == 3 || shuxing == 4) {
                    shuxingget = "/box/tongji_mains.asp?get=bai";
                }
                else {
                    shuxingget = "/box/tongji_mains.asp";
                }
                $.post(shuxingget, {
                    zhuti: zhuti
                    , shuxing: a
                    , kaishi: kaishi
                    , jieshu: jieshu
                    , tjclass: tjclass
                }, function (data, status) {
                    if (status == "success") {
                        $("#tj_sbox").html(data);
                    }
                    else {
                        $("#tj_sbox").html("加载失败，请稍后重试");
                    }
                });
            }

            function kaishi_(a) {
                var zhuti = $("#zhuti_num").val();
                var shuxing = $("#shuxing_num").val();
                var kaishi = $("#kaishi_num").val();
                var jieshu = $("#jieshu_num").val();
                var tjclass = $("input[name=tongjiclass]:checked").val();
                /////////
                $.post("/box/tongji_mains.asp", {
                    zhuti: zhuti
                    , shuxing: shuxing
                    , kaishi: a
                    , jieshu: jieshu
                    , tjclass: tjclass
                }, function (data, status) {
                    if (status == "success") {
                        $("#tj_sbox").html(data);
                    }
                    else {
                        $("#tj_sbox").html("加载失败，请稍后重试");
                    }
                });
                /////////
            }

            function jieshu_(a) {
                var zhuti = $("#zhuti_num").val();
                var shuxing = $("#shuxing_num").val();
                var kaishi = $("#kaishi_num").val();
                var jieshu = $("#jieshu_num").val();
                var tjclass = $("input[name=tongjiclass]:checked").val();
                /////////
                if (a < kaishi) {
                    alert("结束年份不能小于开始年份");
                }
                else {
                    $.post("/box/tongji_mains.asp", {
                        zhuti: zhuti
                        , shuxing: shuxing
                        , kaishi: kaishi
                        , jieshu: a
                        , tjclass: tjclass
                    }, function (data, status) {
                        if (status == "success") {
                            $("#tj_sbox").html(data);
                        }
                        else {
                            $("#tj_sbox").html("加载失败，请稍后重试");
                        }
                    });
                }
                /////////
            }
        </script>
        <script src="sel_js/bootstrap.min.js"></script>
        <script src="sel_js/vendor/tabcomplete.min.js"></script>
        <script src="sel_js/vendor/livefilter.min.js"></script>
        <script src="sel_js/vendor/src/bootstrap-select.js"></script>
        <script src="sel_js/vendor/src/filterlist.js"></script>
        <script src="sel_js/plugins.js"></script>
        <%conn.close
						set conn=nothing%>