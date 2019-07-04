<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/6/3
  Time: 10:51
  邮箱找回密码
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
<body>
<!--注册开始-->
<div class="am-g">
    <!--头部开始-->
    <header data-am-widget="header" class="am-header am-header-default bg-primary">
        <div class="am-header-left am-header-nav">
            <a href="<%=path%>/forget/forget" class="am-text-sm">
                <i class="am-header-icon am-icon-angle-left"></i> 返回
            </a>
        </div>

        <h1 class="am-header-title">
            <a href="#" class="title-link">
                邮箱找回
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
    <div id=""class="am-u-sm-12">
        <form class="am-form form-register am-margin-top-xl" action="<%=path%>/forget/retrieveemail" method="post" onsubmit="checkForgetFrom()">
            <div class="am-form-group">
                <input type="text" class=""  placeholder="请输入邮箱" id="email" name="email">
            </div>
            <div class="am-form-group">
                <input type="text" class=""  placeholder="请输入手机号" id="phone" name="phone">
            </div>
            <input type="submit" class="am-btn am-btn-secondary am-btn-block am-margin-top-lg" data-am-modal="{target: '#email'}" value="确 定"/>
        </form>
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
<script src="/static/source/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="<%=path%>/static/source/js/amazeui.min.js"></script>
<script>
    function checkForgetFrom() {
        var  email= $('#email').val();
        if (isNull(email)) {
            $('#submit').attr('value', '请输入邮箱!').css('background', 'red');
            return false;
        }

        var  phone= $('#phone').val();
        if (isNull(phone)) {
            $('#submit').attr('value', '请输入手机号!').css('background', 'red');
            return false;
        }
        return true;
    }
</script>
</body>
</html>