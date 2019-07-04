<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/6/17
  Time: 10:00
  用户私信聊天 页面
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
    <header data-am-widget="header" class="am-header am-header-default am-header-fixed bg-1 header-gray">
        <div class="am-header-left am-header-nav">
            <a href="#" class="am-text-sm" onclick="closeThisWindow();">
                <i class="am-header-icon am-icon-angle-left"></i> 返回
            </a>
        </div>

        <h1 class="am-header-title">
            <a href="#title-link" class="">
                某某某
            </a>
        </h1>

        <div class="am-header-right am-header-nav header-right-btn">
            <button class="am-btn am-btn-danger am-radius">关注</button>
        </div>
    </header>
    <!--头部结束-->
    <div class="am-u-sm-12 chat-main">
        <ul class="am-comments-list am-comments-list-flip">
            <li class="am-comment">
                <a href="#link-to-user-home">
                    <img src="assets/img/person.png" alt="" class="am-comment-avatar" width="48" height="48"/>
                </a>

                <div class="am-comment-main">
                    <div class="am-comment-bd">
                        nihafsagjdjgdjslfdajg  仿照微信，朋友圈分享图片功能 。可以进行图片的多张选择，拍照添加图片，以及进行图片的预览，预览时可以进行缩放，并且可以删除选中状态的图片 。很不错的源码，大家有需要可以下载看看 。
                    </div>
                </div>
            </li>

            <li class="am-comment am-comment-flip">
                <a href="#link-to-user-home">
                    <img src="assets/img/person.png" alt="" class="am-comment-avatar" width="48" height="48"/>
                </a>
                <div class="am-comment-main">
                    <div class="am-comment-bd">
                        nihafsagjdjgdjslfdajg  仿照微信，朋友圈分享图片功能 。可以进行图片的多张选择，拍照添加图片，以及进行图片的预览，预览时可以进行缩放，并且可以删除选中状态的图片 。很不错的源码，大家有需要可以下载看看 。
                    </div>
                </div>
            </li>
            <li class="am-comment">
                <a href="#link-to-user-home">
                    <img src="assets/img/person.png" alt="" class="am-comment-avatar" width="48" height="48"/>
                </a>

                <div class="am-comment-main">
                    <div class="am-comment-bd">
                        nihafsagjdjgdjslfdajg
                    </div>
                </div>
            </li>
            <li class="am-comment am-comment-flip">
                <a href="#link-to-user-home">
                    <img src="assets/img/person.png" alt="" class="am-comment-avatar" width="48" height="48"/>
                </a>
                <div class="am-comment-main">
                    <div class="am-comment-bd">
                        nihafsagjdjgdjslfdajg  仿照微信，朋友圈分享图片功能 。可以进行图片的多张选择，拍照添加图片，以及进行图片的预览，预览时可以进行缩放，并且可以删除选中状态的图片 。很不错的源码，大家有需要可以下载看看 。
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <!-- 底部 开始-->
    <div class="am-u-sm-12 search index-search comment-input">
        <form class="am-form am-margin-top-xs">
            <div class="am-input-group am-input-group-sm">
                <input type="text" class="am-form-field" placeholder="回复">
                <span class="am-input-group-btn search-r">
                      <button class="am-btn am-btn-default search-r-btn" type="button">发送</button>
                    </span>
            </div>
        </form>
    </div>
    <!-- 底部结束 -->
</div>
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
    function closeThisWindow() {
        window.close();
    }
</script>
</body>
</html>
