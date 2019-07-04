package com.rushang.service.impl;

import com.rushang.mapper.ForgetMapper;
import com.rushang.service.ForgetService;
import com.rushang.utils.CommonDate;
import com.rushang.utils.SendEmailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ForgetServiceImpl implements ForgetService {
    @Autowired
    ForgetMapper forgetMapper;

    public boolean getPwdByEmail(String email){
        String userPwd=null;
        try{
            userPwd=forgetMapper.selectPwdByEmail(email);
            int i=forgetMapper.insertForgetEmailLog(email, CommonDate.getTime24());
            if (i==1){
                //SendEmailUtil.sendQQmail(email,"青岛知税乎密码找回","尊敬的用户：您的密码为："+userPwd+"。");
                return true;
            }
        }catch (Exception e){
            e.printStackTrace();

        }
        return false;
    }

    public boolean getPwd(String email,String phone){
        try{
            String userPwd=forgetMapper.selectPwd(email,phone);
            int i=forgetMapper.insertForgetEmailLog(email, phone);
            if (i==1){
                SendEmailUtil.sendQQmail(email,"青岛知税乎密码找回","尊敬的用户：您的密码为："+userPwd+"。");
                return true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

}
