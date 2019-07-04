package com.rushang.service.impl;

import com.rushang.mapper.RegisterMapper;
import com.rushang.service.UserRegisterService;
import com.rushang.utils.CommonDate;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserRegisterServiceImpl implements UserRegisterService {
    private static Logger logger= Logger.getLogger(UserRegisterServiceImpl.class);
    @Autowired
    RegisterMapper registerMapper;

    /**
     * 生成注册信息
     * @param nickname
     * @param sex
     * @param phone
     * @param email
     * @param password
     * @param date
     * @return
     */
    public boolean createRegisterInfo(String nickname, String sex, String phone, String email, String password,String date){
        boolean createState=false;
        int i=0;
        try{
            i=registerMapper.insertRegister(email,password,nickname,phone,sex, date);
            if(i==1){
                createState=true;
            }else {
                createState=false;
            }
            logger.info("createState:"+createState);
        }catch (Exception e){
            e.printStackTrace();
        }
        return createState;
    }

    /**
     * 判断号码是否被占用
     * @param phone
     * @return
     */

    public boolean isPhoneNull(String phone){
        boolean bool=false;
        try{
            String userPhone=registerMapper.selectTelByTel(phone);
            if(userPhone!=null){
                bool=false;
            }else{
                bool=true;
            }
        }catch (Exception e){

        }
        return bool;
    }

    /**
     * 判断邮箱是否被占用
     * @param email
     * @return
     */
    public boolean isEmailNull(String email){
        boolean bool=false;
        try{
            String userEmail = registerMapper.selectEmailByEmail(email);
            if(userEmail!=null){
                bool=false;
            }else{
                bool=true;
            }

        }catch (Exception e){

        }
        return bool;
    }

    public String getRegisterUserId(String nickname, String sex, String phone, String email, String password,String date){
        String userid= null;
        try{
            logger.info("开始查询主键");
            userid=registerMapper.selectRegisterKey(email,password,nickname,phone,sex,date);
            logger.info("Impl-userid:"+userid);
        }catch (Exception e){

        }
        return userid;
    }

    public boolean createUser(String userId,String nickname, String phone, String email, String password,String photo, String sex,String signInDate){
        boolean state=false;
        int i=0;
        try {
            i=registerMapper.insertNewUser(userId,nickname,phone,email,password,photo,sex,signInDate);
            if(i==1) {
                state=true;
            }else {
                state=false;
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return state;
    }


}
