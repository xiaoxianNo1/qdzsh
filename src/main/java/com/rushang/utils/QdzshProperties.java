package com.rushang.utils;

import java.util.Properties;
import java.util.ResourceBundle;

public class QdzshProperties {

    private String readProperties(String keyName){
        Properties properties=null;
        String value=null;
        try{
            properties=new Properties();
            ResourceBundle resourceBundle=ResourceBundle.getBundle("qdzsh");
            value=resourceBundle.getString(keyName);
        }catch (Exception e){
            e.printStackTrace();
        }
        return value;
    }
}
