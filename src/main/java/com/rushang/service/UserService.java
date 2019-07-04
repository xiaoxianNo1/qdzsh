package com.rushang.service;

import com.rushang.pojo.User;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

public interface UserService {
    public Map getUserInfoById(String userId);

    public void addFollowUser(String gxlx,String gxzm,String yhid,String bgzyhid);

    public Boolean updateUserInfo(String User_CoolName, String User_Tel, String User_Email, String User_Pwd, InputStream User_Photo, String User_SignInDate, String User_ID);

    public List<Map> getUserFollow(String yhid,String bgzyhid);

    public boolean updateFollowUser(String gxlx,String gxzm,int yhgxid);



}
