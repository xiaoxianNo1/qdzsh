<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/7/1
  Time: 11:03
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
    <header data-am-widget="header" class="am-header am-header-default am-header-fixed bg-white bg-top-w">
        <div class="am-header-left am-header-nav">
            <a href="#" class="am-text-sm" onclick="backClick();">
                <i class="am-header-icon am-icon-angle-left"></i> 返回
            </a>
        </div>

        <h1 class="am-header-title">
            <a href="#" class="title-link">
                详情页面
            </a>
        </h1>

        <div class="am-header-right am-header-nav">
            <a href="#" class="am-text-sm">
                <i class="am-icon-share-alt"></i>
            </a>
        </div>
    </header>
    <!--头部结束-->
    <input type="hidden" id="gnid" name="gnid" value="${map.gnid}" />
    <input type="hidden" id="pageNumber" name="pageNumber" value="1"/>
    <input type="hidden" id="pageSize" name="pageSize" value="10"/>
    <div id="messageZX">

    </div>



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
    $(function () {
        loadMessages();
    });


    function loadMessages() {
        console.info("开始加载消息");
        var userid=getCookie('userid');
        var gnid=$("input[name='gnid']").val();
        var pageSize=$("input[name='pageSize']").val();
        var pageNum=$("input[name='pageNumber']").val();

        var jsonData={
            "gnid":gnid,
            "userId":userid,
            "pageSize":pageSize,
            "pageNum":pageNum
        };
        $.ajax({
            type: "POST",
            url: "<%=path%>/message/myKind",
            data: JSON.stringify(jsonData),
            contentType:'application/json;charset=UTF-8',
            dataType: 'json',
            success:function(data){
                if(data.code=='201'){
                    console.info("到底了");
                    return;
                }
                pageNum++;
                $("input[name='pageNumber']").val(pageNum);

                for (var i = 0; i < data.result.length; i++){
                    var items='<div class="index-new am-u-sm-12 am-margin-vertical-xs">';
                    /*<!-- 作者 -->*/
                    items += '<div class="index-new-tit am-u-sm-12 am-padding-vertical-xs am-padding-horizontal-0">';
                    items += '<div class="am-u-sm-8 am-padding-0">';
                    items += '<a href="#" class="am-block am-cf" onclick="loadWinOpen(\'chat/chat\')">';
                    items += '<div class="am-fl">';
                    items +='<img src="<%=path%>/static/source/img/person.png" alt="头像" width="50" height="50" class="am-img-thumbnail am-circle">';
                    items += '</div>';
                    items += '<div class="am-fl am-margin-left-xs am-margin-top-xs">';
                    items += '<div class="am-margin-bottom-0 am-text-sm"><strong>'+data.result[i].User_CoolName+'</strong></div>';
                    items += '<div class="am-text-xs text-gray">'+timestampToTime(data.result[i].fbsj)+'</div>';
                    items += '</div>';
                    items +='</a>';
                    items += '</div>';
                    items += '<div class="am-u-sm-4 am-cf am-margin-top-sm am-padding-0">';
                    //items += '<button type="button" class="am-btn am-btn-danger am-text-xs am-radius am-btn-xs am-padding-xs am-fr">关注</button>';
                    items += '</div>';
                    items += '</div>';
                    /*<!-- 内容区 -->*/
                    items += '<div class="index-new-main am-u-sm-12 am-padding-horizontal-0">';
                    var msgId=data.result[i].xxid;
                    items += '<a href="<%=path%>/message/messagedetails?messageId='+msgId+'"  target="frame1" >';
                    items += '<h5 class="am-text-justify">'+data.result[i].xxbt+ ' </h5> ';

                    if(data.result[i].xxtpsl==0){
                        items += ' <div class="am-u-sm-12 am-padding-0 am-text-justify">';
                        items +=data.result[i].xxnr;
                        items += '</div>';
                    }else if(data.result[i].xxtpsl>0){
                        items += '<div class="am-u-sm-9 am-padding-0 am-text-justify">';
                        items +=data.result[i].xxnr;
                        items += '</div>';
                        items += '<div class="am-u-sm-3 am-padding-right-0">';

                        items += '<img  class="am-img-responsiv" width="100%" height="74" id=imgZx'+i+'  >';

                        items += '</div>';
                    }
                    items += '</a>';
                    items += '</div>';

                    items +='<div class="index-new-footer am-margin-vertical-xs am-cf">';
                    items += '<div class="am-u-sm-6 am-padding-0">';
                    items +='<a href="<%=path%>/message/classification?flid='+data.result[i].xxfl+'" class="am-text-sm am-block">'+data.result[i].tow_towcol+'</a>';
                    items += '</div>';
                    items += '<div class="am-u-sm-6 am-padding-0">';
                    items += '<ul class="am-avg-sm-3 am-text-sm text-gray">';
                    items += '<li class="am-text-right"><i class="am-icon-commenting"></i> '+data.result[i].plcs+' </li>';
                    items +='<li class="am-padding-left-xs"><i class="am-icon-star-o"></i> '+data.result[i].sccs+'</li>';
                    items += '<li class="am-text-right" >';
                    items += '<div class="am-dropdown am-dropdown-up" data-am-dropdown>';
                    items +='<a class="am-dropdown-toggle text-gray" data-am-dropdown-toggle><!--<i class="am-icon-gear" >--></i></a>';
                    items += '<ul class="am-dropdown-content">';
                    items += '<li><a href="#">不感兴趣</a></li>';
                    items += '<li class="am-divider"></li>';
                    items += '<li><a href="#">屏蔽</a></li>';
                    items +='</ul>';
                    items += '</div>';
                    items += '</li>';
                    items += '</ul>';
                    items +='</div>';
                    items += '</div>';

                    $("#messageZX").append(items);
                    document.getElementById("imgZx"+i).src="data:image/png;base64,"+data.result[i].tp_nr;


                }

            }
        });
    }
</script>

</body>
</html>
