package com.rushang.mapper;

import org.apache.ibatis.annotations.Param;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

public interface UserMapper {
    public Map getUserById(@Param("userId") String userId);

    public int updateUserSignInDate(String userId);

    public int insertFollowUser(@Param("gxlx")String gxlx,@Param("gxzm")String gxzm,@Param("yhid")String yhid,@Param("bgzyhid")String bgzyhid);

    public int updateUserInfo(@Param("User_CoolName")String User_CoolName, @Param("User_Tel")String User_Tel, @Param("User_Email")String User_Email, @Param("User_Pwd")String User_Pwd, @Param("User_Photo")InputStream User_Photo, @Param("User_SignInDate")String User_SignInDate, @Param("User_ID")String User_ID);

    public List<Map> selectUserFollow(@Param("yhid")String yhid,@Param("bgzyhid")String bgzyhid);

    public int updateUserFollow(@Param("gxlx")String gxlx,@Param("gxzm")String gxzm,@Param("yhgxid")int yhgxid);

}
