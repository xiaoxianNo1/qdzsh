package com.rushang.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

@Mapper
public interface FileMapper {
    int insertMessageTp(@Param("tpid")String tpid,@Param("tpnr") InputStream tpnr, @Param("messageId")String messageId, @Param("tpmc")String tpmc);

    List<Map> selectTpByMessageId(@Param("messageid")String messageid);
}
