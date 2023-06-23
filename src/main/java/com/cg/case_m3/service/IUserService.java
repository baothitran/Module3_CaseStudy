package com.cg.case_m3.service;

import com.cg.case_m3.model.User;

public interface IUserService {
    void create(User user);
    User checkUser(String userEmail, String password);
    boolean checkExistUser(String signUpEmail);
}