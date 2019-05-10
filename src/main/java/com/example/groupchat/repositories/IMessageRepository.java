package com.example.groupchat.repositories;

import com.example.groupchat.db.Message;
import com.example.groupchat.db.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IMessageRepository extends JpaRepository<Message, Long> {
}
