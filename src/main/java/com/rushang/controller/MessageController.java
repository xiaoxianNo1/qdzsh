package com.rushang.controller;


import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.rushang.pojo.Page;
import com.rushang.pojo.Pulishnews;
import com.rushang.service.CollectionService;
import com.rushang.service.FileService;
import com.rushang.service.MessageService;
import com.rushang.service.UserService;
import com.rushang.utils.CommonDate;
import com.rushang.utils.WordDefined;
import com.rushang.utils.fastjson.Json;
import com.rushang.utils.fastjson.Result;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.*;

/**
 *消息
 */
@Controller
@RequestMapping(value = "/message",method = RequestMethod.GET )
public class MessageController {
    private static Logger logger=Logger.getLogger(MessageController.class);
    @Autowired
    MessageService messageService;

    @Autowired
    FileService fileService;

    @Autowired
    CollectionService collectionService;

    @Autowired
    UserService userService;

    //首页
    @RequestMapping(value = "/message",method = RequestMethod.GET)
    public ModelAndView messageIndex(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("index");

        //return "message";
        return modelAndView;
    }

    //获取消息测试 已停用
    @RequestMapping(value = "/getmessagepost",method = RequestMethod.POST)
    public ModelAndView messageIndexPost(){
        String pageNum ="1";
        String xxlx="1";
        String userId=null;
        String ztcs=null;
        String fbsj="1";
        int total=5;//每次加载请求的数据量

        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("index");


        List<Map> pageList =new ArrayList<Map>();
        int startTow=(Integer.parseInt(pageNum)-1) * 2;//当前页开始的行数
        pageList=messageService.selectMessageByPage(null,xxlx,userId,ztcs,fbsj,startTow,total);

        modelAndView.addObject("pageList",pageList);

        return modelAndView;
    }

