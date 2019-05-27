package app.groupchat.service;

import app.groupchat.db.Message;
import app.groupchat.db.Room;
import app.groupchat.db.User;

import java.util.List;

public interface IGroupChatService {
    String encodePassword(String password);
    User loadUser(User user);
    void insertUser(User user);
    void insertRoom(Room room);
    void insertMessage(Message message);
}
