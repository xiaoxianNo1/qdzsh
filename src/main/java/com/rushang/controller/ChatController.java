package com.rushang.controller;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.Map;


/**
 * 聊天
 */



@Controller
@RequestMapping(value = "/chat")
public class ChatController {

    @RequestMapping(value = "/chat",method = RequestMethod.GET)
    public ModelAndView chat(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("chat");
        return modelAndView;
    }

    //获取好友列表
    @RequestMapping(value = "/getChatList" ,method = RequestMethod.POST)
    public void getChatList(HttpServletResponse response, @RequestBody JSONObject jsonParam)throws Exception{
        Map<String ,String> param=JSONObject.parseObject(jsonParam.toJSONString(),new TypeReference<Map<String, String>>(){});//jsonObject转map
        String pageNum =param.get("pageNum")==null?"" :param.get("pageNum");
        String pageSize =param.get("pageSize")==null?"" :param.get("pageSize");
        String userId =param.get("userId")==null?"" :param.get("userId");
    }
}
