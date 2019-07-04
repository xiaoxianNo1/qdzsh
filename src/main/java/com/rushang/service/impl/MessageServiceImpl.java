package com.rushang.service.impl;

import com.rushang.mapper.MessageMapper;

import com.rushang.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    MessageMapper messageMapper;

    public List<Map> selectMessage(String xxlx,String UserId,String ztcs,String fbsj){
        List<Map> list=new ArrayList<Map>();
        try{
            list=messageMapper.selectMessageByUserId(xxlx,UserId,ztcs,fbsj);
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 分页查询消息 list
     * @param xxfl
     * @param xxlx
     * @param UserId
     * @param ztcs
     * @param fbsj
     * @param startTow
     * @param total
     * @return
     */
    public List<Map> selectMessageByPage(String xxfl,String xxlx,String UserId,String ztcs,String fbsj,int startTow,int total){
        List<Map> list=new ArrayList<Map>();
        try{
            list=messageMapper.selectMessageByPage(xxfl,xxlx,UserId,ztcs,fbsj,startTow,total);
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public int selectTotal(String xxlx,String UserId,String ztcs,String fbsj){
        int total = messageMapper.selectMessageTotal(xxlx, UserId);
        return total;
    }

    /**
     * 根据xxid 获取详情信息
     * @param xxid
     * @return
     */

    public Map getMessageDetailsByXxid(String xxid){
        Map map=null;
        try {
            map=messageMapper.selectMessageDetailsByXxid(xxid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return map;


    }

    public List<Map> pageShare(int startRow){
        List<Map> list =new ArrayList<Map>();
        //list=messageMapper.selectMessageByPage(startRow);
        return list;
    }

    /**
     * 获取一级分类
     * @return
     */
    public List<Map> getOneClass(){
        List<Map> oneList=new ArrayList<Map>();
        try {
            oneList=messageMapper.selectOneClass();
        }catch (Exception e){
            e.printStackTrace();
        }
        return oneList;
    }

    /**
     * 根据一级分类获取二级分类信息
     * @param oneId
     * @return
     */
    public List<Map> getTowClass(String oneId){
        List<Map> towList=new ArrayList<Map>();
        try{
            towList=messageMapper.selectTowClass(oneId);
        }catch (Exception e){
            e.printStackTrace();
        }
        return towList;
    }


    /**
     * 添加消息
     * @param xxid
     * @param xxlx
     * @param xxbt
     * @param xxnr
     * @param fbsj
     * @param sccs
     * @param plcs
     * @param zfcs
     * @param ztcs
     * @param ydcs
     * @param xxfl
     * @param xxtpsl
     * @param fbyhid
     * @return
     */
    public boolean addMessage(String xxid,String xxlx,String xxbt,String xxnr,String fbsj,int sccs,int plcs,int zfcs,int ztcs, int ydcs,String xxfl,int xxtpsl,String fbyhid){
        Boolean bool=false;
        try{
            //
            int i=messageMapper.insertMessage(xxid,xxlx,xxbt,xxnr,fbsj,sccs,plcs,zfcs,ztcs,ydcs,xxfl,xxtpsl,fbyhid);
            System.out.println("插入消息返回状态"+i);
            if(i==1){
                bool=true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return bool;
    }

    /**
     * 添加阅读次数
     * @param xxid
     * @return
     */
    public boolean addYdcs(String xxid,int ydcs){

        try {
            messageMapper.updateYdcs(xxid,ydcs+1);
        }catch (Exception e){
            e.printStackTrace();
        }

        return false;
    }

    /**
     * 添加赞同次数
     * @param dzcs
     * @param xxid
     * @return
     */
    public boolean updateDzcs(int dzcs, String xxid){
        try {
            int i=0;
            i=messageMapper.updateDzcs(xxid,dzcs);
            if(i==1){
                return true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return false;
    }

    /**
     * 添加收藏次数
     * @param sccs
     * @param xxid
     * @return
     */
    public boolean updateSccs(int sccs, String xxid){
        try {
            int i=0;
            i=messageMapper.updateSccs(xxid,sccs);
            if(i==1){
                return  true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return false;
    }

    public List<Map> getScList(String scyhid,int startTow,int total){
        List<Map> list=new ArrayList<Map>();
        try{
            list=messageMapper.selectMsgSc(scyhid,startTow,total);
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public List<Map> getMessageBySearch(String xxnr,String xxlx,int startTow,int total){
        List<Map> list=new ArrayList<Map>();
        try {
            list=messageMapper.selectMessageBySearch(xxnr,xxlx,startTow,total);
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
