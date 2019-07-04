package com.rushang.controller;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.rushang.service.CommentService;
import com.rushang.utils.fastjson.Json;
import com.rushang.utils.fastjson.Result;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
/**
 * 评论ctrl
 */
@Controller
@RequestMapping(value = "/comment",method=RequestMethod.GET)
public class CommentController {
    private static Logger logger=Logger.getLogger(CommentController.class);
    @Autowired
    CommentService commentService;

    @RequestMapping(value = "/getCommentByXxidJson" ,method = RequestMethod.POST)
    public void getCommentByXxIdJson(HttpServletResponse response, @RequestBody JSONObject jsonParam)throws Exception{
        Map<String ,String> param=JSONObject.parseObject(jsonParam.toJSONString(),new TypeReference<Map<String, String>>(){});//jsonObject转map
        logger.info("param:"+param);
        String xxid=param.get("xxid")==null?"":param.get("xxid");
        String yhid=param.get("yhid")==null?"":param.get("yhid");;
        String pageNum=param.get("pageNum")==null?"":param.get("pageNum");;
        int total=param.get("pageSize")==null ? 5: Integer.parseInt(param.get("pageSize"));//每次加载请求的数据量
        String zxpx=param.get("zxpx")==null?"":param.get("zxpx");
        String zrpx=param.get("zrpx")==null?"":param.get("zrpx");

        Result result=null;
        List<Map> pageList =new ArrayList<Map>();
        int startTow=(Integer.parseInt(pageNum)-1) * total;//当前页开始的行数
        pageList= commentService.selectPlByXxidPage(xxid,yhid,startTow,total,zxpx,zrpx);
        if(pageList.size()==0||pageList==null){
            result=new Result(false,201,"没有更多评论");
        }else if(pageList.size()>0){
            result=new Result(true,200,"成功",pageList);
        }
        Json.toJson(result,response);
    }

    @RequestMapping(value = "/addcommentjson",method = RequestMethod.POST)
    public void addCommentJson(HttpServletResponse response, @RequestBody JSONObject jsonParam)throws  Exception{
        Map<String ,String> param=JSONObject.parseObject(jsonParam.toJSONString(),new TypeReference<Map<String, String>>(){});//jsonObject转map
        String xxid=param.get("xxid")==null?"":param.get("xxid");
        String yhid=param.get("yhid")==null?"":param.get("yhid");
        String commentContent=param.get("commentContent")==null?"":param.get("commentContent");
        boolean bool=commentService.addComment(xxid,yhid,commentContent);
        Result result=null;
        if(bool){
            result=new Result(true,200,"评论成功");
        }else {
            result=new Result(false,201,"评论失败，请重试。");
        }
        Json.toJson(result,response);
    }

}
