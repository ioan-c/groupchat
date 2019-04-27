package com.example.groupchat.repositories;


import com.example.groupchat.db.UsersModel;

import java.util.List;

public interface IUserRepository {

    UsersModel saveUser(UsersModel user);
    List<UsersModel> findAll();
    void deleteUser(Long id);

}
