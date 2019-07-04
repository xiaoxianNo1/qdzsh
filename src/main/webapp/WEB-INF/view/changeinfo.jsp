<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/6/18
  Time: 16:11
  用户修改信息
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
    <form class="am-form" method="post" enctype="multipart/form-data" action="<%=path%>/user/changeinfopost">
        <!--头部开始-->
        <header data-am-widget="header" class="am-header am-header-default am-header-fixed bg-1 header-gray">
            <div class="am-header-left am-header-nav">
                <a href="#" class="am-text-sm" onclick="backClick();">
                    <i class="am-header-icon am-icon-angle-left"></i> 返回
                </a>
            </div>

            <h1 class="am-header-title">
                <a href="#title-link" class="">
                    修改信息
                </a>
            </h1>

            <div class="am-header-right am-header-nav header-right-btn">
                <button type="submit" class="am-btn am-btn-secondary am-radius">保存</button>
            </div>
        </header>
        <!--头部结束-->
        <!-- 列表 -->
        <div id="userInfoLi">

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
<script src="/static/source/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="<%=path%>/static/source/js/amazeui.min.js"></script>
<script src="<%=path%>/static/source/js/qdzsh.js"></script>
<script>
    $(function () {
        var userid=getCookie('userid');
        console.info("userid"+userid);

        var jsonData={
            "userId":userid
        };

        $.ajax({
            type: "POST",
            url: '<%=path%>/user/userinfojson',
            data: JSON.stringify(jsonData),
            contentType:'application/json;charset=UTF-8',
            dataType: 'json',
            success:function(data){
                var mapUser=data.result;
                var items='<input type="hidden" id="userId" name="userId" value="'+userid+'" />';
                items+='<div class="am-u-sm-12 bg-white">';
                items+='<ul class="user-change-list">';
                items+='<li>';
                items+='<a href="#">';
                items+='头像';

                items+='<span class="change-list-right">';

                items+='<div class="am-form-group am-form-file img-upload am-margin-0">';
                items+='<img class="am-circle" width="36" height="36" id="userPhoto">';
                items+='<input type="file" id="filePhoto" name="filePhoto">';
                items+='</div>';
                items+='</span>';

                items+='</a>';
                items+='</li>';
                items+='<li>';
                items+='昵称';
                items+='<span class="change-list-right"> <input type="text" name="userCoolName" class="am-text-right"  class="" value="'+mapUser.User_CoolName +'"></span>';
                items+='</li>';
                items+='<li class="change-list-end">';
                items+='手机号';
                items+='<span class="change-list-right"><input type="text" name="userPhone" class="am-text-right"  class="" value="'+mapUser.User_Tel +'"></span>';
                items+='</li>';
                items+='</ul>';
                items+='</div>';
                items+='<div class="am-u-sm-12 bg-white am-margin-top-sm">';
                items+='<ul class="user-change-list">';
                items+='<li class="change-list-end">';
                items+='邮箱';
                items+='<span class="change-list-right"> <input type="text" name="userMaill" class="am-text-right"  class="" value="'+mapUser.User_Email +'"></span>';
                items+='</li>';
                items+='</ul>';
                items+='</div>';
                $("#userInfoLi").append(items);

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

    //头像预览
    $("#filePhoto").on("change",function (e) {
       var file=e.target.files[0];
       var maxSize=2048;//设置图片上传最大值为2M
       var name=file.name;
       var size=(file.size/1024).toFixed(2);
       var type=file.type;
       var reader=new FileReader();
       reader.readAsDataURL(file);
       reader.onload=function (e) {
           var result=e.target.result;
           var image=new Image();
           image.src=result;
           image.onload=function () {
               if(size>maxSize){
                   //判断图像大小，大于2M则压缩后上传。
                   var img64=compress(image,100,100,0.7);
                   $("#userPhoto").attr("src",img64);//实现图片预览功能
               }else {
                   $("#userPhoto").attr("src",result);//实现图片预览功能
               }

           }

       }
    });

    /**
     * canvas 图片压缩函数
     * @param img
     * @param width
     * @param height
     * @param ratio
     */
    function compress(img,width,height,ratio) {
        var canvas,ctx,img64;
        canvas=document.createElement('canvas');
        canvas.width=width;
        canvas.height=height;
        ctx=canvas.getContext("2d");
        ctx.drawImage(img,0,0,width,height);
        img64=canvas.toDataURL("image/jpeg",ratio);
        return img64;
    }
</script>
</body>
</html>
