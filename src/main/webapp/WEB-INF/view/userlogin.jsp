<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/5/28
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www/wapforum.org/DTD/xhtml-mobile10.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path =request.getContextPath();%>
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
    <header data-am-widget="header" class="am-header">
        <div class="am-header-left am-header-nav">
            <a href="#" class="link-text-black">
                <i class="am-header-icon am-icon-times"></i>
            </a>
        </div>

        <!--<h1 class="am-header-title">
            <a href="#title-link" class="">

            </a>
        </h1>-->

        <div class="am-header-right am-header-nav am-text-sm">
            <a href="<%=path%>/register/register" class="">
                注册
            </a>
        </div>
    </header>

    <!--头部结束-->
    <!--登录表单 开始-->
    <div id=""class="am-u-sm-12">
        <p class="am-text-xl am-text-center am-margin">用户登录</p>
        <form id="login-from" class="am-form form-register" action="<%=path%>/login/userLogin" method="post" onsubmit="return checkLoginForm()">
            <div class="am-form-group">
                <input type="text" class="" id = "username" name ="useraccount"  placeholder="请输入手机号/邮箱">
            </div>
            <div class="am-form-group am-margin-bottom-0">
                <input type="password" class="" id="password" name="password"  placeholder="请输入密码">
            </div>
            <!--<div class="am-input-group">
              <input type="password" class="am-form-field"  placeholder="请输入密码">
               <span class="am-input-group-label"><i class="am-icon-eye"></i></span>
            </div>  -->
            <p class="am-text-right am-margin-vertical-xs"><a href="<%=path%>/forget/forget" class="am-text-sm text-gray">忘记密码</a></p>
            <input type="submit" class="am-btn am-btn-secondary am-btn-block" id="submit" value="登录" ></input>
        </form>

        <p class="am-margin-vertical-xs am-text-sm text-gray">如果您没有账号，请先<a href="<%=path%>/register/register" class="am-text-sm">注册</a></p>
        <!--登录表单 结束-->
        <!--第三方登录 开始-->
        <div class="other-register" style="display:none ">
            <span class="other-register-tit am-text-center am-text-sm">第三方登录</span>
            <hr data-am-widget="divider" style="" class="am-divider am-divider-default" />
            <div class="am-u-sm-3 am-u-sm-centered am-text-center"><a href="#" class="am-icon-btn am-success am-icon-wechat"></a></div>
            <p class="am-text-sm text-gray">登录即代表您已同意我们的<a href="" class="am-text-sm">服务协议</a>和<a href="" class="am-text-sm">隐私政策</a></p>
        </div>
        <!--第三方登录 结束-->
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
    $(function () {
        <c:if test="${not empty param.timeout}">
        layer.msg('连接超时,请重新登陆!', {
            offset: 0,
            shift: 6
        });
        </c:if>

        if ("${error}") {
            $('#submit').attr('value', "${error}").css('background', 'red');
        }

        if ("${message}") {
            layer.msg('${message}', {
                offset: 0
            });
        }

        $('.close').on('click', function (c) {
            $('.login-form').fadeOut('slow', function (c) {
                $('.login-form').remove();
            });
        });

        $('#username,#password').change(function () {
            $('#submit').attr('value', '登录').css('background', '#00aaff');
        });
    });

    function checkLoginForm() {
        //console.info("开始检验");

        var username = $('#username').val();
        var password = $('#password').val();

        var reg=/^1[34578][0-9]{9}/;
        var reg1=/[a-zA-Z0-9]{1,10}@[a-zA-Z0-9]{1,5}\.[a-zA-Z0-9]{1,5}/;
        if(!reg.test(username) && !reg1.test(username)){
            $('#submit').attr('value', '请输入正确的手机号或邮箱!').css('background', 'red');
            return false;
        }

        if (isNull(username) && isNull(password)) {
            //console.info("请输入账号和密码!");
            $('#submit').attr('value', '请输入账号和密码!').css('background', 'red');
            return false;
        }
        if (isNull(username)) {
            console.info("请输入账号!!!");
            $('#submit').attr('value', '请输入账号!').css('background', 'red');
            return false;
        }
        if (isNull(password)) {
            console.info("请输入密码!!!");
            $('#submit').attr('value', '请输入密码!').css('background', 'red');
            return false;
        }

        $('#submit').attr('value', '登录中~');
        return true;
    }

    function isNull(input) {
        if (input == null || input == '' || input == undefined) {
            return true;
        }
        else {
            return false;
        }
    }
</script>

</body>
</html>
