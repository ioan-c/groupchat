package app.groupchat.service;

import app.groupchat.db.User;

public interface IUserService {
    String encodePassword(String password);
    User loadUser(User user);
}
