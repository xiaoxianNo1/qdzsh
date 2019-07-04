<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/6/19
  Time: 9:08
  发布消息
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

    <style>
        #fileBox{
            /*margin:rem 0*/;
        }
        #fileBox label{
            border: 1px solid #ccc;
            display:block;
            float:left;
            height:120px;
            width:120px;
            background:url(<%=path%>/static/source/img/bg1.jpg) no-repeat center;
            background-size: .19rem;
            background-color: #ccc;
            margin-left: .17rem;

        }
        #fileBox .file-btn{
            height:50px;
            width:50px;
            margin:0 .5rem .5rem 0;opacity:0;
        }
        #fileBox .review-box{
            display:block;
            float:left;
            margin-left: .17rem;
        }
        #fileBox .review-box img{
            height:120px;
            width:120px;
            margin:0 .1rem .2rem 0;
        }
        #fileBox .prev-item{
            position:relative;display:inline-block;
        }
        #fileBox .prev-item .closebtn{
            position:absolute;
            right: -1px;
            top: -4px;
            display: block;
            height: 14px;
            width: 14px;
            color: #fff;
            font-size: 16px;
            line-height:14px;
            text-align: center;
            background: red;
            border-radius: 10px;
        }
        #fileBox .prev-item .closebtn {
            position: absolute;
            right: 7px;
            top: -4px;
            display: block;
            height: 14px;
            width: 14px;
            color: #fff;
            font-size: 16px;
            line-height: 14px;
            text-align: center;
            background: #8E8E93;
            border-radius: 10px;
        }
    </style>

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
<body onload="getCookieId();">
<!--注册开始-->
    <div class="am-g">
        <form action="<%=path%>/message/uploadmsg" method="post" enctype="multipart/form-data" onsubmit="return checkPublishForm()" >
            <!--头部开始-->
            <header data-am-widget="header" class="am-header  am-header-fixed bg-1">
                <div class="am-header-left am-header-nav">
                    <a href="#" class="am-link-muted am-text-sm" onclick="closeThisWindow()">
                        取消
                    </a>
                </div>

                <h1 class="am-header-title">
                    发布
                </h1>

                <div class="am-header-right am-header-nav">
                    <button type="submit"  class="am-btn am-btn-link am-text-sm a-text-default" value="">完成</button>
                </div>
            </header>
            <!--头部结束-->
            <!-- 提问部分-->
            <div class="am-u-sm-12 question am-margin-top">
                <div class="am-form" id="am-form">
                    <input type="hidden" id="xxlx" name="xxlx" value="${xxlx}" />
                    <%--<input type="hidden" id="userid" name="userid" value="${userid}" />--%>
                    <div class="am-form-group am-margin-bottom-xs">
                        <input type="text" class=""  placeholder="请输入一个标题" name="msgtitle">
                    </div>
                    <hr data-am-widget="divider" style="" class="am-divider am-divider-default am-margin-0" />
                    <div class="am-form-group am-margin-vertical-xs">
                        <textarea class="" rows="12" placeholder="请添加一个描述" style="outline:none;" name="contentDescription" id="contentDescription"></textarea>
                    </div>

                    <ul class="am-list">
                        <li id="classli">
                            <a href="#" class="am-text-truncate am-cf am-text-sm am-padding-xs" onclick="openCategory();" id="selectClass">
                                #请选择分类
                                <span class="am-icon-angle-right am-fr"></span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div style="margin-left: 25px">
                <div class="file-box clearboth" id="fileBox">
                    <label class="clone-dom" style="display:none;">
                        <input type="file" class="file-btn" name="img[]"/>
                    </label>
                    <div class="review-box"></div>
                    <label><input type="file" class="file-btn clone-dom" name="img[]"/>
                    </label>
                </div>
            </div>

        </form>
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
<script src="<%=path%>/static/source/js/qdzsh.js"></script>
<script type="text/javascript">

    //从cookie获取用户id
    function getCookieId() {
        var cookieId= getCookie('userid');
        console.info("cookieId:"+cookieId);
        var items='<input type="hidden" id="userid" name="userid" value="'+cookieId+'" />';
        $("#am-form").append(items);
    }

    function openCategory() {
        var url="<%=path%>/message/category";
        window.open(url,'','');
    }

    $(function () {

    });
    function returnValue(data) {
        //$('id').val(data.id);
        //console.info("id:"+data.id);
        //var xxflid=data.id==null?1001:data.id;
        var item='<input type="hidden" name="xxfl" value="'+data.id+'" />';
        $("#classli").append(item);
        var classa=document.getElementById("selectClass");
        classa.innerHTML=data.tow_towcol;
    }

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

    $('#fileBox').on("click", ".file-btn",function(){
        var index = $(this).parent().index();
        if(index == 11){
            alert("最多可以上传9张图片！");
            return false;
        }
    });
    //触发选中文件事件
    $("#fileBox").on("change", ".file-btn", function(event){
        var imgNum = parseInt($("#fileBox .review-box img").length);
        if(imgNum < 9){
            var file = event.target.files;  //获取选中的文件对象
            var imgTag = $("<img src=''/>");
            var fileName = file[0].name;    //获取当前文件的文件名
            var url = createObjectURL(file[0]); //获取当前文件对象的URL
            //忽略大小写
            var jpg = (fileName.indexOf(".jpg") > -1) || (fileName.toLowerCase().indexOf(".jpg") > -1);
            var png = (fileName.indexOf(".png") > -1) || (fileName.toLowerCase().indexOf(".png") > -1);
            var jpeg = (fileName.indexOf(".jpeg") > -1) || (fileName.toLowerCase().indexOf(".jpeg") > -1);
            var jpeg = (fileName.indexOf(".gif") > -1) || (fileName.toLowerCase().indexOf(".gif") > -1);
            var jpeg = (fileName.indexOf(".bmp") > -1) || (fileName.toLowerCase().indexOf(".bmp") > -1);
            //判断文件是否是图片类型
            if(jpg || png || jpeg || gif || bmp){
                imgTag.attr("src",url);
            }else{
                alert("请选择合适的图片类型文件！");
            }

            //最佳显示
            var imgbox = $("<div class='prev-item'><span class='closebtn'>×</span></div>");
            imgbox.append(imgTag);
            box.append(imgbox);
            event.target.parentNode.style.display = "none";
            var cloneDom = $(".clone-dom").eq(0).clone().removeAttr("style");
            $("#fileBox").append(cloneDom);
        }
    });

    $(".review-box").on("click", ".prev-item", function(){
        var index = $(this).index();
        $(this).remove();
        $("#fileBox label:eq(" + (index + 1) + ")").remove();
    });

    //form 表单提交前的检验
    function checkPublishForm() {
        var msgtitle=$("input[name='msgtitle']").val();

        if(msgtitle==null ||msgtitle ==""){
            autoWin('请输入标题！');
            return false;
        }

        var contentDescription=$("#contentDescription").val();
        console.info("contentDescription:"+contentDescription);
        if(contentDescription==null || contentDescription==""){
            autoWin("请输入描述内容！");
            return false;
        }

        var imgNum = parseInt($("#fileBox .review-box img").length);
        if(imgNum < 1){
            autoWin("请至少选择上传一张图片！");
            return false;
        }
        return true;
    }

    function autoWin(message) {
        layer.msg(message, {
            offset: 0
        });
    }

</script>
</body>
</html>
