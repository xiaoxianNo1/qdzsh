package com.rushang.mapper;

import com.rushang.pojo.MessageSc;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 收藏mapper
 */
@Mapper
public interface CollectionMapper {
    /**
     * 根据用户id 查询收藏列表
     * @param userId
     * @return
     */
    List<MessageSc> selectUserCollection(@Param("userId")String userId);

    /**
     * 根据用户id 查询用户收藏数量
     * @param userId
     * @return
     */
    int selectUserCollectionTotal(@Param("userId")String userId);

    /**
     * 分页查询
     * @param startTow
     * @return
     */
    List<Map> selectUserCollectionByPage(@Param("yhid")String yhid,@Param("xxid")String xxid,@Param("startTow")int startTow);

    /**
     * 插入用户收藏
     * @param date
     * @param sczt
     * @param userid
     * @param xxid
     * @return
     */
    int insertUserCollection(@Param("scsj")String date,@Param("sczt")String sczt,@Param("userid")String userid,@Param("xxid")String xxid);

    /**
     * 更新用户收藏状态
     * @param sczt
     * @param scid
     * @return
     */
    int updateUserCollection(@Param("sczt")String sczt,@Param("scid")String scid);

}
