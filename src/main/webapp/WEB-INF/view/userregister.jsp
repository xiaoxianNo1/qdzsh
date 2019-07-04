<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/5/31
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www/wapforum.org/DTD/xhtml-mobile10.dtd">
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
    <header data-am-widget="header" class="am-header am-header-default bg-primary">
        <div class="am-header-left am-header-nav">
            <a href="<%=path%>/login/login" class="am-text-sm">
                <i class="am-header-icon am-icon-angle-left"></i> 返回
            </a>
        </div>

        <h1 class="am-header-title">
            <a href="#title-link" class="">
                注册
            </a>
        </h1>

        <!--<div class="am-header-right am-header-nav">
            <a href="#" class="">
                  注册
            </a>
        </div>-->
    </header>
    <!--头部结束-->
    <!--注册表单 开始-->
    <div id=""class="am-u-sm-12">
        <form class="am-form form-register am-margin-top-sm form-logon" action="<%=path%>/register/userregister" method="post" onsubmit="return checkRegisterFrom()">
            <div class="am-input-group am-margin-top-xs">
                <span class="am-input-group-label"><i class="am-icon-user am-text-secondary"></i></span>
                <input type="text" class="am-form-field"  placeholder="请输入昵称" maxlength="10" id="nickname" name="nickname">
            </div>
            <div class="am-input-group am-margin-top-xs">
                <span class="am-input-group-label"><i class="am-icon-intersex am-text-secondary"></i></span>
                <input type="text" class="am-form-field" id="sex" name="sex"  placeholder="请选择性别" list="sexlist" onClick="" maxlength="1">
                    <datalist id="sexlist">
                        <option>男</option>
                        <option>女</option>
                    </datalist>
            </div>
            <div class="am-input-group am-margin-top-xs">
                <span class="am-input-group-label"><i class="am-icon-mobile-phone am-text-lg am-text-secondary"></i></span>
                <input type="tel" class="am-form-field"  placeholder="请输入手机号" maxlength="11" id="phone" name="phone">
            </div>
            <%--<div class="am-input-group am-margin-top-xs">
                <span class="am-input-group-label"><i class="am-icon-code am-text-secondary"></i></span>
                <input type="text" class="am-form-field"  placeholder="请输入验证码">
                <span class="am-input-group-btn">
                    <button class="am-btn am-btn-secondary am-radius" type="button">获取验证码</button>
                </span>
            </div>--%>
            <div class="am-input-group am-margin-top-xs">
                <span class="am-input-group-label"><i class="am-icon-envelope-o am-text-secondary" ></i></span>
                <input type="text" class="am-form-field"  placeholder="请输入邮箱" id="email" name="email">
            </div>
            <div class="am-input-group am-margin-top-xs">
                <span class="am-input-group-label"><i class="am-icon-key am-text-secondary" ></i></span>
                <input type="password" class="am-form-field"  placeholder="请输入密码" minlength="5" maxlength="20" id="password" name="password">
            </div>
            <div class="am-input-group am-margin-top-xs">
                <span class="am-input-group-label"><i class="am-icon-key am-text-secondary"  ></i></span>
                <input type="password" class="am-form-field"  placeholder="请再次输入密码" minlength="5" maxlength="20" id="confirm">
            </div>
            <input type="submit" class="am-btn am-btn-secondary am-btn-block am-margin-top-lg bg-primary" id="submit" value ="注  册"></input>
        </form>

        <!--注册表单 结束-->
    </div>
</div>
<!--注册结束-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=path%>/static/source/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
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
                offset: 0,
            });
        }

    });

    function checkRegisterFrom() {
        var nickname=$('#nickname').val();
        var sex  = $('#sex').val();
        var  phone= $('#phone').val();
        var  email= $('#email').val();
        var  password= $('#password').val();
        var confirm = $('#confirm').val();
        if (isNull(nickname)) {
            $('#submit').attr('value', '请输入昵称!').css('background', 'red');
            return false;
        }
        if (isNull(sex)) {
            $('#submit').attr('value', '请选择性别!').css('background', 'red');
            return false;
        }
        if (isNull(phone)) {
            $('#submit').attr('value', '请输入手机号!').css('background', 'red');
            return false;
        }
        if (isNull(email)) {
            $('#submit').attr('value', '请输入邮箱!').css('background', 'red');
            return false;
        }
        if (isNull(password)) {
            $('#submit').attr('value', '请输入密码!').css('background', 'red');
            return false;
        }
        if (isNull(confirm)) {
            $('#submit').attr('value', '请输入确认密码!').css('background', 'red');
            return false;
        }
        if(password!=confirm){
            $('#submit').attr('value', '两次密码不一致!').css('background', 'red');
            return false;
        }if(!isPhone(phone)){
            $('#submit').attr('value', '请输入正确的手机号!').css('background', 'red');
            return false;
        }
        if(!isEmail(email)){
            $('#submit').attr('value', '请输入正确的邮箱!').css('background', 'red');
            return false;
        }
            return true;


    }

    //判断不为空
    function isNull(input) {
        if (input == null || input == '' || input == undefined) {
            return true;
        }
        else {
            return false;
        }
    }

    //邮箱正则
    function isEmail(email) {
        var ePattern= /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if(!ePattern.test(email)){
            return false;
        }
        return true;
    }
    //手机号正则
    function isPhone(phone) {
        var mPattern= /^1[34578][0-9]{9}/;
        if(!mPattern.test(phone)){
            return false;
        }
        return  true;
    }
</script>
</body>
</html>