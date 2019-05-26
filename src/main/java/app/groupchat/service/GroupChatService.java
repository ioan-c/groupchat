package app.groupchat.service;

import app.groupchat.db.IGroupChatDAO;
import app.groupchat.db.Message;
import app.groupchat.db.Room;
import app.groupchat.db.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
//@EnableTransactionManagement
public class GroupChatService implements IGroupChatService {
    private IGroupChatDAO groupChatDAO;

    @Autowired
    public GroupChatService(IGroupChatDAO userDAO){
        this.groupChatDAO = userDAO;
    }

    @Override
    public String encodePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(10); // Strength set as 10
        String encodedPassword = encoder.encode(password);

        return encodedPassword;
    }

    @Override
    public User loadUser(User user) {
       return groupChatDAO.findUser(user);
    }

    @Override
    public void insertUser(User user){
        groupChatDAO.insertUser(user);
    }

    @Override
    public void insertRoom(Room room) {
        groupChatDAO.insertRoom(room);
    }

    @Override
    public void insertMessage(Message message) {
        groupChatDAO.insertMessage(message);
    }
}
