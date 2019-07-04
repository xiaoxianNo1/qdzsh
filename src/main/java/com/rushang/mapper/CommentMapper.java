package com.rushang.mapper;

import com.rushang.pojo.MessagePl;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 评论Mapper
 */
@Mapper
public interface CommentMapper {
    List<Map> selectPlByXxid(@Param("xxid")String xxid, @Param("yhid")String yhid);

    int selectPlByXxidTotal(@Param("xxid")String xxid,@Param("yhid")String yhid);

    List<Map> selectPlByXxidPage(@Param("xxid")String xxid,@Param("yhid")String yhid,@Param("startTow")int startTow,@Param("total")int total,@Param("zxpx") String zxpx,@Param("zrpx")String zrpx);

    int insertComment(@Param("plnr")String plnr,@Param("plsj")String plsj,@Param("xxid")String xxid,@Param("yhid")String yhid);
}
