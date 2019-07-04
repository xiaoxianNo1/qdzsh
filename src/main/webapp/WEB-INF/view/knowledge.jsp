<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/6/17
  Time: 9:08
  涨知识
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path =request.getContextPath();%>
<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="知税乎">
    <meta name="viewport"
          content="width=device-width, initial-scale=1">
    <title>知税乎</title>

    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">

    <!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="欢迎使用知税乎"/>

    <link rel="stylesheet" href="<%=path%>/static/source/css/amazeui.min.css">
    <link rel="stylesheet" href="<%=path%>/static/source/css/app.css">
</head>
<body onload="fastload();">
<!--注册开始-->
<div class="am-g">
    <!--头部开始-->
    <div class="am-u-sm-12 search index-search am-header-fixed">
        <form class="am-form am-margin-top-xs">
            <div class="am-input-group am-input-group-sm">
						<span class="am-input-group-btn search-l">
							<button class="am-btn am-btn-default search-l-btn" type="button"><span class="am-icon-search"></span></button>
						</span>
                <input type="text" class="am-form-field" placeholder="搜索"  onclick="loadWinOpen('/message/search')" />
                <span class="am-input-group-btn search-r">
						<button class="am-btn am-btn-default search-r-btn" type="button"><span class="am-icon-pencil-square-o"></span><a href="<%=path%>/message/publishnews">发布</a></button>
				</span>
            </div>
        </form>
    </div>
    <!--头部结束-->
    <div class="am-u-sm-12 am-padding-0 index-tab-box">
        <div data-am-widget="tabs"  class="am-tabs am-tabs-d2 am-margin-0 index-tab" >
            <ul class="am-tabs-nav am-cf index-tab-nav">
                <li ><a href="[data-tab-panel-0]" onclick="changeBq('0');">关注</a></li>
                <li class="am-active"><a href="[data-tab-panel-1]" onclick="changeBq('1');">最新</a></li>
                <li class=""><a href="[data-tab-panel-2]" onclick="changeBq('2');">热门</a></li>
            </ul>
            <div class="am-tabs-bd">
                <input type="hidden" id="xxbq" name="xxbq" value="1" />
                <input type="hidden" id="xxlx" name="xxlx" value="2" />
                <input type="hidden" id="pageNumber" name="pageNumber" value="1"/>
                <input type="hidden" id="pageSize" name="pageSize" value="10"/>

                <%--关注  开始--%>
                <div data-tab-panel-0 class="am-tab-panel" id="messageGz">
                </div>
                <%--关注  结束--%>
                <!-- 最新 开始 -->
                <div data-tab-panel-1 class="am-tab-panel am-active bg-1" id="messageZX">
                </div>
                <!-- 最新 结束 -->
                <%-- 最热 开始--%>
                <div data-tab-panel-2 class="am-tab-panel " id="messageZR">
                </div>
                <%--最热 结束--%>

            </div>
        </div>
    </div>
    <!-- 内容区结束 -->
    <!-- 底部 开始-->
    <div data-am-widget="navbar" class="am-navbar am-cf am-navbar-default "	id="">
        <ul class="am-navbar-nav am-cf am-avg-sm-4 index-navbar">
            <li >
                <a href="<%=path%>/message/message" class="">
                    <span class="am-icon-home"></span>
                    <span class="am-navbar-label">首页</span>
                </a>
            </li>
            <li>
                <a href="<%=path%>/message/knowledge" class="am-active">
                    <span class="am-icon-book"></span>
                    <span class="am-navbar-label">涨知识</span>
                </a>
            </li>
            <li>
                <a href="<%=path%>/notice/notice" class="">
                    <span class="am-icon-bell"><%--<span class="index-navbar-badge am-badge am-badge-danger am-round am-text-xs">···</span>--%></span>
                    <span class="am-navbar-label">消息</span>
                </a>
            </li>
            <li >
                <a href="<%=path%>/user/me" class="">
                    <span class="am-icon-user"><%--<span class="index-navbar-badge am-badge am-badge-danger am-round am-text-xs">8</span>--%></span>
                    <span class="am-navbar-label">我的</span>
                </a>
            </li>
        </ul>
    </div>
    <!-- 底部结束 -->
</div>
<!-- 回到顶部 开始-->
<div data-am-widget="gotop" class="am-gotop am-gotop-fixed" >
    <a href="#top" title="回到顶部">
        <span class="am-gotop-title">回到顶部</span>
        <i class="am-gotop-icon am-icon-chevron-up"></i>
    </a>
</div>
<!--回到顶部结束  -->


<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=path%>/static/plugins/jquery/jquery-2.1.4.min.js"></script>
<script src="<%=path%>/static/source/js/jquery.min.js"></script>
<script src="<%=path%>/static/plugins/layer/layer.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="<%=path%>/static/source/js/amazeui.min.js"></script>
<script src="<%=path%>/static/source/js/jquery-weui.js"></script>
<script src="<%=path%>/static/source/js/dropload.js"></script>
<script src="<%=path%>/static/source/js/qdzsh.js"></script>

