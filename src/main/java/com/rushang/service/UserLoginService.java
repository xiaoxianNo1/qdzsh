package com.rushang.service;

import com.rushang.pojo.User;

public interface UserLoginService {
    User getUserByEmail(String email);
    User getUserByPhone(String phone);
    boolean isPassword(String userId,String password);
}
