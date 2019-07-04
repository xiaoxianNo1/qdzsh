package com.rushang.utils.fastjson;

public enum RespCode {
	SUCCESS(0, "����ɹ�"),
    WARN(-1, "�����쳣�����Ժ�����");

    private int code;
    private String msg;

    RespCode(int code, String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }
    public String getMsg() {
        return msg;
    }
}
