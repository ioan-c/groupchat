package com.example.groupchat.repositories;

import com.example.groupchat.db.UsersModel;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

@Repository
public class UserRepository implements IUserRepository {

    @PersistenceContext
    private EntityManager entityManager;

    private static final AtomicLong counter = new AtomicLong();

    @Override
    public UsersModel saveUser(UsersModel user) {
        try {
         //   user.setId(counter.getAndIncrement());
          //  user.setId(12);
            entityManager.persist(user);
            entityManager.flush();
         //   entityManager.getTransaction().commit();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return user;
    }

    @Override
    public List<UsersModel> findAll() {
        String findAllQuery = "from UsersModel";
        List<UsersModel> result = new ArrayList<>();

        try {
            result = entityManager.createQuery(findAllQuery, UsersModel.class).getResultList();
        } catch (Exception exception) {
            exception.printStackTrace();
        }

        return result;
    }

}
