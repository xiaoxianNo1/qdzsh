package com.rushang.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ForgetMapper {

    public String selectPwdByEmail(@Param("email") String email);

    public int insertForgetEmailLog(@Param("email")String email,@Param("user_phone")String user_phone);

    public String selectPwdByPhone(@Param("phone") String phone);

    public String selectPwd(@Param("email") String email,@Param("phone") String phone);


}
