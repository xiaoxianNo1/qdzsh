<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/6/12
  Time: 14:00
  消息详情页面
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
    <header data-am-widget="header" class="am-header am-header-default am-header-fixed bg-1 header-gray">
        <div class="am-header-left am-header-nav">
            <div onclick="closeThisWindow();">
                <a href="#" class="am-text-sm">
                    <i class="am-header-icon am-icon-angle-left"></i> 返回
                </a>
            </div>

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

    <!-- 模块 开始 (无图片- 无设置)-->
    <div class="index-new am-u-sm-12 index-new-datail">
        <!-- 作者 -->
        <div class="index-new-tit am-u-sm-12 am-padding-vertical-xs am-padding-horizontal-0">
            <div class="am-u-sm-8 am-padding-0">
                <a href="" class="am-block am-cf">
                    <div class="am-fl">
                        <img src="<%=path%>/static/source/img/person.png" alt="头像" width="50" height="50" class="am-img-thumbnail am-circle">
                    </div>
                    <div class="am-fl am-margin-left-xs am-margin-top-xs">
                        <div class="am-margin-bottom-0 am-text-sm"><strong> ${map.User_CoolName} </strong></div>
                        <div class="am-text-xs">${map.fbsj}</div>
                    </div>
                </a>
            </div>
            <div class="am-u-sm-4 am-cf am-margin-top-sm am-padding-0">
                <input type="hidden" id="messageFbyhId" name="messageFbyhId" value=${map.fbyhid}>
                <input type="hidden" id="yhgxid" name="yhgxid">
                <button type="button" class="am-btn am-btn-danger am-text-xs am-radius am-btn-xs am-padding-xs am-fr" id="btnChangeGz" onclick="userFollow();">关注</button>
            </div>
        </div>
        <!-- 内容区 -->
        <div class="index-new-main am-u-sm-12 am-padding-horizontal-0">
            <input type="hidden" id="xxid" name="xxid" value="${map.xxid}" />
            <h5 class="am-text-justify am-margin-bottom-xs">${map.xxbt}</h5>
            <p class="am-u-sm-12 am-padding-0 am-text-justify am-margin-vertical-xs">
                ${map.xxnr}

                <input type="hidden" id="xxtpsl" name="xxtpsl" value=${map.xxtpsl}/>
                <div class="am-u-sm-12 am-margin-top-sm am-padding-0">
                    <ul class="am-avg-sm-3 img-thumbnail">
                        <div id="images">
                            <%--<br><img src="<%=path%>/static/source/img/person.png" class="am-img-responsiv"> <br>--%>
                        </div>
                    </ul>
                </div>

            </p>
        </div>
        <div class="index-new-footer am-margin-vertical-xs am-cf">
            <div class="am-u-sm-6 am-padding-0">
                <a href="<%=path%>/message/classification?flid= ${map.xxfl}" class="am-text-sm am-block"># ${map.tow_towcol}</a>
            </div>
            <div class="am-u-sm-6 am-padding-0">
                <ul class="am-avg-sm-2 am-text-sm am-text-right">
                    <li class="" onclick="msgDzSc('dzcs')" ><i class="am-icon-thumbs-o-up"></i> <i id="yhdz">点赞</i></li>
                    <li class="" onclick="msgDzSc('sccs')" ><i class="am-icon-star-o"></i> <i id="yhsc">收藏</i></li>
                    <input type="hidden" id="scid">

                </ul>
            </div>
        </div>
    </div>
    <!-- 模块 结束 -->
    <!-- 评论区 开始 -->
    <div class="am-u-sm-12 comment am-margin-top-sm bg-white border-top-gray border-bottom-gray">
        <div class="comment-tit am-cf">
            <span class="am-text-sm am-fl"><strong>评论</strong></span>
            <a class="text-gray am-text-sm am-fr" ><i id="changeZxZr" onclick="changePlpx()">最新</i><i class="am-icon-sort-amount-desc"></i></a>
        </div>

        <input type="hidden" id="pageNumber" name="pageNumber" value="1"/>
        <input type="hidden" id="pageSize" name="pageSize" value="20"/>
        <div id="plq">

        </div>





    </div>
    <!-- 评论区 结束 -->
    <!-- 底部 开始-->
    <div class="am-u-sm-12 search index-search comment-input">
        <form class="am-form am-margin-top-xs">
            <div class="am-input-group am-input-group-sm">
                <input type="text" class="am-form-field" placeholder="评论" id="commentContent">
                <span class="am-input-group-btn search-r">
                      <button class="am-btn am-btn-default search-r-btn" type="button" onclick="sendComment();">发送</button>
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
<script >

    $(function () {
        var yhid=getCookie('userid');
        var bgzyhid=$("input[name='messageFbyhId']").val();
        var messageId=$("input[name='xxid']").val();
        var pictureNum=$("input[name='xxtpsl']").val();
        var jsonMsgId={"messageId":messageId};

        if(pictureNum!=0){
            $.ajax({
                type: "POST",
                url: '<%=path%>/message/getmessageimagesjson',
                data: JSON.stringify(jsonMsgId),
                contentType: 'application/json;charset=UTF-8',
                dataType: 'json',
                success: function (data) {
                    var returncode=data.code;
                    if(returncode!=200){
                        return;
                    }
                    var pictureList=data.result;
                    //console.info(pictureList.length);
                    for(var i=0;i<pictureList.length;i++){
                        var picItems='<li><img class=""  width="100%" height="100%" id="img'+i+'"></li>';
                        //picItems+='';
                        $("#images").append(picItems);
                        document.getElementById("img"+i).src="data:image/png;base64,"+data.result[i].tp_nr;
                    }

                    /*if(pictureList.length==1){

                    }*/

                }
            });
        }

        var jsonCollection={"xxid":messageId,
            "yhid":yhid
        };
        $.ajax({
            type: "POST",
            url: '<%=path%>/message/getmessagecollectionjson',
            data: JSON.stringify(jsonCollection),
            contentType: 'application/json;charset=UTF-8',
            dataType: 'json',
            success: function (dataSc) {
                var returnCode=dataSc.code;
                var returnResult=dataSc.result;
                if(returnCode!=200){
                    $("#yhsc").html("收藏");
                    return;
                }
                $("#yhsc").html("已收藏");
                $("#scid").val(returnResult[0].scid);

            }
        });

        var jsonFollow={
            "yhid":yhid,
            "bgzyhid":bgzyhid
        };

        $.ajax({
            type:"POST",
            url:'<%=path%>/user/getfollowinfo',
            data:JSON.stringify(jsonFollow),
            contentType: 'application/json;charset=UTF-8',
            dataType: 'json',
            success: function (dataGz){
                if(dataGz.code!=200){
                    $("#btnChangeGz").html("关注");
                    return;
                }

                var returnResult=dataGz.result;
                $("#btnChangeGz").html("已关注");
                //console.info(""+returnResult.toString());
                $("#yhgxid").val(returnResult[0].yhgxid);


            }
        })

    });

    //改变排序规则
    function changePlpx(){
        var changeText=document.getElementById("changeZxZr");
        if(changeText.innerText=="最新")
        {
            changeText.innerText="最热";
            $("#plq").empty();
            $("input[name='pageNumber']").val('1');
        }
        else{
            changeText.innerText="最新";
            $("#plq").empty();
            $("input[name='pageNumber']").val('1');
        }

    }

    //上滑加载下一页  下拉刷新
    $(document).ready(function () {
        $(window).scroll(function () {
            var scrollTop =$(this).scrollTop();//滚动条距离顶部的高度
            var scrollHeight = $(document).height();//当前页面的总高度
            var windowHeight= $(this).height();//当前可视的页面高度
            if(scrollTop+windowHeight>=scrollHeight){//距离顶部+当前高度》= 文档总高度，即 代表滑动到底部
                console.info("上拉加载，在这里调用方法");
                loadComment();
            }else if(scrollTop<=0){//滚动条距离顶部的高度小于等于0
                console.info("下拉刷新，在这里调用");

            }
        });
    });

    //加载评论
    function loadComment() {

        var xxid=$("input[name='xxid']").val();
        var pageNum=$("input[name='pageNumber']").val();
        console.info("pageNumber:"+pageNum);
        var pageSize=$("input[name='pageSize']").val();
        var changeZxZr=document.getElementById("changeZxZr");
        var zxpx=null;
        var zrpx=null;
        if(changeZxZr.innerText=="最热")
            zrpx="最热排序查询";
        else
            zxpx="最新排序查询";

        var jsonData={"xxid":xxid,
            "yhid":"",
            "pageNum":pageNum,
            "pageSize":pageSize,
            "zxpx":zxpx,
            "zrpx":zrpx};

        $.ajax({
            type: "POST",
            url: '<%=path%>/comment/getCommentByXxidJson',
            data: JSON.stringify(jsonData),
            contentType: 'application/json;charset=UTF-8',
            dataType: 'json',
            success: function (data) {
                console.info("data:"+data);
                if(data.code=='201'){
                    console.info("到底了");
                    return;
                }
                pageNum++;
                $("input[name='pageNumber']").val(pageNum);
                for (var i = 0; i < data.result.length; i++){
                    var items='<div class="index-new-tit am-u-sm-12 am-padding-vertical-xs am-padding-horizontal-0">';
                    items+='<div class="am-u-sm-8 am-padding-0">';
                    items+='<a href="" class="am-block am-cf">';
                    items+='<div class="am-fl">';
                    items+='<img src="<%=path%>/static/source/img/person.png" alt="头像" width="40" height="40" class="am-img-thumbnail am-circle">';
                    items+='</div>';
                    items+='<div class="am-fl am-margin-left-xs">';
                    items+='<div class="am-margin-bottom-0 am-text-sm"><strong>'+data.result[i].User_CoolName+'</strong></div>';
                    items+='<div class="am-text-xs text-gray">'+timestampToTime(data.result[i].plsj)+'</div>';
                    items+='</div>';
                    items+='</a>';
                    items+='</div>';
                    items+='<div class="am-u-sm-4 am-margin-top-xs am-padding-0 am-text-right">';
                    items+='<a href="" class="text-gray am-text-sm"><i class="am-icon-thumbs-o-up"></i> '+data.result[i].dzcs+'</a>';
                    items+='</div>';
                    items+='<div class="am-u-sm-12 am-text-sm am-padding-0 am-text-justify">';
                    items+=data.result[i].plnr;
                    items+='</div>';
                    items+='<div class="am-u-sm-12 am-padding-0 am-text-sm am-text-right">';
                    items+='<a href="" class="text-gray"><i class="am-icon-commenting"></i></a> · <a href="" class="text-gray"><i class="am-icon-share"></i></a>';
                    items+='</div>';
                    items+='</div>';

                    $("#plq").append(items);
                }
            },
            error: function (xhr, type) {
                alert('Ajax error!');
            }
        });
    }

    //把日期字符串转换为日期格式
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

    //发送评论
    function sendComment() {
        var xxid=$("input[name='xxid']").val();
        var yhid=getCookie('userid');
        var commentContent=$("#commentContent").val();
        /*if(commentContent==null){
            return;
        }*/
        console.info("评论内容："+commentContent);
        if($.isEmptyObject(commentContent)){
            layer.msg('请输入评论内容!', {
                offset: 0
            });
            return;
        }

        var jsonComment={"xxid":xxid,
                        "yhid":yhid,
                        "commentContent":commentContent
        };

        $.ajax({
            type: "POST",
            url: '<%=path%>/comment/addcommentjson',
            data: JSON.stringify(jsonComment),
            contentType:'application/json;charset=UTF-8',
            dataType: 'json',
            success:function(data){
                var returncode=data.code;
                if(returncode==201){
                    return;
                }
                console.info("code:"+returncode);
                $("#commentContent").val('');

            }
        });


    }

    //消息点赞收藏
    function msgDzSc(dzscbq) {
        console.info("dzscbq"+dzscbq);

        var xxid=$("input[name='xxid']").val();
        var yhid=getCookie('userid');
        var dzcs=null;
        var qxdz=null;
        var sccs=null;
        var qxsc=null;
        var scid=$("#scid").val();

         if(dzscbq=="dzcs"){
             var dzText=$("#yhdz").html();
             //console.info("dzText:"+dzText);
             if(dzText=="点赞"){
                 //添加点赞
                 dzcs="添加点赞";
                 qxdz=null;
                 $("#yhdz").html("已点赞");
             }else if(dzText=="已点赞"){
                 //取消点赞
                 dzcs=null;
                 qxdz="取消点赞";
                 $("#yhdz").html("点赞");
             }

         }else if(dzscbq=="sccs"){
             var scText=$("#yhsc").html();
             if(scText=="收藏"){
                 sccs="添加收藏";
                 $("#yhsc").html("已收藏");

             }else if(scText=="已收藏"){
                 qxsc="取消收藏";
                 $("#yhsc").html("收藏");

             }
        }

        var jsonDzSc={"xxid":xxid,
                    "yhid":yhid,
                    "dzcs":dzcs,
                    "qxdz":qxdz,
                    "sccs":sccs,
                    "qxsc":qxsc,
                    "scid":scid
        };

        $.ajax({
            type: "POST",
            url: '<%=path%>/message/msgdzsc',
            data: JSON.stringify(jsonDzSc),
            contentType:'application/json;charset=UTF-8',
            dataType: 'json'
        });

    }

    function userFollow() {
        var followState=$("#btnChangeGz").html();
        var yhid=getCookie('userid');
        var bgzyhid=$("input[name='messageFbyhId']").val();
        var yhgxid=$("input[name='yhgxid']").val();

        if(followState=="关注"){
            $("#btnChangeGz").html("已关注");
        }else if(followState=="已关注"){
            $("#btnChangeGz").html("关注");
        }

        var jsonFollow={
            "followState":followState,
            "yhid":yhid,
            "bgzyhid":bgzyhid,
            "yhgxid":yhgxid
        };

        $.ajax({
            type: "POST",
            url: '<%=path%>/user/setfollowinfo',
            data: JSON.stringify(jsonFollow),
            contentType: 'application/json;charset=UTF-8',
            dataType: 'json'
        });
    }
    
</script>
</body>
</html>
