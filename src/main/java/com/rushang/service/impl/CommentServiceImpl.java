package com.rushang.service.impl;

import com.rushang.mapper.CommentMapper;
import com.rushang.service.CommentService;
import com.rushang.utils.CommonDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentMapper commentMapper;
    public List<Map> selectPlByXxidPage(String xxid,String yhid,int startTow,int total,String zxpx,String zrpx){
        List<Map> commentMap=new ArrayList<Map>();
        try {
            commentMap=commentMapper.selectPlByXxidPage(xxid,yhid,startTow,total,zxpx,zrpx);
        }catch (Exception e){
            e.printStackTrace();
        }
        return  commentMap;
    }

    public boolean addComment(String xxid, String yhid, String commentContent){
        try {
            int i=0;

            i=commentMapper.insertComment(commentContent, CommonDate.getTime24(),xxid,yhid);
            if(i==1){
                return true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
