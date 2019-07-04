package com.rushang.mapper;

import com.rushang.pojo.Messages;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface MessageMapper {
    /**
     * 根据用户id 查询信息
     * @param xxlx 1为提问 2为知识
     * @param UserId
     * @return
     */
    List<Map> selectMessageByUserId(@Param("xxlx")String xxlx,@Param("UserId")String UserId,@Param("ztcs")String ztcs,@Param("fbsj")String fbsj);

    /**
     * 获取指定用户信息数量
     * @param xxlx 1为提问 2为知识
     * @param UserId
     * @return
     */
    int selectMessageTotal(@Param("xxlx")String xxlx,@Param("UserId")String UserId);

    /**
     * 分页查询指定用户信息
     * @param xxlx
     * @param UserId
     * @param startTow 第几页
     * @param total 查询行数
     * @return
     */
    List<Map> selectMessageByPage(@Param("xxfl")String xxfl,@Param("xxlx")String xxlx,@Param("UserId")String UserId,@Param("ztcs")String ztcs,@Param("fbsj")String fbsj,@Param("startTow")int startTow,@Param("total")int total);

    /**
     * 插入一条信息
     * @param xxlx
     * @param xxbt
     * @param xxnr
     * @param fbsj
     * @param sccs
     * @param plcs
     * @param zfcs
     * @param ztcs
     * @param ydcs
     * @param xxfl
     * @param xxtpsl
     * @param fbyhid
     * @return
     */
    int insertMessage(@Param("xxid")String xxid,@Param("xxlx") String xxlx,@Param("xxbt")String xxbt,@Param("xxnr")String xxnr,@Param("fbsj")String fbsj,
                      @Param("sccs") int sccs,@Param("plcs") int plcs,@Param("zfcs") int zfcs,@Param("ztcs") int ztcs,@Param("ydcs") int ydcs,
                      @Param("xxfl") String xxfl,@Param("xxtpsl") int xxtpsl,@Param("fbyhid")String fbyhid);


    /**
     * 修改一条消息
     * @param xxid
     * @param sccs
     * @param plcs
     * @param zfcs
     * @param ztcs
     * @param ydcs
     * @return
     */
    int updateMessageById(@Param("xxid")String xxid,@Param("sccs") int sccs,@Param("plcs") int plcs,@Param("zfcs") int zfcs,@Param("ztcs") int ztcs,@Param("ydcs") int ydcs);

    /**
     * 根据消息id 查询详细信息
     * @param xxid
     * @return
     */
    Map<String,String> selectMessageDetailsByXxid(@Param("xxid")String xxid);

    /**
     * 查询一级分类
     * @return
     */
   List<Map> selectOneClass();

    /**
     * 查询二级分类
     * @param oneId
     * @return
     */
   List<Map> selectTowClass(@Param("firstid")String oneId);

    /**
     * 更新阅读次数
     * @param xxid
     * @param ydcs
     * @return
     */
   int updateYdcs(@Param("xxid")String xxid,@Param("ydcs")int ydcs);

    /**
     * 更新点赞次数
     * @param xxid
     * @param ztcs
     * @return
     */
   int updateDzcs(@Param("xxid")String xxid,@Param("ztcs")int ztcs);

    /**
     * 更新收藏次数
     * @param xxid
     * @param sccs
     * @return
     */
   int updateSccs(@Param("xxid")String xxid,@Param("sccs")int sccs);

   List<Map> selectMsgSc(@Param("scyhid")String scyhid,@Param("startTow")int startTow,@Param("total")int total);

   List<Map> selectMessageBySearch(@Param("xxnr")String xxnr,@Param("xxlx")String xxlx,@Param("startTow")int startTow,@Param("total")int total);


}
