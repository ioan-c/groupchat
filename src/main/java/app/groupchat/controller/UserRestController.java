package app.groupchat.controller;

import app.groupchat.db.User;
import app.groupchat.db.repositories.IUserRepository;
import app.groupchat.service.IGroupChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/groupchat")
public class UserRestController {
    private final IUserRepository userRepository;
    private final IGroupChatService userService;

    @Autowired
    public UserRestController(IGroupChatService userService, IUserRepository userRepository) {
        this.userService = userService;
        this.userRepository = userRepository;
    }

    /**
     * Get all users list.
     *
     * @return the list
     */
    @GetMapping("/users")
    public List<User> getAllUsers() {
        System.out.println("getallusers called " +  (List<User>) userRepository.findAll());

        return userRepository.findAll();
    }

    @GetMapping("/findUser")
    public User findUser(@RequestBody User user){
        System.out.println("username "+user.getUsername());
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(10);
        User dbUser =  userService.loadUser(user);
        if (encoder.matches(user.getPassword(), dbUser.getPassword())){
            return dbUser;
        }else{
            return new User();
        }
    }

    @PostMapping("/insertUser")
    public String createUser(@RequestBody User user){

        userRepository.save(user);
        return "success";
    }

    @PutMapping("/updateUser")
    public String updateUser(@RequestBody User user){
        userRepository.save(user);
        return "success";
    }

    @DeleteMapping("/deleteUser")
    public String deleteUser(@RequestBody Long id){
        User user = userRepository.findById(id).get();
        userRepository.delete(user);
        return "success";
    }

}