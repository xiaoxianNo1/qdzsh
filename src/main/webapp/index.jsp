<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<div class="am-g">
    <a href="<%=path%>/message/message" class="yd-time" >跳过 <b id="second">3</b>s</a>
    <div class="yd-font am-u-sm-3 am-u-sm-centered am-text-center am-margin-xl am-padding-top" id="yd-box">
        <span id="yd">你来问 我来答</span>
    </div>
    <div class="yd-img-box">
        <img src="<%=path%>/static/source/img/book.png" class="am-block">
        <p class="am-text-center am-margin-top-xs">青岛市稽查局</p>
    </div>

</div>

<script language="javascript">
    var index=0;
    var word=document.getElementById("yd").innerHTML;
    function type(){
        document.getElementById("yd-box").innerText = word.substring(0,index++);
    }
    setInterval(type, 300);
</script>

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=path%>/static/source/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="<%=path%>/static/source/js/amazeui.min.js"></script>
<script type="text/javascript">
    <%--    三秒倒计时进入--%>
    var sec=document.getElementById("second");
    var i=3;
    var timer = setInterval(function () {
        i--;

        if(i<0){
            sec.innerHTML=0;
        }else {
            sec.innerHTML=i;
        }
        if(i==0){
            window.location.href="<%=path%>/message/message";
        }
    },1000);

    /*function goBack() {
        window.location.href="";
        //window.history.go(-1);
    }*/
</script>
</body>
</html>