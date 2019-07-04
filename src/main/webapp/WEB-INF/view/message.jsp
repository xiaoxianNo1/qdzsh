<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/30
  Time: 16:15
  消息页 已经不用了
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path =request.getContextPath();%>
<!doctype html>
<html class="no-js">
<style type="text/css">
    .notext{
        border: none;box-shadow:none;
    }
</style>
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
    <link rel="stylesheet" href="<%=path%>/static/source/css/dropload.css">
</head>
<body>
<!--注册开始-->
<div class="am-g">
    <!--头部开始-->
    <div class="am-u-sm-12 search index-search am-header-fixed">
        <form class="am-form am-margin-top-xs" action="" method="post">
            <div class="am-input-group am-input-group-sm">
						<span class="am-input-group-btn search-l">
							<button class="am-btn am-btn-default search-l-btn" type="button"><span class="am-icon-search"></span></button>
						</span>
                <input type="text" class="am-form-field" placeholder="搜索">
                <span class="am-input-group-btn search-r">
								<button class="am-btn am-btn-default search-r-btn" type="button"><span class="am-icon-pencil-square-o"></span> 提问</button>
							</span>
            </div>
        </form>
    </div>
    <!--头部结束-->
    <div class="am-u-sm-12 am-padding-0 index-tab-box inner">
        <div data-am-widget="tabs"  class="am-tabs am-tabs-d2 am-margin-0 index-tab " >
            <ul class="am-tabs-nav am-cf index-tab-nav">
                <li ><a href="[data-tab-panel-0]">关注</a></li>
                <li class="am-active"><a href="[data-tab-panel-1]">最新</a></li>
                <li class=""><a href="[data-tab-panel-2]">热门</a></li>
            </ul>
            <div class="am-tabs-bd ">
                <!-- 关注 开始 -->
                <div data-tab-panel-0 class="am-tab-panel">
                    【青春】那时候有多好，任雨打湿裙角。忍不住哼起，心爱的旋律。绿油油的树叶，自由地在说笑。燕子忙归巢，风铃在舞蹈。经过青春的草地，彩虹忽然升起。即使视线渐渐模糊，它也在我心里。就像爱过的旋律，没人能抹去。因为生命存在失望，歌唱，所以才要歌唱。
                </div>
                <!-- 关注 结束 -->
                <!-- 最新 开始 -->
                <div class="dsas " id="messagedetails">
                    <c:forEach items="${pageList}" var="msg" varStatus="vstatus">

                        <!-- 模块 开始 (多张图片- 无设置)-->
                        <div class="index-new am-u-sm-12 am-margin-vertical-xs ">
                            <!-- 作者 -->
                            <div class="index-new-tit am-u-sm-12 am-padding-vertical-xs am-padding-horizontal-0">
                                <div class="am-u-sm-8 am-padding-0">
                                    <a href="" class="am-block am-cf">
                                        <div class="am-fl">
                                            <img src="<%=path%>/static/source/img/avtar.png" alt="头像" width="50" height="50" class="am-img-thumbnail am-circle">
                                        </div>
                                        <div class="am-fl am-margin-left-xs">
                                            <p class="am-margin-bottom-0 am-text-sm" ><strong><input type="text" name="" value="${msg.User_CoolName}" readonly style="border: none;box-shadow:none;"></strong></p>
                                                <%--<p class="am-margin-bottom-0 am-text-sm" ><strong> <script> ${msg.User_CoolName}</script> </strong></p>--%>
                                            <span class="am-text-xs"><input type="text" name="" value="${msg.fbsj}" readonly style="border: none;box-shadow:none;"></span>
                                        </div>
                                    </a>
                                </div>
                                <div class="am-u-sm-4 am-cf am-margin-top-sm am-padding-0">
                                    <button type="button" class="am-btn am-btn-danger am-text-xs am-radius am-btn-xs am-padding-xs am-fr">关注</button>
                                </div>
                            </div>
                            <!-- 内容区 -->
                            <div class="index-new-main am-cf">
                                <a href="">
                                    <h5 class="am-text-justify"><input type="text" class="notext" value="${msg.xxbt}"></h5>
                                    <div class="am-u-sm-12 am-padding-0 am-text-sm am-text-justify">
                                            ${msg.xxnr}
                                    </div>
                                    <div class="am-u-sm-12 am-margin-top-sm am-padding-0">
                                        <ul class="am-avg-sm-3 img-thumbnail">
                                            <li><img class="" src="<%=path%>/static/source/img/bg1.jpg"  width="96%" height="64"></li>
                                            <li><img class="" src="<%=path%>/static/source/img/bg2.jpg"  width="96%" height="64"></li>
                                            <li><img class="" src="<%=path%>/static/source/img/bg3.jpg"  width="96%" height="64"></li>
                                        </ul>
                                    </div>

                                </a>
                            </div>
                            <div class="index-new-footer am-margin-vertical-xs am-cf">
                                <div class="am-u-sm-6 am-padding-0">
                                    <a href="" class="am-text-sm am-block">${msg.tow_towcol}</a>
                                </div>
                                <div class="am-u-sm-6 am-padding-0 am-link-muted am-text-sm am-text-right text-gray">
                                    <i class="am-icon-commenting"></i> ${msg.plcs} <i class="am-icon-heart"></i> ${msg.sccs}
                                </div>
                            </div>
                        </div>
                        <!-- 模块 结束 -->
                    </c:forEach>
                </div>

                <%--<div class="loadmore" style="padding-bottom: 30px;height: 20px">
                    <span >正在加载</span>
                </div>--%>
                <!-- 最新 结束 -->
                <!-- 最热 开始 -->
                <div data-tab-panel-2 class="am-tab-panel ">
                    【歌唱】那时候有多好，任雨打湿裙角。忍不住哼起，心爱的旋律。绿油油的树叶，自由地在
                </div>
                <!-- 最热 结束 -->
            </div>
        </div>
    </div>
    <!-- 内容区结束 -->
    <!-- 底部 开始-->
    <div data-am-widget="navbar" class="am-navbar am-cf am-navbar-default "	id="">
        <ul class="am-navbar-nav am-cf am-avg-sm-4 index-navbar">
            <li >
                <a href="#" class="am-active">
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
                <a href="<%=path%>/user/me" class="">
                    <span class="am-icon-user"><%--<span class="index-navbar-badge am-badge am-badge-danger am-round am-text-xs">8</span>--%></span>
                    <span class="am-navbar-label">我的</span>
                </a>
            </li>
        </ul>
    </div>
    <!-- 底部结束 -->
