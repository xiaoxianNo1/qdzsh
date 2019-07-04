<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/6/14
  Time: 15:10
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
            <a href="#" class="search-back am-text-center" onclick="closeThisWindow()">
                <i class="am-icon-chevron-left"></i>
            </a>
        </div>
        <div class="am-u-sm-11">
            <form class="am-form am-margin-top-xs">
                <div class="am-input-group am-input-group-sm am-input-group-primary">
								<span class="am-input-group-btn search-l">
									<button class="am-btn am-btn-default search-l-btn" type="button"><span class="am-icon-search"></span></button>
								</span>
                    <input type="text" class="am-form-field search-input" placeholder="搜索" name="seachText">
                    <span class="am-input-group-btn">
										<button class="am-btn am-btn-primary" type="button" onclick="btnOnClick()">搜索</button>
									</span>
                </div>
            </form>
        </div>

    </div>
    <!--头部结束-->
    <div class="am-u-sm-12 am-padding-0 index-tab-box">
        <div data-am-widget="tabs"  class="am-tabs am-tabs-d2 am-margin-0 index-tab" >
            <ul class="am-tabs-nav am-cf index-tab-nav">
                <li style="display:none"><a href="[data-tab-panel-0]" onclick="changeBq('0')">分类</a></li>
                <li class="am-active"><a href="[data-tab-panel-1]" onclick="changeBq('2')">知识</a></li>
                <li class=""><a href="[data-tab-panel-2]" onclick="changeBq('1')">问题</a></li>
            </ul>
            <div class="am-tabs-bd">
                <input type="hidden" id="xxbq" name="xxbq" value="2" />
                <input type="hidden" id="xxlx" name="xxlx" value="1" />
                <input type="hidden" id="pageNumber" name="pageNumber" value="1"/>
                <input type="hidden" id="pageSize" name="pageSize" value="10"/>

                <%--分类--%>
                <div data-tab-panel-0 class="am-tab-panel" id="messageFL">

                </div>
                <!-- 最新 开始 -->
                <div data-tab-panel-1 class="am-tab-panel am-active bg-1" id="messageZS">

                </div>
                <!-- 最新 结束 -->
                <div data-tab-panel-2 class="am-tab-panel " id="messageWT">

                </div>
            </div>
        </div>
    </div>
    <!-- 内容区结束 -->
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
<script src="<%=path%>/static/source/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="<%=path%>/static/source/js/amazeui.min.js"></script>
<script src="<%=path%>/static/source/js/jquery-weui.js"></script>
<script src="<%=path%>/static/source/js/dropload.js"></script>
<script src="<%=path%>/static/source/js/qdzsh.js"></script>
<script>
    function closeThisWindow() {
        window.close();
    }

    //标签更好点击事件
    function changeBq(bqtype) {
        var type=bqtype;
        if(type=='0'){
            $("#xxbq").val('0');
            $("input[name='pageNumber']").val('1');
        }else if(type=='1'){
            $("#xxbq").val('1');
            $("input[name='pageNumber']").val('1');
        }else if(type=='2'){
            $("#xxbq").val('2');
            $("input[name='pageNumber']").val('1');
        }
    }

    function btnOnClick() {
        $("#messageFL").empty();
        $("#messageWT").empty();
        $("#messageZS").empty();
        $("input[name='pageNumber']").val('1');
        loadMessage();
    }

    //点击搜索后加载数据
    function loadMessage() {
        var seachText=$("input[name='seachText']").val();
        var userId=getCookie('userid');
        var xxbq=$("input[name='xxbq']").val();
        var pageNum=$("input[name='pageNumber']").val();
        var pageSize=$("input[name='pageSize']").val();

        var jsonData={"seachText":seachText,
            "userId":userId,
            "xxbq":xxbq,
            "pageNum":pageNum,
            "pageSize":pageSize
        };

        $.ajax({
            type: "POST",
            url: '<%=path%>/message/searchJson',
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

                        if(xxbq=='0'){
                            items += '<img  class="am-img-responsiv" width="100%" height="74" id=imgFL'+i+'  >';
                        }else if(xxbq=='1'){
                            items += '<img  class="am-img-responsiv" width="100%" height="74" id=imgWT'+i+'  >';
                        }else if(xxbq=='2'){
                            items += '<img  class="am-img-responsiv" width="100%" height="74" id=imgZS'+i+'  >';
                        }

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

                    if(xxbq=='0'){
                        $("#messageFL").append(items);
                        document.getElementById("imgFL"+i).src="data:image/png;base64,"+data.result[i].tp_nr;
                    }else  if(xxbq=='1'){
                        //console.info("问题");
                        $("#messageWT").append(items);
                        document.getElementById("imgWT"+i).src="data:image/png;base64,"+data.result[i].tp_nr;
                    }else if(xxbq=='2'){
                        //console.info("知识");
                        $("#messageZS").append(items);
                        document.getElementById("imgZS"+i).src="data:image/png;base64,"+data.result[i].tp_nr;
                    }

                }

            }
        });

    }
</script>
</body>
</html>
