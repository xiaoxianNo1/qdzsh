package com.rushang.utils.fastjson;

import java.util.Map;

/**
 *
 */
public class Result {
	private String status;
	private Integer yywszmsl;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getYywszmsl() {
		return yywszmsl;
	}
	public void setYywszmsl(Integer yywszmsl) {
		this.yywszmsl = yywszmsl;
	}
	
	public Result(String status,Integer yywszmsl){
		this.status=status;
		this.yywszmsl=yywszmsl;
	}
	
	
	private Integer code;
    private Boolean isSuccess;
    private String message;
    private String requestAddress;
    private Object result;




    public Result(RespCode success, Map map){
        super();
    }


    public Result(Boolean success, Integer code, String message){
        super();
        this.isSuccess=success;
        this.code=code;
        this.message=message;
    }


    public Result(Boolean success, Integer code, Object result){
        super();
        this.isSuccess=success;
        this.code=code;
        this.result=result;
    }


    public Result(Boolean success, Integer code, String message, Object result){
        super();
        this.isSuccess=success;
        this.code=code;
        this.message=message;
        this.result=result;
    }


    public Result(Boolean success, Integer code, String message, String requestAddress,Object result){
        super();
        this.isSuccess=success;
        this.code=code;
        this.message=message;
        this.requestAddress=requestAddress;
        this.result=result;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public Boolean getIsSuccess() {
        return isSuccess;
    }

    public void setIsSuccess(Boolean isSuccess) {
        this.isSuccess = isSuccess;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }

    public String getRequestAddress() {
        return requestAddress;
    }

    public void setRequestAddress(String requestAddress) {
        this.requestAddress = requestAddress;
    }

}
