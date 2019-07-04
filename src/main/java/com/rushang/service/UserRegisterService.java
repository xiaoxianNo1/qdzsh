package com.rushang.service;

public interface UserRegisterService {
    /**
     * 生成一条注册信息
     * @param nickname
     * @param sex
     * @param phone
     * @param email
     * @param password
     * @return
     */
    public boolean createRegisterInfo(String nickname, String sex, String phone, String email, String password,String date);

    public boolean isPhoneNull(String phone);

    public boolean isEmailNull(String email);

    public String getRegisterUserId(String nickname, String sex, String phone, String email, String password,String date);

    public boolean createUser(String userId,String nickname, String phone, String email, String password,String photo, String sex,String signInDate);
}
