package com.example.groupchat.controller;

import com.example.groupchat.db.UsersModel;
import com.example.groupchat.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/groupchat")
public class UserController {


    private final IUserService userService;

    @Autowired
    public UserController(IUserService userService) {
        this.userService = userService;
    }

    /**
     * Get all users list.
     *
     * @return the list
     */
    @GetMapping("/users")
    public List<UsersModel> getAllUsers() {
        System.out.println("getallusers called " +  (List<UsersModel>) userService.findAll());

        return (List<UsersModel>) userService.findAll();
    }

//    @GetMapping("/users/{id_user}")
//    public ResponseEntity<UsersModel> getUsersById(@PathVariable(value = "id_user") Long userId) {
//        UsersModel user =
//                userRepository
//                        .findById(userId).isPresent() ? userRepository
//                        .findById(userId).get() :
//                new UsersModel();
//                       // .orElseThrow(() -> new ResourceNotFoundException("User not found on :: " + userId));
//        return ResponseEntity.ok().body(user);
//    }

    @PostMapping("/insertUser")
    public String createUser(@RequestBody UsersModel usersModel){
        UsersModel user = new UsersModel();
        user.setUsername(usersModel.getUsername());
        user.setPassword(usersModel.getPassword());
        System.out.println("user "+user.getId()+" "+usersModel.getId()+" "+user.getUsername());
        userService.saveUser(user);
        return "success";
    }
    /**
     * Update user response entity.
     *
     * @param userId the user id
     * @param userDetails the user details
     * @return the response entity
     * @throws ResourceNotFoundException the resource not found exception
     *//*
    @PutMapping("/users/{id}")
    public ResponseEntity<UsersModel> updateUser(
            @PathVariable(value = "id") Long userId, @Valid @RequestBody User userDetails)
            throws ResourceNotFoundException {
        User user =
                userRepository
                        .findById(userId)
                        .orElseThrow(() -> new ResourceNotFoundException("User not found on :: " + userId));
        user.setEmail(userDetails.getEmail());
        user.setLastName(userDetails.getLastName());
        user.setFirstName(userDetails.getFirstName());
        user.setUpdatedAt(new Date());
        final User updatedUser = userRepository.save(user);
        return ResponseEntity.ok(updatedUser);
    }
   *//* *//**//**
     * Delete user map.
     *
     * @param userId the user id
     * @return the map
     * @throws Exception the exception
     *//*
    @DeleteMapping("/user/{id}")
    public Map<String, Boolean> deleteUser(@PathVariable(value = "id") Long userId) throws Exception {
        UsersModel UsersModel =
                userRepository
                        .findById(userId)
                        .orElseThrow(() -> new ResourceNotFoundException("User not found on :: " + userId));
        userRepository.delete(user);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", Boolean.TRUE);
        return response;
    }*/
}