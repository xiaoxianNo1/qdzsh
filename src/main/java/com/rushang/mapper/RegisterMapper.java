package com.rushang.mapper;

import com.rushang.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface RegisterMapper {
    /**
     * 插入一条注册信息
     * @param userEmail
     * @param userPwd
     * @param userCoolName
     * @param userTel
     * @param userSex
     * @return
     */
    int insertRegister(@Param("userEmail") String userEmail,@Param("userPwd") String userPwd,@Param("userCoolName") String userCoolName,@Param("userTel") String userTel,@Param("userSex") String userSex,@Param("date") String date);

    /**
     * 查询注册用户id
     * @param userEmail
     * @param userPwd
     * @param userCoolName
     * @param userTel
     * @param userSex
     * @param date
     * @return
     */
    String selectRegisterKey(@Param("userEmail") String userEmail,@Param("userPwd") String userPwd,@Param("userCoolName") String userCoolName,@Param("userTel") String userTel,@Param("userSex") String userSex,@Param("date") String date);

    /**
     * 插入一个新用户
     * @param userId
     * @param userCoolName
     * @param userTel
     * @param userEmail
     * @param userPwd
     * @param userPhoto
     * @param userSex
     * @param //userHomeWeb
     * @param User_SignIndate
     * @return
     */
    int insertNewUser(@Param("userId") String userId,@Param("userCoolName") String userCoolName,@Param("userTel") String userTel,@Param("userEmail") String userEmail,@Param("userPwd") String userPwd,@Param("userPhoto") String userPhoto,@Param("userSex") String  userSex,/*@Param("userHomeWeb") String userHomeWeb,*/@Param("User_SignIndate") String User_SignIndate);

    /**
     * 根据手机号查询手机号
     * @param userTel
     * @return
     */
    String selectTelByTel(@Param("userTel")String userTel);

    /**
     * 根据邮箱查询邮箱
     * @param userEmail
     * @return
     */
    String selectEmailByEmail(@Param("userEmail")String userEmail);



}
