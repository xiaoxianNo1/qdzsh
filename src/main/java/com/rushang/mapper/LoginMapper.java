package com.rushang.mapper;

import com.rushang.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface LoginMapper {
    /**
     * 根据用户手机号查询密码
     * @param userTel
     * @return
     */
    User selectPwdByTel(@Param("userTel")String userTel);

    /**
     * 根据用户邮箱查询密码
     * @param userEmail
     * @return
     */
    User selectPwdByEmail(@Param("userEmail")String userEmail);
}
