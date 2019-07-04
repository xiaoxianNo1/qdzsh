<%--
  Created by IntelliJ IDEA.
  User: zxw
  Date: 2019/6/17
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path =request.getContextPath();%>
<html>
<head>
    <title>上传文件实例</title>
</head>
<body>
    <%--<td class="tt">
        <input type="file" id="file" name="file" style="height:25px" size="40"/>
    </td>--%>
    <%--<from action="<%=path%>/filesUpload" method="post" enctype="multipart/form-data" >
        <p>
            选择文件：<input type="file" name="files">
        </p>
        <p>
            选择文件：<input type="file" name="files">
        </p>
        <p>
            选择文件：<input type="file" name="files">
        </p>

        <input type="submit" value="提交">
    </from>--%>

    <from id="registerForm" action="registerSubmit.action" method="post" enctype="multipart/form-data">
        <input type="file" id="uploadPhoto" name="uploadPhoto1">
        <input type="file" id="uploadPhoto2" name="uploadPhoto2">
        <input type="file" id="uploadPhoto3" name="uploadPhoto3">
        <p class="help-block"> 电视上传</p>
    </from>

<script>
    function getImg() {
        var bts=[{
            title:"拍照"
        },{
            title:"从相册选择"
        }];
        plus.nativeUI.actionSheet({
            cancel:"取消",
            buttons:bts
        },function (e) {
            if(e.index==1){
                getImage();
            }else if(e.index ==2){
                galleryImgs();
            }
        });
    }

    function getImage() {
        var cmr=plus.camera.getCamera();
        cmr.captureImage(function (p) {
            console.info("拍照" + p);
            plus.io.resolveLocalFileSystemURL(p, function (entry) {
                compressImage(entry.toLocalURL(), entry.name);
            }, function (e) {
                plus.nativeUI.toast("读取拍照文件错误:" + e.message);
            });
        },function (e) {

        },{
            filter:'image'
        });
    }

    function galleryImgs() {
        plus.gallery.pick(function (e) {
            var name =e.substr(e.lastIndexOf('/')+1);
            compressImage(e,name);
        },function (e) {

        },{
            filter:"image"
        });
    }

    function compressImage(url,filename) {
        var name="_doc/upload/"+filename;
        plus.zip.compressImage({
            src:url,
            dst:mame,
            quality:40,
            overwrite:true
        },function (zip) {
            console.info("图片压缩后路径"+zip.target);
            createUpload(zip.target)
        },function (error) {
            plus.nativeUI.toast("压缩图片失败，请稍后再试");
        });
    }

    function createUpload(url) {
        var server="<%=path%>";
        var wt=plus.nativeUI.showWaiting();
        var task=plus.uploader.createUpload(server,
            {method:"POST"},
            function (t,status) {
                if(status==200){
                    wt.close();
                    var result=JSON.parse(t.responseText);
                    console.info("上传成功返回结果："+result);
                }else {
                    console.log("上传失败"+status);
                    wt.close();
                }

            }
        );
        task.addFile(url,{key:'file'});
        task.stack();

    }
</script>
</body>
</html>
