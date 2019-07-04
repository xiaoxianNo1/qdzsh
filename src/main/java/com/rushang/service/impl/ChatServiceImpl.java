package com.rushang.service.impl;

import com.rushang.mapper.ChatMapper;
import com.rushang.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: 小贤
 * @Date: 2019/7/3/ 0003 16:18
 * @Version 1.0
 */
@Service
public class ChatServiceImpl implements ChatService {
    @Autowired
    ChatMapper chatMapper;
    public List<Map> getUserGx(String yhid){
        List<Map> list=new ArrayList<Map>();
        try {
            list=chatMapper.selectUserGx(yhid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
