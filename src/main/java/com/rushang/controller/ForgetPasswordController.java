package com.rushang.controller;

import com.rushang.service.ForgetService;
import com.rushang.utils.WordDefined;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
/**
 *找回密码
 */
@Controller
@RequestMapping("/forget")
public class ForgetPasswordController {
    private static Logger logger=Logger.getLogger(ForgetPasswordController.class);

    @Autowired
    ForgetService forgetService;

    @RequestMapping(value = "/forget", method = RequestMethod.GET)
    public String forget(){
        return "forgetpassword";
    }

    @RequestMapping(value = "/forgetemail", method = RequestMethod.GET)
    public String forgetemail(){
        return "forgetemail";
    }

    @RequestMapping(value = "/retrieveemail", method = RequestMethod.POST)
    public String retrieveEmail(String email,String phone, HttpSession session, RedirectAttributes attributes, HttpServletRequest request){
        logger.info("email"+email);
        if(forgetService.getPwd(email,phone)){
            logger.info("邮件发送成功");
            attributes.addFlashAttribute("message",WordDefined.FOREGT_SUCCESS);

        }else {
            logger.info("邮件发送失败");
            attributes.addFlashAttribute("error", WordDefined.FOREGT_ERROR);
            return "redirect:/forget/forgetpassword";

        }
        return "redirect:/login/login";
    }

    @RequestMapping(value = "/forgetphone", method = RequestMethod.GET)
    public String forgetphone(){
        return "forgetphone";
    }

}
