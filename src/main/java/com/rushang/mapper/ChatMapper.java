package com.rushang.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @Author: 小贤
 * @Date: 2019/7/3/ 0003 16:19
 * @Version 1.0
 */
@Mapper
public interface ChatMapper {
    public List<Map> selectUserGx(@Param("yhid")String yhid);
}
