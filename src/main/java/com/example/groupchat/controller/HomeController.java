package com.example.groupchat.controller;

import com.example.groupchat.db.UsersModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

//    @RequestMapping("/")
//    public String index() {
//        return "Greetings from Spring Boot!";
//    }

    @RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
    public String index(Model model) {

        String message = "Welcome to GroupChat";

        model.addAttribute("message", message);

        return "index";
    }

    @RequestMapping(value = {"/signUp" }, method = RequestMethod.GET)
    public String signUp(Model model) {

        return "signUp";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String submit(@ModelAttribute("user") UsersModel user,
                         BindingResult result, ModelMap model) {

        model.addAttribute("username", user.getUsername());
        model.addAttribute("password", user.getPassword());
        model.addAttribute("email", user.getEmail());
        model.addAttribute("phone", user.getPhone());
        model.addAttribute("country", user.getCountry());
        model.addAttribute("city", user.getCity());

        System.out.println("data received: "+ user.getUsername()+ " "+user.getPassword());


        return "signUp";
    }


}

