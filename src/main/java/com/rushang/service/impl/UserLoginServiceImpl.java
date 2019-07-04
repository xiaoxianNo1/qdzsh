package com.rushang.service.impl;

import com.rushang.mapper.LoginMapper;
import com.rushang.pojo.User;
import com.rushang.service.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserLoginServiceImpl implements UserLoginService {

    @Autowired
    LoginMapper loginMapper;
    public User getUserByEmail(String email){
        User user =null;
        try {
            user=loginMapper.selectPwdByEmail(email);
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }
    public User getUserByPhone(String phone){
        User user =null;
        try {
            user=loginMapper.selectPwdByTel(phone);
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    public boolean isPassword(String userId,String password){
        Boolean bool=false;
        try {
            //loginMapper.selectPwdByEmail()
        }catch (Exception e){
            e.printStackTrace();
        }
        return bool;
    }
}
