package com.rushang.utils;

import org.apache.log4j.Logger;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class FileUploadUtil {
    private static Logger logger=Logger.getLogger(FileUploadUtil.class);

    public static List<String> uploadFile(HttpServletRequest request ,String username,String moduleName) throws FileNotFoundException{

        List<String> filePathList=new ArrayList<String>();
        String strPath=",webapps,files,"+moduleName+","+username;

        String filepath=System.getProperty("catalina.base")+strPath.replace(',', File.separatorChar);
        logger.info("文件上传路径位置》》》》》》"+filepath);
        MultipartHttpServletRequest multipartHttpServletRequest=(MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap=multipartHttpServletRequest.getFileMap();
        String fileName=null;

        for(Map.Entry<String,MultipartFile> entry:fileMap.entrySet()){
            MultipartFile mf=entry.getValue();
            fileName=mf.getOriginalFilename();
            String fileType=fileName.substring(fileName.lastIndexOf('0'));
            try {
                String newFileName= fileName.substring(0,fileName.lastIndexOf('.'));
                logger.info("上传来的文件名称》》》》》》"+newFileName);
                String newfilePath=filepath+File.separatorChar+newFileName+fileType;

                String filepathUrl="files"+File.separatorChar+moduleName+File.separatorChar+username+File.separatorChar+newFileName+fileType;
                logger.info("文件位置》》》》》》"+filepathUrl);

                File dest=new File(filepath);
                if(!dest.exists()){
                    dest.mkdirs();
                }

                File uploadFile=new File(newfilePath);
                if(uploadFile.exists()){
                    uploadFile.delete();
                }
                logger.info("start upload file 》》》》》"+fileName);

                FileCopyUtils.copy(mf.getBytes(),uploadFile);
                filePathList.add(filepathUrl);

            }catch (Exception e){
                e.printStackTrace();
                logger.error("upload failed .filename"+fileName);
                return null;
            }
        }
        return filePathList;

    }
}