    //json 获取消息
    @RequestMapping(value = "/getMessageJson",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public void getMessageJson(HttpServletResponse response, @RequestBody JSONObject jsonParam) throws Exception{
        Map<String ,String> param=JSONObject.parseObject(jsonParam.toJSONString(),new TypeReference<Map<String, String>>(){});//jsonObject转map
        String pageNum =param.get("pageNum")==null?"" :param.get("pageNum");
        String xxlx=param.get("xxlx")==null?"":param.get("xxlx");
        String userId=param.get("userId")==null?"":param.get("userId");
        String ztcs=param.get("ztcs")==null?"" : param.get("ztcs");
        String fbsj=param.get("fbsj")==null ? "" : param.get("fbsj");
        String xxfl=param.get("xxfl")==null?"":param.get("xxfl");
        String gzbq=param.get("gzbq")==null?"":param.get("gzbq");
        int total=param.get("pageSize")==null ? 20: Integer.parseInt(param.get("pageSize"));//每次加载请求的数据量
        Result result=null;
        List<Map> pageList =new ArrayList<Map>();
        int startTow=(Integer.parseInt(pageNum)-1) * total;//当前页开始的行数

        logger.info("gzbq:"+gzbq);

        if(gzbq.equals("")||gzbq==null){
            pageList=messageService.selectMessageByPage(xxfl,xxlx,null,ztcs,fbsj,startTow,total);
        }else {
            //获取用户关注的所有用户
            List<Map> bgzyhList=new ArrayList<Map>();
            bgzyhList=userService.getUserFollow(userId,null);
            if(bgzyhList.size()>0){
                for(Map bgzyhMap:bgzyhList){
                    String bgzyhId=bgzyhMap.get("bgzyhid").toString();
                    List bgzyhMessageLs=messageService.selectMessageByPage(xxfl,xxlx,bgzyhId,ztcs,fbsj,startTow,total);
                    pageList.addAll(bgzyhMessageLs);
                }
            }
           /* //获取用户关注的所有分类
            List<Map> bgzflList=new ArrayList<Map>();
            //bgzflList*/
           //result=new Result(true,200,pageList);
        }
        if(pageList.size()==0||pageList==null){
            result=new Result(false,201,"没有消息");
        }else if(pageList.size()>0){
            result=new Result(true,200,"成功",pageList);
        }

        Json.toJson(result,response);
    }

    //消息详情页面
    @RequestMapping(value = "/messagedetails",method = RequestMethod.POST)
    public ModelAndView messageDetails(HttpServletRequest request){
        String xxid = request.getParameter("messageId")==null?"":request.getParameter("messageId");
        //logger.info("xxid:"+xxid);

        ModelAndView modelAndView=new ModelAndView();
        Map map=messageService.getMessageDetailsByXxid(xxid);
        int ydcs=Integer.parseInt(map.get("ydcs").toString());
        logger.info("ydcs:"+ydcs);
        messageService.addYdcs(xxid,ydcs);
        modelAndView.setViewName("messagedetails");
        modelAndView.addObject("map",map);
        return modelAndView;
    }

    //获取消息图片
    @RequestMapping(value = "getmessageimagesjson" ,method = RequestMethod.POST)
    public void getMessageImagesJson(HttpServletResponse response, @RequestBody JSONObject jsonParam)throws Exception{
        Result result=null;
        Map<String ,String> param=JSONObject.parseObject(jsonParam.toJSONString(),new TypeReference<Map<String, String>>(){});//jsonObject转map
        String messageId =param.get("messageId")==null?"" :param.get("messageId");
        List<Map> pictureList=fileService.getTpByMessageId(messageId);
        if(pictureList==null){
            result=new Result(false,201,"获取图片失败");
        }else {
            result=new Result(true,200,"获取图片成功",pictureList);
        }
        Json.toJson(result,response);

    }

    //发布问题页面
    @RequestMapping(value = "/askquestion",method = RequestMethod.GET)
    public ModelAndView askQuestion(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("publishnews");
        modelAndView.addObject("xxlx","1");
        return modelAndView;
    }

    //发布知识页面
    @RequestMapping(value = "/publishnews",method = RequestMethod.GET)
    public ModelAndView publishNews(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("publishnews");
        modelAndView.addObject("xxlx","2");
        return modelAndView;
    }

    //上传一个消息
    @RequestMapping(value = "/uploadmsg",method = RequestMethod.POST)
    public String upLoadMsg(Pulishnews pulishnews, @RequestParam(value = "img[]",required = false)MultipartFile[] files, HttpServletRequest request, RedirectAttributes attributes) throws  Exception{
        Boolean upload1=false;
        Boolean upload2=false;
        logger.info(pulishnews.toString());
        try{
            String xxid= UUID.randomUUID().toString().replaceAll("-","");
            upload1=messageService.addMessage(xxid,pulishnews.getXxlx(),pulishnews.getMsgtitle(),pulishnews.getContentDescription(), CommonDate.getTime24(),0,0,0,0,0,pulishnews.getXxfl()==null?"0001":pulishnews.getXxfl(),files.length-2,pulishnews.getUserid());

            //String messageId=null;
            String tpmc=null;
            for(MultipartFile multipartFile:files){
                String tpid= UUID.randomUUID().toString().replaceAll("-","");
                if(!multipartFile.isEmpty()){
                    //保存图片
                    tpmc=multipartFile.getOriginalFilename();
                    InputStream inputStream=multipartFile.getInputStream();
                    upload2=fileService.addMessageTp(tpid,inputStream,xxid,tpmc);

                    inputStream.close();
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }



        ModelAndView modelAndView=new ModelAndView();

        if(upload1){
            attributes.addFlashAttribute("message", WordDefined.RELEASE_SUCCESS);
        }else if(upload1){
            attributes.addFlashAttribute("message", WordDefined.RELEASE_ERROR);
        }
        return "redirect:/message/message";

    }

    //分类页面
    @RequestMapping(value = "/category" ,method = RequestMethod.GET)
    public ModelAndView category(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("category");
        return  modelAndView;
    }

    //获取分类
    @RequestMapping(value = "/getClass",method = RequestMethod.POST)
    public void getClassJson(HttpServletResponse response)throws Exception{
        Result result=null;
        //List
        List<Map> oneList=new ArrayList<Map>();
        Map<String,List> map=new HashMap<String, List>();

        oneList=messageService.getOneClass();
        for(int i=0;i<oneList.size();i++){
            Map oneMap=oneList.get(i);
            List<Map> towList=new ArrayList<Map>();
            towList=messageService.getTowClass(oneMap.get("one_id").toString());
            map.put(oneMap.get("one_type").toString(),towList);

        }
        logger.info("map："+map.toString());

        if(map!=null){
            result=new Result(true,200,map);
        }else {
            result=new Result(false,200,"获取分类失败，请重试！");
        }
        Json.toJson(result,response);
    }

    //搜索页面
    @RequestMapping(value = "/search" ,method = RequestMethod.GET)
    public ModelAndView search(HttpServletRequest request){
        String xxid = request.getParameter("messageId")==null?"":request.getParameter("messageId");
        List<Map> list =null;
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("search");
        return  modelAndView;
    }

    //按照分类查询页面
    @RequestMapping(value = "/classification" ,method = RequestMethod.GET)
    public ModelAndView classification(HttpServletRequest request){
        String flid = request.getParameter("flid")==null?"":request.getParameter("flid");
        //logger.info("flid:"+flid);
        //List<Map> list =messageService.selectMessageByPage(flid,null,null,null,"按照最新排序",1,20);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("classification");
        return  modelAndView;
    }


    //涨知识页面
    @RequestMapping(value = "/knowledge",method = RequestMethod.GET)
    public ModelAndView knowledge(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("knowledge");
        return  modelAndView;
    }

    //用户对消息点赞或者收藏
    @RequestMapping(value = "/msgdzsc",method = RequestMethod.POST)
    public void msgDzsc(HttpServletResponse response, @RequestBody JSONObject jsonParam) throws Exception{
        Result result=null;
        Map<String ,String> param=JSONObject.parseObject(jsonParam.toJSONString(),new TypeReference<Map<String, String>>(){});//jsonObject转map
        String xxid =param.get("xxid")==null?"" :param.get("xxid");
        String yhid =param.get("yhid")==null?"" :param.get("yhid");
        String dzcs =param.get("dzcs")==null?"" :param.get("dzcs");
        String qxdz =param.get("qxdz")==null?"" :param.get("qxdz");
        String sccs =param.get("sccs")==null?"" :param.get("sccs");
        String qxsc =param.get("qxsc")==null?"" :param.get("qxsc");
        String scid =param.get("scid")==null?"" :param.get("scid");
        logger.info("scid:"+scid);

        if(dzcs!=""){
            logger.info("开始点赞次数更新");
            Map map=messageService.getMessageDetailsByXxid(xxid);
            int ztcs=Integer.parseInt(map.get("ztcs").toString());
            messageService.updateDzcs(ztcs+1,xxid);
        }else if(qxdz!=""){
            logger.info("取消点赞次数");
            Map map=messageService.getMessageDetailsByXxid(xxid);
            int ztcs=Integer.parseInt(map.get("ztcs").toString());
            messageService.updateDzcs(ztcs-1,xxid);
        }else if(sccs!=""){
            logger.info("开始收藏次数更新");
            Map map=messageService.getMessageDetailsByXxid(xxid);
            int sccs1=Integer.parseInt(map.get("sccs").toString());
            collectionService.addCollection(yhid,xxid);
            messageService.updateSccs(sccs1+1,xxid);
        }else if(qxsc!=""){
            logger.info("取消收藏次数");
            Map map=messageService.getMessageDetailsByXxid(xxid);
            int sccs1=Integer.parseInt(map.get("sccs").toString());
            collectionService.updateCollection(scid,"2");
            messageService.updateSccs(sccs1-1,xxid);
        }

        result=new Result(true,200,"操作完成");
        Json.toJson(result,response);



    }

    @RequestMapping(value = "getmessagecollectionjson",method = RequestMethod.POST)
    public void getMessageCollection(HttpServletResponse response, @RequestBody JSONObject jsonParam)throws Exception{
        Result result=null;
        Map<String ,String> param=JSONObject.parseObject(jsonParam.toJSONString(),new TypeReference<Map<String, String>>(){});//jsonObject转map
        String xxid =param.get("xxid")==null?"" :param.get("xxid");
        String yhid =param.get("yhid")==null?"" :param.get("yhid");
        logger.info("yhid"+yhid+"\n xxid:"+xxid);
        List<Map> list= collectionService.getCollection(yhid,xxid,0);
        if(list.size()>0){
            result=new Result(true,200,"获取成功",list);
            logger.info("list"+list.toString());
        }else {

            result=new Result(false,201,"没有获取到关注信息");
        }
        Json.toJson(result,response);
    }

    //我的提问我的知识我的收藏
    @RequestMapping(value = "/myKind" , method = RequestMethod.POST)
    public void myKind(HttpServletResponse response, @RequestBody JSONObject jsonParam)throws Exception{
        Result result=null;
        Map<String ,String> param=JSONObject.parseObject(jsonParam.toJSONString(),new TypeReference<Map<String, String>>(){});//jsonObject转map
        String gnid =param.get("gnid")==null?"" :param.get("gnid");
        String userId =param.get("userId")==null?"" :param.get("userId");
        String pageNum =param.get("pageNum")==null?"" :param.get("pageNum");
        int total=param.get("pageSize")==null ? 20: Integer.parseInt(param.get("pageSize"));//每次加载请求的数据量
        int startTow=(Integer.parseInt(pageNum)-1) * total;//当前页开始的行数
        logger.info("gnid"+gnid);
        logger.info("userId"+userId);
        logger.info("pageNum"+pageNum);
        List<Map> pageList=new ArrayList<Map>();
        if(gnid.equals("1")||gnid.equals("2")){//我的提问  我的知识
            pageList=messageService.selectMessageByPage(null,gnid,userId,null,"按发表时间排序",startTow,total);
        }else if(gnid.equals("3")){
            //我的收藏
            List<Map> listSc=new ArrayList<Map>();
            pageList=messageService.getScList(userId,startTow,total);
        }
        if(pageList.size()==0||pageList==null){
            result=new Result(false,201,"没有消息");
        }else if(pageList.size()>0){
            result=new Result(true,200,"成功",pageList);
        }

        Json.toJson(result,response);

    }

    //搜索Json 获取
    @RequestMapping(value = "/searchJson",method = RequestMethod.POST)
    public void searchJson(HttpServletResponse response, @RequestBody JSONObject jsonParam)throws Exception{
        Map<String ,String> param=JSONObject.parseObject(jsonParam.toJSONString(),new TypeReference<Map<String, String>>(){});//jsonObject转map
        String seachText =param.get("seachText")==null?"" :param.get("seachText");
        String userId =param.get("userId")==null?"" :param.get("userId");
        String xxbq=param.get("xxbq")==null?"":param.get("xxbq");
        String pageNum=param.get("pageNum")==null?"":param.get("pageNum");
        int total=param.get("pageSize")==null ? 20: Integer.parseInt(param.get("pageSize"));//每次加载请求的数据量
        int startTow=(Integer.parseInt(pageNum)-1) * total;//当前页开始的行数
        logger.info(userId);
        logger.info(xxbq);
        logger.info(seachText);
        Result result=null;
        List<Map> list=messageService.getMessageBySearch(seachText,xxbq,startTow,total);
        if(list.size()>0){
            result = new Result(true,200,"获取消息成功",list);
        }else {
            result=new Result(false,201,"获取消息失败");
        }
        Json.toJson(result,response);


    }


























    @RequestMapping(value = "/test",method = RequestMethod.GET)
    public String  test(){
        System.out.println("你好");
        return "index";
    }


    @RequestMapping(value = "/page",method = RequestMethod.GET)
    public void findUserByPage(){
        System.out.println("你好");
        try {

            //HttpSession session=request.getSession();
            List<Map> pageList =messageService.pageShare(0);
            int total =messageService.selectTotal("1",null,null,"1");
            int pageTotal =total % 10 ==0?total /10:total/10+1;
            int pageArray[] =new int [pageTotal];
            for(int i=0;i<=pageTotal ;i++){
                pageArray[i-1]=i;
            }
            System.out.println(pageList.toString());
            //session.setAttribute("pageArray",pageArray);
        }catch (Exception e){
            //model.addAttribute("message","未能获取数据");
            //return "message";
        }
        //return "message";
    }

    @RequestMapping(value = "/pageController" ,method = RequestMethod.GET)
    public void pageController(){
        String pageNum ="2";
        List<Map> pageList =new ArrayList<Map>();
        int startRow=(Integer.parseInt(pageNum)-1) * 2;//当前页开始的行数
        pageList=messageService.pageShare(startRow);
        //model.addAttribute("pageList",pageList);
        System.out.println(pageList.toString());
    }
}