</div>
<!-- 回到顶部 开始-->
<div data-am-widget="gotop" class="am-gotop am-gotop-fixed" >
    <a href="#top" title="回到顶部">
        <span class="am-gotop-title">回到顶部</span>
        <i class="am-gotop-icon am-icon-chevron-up"></i>
    </a>
</div>
<!--回到顶部结束  -->


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
<script>
    //上滑加载下一页
   $(document).ready(function () {
       $(window).scroll(function () {
           var scrollTop =$(this).scrollTop();//滚动条距离顶部的高度
           var scrollHeight = $(document).height();//当前页面的总高度
           var windowHeight= $(this).height();//当前可视的页面高度
           if(scrollTop+windowHeight>=scrollHeight){//距离顶部+当前高度》= 文档总高度，即 代表滑动到底部
               console.info("上拉加载，在这里调用方法");
               downLoad();
           }else if(scrollTop<=0){//滚动条距离顶部的高度小于等于0
               console.info("下拉刷新，在这里调用");

           }
       });
   });

   function downLoad() {
       $.ajax({
           type: 'POST',
           url: '<%=path%>/message/getMessagePost',
           dataType: 'json',
           success: function(data){
               var result = '';
               console.info(data);
               console.info(data.code);
               console.info(data.isSuccess);
               console.info(data.result);
               for(var i = 0; i < data.result.length; i++){
                   var items='<div class="index-new am-u-sm-12 am-margin-vertical-xs ">'
                   items += '<div class="am-u-sm-8 am-padding-0">'
                   items += '<a href="" class="am-block am-cf">'
                   items += '<div class="am-fl">'
                   items += '<img src="<%=path%>/static/source/img/avtar.png" alt="头像" width="50" height="50" class="am-img-thumbnail am-circle">'
                   items += '</div>'
                   items += '<div class="am-fl am-margin-left-xs">'
                   items += '<p class="am-margin-bottom-0 am-text-sm" ><strong>'+data.result[i].User_CoolName+'</strong></p>'
                   items += '<span class="am-text-xs">'+timestampToTime(data.result[i].fbsj)+'</span>'
                   items += '</div>'
                   items += '</a>'
                   items += '</div>'
                   items += '<div class="am-u-sm-4 am-cf am-margin-top-sm am-padding-0">'
                   items += '<button type="button" class="am-btn am-btn-danger am-text-xs am-radius am-btn-xs am-padding-xs am-fr">关注</button>'
                   items += '</div>'
                   items += '</div>'
                   items += '<div class="index-new-main am-cf">'
                   items += '<a href="">'
                   items += '<h5 class="am-text-justify">'+data.result[i].xxbt+'</h5>'
                   items += '<div class="am-u-sm-12 am-padding-0 am-text-sm am-text-justify">'
                   items += ''+data.result[i].xxnr+''
                   items += '</div>'
                   items += '<div class="am-u-sm-12 am-margin-top-sm am-padding-0">'
                   items += '<ul class="am-avg-sm-3 img-thumbnail">'
                   items += '<li><img class="" src="<%=path%>/static/source/img/bg1.jpg"  width="96%" height="64"></li>'
                   items += '<li><img class="" src="<%=path%>/static/source/img/bg2.jpg"  width="96%" height="64"></li>'

                   items += '<li><img class="" src="<%=path%>/static/source/img/bg3.jpg"  width="96%" height="64"></li>'
                   items += '</ul>'
                   items += '</div>'
                   items += '</a>'
                   items += '</div>'

                   items += '<div class="index-new-footer am-margin-vertical-xs am-cf">'
                   items += '<div class="am-u-sm-6 am-padding-0">'
                   items += '<a href="" class="am-text-sm am-block">'+data.result[i].tow_towcol+'</a>'
                   items += '</div>'
                   items += '<div class="am-u-sm-6 am-padding-0 am-link-muted am-text-sm am-text-right text-gray">'

                   items += '<i class="am-icon-commenting"></i> '+data.result[i].plcs+' <i class="am-icon-heart"></i> '+data.result[i].sccs+''
                   items += '</div>'
                   items += '</div>'
                   items += '</div>'
                   /*items += ''

                   items += ''
                   items += ''
                   items += ''
                   items += ''
                   items += ''*/


                   $("#messagedetails").append(items);
                   //console.info(data.result[i].xxnr);
                   /*result +=   '<a class="item opacity" href="'+data.result[i].tow_towcol+'">'
                       +'<h3>'+data.result[i].xxbt+'</h3>'
                       +'<span class="date">'+data.result[i].xxnr+'</span>'
                       +'</a>';*/
               }

           },
           error: function(xhr, type){
               alert('Ajax error!');

           }
       });
   }

   function timestampToTime(timestamp) {
       var date =new Date(timestamp);
       Y=date.getFullYear()+'-';
       M=(date.getMonth()+1<10?'0'+(date.getMonth()+1):date.getMonth()+1)+'-';
       D=date.getDate()+' ';
       h=date.getHours()+':';
       m=date.getMinutes()+':';
       s=date.getSeconds();
       return Y+M+D+h+m+s;
   }
</script>
</body>
</html>