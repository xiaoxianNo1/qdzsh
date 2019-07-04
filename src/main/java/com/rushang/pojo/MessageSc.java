package com.rushang.pojo;

import java.util.Date;

public class MessageSc {
    private String scid;
    private Date scsj;//收藏时间
    private String sczt;//收藏状态
    private String scyhid;//收藏用户id
    private String xxid;//消息id

    public String getScid() {
        return scid;
    }

    public void setScid(String scid) {
        this.scid = scid;
    }

    public Date getScsj() {
        return scsj;
    }

    public void setScsj(Date scsj) {
        this.scsj = scsj;
    }

    public String getSczt() {
        return sczt;
    }

    public void setSczt(String sczt) {
        this.sczt = sczt;
    }

    public String getScyhid() {
        return scyhid;
    }

    public void setScyhid(String scyhid) {
        this.scyhid = scyhid;
    }

    public String getXxid() {
        return xxid;
    }

    public void setXxid(String xxid) {
        this.xxid = xxid;
    }
}
