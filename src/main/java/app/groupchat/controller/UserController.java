package app.groupchat.controller;

import app.groupchat.config.security.util.SecurityUtils;
import app.groupchat.db.User;
import app.groupchat.repositories.IUserRepository;
import app.groupchat.service.IUserService;
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
public class UserController {

    private final IUserService userService;
    private IUserRepository userRepository;

    @Autowired
    public UserController(IUserService userService, IUserRepository userRepository) {
        this.userService = userService;
        this.userRepository = userRepository;
    }


    @RequestMapping(value = { "/", "/login"}, method = RequestMethod.GET)
    public ModelAndView login(Model model) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
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
       // userService.saveUser(user);
        return "signUp";
    }

    @RequestMapping(value = {"/getUsers" }, method = RequestMethod.GET)
    public String getUsers(Model model) {
        model.addAttribute("users", userRepository.findAll());
        return "getUsers";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user,
                          BindingResult result, ModelMap model) {
        String returnString = "login";
        user.setPassword(userService.encodePassword(user.getPassword()));
        userRepository.save(user);
        if(SecurityUtils.isAuthenticated()){
            model.addAttribute("users", userRepository.findAll());
            returnString = "getUsers";
        }

        return returnString;
    }

    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
    public String deleteUser(@ModelAttribute("user") User user,
                             BindingResult result, ModelMap model) {

        userRepository.delete(user);

        model.addAttribute("users", userRepository.findAll());

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
        User oldUser = userRepository.findById(user.getId()).get();
        oldUser.setUsername(user.getUsername());
        oldUser.setCity(user.getCity());
        oldUser.setCountry(user.getCountry());
        oldUser.setPhone(user.getPhone());
        oldUser.setEmail(user.getEmail());
        userRepository.save(oldUser);
        model.addAttribute("users", userRepository.findAll());
        return "getUsers";
    }

}

