package com.rushang.service;

public interface ForgetService {
    public boolean getPwdByEmail(String email);
    public boolean getPwd(String email,String phone);
}
