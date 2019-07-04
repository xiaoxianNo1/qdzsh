package com.rushang.service.impl;

import com.rushang.mapper.UserMapper;
import com.rushang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    /**
     * 根据用户id 获取用户信息
     * @param userId
     * @return
     */
    public Map getUserInfoById(String userId){
        Map user=userMapper.getUserById(userId);
        return user;
    }

    /**
     * 添加用户关注
     * @param gxlx
     * @param gxzm
     * @param yhid
     * @param bgzyhid
     */
    public void addFollowUser(String gxlx,String gxzm,String yhid,String bgzyhid){
        System.out.println("gxlx:"+gxlx+"\n"+gxzm+"\n"+yhid+"\n"+bgzyhid);
        userMapper.insertFollowUser(gxlx,gxzm,yhid,bgzyhid);
    }

    /**
     * 更新用户信息
     * @param User_CoolName
     * @param User_Tel
     * @param User_Email
     * @param User_Pwd
     * @param User_Photo
     * @param User_SignInDate
     * @param User_ID
     * @return
     */
    public Boolean updateUserInfo(String User_CoolName, String User_Tel, String User_Email, String User_Pwd, InputStream User_Photo, String User_SignInDate, String User_ID){
        int i=0;
        try{
            i=userMapper.updateUserInfo(User_CoolName,User_Tel,User_Email,User_Pwd,User_Photo,User_SignInDate,User_ID);
            if(i==1)return true;
        }catch (Exception e){
            e.printStackTrace();
        }

        return false;
    }

    /**
     * 获取用户关注信息
     * @param yhid
     * @param bgzyhid
     * @return
     */
    public List<Map> getUserFollow(String yhid,String bgzyhid){
        List<Map> list=new ArrayList<Map>();
        try {
            list=userMapper.selectUserFollow(yhid,bgzyhid);
        }catch (Exception e){
            e.printStackTrace();
            //throw new Exception("获取用户关注信息"+e);
        }
        return list;
    }

    /**
     * 更新用户关注信息
     * @param gxlx
     * @param gxzm
     * @param yhgxid
     * @return
     */
    public boolean updateFollowUser(String gxlx,String gxzm,int yhgxid){

        try {
            int i=0;
            i=userMapper.updateUserFollow(gxlx,gxzm,yhgxid);
            if(i==1){
                return true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }


        return false;
    }
}
