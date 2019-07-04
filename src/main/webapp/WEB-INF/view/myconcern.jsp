<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/6/18
  Time: 16:03
  我的关注
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>知税乎</title>
    <%--我的关注--%>
    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">

    <!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="欢迎使用知税乎" />

    <link rel="stylesheet" href="<%=path%>/static/source/css/amazeui.min.css">
    <link rel="stylesheet" href="<%=path%>/static/source/css/app.css">
</head>

<body class="bg-1">
<!--注册开始-->
<div class="am-g">
    <header data-am-widget="header" class="am-header am-header-default am-header-fixed bg-1 header-gray">
        <div class="am-header-left am-header-nav">
            <a href="javascript:;" class="am-text-sm" onclick="backClick();">
                <i class="am-header-icon am-icon-angle-left"></i> 返回
            </a>
        </div>

        <h1 class="am-header-title">
            <a href="javascript:;" class="title-link">
                我的关注
            </a>
        </h1>

        <!--<div class="am-header-right am-header-nav">
                <a href="#" class="">
                      注册
                </a>
            </div>-->
    </header>
    <div class="am-u-sm-12 am-padding-0">
        <div data-am-widget="tabs" class="am-tabs am-tabs-d2 am-margin-0 index-tab">
            <ul class="am-tabs-nav am-cf index-tab-nav">
                <li class="am-active"><a href="[data-tab-panel-0]">用户</a></li>
                <li><a href="[data-tab-panel-1]">分类</a></li>
            </ul>
            <div class="am-tabs-bd">
                <div data-tab-panel-0 class="am-tab-panel am-active bg-1">
                    <!-- 取消用户关注模块 开始 -->
                    <div class="am-u-sm-12 user-remove">
                        <ul class="am-u-sm-9 am-padding-0">
                            <a href="" class="a-text-default am-block">
                                <li><img src="assets/img/person.png" class="am-circle" width="40" height="40"></li>
                                <li><strong>知税乎大哥第三个sasfasdf ds</strong></li>
                            </a>
                        </ul>
                        <div class="am-u-sm-3 am-md-1 am-padding-0 am-text-right">
                            <button class="am-btn am-btn am-btn-danger am-btn-sm am-margin-top-sm">取消关注</button>
                        </div>
                    </div>
                    <!-- 取消用户关注模块 结束 -->
                    <!-- 取消用户关注模块 开始 -->
                    <div class="am-u-sm-12 user-remove">
                        <ul class="am-u-sm-9 am-padding-0">
                            <a href="" class="a-text-default am-block">
                                <li><img src="assets/img/person.png" class="am-circle" width="40" height="40"></li>
                                <li><strong>知税乎大哥第三个sasfasdf ds</strong></li>
                            </a>
                        </ul>
                        <div class="am-u-sm-3 am-md-1 am-padding-0 am-text-right">
                            <button class="am-btn am-btn am-btn-danger am-btn-sm am-margin-top-sm">取消关注</button>
                        </div>
                    </div>
                    <!-- 取消用户关注模块 结束 -->
                    <!-- 取消用户关注模块 开始 -->
                    <div class="am-u-sm-12 user-remove">
                        <ul class="am-u-sm-9 am-padding-0">
                            <a href="" class="a-text-default am-block">
                                <li><img src="assets/img/person.png" class="am-circle" width="40" height="40"></li>
                                <li><strong>知税乎大哥第三个sasfasdf ds</strong></li>
                            </a>
                        </ul>
                        <div class="am-u-sm-3 am-md-1 am-padding-0 am-text-right">
                            <button class="am-btn am-btn am-btn-danger am-btn-sm am-margin-top-sm">取消关注</button>
                        </div>
                    </div>
                    <!-- 取消用户关注模块 结束 -->

                    <div class="am-u-sm-12 am-text-center am-text-xs text-gray am-margin-vertical-xs">
                        我是有底线的
                        <hr class="am-margin-0" />
                    </div>
                </div>
                <!-- 最新 开始 -->
                <div data-tab-panel-1 class="am-tab-panel bg-1">
                    <!-- 取消用户关注模块 开始 -->
                    <div class="am-u-sm-12 user-remove">
                        <a href="" class="a-text-default am-block am-u-sm-9 am-text-truncate">
                            知税乎大哥第三个sasfasdf ds
                        </a>
                        <div class="am-u-sm-3 am-md-1 am-padding-0 am-text-right">
                            <button class="am-btn am-btn am-btn-danger am-btn-sm am-margin-top-sm">取消关注</button>
                        </div>
                    </div>
                    <!-- 取消用户关注模块 结束 -->
                    <!-- 取消用户关注模块 开始 -->
                    <div class="am-u-sm-12 user-remove">
                        <a href="" class="a-text-default am-block am-u-sm-9 am-text-truncate">
                            知税乎大哥第三个sasfasdf ds
                        </a>
                        <div class="am-u-sm-3 am-md-1 am-padding-0 am-text-right">
                            <a class="am-btn am-btn am-btn-danger am-btn-sm am-margin-top-sm">取消关注</a>
                        </div>
                    </div>
                    <!-- 取消用户关注模块 结束 -->
                    <!-- 取消用户关注模块 开始 -->
                    <div class="am-u-sm-12 user-remove">
                        <a href="" class="a-text-default am-block am-u-sm-9 am-text-truncate">
                            知税乎大哥第三个sasfasdf ds
                        </a>
                        <div class="am-u-sm-3 am-md-1 am-padding-0 am-text-right">
                            <button class="am-btn am-btn am-btn-danger am-btn-sm am-margin-top-sm">取消关注</button>
                        </div>
                    </div>
                    <!-- 取消用户关注模块 结束 -->

                    <div class="am-u-sm-12 am-text-center am-text-xs text-gray am-margin-vertical-xs">
                        我是有底线的
                        <hr class="am-margin-0" />
                    </div>
                </div>
                <!-- 最新 结束 -->
            </div>
        </div>
    </div>
    <!-- 内容区结束 -->
</div>

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=path%>/static/plugins/jquery/jquery-2.1.4.min.js"></script>
<script src="<%=path%>/static/source/js/jquery.min.js"></script>
<script src="<%=path%>/static/plugins/layer/layer.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="/static/source/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="<%=path%>/static/source/js/amazeui.min.js"></script>
<script src="<%=path%>/static/source/js/qdzsh.js"></script>
</body>

</html>