package app.groupchat.controller;

import app.groupchat.db.User;
import app.groupchat.repositories.IUserRepository;
import app.groupchat.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/groupchat")
public class UserRestController {
    private final IUserRepository userRepository;
    private final IUserService userService;

    @Autowired
    public UserRestController(IUserService userService, IUserRepository userRepository) {
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
    public boolean findUser(@RequestBody User user){
        System.out.println("username "+user.getUsername());

        return userService.loadUser(user.getUsername()) != null;
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