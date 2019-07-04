package com.rushang.service.impl;

import com.rushang.mapper.CollectionMapper;
import com.rushang.service.CollectionService;
import com.rushang.utils.CommonDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class CollectionServiceImpl implements CollectionService {
    @Autowired
    CollectionMapper collectionMapper;

    /**
     * 添加收藏
     * @param yhid
     * @param xxid
     * @return
     */
    public boolean addCollection(String yhid,String xxid){
        try {
            int i=0;
            i=collectionMapper.insertUserCollection(CommonDate.getTime24(),"1",yhid,xxid);
            if(i==1){
                return true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return false;
    }

    /**
     * 获取收藏列表
     * @param yhid
     * @param xxid
     * @param startTow
     * @return
     */
    public List<Map> getCollection(String yhid,String xxid,int startTow){
        List<Map> list=new ArrayList<Map>();
        try {
            list=collectionMapper.selectUserCollectionByPage(yhid,xxid,startTow);

        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }

    /**
     * 更新收藏状态
     * @param yhid
     * @param xxid
     * @param sczt
     * @return
     */
    public boolean updateCollection(String scid,String sczt){

        try{
            int i=0;
            i=collectionMapper.updateUserCollection(sczt,scid);
        }catch (Exception e){
            e.printStackTrace();
        }

        return false;
    }
}
