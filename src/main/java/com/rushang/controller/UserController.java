package com.rushang.controller;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.rushang.pojo.ChangeInfo;
import com.rushang.service.UserService;
import com.rushang.utils.WordDefined;
import com.rushang.utils.fastjson.Json;
import com.rushang.utils.fastjson.Result;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/user")
public class UserController {
    private static Logger logger=Logger.getLogger(UserController.class);
    @Autowired
    UserService userService;

    @RequestMapping(value = "addfollowuser")
    public void addFollowUser()throws Exception{

    }

    //打开我的页面
    @RequestMapping(value = "me",method = RequestMethod.GET)
    public ModelAndView me(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("me");
        return modelAndView;
    }

    //获取用户信息json
    @RequestMapping(value = "userinfojson",method = RequestMethod.POST)
    public void userInfoJson(HttpServletResponse response, @RequestBody JSONObject jsonParam)throws Exception{
        Map<String ,String> param=JSONObject.parseObject(jsonParam.toJSONString(),new TypeReference<Map<String, String>>(){});//jsonObject转map
        String userId =param.get("userId")==null?"" :param.get("userId");
        logger.info("userId="+userId);
        Result result=null;
        Map mapUser=userService.getUserInfoById(userId);
        if(mapUser==null){
            result=new Result(false,200,"用户不存在");
        }else {
            result=new Result(true,200,"获取用户成功。",mapUser);
        }
        Json.toJson(result,response);
    }

    //打开修改信息页面
    @RequestMapping(value = "changeinfo" ,method = RequestMethod.GET)
    public ModelAndView changeinfo(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("changeinfo");
        return modelAndView;
    }

    //用户修改信息提交
    @RequestMapping(value = "changeinfopost" ,method = RequestMethod.POST)
    public String changeinfopost(ChangeInfo changeInfo, @RequestParam(value = "filePhoto",required = false)MultipartFile file, HttpServletRequest request, RedirectAttributes attributes) throws Exception{
        Boolean bool=false;

        InputStream inputStream=null;
        if(!file.isEmpty()){
            inputStream=file.getInputStream();

        }
        bool=userService.updateUserInfo(changeInfo.getUserCoolName(),changeInfo.getUserPhone(),changeInfo.getUserMaill(),null,inputStream,null,changeInfo.getUserId());
        if (bool){
            //修改信息成功
            attributes.addFlashAttribute("message", WordDefined.LOG_DETAIL_UPDATE_PROFILE_SUCCESS);
            return "redirect:/user/me";
        }else {
            //修改信息失败
            attributes.addFlashAttribute("message", WordDefined.LOG_DETAIL_UPDATE_PROFILE_ERROR);
            return "redirect:/user/me";
        }

        //return null;

    }

    //获取用户关注信息
    @RequestMapping(value = "getfollowinfo" ,method = RequestMethod.POST)
    public void getFollowInfo(HttpServletResponse response, @RequestBody JSONObject jsonParam)throws Exception{
        Map<String ,String> param=JSONObject.parseObject(jsonParam.toJSONString(),new TypeReference<Map<String, String>>(){});//jsonObject转map
        String yhid =param.get("yhid")==null?"" :param.get("yhid");
        String bgzyhid =param.get("bgzyhid")==null?"" :param.get("bgzyhid");
        Result result=null;
        List<Map> followList= userService.getUserFollow(yhid,bgzyhid);
        if(followList.size()>0){
            result=new Result(true,200,"获取成功",followList);
        }else {
            result=new Result(false,201,"获取失败");
        }
        Json.toJson(result,response);

    }
    //修改用户关注信息
    @RequestMapping(value = "setfollowinfo",method = RequestMethod.POST)
    public void setFollowInfo(HttpServletResponse response, @RequestBody JSONObject jsonParam)throws Exception{
        Map<String ,String> param=JSONObject.parseObject(jsonParam.toJSONString(),new TypeReference<Map<String, String>>(){});//jsonObject转map
        String yhid =param.get("yhid")==null?"" :param.get("yhid");
        String bgzyhid =param.get("bgzyhid")==null?"" :param.get("bgzyhid");
        String followState =param.get("followState")==null?"" :param.get("followState");
        String yhgxid =param.get("yhgxid")==null?"" :param.get("yhgxid");
        logger.info("setfollowinfo："+yhid+"\n"+bgzyhid+"\n"+yhgxid+"\n");
        if(followState.equals(WordDefined.USER_UNFOLLOW)){
            logger.info("添加关注");
            userService.addFollowUser("1","好友",yhid,bgzyhid);
        }else if(followState.equals(WordDefined.USER_FOLLOW)){
            logger.info("取消关注");
            userService.updateFollowUser("2",null,Integer.parseInt(yhgxid));
        }
        Result result=new Result(true,200,"操作完成");
        Json.toJson(result,response);

    }

    //我的关注
    @RequestMapping(value = "myconcern" , method = RequestMethod.GET)
    public ModelAndView myconcern()throws  Exception{
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("myconcern");
        return modelAndView;
    }

    //我的提问
    @RequestMapping(value = "myquestions" , method = RequestMethod.GET)
    public ModelAndView myquestions()throws Exception{
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("mykind");
        return modelAndView;
    }

    @RequestMapping(value = "mykind" , method = RequestMethod.GET)
    public ModelAndView mykind(HttpServletRequest request)throws Exception{

        String gnid = request.getParameter("gnid")==null?"":request.getParameter("gnid");
        Map map=new HashMap();
        map.put("gnid",gnid);

        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("mykind");
        modelAndView.addObject("map",map);
        return modelAndView;
    }


}
