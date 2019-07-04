package com.rushang.service;

import java.util.List;
import java.util.Map;

public interface CommentService {
    public List<Map> selectPlByXxidPage(String xxid,String yhid,int startTow,int total,String zxpx,String zrpx);

    boolean addComment(String xxid, String yhid, String commentContent);
}
