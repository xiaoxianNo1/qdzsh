<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/6/18
  Time: 15:58
  我的 页面
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path =request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www/wapforum.org/DTD/xhtml-mobile10.dtd">
<html class="no-js">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="知税乎">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>知税乎</title>

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
    <!-- 用户头像 开始-->
    <div class="user-top am-padding-sm">
        <div class="am-u-sm-12 am-margin-top">
            <ul class="am-u-sm-8 am-margin-vertical-sm am-padding-0" id="userInfo">
               <%-- <li><img src="<%=path%>/static/source/img/person.png" class="am-circle" width="46" height="46"></li>
                <li><strong>知税乎大哥第三个sa sfasdf ds</strong></li>--%>
            </ul>
            <div class="am-u-sm-4 am-text-right am-padding-0">
                <a href="<%=path%>/user/changeinfo" class="text-gray am-text-sm">修改信息 <i class="am-icon-angle-right"></i></a>
            </div>
        </div>
    </div>
    <!-- 用户头像 结束 -->
    <!--注册表单 开始-->
    <div class="am-u-sm-12 user-main am-margin-top-sm am-text-center">
        <ul class="am-avg-sm-4">
            <li>
                <a href="<%=path%>/user/mykind?gnid=1">
                    <i class=" am-text-primary am-icon-edit am-icon-sm"></i>
                    <span class="am-block am-text-sm am-margin-xs">我的提问</span>
                </a>
            </li>
            <li>
                <a href="<%=path%>/user/mykind?gnid=2">
                    <i class=" am-text-success am-icon-book am-icon-sm"></i>
                    <span class="am-block am-text-sm am-margin-xs">我的知识</span>
                </a>
            </li>
            <li>
                <a href="<%=path%>/user/mykind?gnid=3">
                    <i class=" am-text-secondary am-icon-heart am-icon-sm"></i>
                    <span class="am-block am-text-sm am-margin-xs">我的收藏</span>
                </a>
            </li>
            <li>
                <a href="<%=path%>/user/myconcern?gnid=4">
                    <i class=" am-text-warning am-icon-star am-icon-sm"></i>
                    <span class="am-block am-text-sm am-margin-xs">我的关注</span>
                </a>
            </li>
            <li>
                <a href="<%=path%>/user/mykind" style="visibility: hidden">
                    <i class=" am-text-danger am-icon-share am-icon-sm"></i>
                    <span class="am-block am-text-sm am-margin-xs">我的转发</span>
                </a>
            </li>

            <li>
                <a href="<%=path%>/user/mykind" style="visibility: hidden">
                    <i class=" am-text-primary am-icon-list am-icon-sm"></i>
                    <span class="am-block am-text-sm am-margin-xs">我的浏览</span>
                </a>
            </li>

        </ul>
    </div>
</div>
<div class="quit am-text-center am-margin-top-sm">
    <a href="<%=path%>/login/userlogout" class="am-text-danger"><i class="am-icon-power-off"></i> 退出登录</a>
</div>


<!-- 底部 开始-->
<div data-am-widget="navbar" class="am-navbar am-cf am-navbar-default "	id="">
    <ul class="am-navbar-nav am-cf am-avg-sm-4 index-navbar">
        <li >
            <a href="<%=path%>/message/message" >
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
            <a href="<%=path%>/notice/notice" class="">
                <span class="am-icon-bell"><%--<span class="index-navbar-badge am-badge am-badge-danger am-round am-text-xs">···</span>--%></span>
                <span class="am-navbar-label">消息</span>
            </a>
        </li>
        <li >
            <a href="<%=path%>/user/me" class="am-active">
                <span class="am-icon-user"><%--<span class="index-navbar-badge am-badge am-badge-danger am-round am-text-xs">8</span>--%></span>
                <span class="am-navbar-label">我的</span>
            </a>
        </li>
    </ul>
</div>
<!-- 底部结束 -->



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

        if ("${error}") {
            $('#submit').attr('value', "${error}").css('background', 'red');
        }

        if ("${message}") {
            layer.msg('${message}', {
                offset: 0,
            });
        }

       var userid=getCookie('userid');
       console.info("userid"+userid);

        var jsonData={
            "userId":userid
        };

        $.ajax({
            type: "POST",
            url: "<%=path%>/user/userinfojson",
            data: JSON.stringify(jsonData),
            contentType:'application/json;charset=UTF-8',
            dataType: 'json',
            success:function(data){
                var mapUser=data.result;
                var  items='<li><img class="am-circle" width="46" height="46" id="userPhoto"> </li>';
                items+='<li><strong>'+mapUser.User_CoolName+'</strong></li>';

                $("#userInfo").append(items);

                document.getElementById("userPhoto").src="data:image/png;base64,"+mapUser.User_Photo;
            },error:function (xhr, type) {

            }
        });
    });

    //获取cookie
    function getCookie(cname) {
        var name =cname+"=";
        var ca= document.cookie.split(';');
        for(var i=0;i<ca.length;i++){
            var c=ca[i].trim();
            if(c.indexOf(name)==0)
                return c.substring(name.length,c.length);
        }
        return "";
    }

</script>
</body>
</html>