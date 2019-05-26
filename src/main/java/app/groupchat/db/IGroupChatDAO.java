package app.groupchat.db;

public interface IGroupChatDAO {

    User findUser(User user);
    void insertUser(User user);
    void insertRoom(Room room);
    void insertMessage(Message message);
}