<script>
    $(function () {
        if ("${message}") {
            layer.msg('${message}', {
                offset: 0
            });
        }

    });

    //页面刚进来 第一次加载
    function fastload(){
        //判断用户是否登录
        if(getCookie('userid')=='' || getCookie('usertoken')==''){
            window.location.href='<%=path%>/login/login';
            return;
        }

        var pageNum=$("input[name='pageNumber']").val();
        if(pageNum == 1){
            downLoad();
        }

    }

    //更换标签标志
    function changeBq(bqlx){
        if(bqlx=='0'){
            //关注
            $("#messageGz").empty();
            $("#xxbq").val('0');
            $("input[name='pageNumber']").val('1');
            downLoad();
        }else if(bqlx=='1'){
            //最新
            $("#messageZX").empty();
            $("#xxbq").val('1');
            $("input[name='pageNumber']").val('1');
            downLoad();
        }else if(bqlx=='2'){
            //最热
            $("#messageZR").empty();
            $("#xxbq").val('2');
            $("input[name='pageNumber']").val('1');
            downLoad();
        }

    }

    //上滑加载下一页  下拉刷新
    $(document).ready(function () {
        $(window).scroll(function () {
            var scrollTop =$(this).scrollTop();//滚动条距离顶部的高度
            var scrollHeight = $(document).height();//当前页面的总高度
            var windowHeight= $(this).height();//当前可视的页面高度
            if(scrollTop+windowHeight>=scrollHeight){//距离顶部+当前高度》= 文档总高度，即 代表滑动到底部
                console.info("上拉加载，在这里调用方法");
                downLoad();
            }else if(scrollTop<=0){//滚动条距离顶部的高度小于等于0
                console.info("下拉刷新，在这里调用");

            }
        });
    });

    //加载更多数据
    function downLoad() {
        var pageNum=$("input[name='pageNumber']").val();
        var xxlx=$("input[name='xxlx']").val();
        var ztcs=null;//$("input[name='ztcs']").val();
        var fbsj=null;//$("input[name='xxbq']").val();
        var pageSize=$("input[name = 'pageSize']").val();
        var bqlx=$("input[name = 'xxbq']").val();
        var gzbq=null;
        var userId=getCookie('userid');

        if(bqlx=='0'){
            //关注
            gzbq="获取关注";
            fbsj="最新排序";
            ztcs=null;

        }else if(bqlx=='1'){
            //最新
             ztcs=null;
             fbsj="最新排序";
             gzbq=null;
        }else if(bqlx=='2'){
            //最热
            ztcs="最热排序";
            fbsj=null;
            gzbq=null;
        }

        var jsonData={"pageNum":pageNum,
            "xxlx":xxlx,
            "ztcs":ztcs,
            "fbsj":fbsj,
            "userId":userId,
            "pageSize":pageSize,
            "gzbq":gzbq};

        $.ajax({
            type: "POST",
            url: '<%=path%>/message/getMessageJson',
            data: JSON.stringify(jsonData),
            contentType:'application/json;charset=UTF-8',
            dataType: 'json',
            success:function(data){

                if(data.code=='201'){
                    console.info("到底了");
                    return;
                }
                pageNum++;
                $("input[name='pageNumber']").val(pageNum);

                for (var i = 0; i < data.result.length; i++){
                    var items='<div class="index-new am-u-sm-12 am-margin-vertical-xs">';
                    /*<!-- 作者 -->*/
                    items += '<div class="index-new-tit am-u-sm-12 am-padding-vertical-xs am-padding-horizontal-0">';
                    items += '<div class="am-u-sm-8 am-padding-0">';
                    items += '<a href="#" class="am-block am-cf" onclick="loadWinOpen(\'chat/chat\')">';
                    items += '<div class="am-fl">';
                    items +='<img src="<%=path%>/static/source/img/person.png" alt="头像" width="50" height="50" class="am-img-thumbnail am-circle">';
                    items += '</div>';
                    items += '<div class="am-fl am-margin-left-xs am-margin-top-xs">';
                    items += '<div class="am-margin-bottom-0 am-text-sm"><strong>'+data.result[i].User_CoolName+'</strong></div>';
                    items += '<div class="am-text-xs text-gray">'+timestampToTime(data.result[i].fbsj)+'</div>';
                    items += '</div>';
                    items +='</a>';
                    items += '</div>';
                    items += '<div class="am-u-sm-4 am-cf am-margin-top-sm am-padding-0">';
                    //items += '<button type="button" class="am-btn am-btn-danger am-text-xs am-radius am-btn-xs am-padding-xs am-fr">关注</button>';
                    items += '</div>';
                    items += '</div>';
                    /*<!-- 内容区 -->*/
                    items += '<div class="index-new-main am-u-sm-12 am-padding-horizontal-0">';
                    var msgId=data.result[i].xxid;
                    items += '<a href="<%=path%>/message/messagedetails?messageId='+msgId+'"  target="frame1" >';
                    items += '<h5 class="am-text-justify">'+data.result[i].xxbt+ ' </h5> ';

                    if(data.result[i].xxtpsl==0){
                        items += ' <div class="am-u-sm-12 am-padding-0 am-text-justify">';
                        items +=data.result[i].xxnr;
                        items += '</div>';
                    }else if(data.result[i].xxtpsl>0){
                        items += '<div class="am-u-sm-9 am-padding-0 am-text-justify">';
                        items +=data.result[i].xxnr;
                        items += '</div>';
                        items += '<div class="am-u-sm-3 am-padding-right-0">';

                        if(gzbq!=null){
                            items += '<img  class="am-img-responsiv" width="100%" height="74" id=imgGz'+i+'  >';
                        }else if(fbsj!=null){
                            items += '<img  class="am-img-responsiv" width="100%" height="74" id=imgZx'+i+'  >';
                        }else if(ztcs!=null){
                            items += '<img  class="am-img-responsiv" width="100%" height="74" id=imgZr'+i+'  >';
                        }

                        items += '</div>';
                    }

                    /*else if(data.result[i].xxtpsl>1){
                        items += '<div class="am-u-sm-12 am-padding-0 am-text-justify">';
                        items +=data.result[i].xxnr;
                        items += '</div>';
                        items += '<div class="am-u-sm-12 am-margin-top-sm am-padding-0">';
                        items += '<ul class="am-avg-sm-3 img-thumbnail">';
                        items += '<li><img class="" src="< %=path%>/static/source/img/bg1.jpg"  width="96%" height="64"></li>';
                        items += '<li><img class="" src="< %=path%>/static/source/img/bg2.jpg"  width="96%" height="64"></li>';
                        items += '<li><img class="" src="< %=path%>/static/source/img/bg3.jpg"  width="96%" height="64"></li>';
                        items += '</ul>';
                        items += '</div>';
                    }*/
                    items += '</a>';
                    items += '</div>';

                    items +='<div class="index-new-footer am-margin-vertical-xs am-cf">';
                    items += '<div class="am-u-sm-6 am-padding-0">';
                    items +='<a href="<%=path%>/message/classification?flid='+data.result[i].xxfl+'" class="am-text-sm am-block">'+data.result[i].tow_towcol+'</a>';
                    items += '</div>';
                    items += '<div class="am-u-sm-6 am-padding-0">';
                    items += '<ul class="am-avg-sm-3 am-text-sm text-gray">';
                    items += '<li class="am-text-right"><i class="am-icon-commenting"></i> '+data.result[i].plcs+' </li>';
                    items +='<li class="am-padding-left-xs"><i class="am-icon-star-o"></i> '+data.result[i].sccs+'</li>';
                    items += '<li class="am-text-right" >';
                    items += '<div class="am-dropdown am-dropdown-up" data-am-dropdown>';
                    items +='<a class="am-dropdown-toggle text-gray" data-am-dropdown-toggle><!--<i class="am-icon-gear" >--></i></a>';
                    items += '<ul class="am-dropdown-content">';
                    items += '<li><a href="#">不感兴趣</a></li>';
                    items += '<li class="am-divider"></li>';
                    items += '<li><a href="#">屏蔽</a></li>';
                    items +='</ul>';
                    items += '</div>';
                    items += '</li>';
                    items += '</ul>';
                    items +='</div>';
                    items += '</div>';

                    if(gzbq!=null){
                        $("#messageGz").append(items);
                        document.getElementById("imgGz"+i).src="data:image/png;base64,"+data.result[i].tp_nr;
                    }else  if(fbsj!=null){
                        //console.info("最新");
                        $("#messageZX").append(items);
                        document.getElementById("imgZx"+i).src="data:image/png;base64,"+data.result[i].tp_nr;
                    }else if(ztcs!=null){
                        //console.info("最热");
                        $("#messageZR").append(items);
                        document.getElementById("imgZr"+i).src="data:image/png;base64,"+data.result[i].tp_nr;
                    }


                }
            },
            error: function(xhr, type){
                alert('Ajax error!');

            }
        });
    }

    //把日期字符串转换为日期格式
    function timestampToTime(timestamp) {
        var date =new Date(timestamp);
        Y=date.getFullYear()+'-';
        M=(date.getMonth()+1<10?'0'+(date.getMonth()+1):date.getMonth()+1)+'-';
        D=date.getDate()+' ';
        h=date.getHours()+':';
        m=date.getMinutes()+':';
        s=date.getSeconds();
        return Y+M+D+h+m+s;
    }

    function loadWinOpen(pageAddress) {
        window.open('<%=path%>'+pageAddress);
    }

    /*function messagedetailsPost(messageMap) {
        $.ajax({
            type: "POST",
            url: '< %=path%>/message/messagedetails',
            data: JSON.stringify(messageMap),
            contentType: 'application/json;charset=UTF-8',
            dataType: 'json',
            success: function (data) {

            },
            error: function (xhr, type) {
                alert('Ajax error!');
            }
        });
    }*/

</script>

</body>
</html>