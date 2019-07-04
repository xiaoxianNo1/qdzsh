package com.rushang.service;


import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface MessageService {
    public List<Map> selectMessage(String xxlx,String UserId,String ztcs,String fbsj);
    public List<Map> selectMessageByPage(String xxfl,String xxlx,String UserId,String ztcs,String fbsj,int startTow,int total);
    public int selectTotal(String xxlx,String UserId,String ztcs,String fbsj);
    public Map getMessageDetailsByXxid(String xxid);
    public List<Map> pageShare(int startRow);
    public List<Map> getOneClass();
    public List<Map> getTowClass(String oneId);

    public boolean addMessage(String xxid,String xxlx,String xxbt,String xxnr,String fbsj,int sccs,int plcs,int zfcs,int ztcs, int ydcs,String xxfl,int xxtpsl,String fbyhid);

    public boolean addYdcs(String xxid,int ydcs);

    public boolean updateDzcs(int dzcs, String xxid);

    public boolean updateSccs(int sccs, String xxid);

    public List<Map> getScList(String scyhid,int startTow,int total);

    public List<Map> getMessageBySearch(String xxnr,String xxlx,int startTow,int total);
}
