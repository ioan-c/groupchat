package app.groupchat.service;

import app.groupchat.db.IUserDAO;
import app.groupchat.db.User;
import app.groupchat.db.UserDAO;
import app.groupchat.repositories.IUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
//@EnableTransactionManagement
public class UserService implements IUserService {
    private IUserDAO userDao;

    @Autowired
    public UserService(IUserDAO userDAO){
        this.userDao = userDAO;
    }

    @Override
    public String encodePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(10); // Strength set as 10
        String encodedPassword = encoder.encode(password);

        return encodedPassword;
    }

    @Override
    public User loadUser(String username) {
       return userDao.findUser(username);
    }
}
