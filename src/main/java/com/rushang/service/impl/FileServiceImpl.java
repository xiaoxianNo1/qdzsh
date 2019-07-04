package com.rushang.service.impl;

import com.rushang.mapper.FileMapper;
import com.rushang.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class FileServiceImpl implements FileService {
    //@Autowired
    private final FileMapper fileMapper;

    @Autowired
    public FileServiceImpl(FileMapper fileMapper){
        this.fileMapper=fileMapper;
    }


    /**
     * 添加消息图片
     * @param tp_id
     * @param tp_nr
     * @param message_id
     * @param tp_mc
     * @return
     */
    public boolean addMessageTp(String tp_id,InputStream tp_nr, String message_id, String tp_mc){
        Boolean bool=false;
        try{
            int i=fileMapper.insertMessageTp(tp_id,tp_nr,message_id,tp_mc);
            if(i==1){
                bool=true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }


        return bool;
    }

    public List<Map> getTpByMessageId(String messageId){
        List<Map> list=new ArrayList<Map>();
        try{
            list=fileMapper.selectTpByMessageId(messageId);
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }

}
