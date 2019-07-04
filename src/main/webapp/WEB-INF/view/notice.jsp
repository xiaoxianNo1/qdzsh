<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/6/14
  Time: 14:55
  To change this template use File | Settings | File Templates.
  通知
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
<body>
<!--注册开始-->
<div class="am-g">
    <div class="am-u-sm-12 am-padding-0">
        <div data-am-widget="tabs"  class="am-tabs am-tabs-d2 am-margin-0 index-tab" >
            <ul class="am-tabs-nav am-cf index-tab-nav">
                <li class="am-active"><a href="[data-tab-panel-0]">通知</a></li>
                <li ><a href="[data-tab-panel-1]">私信</a></li>
            </ul>
            <div class="am-tabs-bd">
                <div data-tab-panel-0 class="am-tab-panel am-active bg-1">
                    <div class="am-text-right am-u-sm-12 ">
                        <a href="" class="am-link-muted am-text-sm"><i class="am-icon-folder-open-o"></i> 设为全部已读</a>
                    </div>
                    <!-- 通知模块 开始 -->
                    <a href="" class="am-u-sm-12 am-margin-bottom-xs bg-white notice am-padding-top-xs">
                        <div class="am-u-sm-2 am-u-md-1 am-padding-horizontal-xs">
                            <img src="<%=path%>/static/source/img/person.png" alt="系统消息" width="40" height="40" class="am-circle">
                        </div>
                        <div class="am-u-sm-10 am-u-md-11 am-padding-horizontal-xs am-text-sm a-text-default">
                            <div class="am-u-sm-7 am-padding-0 am-text-truncate">
                                <strong>系统通知</strong>
                            </div>
                            <div class="am-u-sm-5 am-padding-0 am-text-right text-gray">
                                2019-02-20
                            </div>
                            <div href="" class="am-text-truncate am-u-sm-12 am-padding-0">
                                存在失望，歌唱，所以存在失望，歌唱，所以存在失望，歌唱，所以存在失望，歌唱，所以存在失望，歌
                            </div>
                        </div>
                    </a>
                    <!-- 通知 结束 -->
                    <!-- 通知模块 开始 -->
                    <a href="" class="am-u-sm-12 am-margin-bottom-xs bg-white notice am-padding-top-xs">
                        <div class="am-u-sm-2 am-u-md-1 am-padding-horizontal-xs">
                            <img src="<%=path%>/static/source/img/person.png" alt="系统消息" width="40" height="40" class="am-circle">
                            <span class="notice-circle am-block"></span>
                        </div>
                        <div class="am-u-sm-10 am-u-md-11 am-padding-horizontal-xs am-text-sm a-text-default">
                            <div class="am-u-sm-7 am-padding-0 am-text-truncate">
                                <strong>系统通知</strong>
                            </div>
                            <div class="am-u-sm-5 am-padding-0 am-text-right text-gray">
                                2019-02-20
                            </div>
                            <div href="" class="am-text-truncate am-u-sm-12 am-padding-0">
                                存在失望，歌唱，所以存在失望，歌唱，所以存在失望，歌唱，所以存在失望，歌唱，所以存在失望，歌
                            </div>
                        </div>
                    </a>
                    <!-- 通知 结束 -->
                    <div class="am-u-sm-12 am-text-center am-text-xs text-gray am-margin-vertical-xs">
                        我是有底线的
                        <hr class="am-margin-0"/>
                    </div>
                </div>
                <!-- 最新 开始 -->
                <input type="hidden" id="pageNumber" name="pageNumber" value="1"/>
                <input type="hidden" id="pageSize" name="pageSize" value="10"/>
                <div data-tab-panel-1 class="am-tab-panel bg-1">
                    <!-- 通知模块 开始 -->
                    <a href="" class="am-u-sm-12 am-margin-vertical-xs bg-white notice am-padding-top-xs">
                        <div class="am-u-sm-2 am-u-md-1 am-padding-horizontal-xs">
                            <img src="<%=path%>/static/source/img/person.png" alt="系统消息" width="40" height="40" class="am-circle">
                        </div>
                        <div class="am-u-sm-10 am-u-md-11 am-padding-horizontal-xs am-text-sm a-text-default">
                            <div class="am-u-sm-7 am-padding-0 am-text-truncate">
                                <strong>系统通知</strong>
                            </div>
                            <div class="am-u-sm-5 am-padding-0 am-text-right text-gray">
                                2019-02-20
                            </div>
                            <div href="" class="am-text-truncate am-u-sm-12 am-padding-0">
                                存在失望，歌唱，所以存在失望，歌唱，所以存在失望，歌唱，所以存在失望，歌唱，所以存在失望，歌
                            </div>
                        </div>
                    </a>
                    <!-- 通知 结束 -->
                    <!-- 通知模块 开始 -->
                    <a href="" class="am-u-sm-12 am-margin-bottom-xs bg-white notice am-padding-top-xs">
                        <div class="am-u-sm-2 am-u-md-1 am-padding-horizontal-xs">
                            <img src="<%=path%>/static/source/img/person.png" alt="系统消息" width="40" height="40" class="am-circle">
                            <span class="notice-circle am-block"></span>
                        </div>
                        <div class="am-u-sm-10 am-u-md-11 am-padding-horizontal-xs am-text-sm a-text-default">
                            <div class="am-u-sm-7 am-padding-0 am-text-truncate">
                                <strong>系统通知</strong>
                            </div>
                            <div class="am-u-sm-5 am-padding-0 am-text-right text-gray">
                                2019-02-20
                            </div>
                            <div href="" class="am-text-truncate am-u-sm-12 am-padding-0">
                                存在失望，歌唱，所以存在失望，歌唱，所以存在失望，歌唱，所以存在失望，歌唱，所以存在失望，歌
                            </div>
                        </div>
                    </a>
                    <!-- 通知 结束 -->
                    <div class="am-u-sm-12 am-text-center am-text-xs text-gray am-margin-vertical-xs">
                        我是有底线的
                        <hr class="am-margin-0"/>
                    </div>
                </div>
                <!-- 最新 结束 -->
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
                <a href="<%=path%>/message/knowledge" class="">
                    <span class="am-icon-book"></span>
                    <span class="am-navbar-label">涨知识</span>
                </a>
            </li>
            <li>
                <a href="<%=path%>/notice/notice" class="am-active">
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

    });




    function download() {
        var pageNum=$("input[name='pageNumber']").val();
        var pageSize=$("input[name = 'pageSize']").val();
        var userId=getCookie('userid');

        var jsonData={"pageNum":pageNum,
            "pageSize":pageSize,
            "userId":userId};

        $.ajax({
            type: "POST",
            url: '<%=path%>/chat/getChatList',
            data: JSON.stringify(jsonData),
            contentType:'application/json;charset=UTF-8',
            dataType: 'json',
            success:function(data){

            }
        });

    }
</script>
</body>
</html>
