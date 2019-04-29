package com.example.groupchat.service;

import com.example.groupchat.db.UsersModel;
import java.util.List;

public interface IUserService {

    UsersModel saveUser(UsersModel user);
    List<UsersModel> findAll();
    void deleteUser(Long id);
    String encodePassword(String password);

}
