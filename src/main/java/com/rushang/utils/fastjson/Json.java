package com.rushang.utils.fastjson;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.io.PrintWriter;

public class Json {
	public static String toJson(Result result, HttpServletResponse response) throws Exception{
        response.setContentType("application/json;charset=GBK");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("GBK");

        PrintWriter writer = response.getWriter();
        String json = JSONObject.toJSONString(result,
                SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullNumberAsZero,
                SerializerFeature.WriteNullListAsEmpty,
                SerializerFeature.WriteNullStringAsEmpty,
                SerializerFeature.WriteNullBooleanAsFalse,
                SerializerFeature.DisableCircularReferenceDetect);
        writer.write(json);
        writer.close();

        return json;
    }
}
