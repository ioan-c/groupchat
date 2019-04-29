package com.example.groupchat.controller;

import com.example.groupchat.db.UsersModel;
import com.example.groupchat.service.IUserService;
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
public class HomeUsersController {

    private final IUserService userService;
    @Autowired
    public HomeUsersController(IUserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = { "/", "/login"}, method = RequestMethod.GET)
    public ModelAndView  login(Model model) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @RequestMapping(value = {"/index"}, method = RequestMethod.GET)
    public ModelAndView  index(Model model) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping(value = {"/signUp" }, method = RequestMethod.GET)
    public String signUp(@ModelAttribute("user") UsersModel user, BindingResult result,
                         Model model) {
       // userService.saveUser(user);
        return "signUp";
    }

    @RequestMapping(value = {"/getUsers" }, method = RequestMethod.GET)
    public String getUsers(Model model) {
        model.addAttribute("users", userService.findAll());
        return "getUsers";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String submit(@ModelAttribute("user") UsersModel user,
                         BindingResult result, ModelMap model) {

       user.setPassword(userService.encodePassword(user.getPassword()));
       userService.saveUser(user);

       model.addAttribute("users", userService.findAll());

        return "getUsers";
    }

    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
    public String deleteUser(@ModelAttribute("user") UsersModel user,
                         BindingResult result, ModelMap model) {

        userService.deleteUser(user.getId());

        model.addAttribute("users", userService.findAll());

        return "getUsers";
    }

    @RequestMapping(value = {"/logout"}, method = RequestMethod.GET)
    public ModelAndView  logout(Model model) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }


}

