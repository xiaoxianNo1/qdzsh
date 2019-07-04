<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/6/3
  Time: 10:18
  忘记密码页面
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
<body class="bg-1">
<!--注册开始-->
<div class="am-g">
    <!--头部开始-->
    <header data-am-widget="header" class="am-header am-header-default bg-primary">
        <div class="am-header-left am-header-nav">
            <a href="<%=path%>/login/login" class="am-text-sm">
                <i class="am-header-icon am-icon-angle-left"></i> 返回
            </a>
        </div>

        <h1 class="am-header-title">
            <a href="#title-link" class="">
                忘记密码
            </a>
        </h1>

        <!--<div class="am-header-right am-header-nav">
            <a href="#" class="">
                  注册
            </a>
        </div>-->
    </header>
    <!--头部结束-->
    <!--找回方式 开始-->
    <div id=""class="am-u-sm-12 am-padding-horizontal-0 forgetpassword">
        <div data-am-widget="list_news" class="am-list-news am-list-news-default am-margin-0" >
            <!--列表标题-->
            <div class="am-list-news-hd am-cf">
                <p class="am-padding-left am-margin-0">请选择以下认证方式找回</p>
            </div>

            <div class="am-list-news-bd">
                <ul class="am-list">
                    <%--<li class="am-g am-list-item-dated am-padding-left">
                        <a href="<%=path%>/forget/forgetphone" class="am-list-item-hd a-text-default "><i class="am-icon-mobile am-text-danger am-text-xl" style="line-height: 16px;"></i> 手机验证
                            <span class="am-list-date"><i class="am-icon-angle-right"></i></span>
                        </a>
                    </li>--%>
                    <li class="am-g am-list-item-dated am-padding-left">
                        <a href="<%=path%>/forget/forgetemail" class="am-list-item-hd a-text-default" data-am-modal="{target: '#email'}"><i class="am-icon-envelope-o am-text-secondary"></i> 邮箱验证
                            <span class="am-list-date"><i class="am-icon-angle-right"></i></span>
                        </a>
                    </li>
                </ul>
            </div>

        </div>
        <%--<!--模态窗口-->
        <div class="am-modal am-modal-alert" tabindex="-1" id="email">
            <div class="am-modal-dialog">
                <!--<div class="am-modal-hd">邮箱验证</div>-->
                <div class="am-modal-bd">
                    已经将密码发送到1655……23@163.com，请前往邮箱查看。
                </div>
                <div class="am-modal-footer">
                    <span class="am-modal-btn">确定</span>
                </div>
            </div>
        </div>--%>

        <!--找回方式 结束-->
    </div>
</div>
<!--注册结束-->

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
</body>
</html>