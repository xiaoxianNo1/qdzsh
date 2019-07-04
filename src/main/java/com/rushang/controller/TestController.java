package com.rushang.controller;

import com.rushang.utils.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Controller
public class TestController {
    @Autowired
    private HttpServletRequest request;

    //public String registerSubmit(User user,<span style="color:#ff0000;">MultipartFile pic1,MultipartFile pic2,MultipartFile </span>)


    /*private boolean saveFile(MultipartFile file){
        if(!file.isEmpty()){
            try {
                String filePath=request.getSession().getServletContext().getRealPath("/")+"upload/"+file.getOriginalFilename();
                file.transferTo(new File(filePath));
                return true;
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return  false;
    }

    @RequestMapping(value = "/filesUpload" , method = RequestMethod.POST)
    public String fileUpload (@RequestParam("files") MultipartFile[] files){
        if(files!=null && files.length>0){
            for(int i=0;i<files.length;i++){
                MultipartFile file=files[i];
                saveFile(file);
            }
        }
        return "redirect:/index";
    }*/


    /*public String uploadFile(Model model, HttpServletRequest request, HttpSession session, @PathVariable("module")String module){
        User user=(User) session.getAttribute("user");
        List<String> list=new ArrayList<String>();
        try{
            list= FileUploadUtil.uploadFile(request,user.getUserName(),(module==null||module.length()==0)?"default":module);
            model.addAttribute();
        }catch (Exception e){

        }
    }*/

    /*@SuppressWarnings("unchecked")
    @RequestMapping(value = "/uploadFile.do")
    public String uploadFile(@RequestParam("file") MultipartFile formFile, HttpServletRequest request, HttpServletResponse response)*/
}
