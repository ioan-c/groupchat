package com.example.groupchat.service;

import com.example.groupchat.db.UsersModel;
import com.example.groupchat.repositories.IUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@EnableTransactionManagement
public class UserService implements IUserService{

    private final IUserRepository userRepository;

    @Autowired
    public UserService(IUserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    @Transactional(value = "transactionManager")
    public UsersModel saveUser(UsersModel user) {
       return userRepository.saveUser(user);
    }

    @Override
    public List<UsersModel> findAll() {
        return userRepository.findAll();
    }
}
