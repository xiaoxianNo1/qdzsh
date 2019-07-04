<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/6/13
  Time: 15:27
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
    <style>

        *{
            margin: 0;
            padding: 0;
        }
        #upBox{
            text-align: center;
            width:100%;
            padding: 20px;
            border: 1px solid #666;
            margin: auto;
            margin-bottom: 200px;
            position: relative;
            border-radius: 10px;
        }
        #inputBox{
            width: 100%;
            height: 40px;
            border: 1px solid cornflowerblue;
            color: cornflowerblue;
            border-radius: 20px;
            position: relative;
            text-align: center;
            line-height: 40px;
            overflow: hidden;
            font-size: 16px;
        }
        #inputBox input{
            width: 114%;
            height: 40px;
            opacity: 0;
            cursor: pointer;
            position: absolute;
            top: 0;
            left: -14%;

        }
        #imgBox{
            text-align: left;
        }
        .imgContainer{
            display: inline-block;
            width: 32%;
            height: 150px;
            margin-left: 1%;
            border: 1px solid #666666;
            position: relative;
            margin-top: 30px;
            box-sizing: border-box;
        }
        .imgContainer img{
            width: 100%;
            height: 150px;
            cursor: pointer;
        }
        .imgContainer p{
            position: absolute;
            bottom: -1px;
            left: 0;
            width: 100%;
            height: 30px;
            background: black;
            text-align: center;
            line-height: 30px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            display: none;
        }
        .imgContainer:hover p{
            display: block;
        }


    </style>
</head>
<body onload="islogin();">
<!--注册开始-->
<div class="am-g">
    <!--头部开始-->
    <header data-am-widget="header" class="am-header  am-header-fixed bg-1">
        <div class="am-header-left am-header-nav">
            <a href="#" class="am-link-muted am-text-sm">
                取消
            </a>
        </div>

        <h1 class="am-header-title">
            提问
        </h1>

        <div class="am-header-right am-header-nav" id="btn">
            <a href="#" class="am-text-primary am-text-sm">
                完成
            </a>
        </div>
    </header>
    <!--头部结束-->

    <!-- 提问部分-->
    <div class="am-u-sm-12 question am-margin-top">
        <form class="am-form">
            <div class="am-form-group am-margin-bottom-xs">
                <input type="text" class=""  placeholder="请输入您要提问的问题">
            </div>
            <hr data-am-widget="divider" style="" class="am-divider am-divider-default am-margin-0" />
            <div class="am-form-group am-margin-vertical-xs">
                <textarea class="" rows="12" placeholder="请对该问题进行描述" style="outline:none;"></textarea>
            </div>

            <ul class="am-list">
                <li>
                    <a href="#" class="am-text-truncate am-cf am-text-sm am-padding-xs">
                        #请选择分类
                        <span class="am-icon-angle-right am-fr"></span>
                    </a>
                </li>
            </ul>
        </form>
    </div>

    <div class="am-u-sm-12 question-img">
        <div style="width: 100%;height: 100vh;position: relative;">
            <div id="upBox">
                <div id="inputBox">
                    <input type="file" title="请选择图片" id="file" multiple="" accept="image/png,image/jpg,image/gif,image/JPEG">
                    点击选择图片
                </div>
                <div id="imgBox">
                </div>
                <%--<button id="btn">上传</button>--%>
            </div>
        </div>
    </div>
</div>
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=path%>/static/source/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="<%=path%>/static/source/js/amazeui.min.js"></script>
<script src="<%=path%>/static/source/js/uploadImg.js" type="text/javascript" charset="utf-8"></script>
<script>
    function islogin() {
        console.info("判断用户是否登录");
        //判断用户是否登录
        if(getCookie('userid')=='' || getCookie('usertoken')==''){
            window.location.href='<%=path%>/login/login';
            return;
        }
    }

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

    /*imgUpload({
        inputId:'file', //input框id
        imgBox:'imgBox', //图片容器id
        buttonId:'btn', //提交按钮id
        upUrl:'/message/upLoadImg',  //提交地址
        data:'file1' //参数名
    });*/

    //获取文件url
    function createObjectURL(blob){
        if (window.URL){
            return window.URL.createObjectURL(blob);
        } else if (window.webkitURL){
            return window.webkitURL.createObjectURL(blob);
        } else {
            return null;
        }
    }

    var box = $("#fileBox .review-box");    //显示图片box
    var file = $("#file"); //file对象
    var domFragment =  document.createDocumentFragment();   //文档流优化多次改动dom



</script>
</body>
</html>
