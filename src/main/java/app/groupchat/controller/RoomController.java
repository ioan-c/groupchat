package app.groupchat.controller;

import app.groupchat.config.security.util.SecurityUtils;
import app.groupchat.db.User;
import app.groupchat.repositories.IRoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RoomController {
    private IRoomRepository roomRepository;
/*
    @Autowired
    public UserController(IRoomRepository roomRepository) {
        this.roomRepository = roomRepository;
    }

    @RequestMapping(value = {"/index"}, method = RequestMethod.GET)
    public ModelAndView index(Model model) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping(value = {"/signUp" }, method = RequestMethod.GET)
    public String signUp(@ModelAttribute("user") User user, BindingResult result,
                         Model model) {
        return "signUp";
    }

    @RequestMapping(value = {"/getUsers" }, method = RequestMethod.GET)
    public String getUsers(Model model) {
        model.addAttribute("users", roomRepository.findAll());
        return "getUsers";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user,
                          BindingResult result, ModelMap model) {
        String returnString = "login";
        user.setPassword(userService.encodePassword(user.getPassword()));
        roomRepository.save(user);
        if(SecurityUtils.isAuthenticated()){
            model.addAttribute("users", roomRepository.findAll());
            returnString = "getUsers";
        }

        return returnString;
    }

    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
    public String deleteUser(@ModelAttribute("user") User user,
                             BindingResult result, ModelMap model) {

        roomRepository.delete(user);

        model.addAttribute("users", roomRepository.findAll());

        return "getUsers";
    }

    @RequestMapping(value = {"/logout"}, method = RequestMethod.GET)
    public ModelAndView logout(Model model) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @RequestMapping(value = "/editUser", method = RequestMethod.POST)
    public String editUser(@ModelAttribute("user") User user, ModelMap model) {
        User oldUser = roomRepository.findById(user.getId()).get();
        oldUser.setUsername(user.getUsername());
        oldUser.setCity(user.getCity());
        oldUser.setCountry(user.getCountry());
        oldUser.setPhone(user.getPhone());
        oldUser.setEmail(user.getEmail());
        roomRepository.save(oldUser);
        model.addAttribute("users", roomRepository.findAll());
        return "getUsers";
    }*/

}
