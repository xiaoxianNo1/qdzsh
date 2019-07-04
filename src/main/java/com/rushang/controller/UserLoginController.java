package com.rushang.controller;

import com.rushang.pojo.User;
import com.rushang.service.UserLoginService;
import com.rushang.service.UserService;
import com.rushang.utils.WordDefined;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *用户登录
 */

@Controller
@RequestMapping("/login")
public class UserLoginController {
    private static Logger logger=Logger.getLogger(UserLoginController.class);
    @Autowired
    UserService userService;
    @Autowired
    UserLoginService userLoginService;
    /**
     * 跳转登录页面
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "userlogin";
    }

    @RequestMapping(value = "userLogin" , method = RequestMethod.POST)
    public String userLoginFrom(String useraccount, String password, HttpSession session, RedirectAttributes attributes, HttpServletRequest request, HttpServletResponse response){
        logger.debug("用户输入的账户信息:"+useraccount);
        User user=null;
        if(isEmail(useraccount)){
            logger.debug("使用邮箱登录");
            user=userLoginService.getUserByEmail(useraccount);
        }else if(isMobileNo(useraccount)){
            logger.debug("使用手机号登录");
            user=userLoginService.getUserByPhone(useraccount);
        }else {
            logger.debug("重新输入信息");
            return "userLogin";
        }
        if (user==null){
            attributes.addFlashAttribute("error", WordDefined.LOGIN_USERID_ERROR);
            return "redirect:/login/login";
        }
        if(!user.getUser_pwd().equals(password)){
            attributes.addFlashAttribute("error", WordDefined.LOGIN_PASSWORD_ERROR);
            return "redirect:/login/login";
        }

        logger.info("userid"+user.getUser_id());
        Cookie userIdCookie=new Cookie("userid",user.getUser_id());
        userIdCookie.setMaxAge(365*24*60*60);
        userIdCookie.setPath("/");
        response.addCookie(userIdCookie);
        Cookie userTokenCookie=new Cookie("usertoken",password);
        userTokenCookie.setMaxAge(365*24*60*60);
        userTokenCookie.setPath("/");
        response.addCookie(userTokenCookie);
        return "index";
    }

    @RequestMapping(value = "/userlogout" ,method = RequestMethod.GET)
    public String userLogout(HttpServletResponse response){
        Cookie userIdCookie=new Cookie("userid",null);
        userIdCookie.setMaxAge(0);
        userIdCookie.setPath("/");
        response.addCookie(userIdCookie);

        Cookie userTokenCookie=new Cookie("usertoken",null);
        userTokenCookie.setMaxAge(0);
        userTokenCookie.setPath("/");
        response.addCookie(userTokenCookie);
        return "userlogin";
    }

    /**
     * 判断是否为整数
     * @param str
     * @return boolean
     */
    public static boolean isInteger(String str){
        Pattern pattern=Pattern.compile("^[-\\+]?[\\d]*$");
        return pattern.matcher(str).matches();
    }

    /**
     * 判断是否为手机号
     * @param phone
     * @return
     */
    public static boolean isMobileNo(String phone){
        //Pattern pattern=Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0-9]))\\d{8}$");
        Pattern pattern=Pattern.compile("^((13[0-9])|(15[^,\\D])|(17[0-9])|(18[0,5-9]))\\d{8}$");
        Matcher matcher=pattern.matcher(phone);
        return matcher.matches();
    }

    /**
     * 判断是否为邮箱
     * @param email
     * @return
     */
    private static boolean isEmail(String email){
        if(null==email || "".equals(email)) return false;
        Pattern pattern=Pattern.compile("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*");//复杂匹配
        Matcher matcher=pattern.matcher(email);
        return matcher.matches();
    }
}
