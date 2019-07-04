package com.rushang.controller;

import com.rushang.service.UserRegisterService;
import com.rushang.utils.CommonDate;
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
 *用户注册
 */
@Controller
@RequestMapping("/register")
public class UserRegisterController {
    private static Logger logger=Logger.getLogger(UserRegisterController.class);

    @Autowired
    UserRegisterService userRegisterService;

    @RequestMapping(value = "/register" ,method = RequestMethod.GET)
    public String Register(){
        return "userregister";
    }

    @RequestMapping(value = "/userregister" ,method = RequestMethod.POST)
    public String userRegister(String nickname, String sex, String phone, String email, String password, HttpSession session, RedirectAttributes attributes, HttpServletRequest request){
        logger.info("昵称:"+nickname);
        String date = CommonDate.getTime24();

        boolean state=userRegisterService.createRegisterInfo(nickname,sex,phone,email,password,date);
        if( !state){
            logger.debug("注册出错了");
            attributes.addFlashAttribute("error", WordDefined.REGISTER_ERROR);
            return "redirect:/register/register";
        }

        logger.info("校验用户手机号和邮箱");
        if (!userRegisterService.isPhoneNull(phone)){
            attributes.addFlashAttribute("error", WordDefined.REGISTER_ERROR_PHONE);
            return "redirect:/register/register";
        }else if(!userRegisterService.isEmailNull(email)){
            attributes.addFlashAttribute("error", WordDefined.REGISTER_ERROR_EMAIL);
            return "redirect:/register/register";
        }

        String userId=userRegisterService.getRegisterUserId(nickname,sex,phone,email,password,date);
        logger.info("userId:"+userId);
        if(userId!=null &&userId!=""){
            logger.info("生成用户");
            if (userRegisterService.createUser(userId,nickname,phone,email,password,"",sex,date )){
                attributes.addFlashAttribute("message",WordDefined.REGISTER_SUCCESS);
                return "redirect:/login/login";
            }else {
                attributes.addFlashAttribute("error", WordDefined.REGISTER_ERROR);
                return "redirect:/register/register";
            }

        }else {
            attributes.addFlashAttribute("error", WordDefined.REGISTER_ERROR);
            return "redirect:/register/register";
        }

    }

}
