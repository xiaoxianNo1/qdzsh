<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/6/18
  Time: 16:08
  分类选择
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
    <div class="am-u-sm-12 search index-search am-header-fixed">
        <div class="am-u-sm-1">
            <a href="#" class="search-back am-text-center">
                <i class="am-icon-chevron-left"></i>
            </a>
        </div>
        <div class="am-u-sm-11" style="visibility:hidden;">
            <form class="am-form am-margin-top-xs">
                <div class="am-input-group am-input-group-sm am-input-group-primary">
								<span class="am-input-group-btn search-l">
									<button class="am-btn am-btn-default search-l-btn" type="button"><span class="am-icon-search"></span></button>
								</span>
                    <input type="text" class="am-form-field search-input" placeholder="搜索">
                    <span class="am-input-group-btn">
										<button class="am-btn am-btn-primary" type="button">搜索</button>
									</span>
                </div>
            </form>
        </div>

    </div>
    <!--头部结束-->
    <div class="am-u-sm-12 am-padding-0 index-tab-box item am-cf">
        <div class="item-left">
            <ul class="item-nav" id="oneClass">
            </ul>
        </div>
        <div class="item-right" id="towClass">
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
<script>
    $(function(){
        downLoad();
        var wh=$(window).height();
        $(".item-left").height(wh);
        $(".item-right").height(wh);
        $(".item-right .item-main").hide().eq(0).show();
        $(".item-left .item-nav").on("click"," >li",function(e){
            e.preventDefault(); //阻止默认事件 即a不跳转链接
            $(this).addClass("item-active").siblings("li").removeClass("item-active");
            var index = $(this).index();
            console.log(index);
            $(".item-main").eq(index).show().siblings().hide();
        })


    });

    function returnClassid(towid,tow_towcol) {
        //var id='1001';
        console.info("tow_towcol"+tow_towcol);
        var data={id:towid,
            tow_towcol:tow_towcol};

        window.opener.returnValue(data);
        window.close();
    }

    function downLoad(){
        $.ajax({
            type: "POST",
            url: '<%=path%>/message/getClass',
            contentType: 'application/json;charset=UTF-8',
            dataType: 'json',
            success: function (data){
                //console.info("data:"+data.result);
                if(data.code!=200){
                    return;
                }
                //console.info("success:"+data.success);

                var itemsOne='';
                var itemsTow='';
                $("oneClass").empty();

                var test=1;
                for(var key in data.result){
                    test++;
                    //console.info("test"+test);
                    itemsOne += '<li>'+key+'</li>';

                    $("#towClass").empty();
                    itemsTow+='<ul class="item-main">';
                    var towlist=data.result[key];
                    for(var value=0;value<towlist.length;value++){
                        itemsTow += '<li onclick="returnClassid('+towlist[value].tow_id+",\'"+towlist[value].tow_towcol+'\')">'+towlist[value].tow_towcol+'</li>';
                    }
                    itemsTow+='</ul>';
                    $("#towClass").append(itemsTow);

                }
                $("#oneClass").append(itemsOne);


            },
            error: function(xhr, type){
                alert('Ajax error!');

            }
        });
    }


</script>

</body>
</html>
