package app.groupchat.controller;

import app.groupchat.config.security.util.SecurityUtils;
import app.groupchat.db.Room;
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

    @Autowired
    public RoomController(IRoomRepository roomRepository) {
        this.roomRepository = roomRepository;
    }

    @RequestMapping(value = {"/rooms" }, method = RequestMethod.GET)
    public String getRooms(Model model) {
        model.addAttribute("rooms", roomRepository.findAll());
        model.addAttribute("room", new Room());
        return "rooms";
    }

    @RequestMapping(value = "/addRoom", method = RequestMethod.POST)
    public String addRoom(@ModelAttribute("room") Room room,
                          BindingResult result, ModelMap model) {
        String returnString = "room";
        roomRepository.save(room);
        model.addAttribute("room",room);
        return "redirect:/rooms";
    }
/*
    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
    public String deleteUser(@ModelAttribute("user") User user,
                             BindingResult result, ModelMap model) {

        roomRepository.delete(user);

        model.addAttribute("users", roomRepository.findAll());

        return "getUsers";
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