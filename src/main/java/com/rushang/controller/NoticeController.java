package com.rushang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * 通知ctrl
 */


@Controller
@RequestMapping(value = "/notice")
public class NoticeController {
    @RequestMapping(value = "notice",method = RequestMethod.GET )
    public ModelAndView notice(){

        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("notice");
        return modelAndView;
    }
}
