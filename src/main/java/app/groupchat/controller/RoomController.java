package app.groupchat.controller;

import app.groupchat.db.Message;
import app.groupchat.db.Room;
import app.groupchat.db.repositories.IMessageRepository;
import app.groupchat.db.repositories.IRoomRepository;
import app.groupchat.service.IGroupChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

@Controller
public class RoomController {
    private IRoomRepository roomRepository;
    private IMessageRepository messageRepository;

    private final IGroupChatService groupChatService;

    @Autowired
    public RoomController(IRoomRepository roomRepository, IGroupChatService groupChatService,
                          IMessageRepository messageRepository) {
        this.roomRepository = roomRepository;
        this.groupChatService = groupChatService;
        this.messageRepository = messageRepository;
    }

    @RequestMapping(value = {"/rooms" }, method = RequestMethod.GET)
    public String getRooms(Model model,@RequestParam(defaultValue = "none") String id) {
        model.addAttribute("rooms", roomRepository.findAll());
        model.addAttribute("room", new Room());
        model.addAttribute("message", new Message());
        Room selectedRoom = null;
        if (id.equals("none")){
            List<Room> rooms = roomRepository.findAll();
            if (rooms != null && !rooms.isEmpty()){
                selectedRoom = roomRepository.findAll().get(0);
            }
        }else{
            selectedRoom = new Room();
            selectedRoom.setId(Long.valueOf(id));
        }
        if (selectedRoom != null){
            Example<Message> example = Example.of(Message.from(null,null,null,selectedRoom,null));
            List<Message> messageList = messageRepository.findAll(example);
            model.addAttribute("messages", messageList);
        }
        System.out.print("room id: "+id);
        return "rooms";
    }

    @RequestMapping(value = "/addRoom", method = RequestMethod.POST)
    public String addRoom(@ModelAttribute("room") Room room,
                          BindingResult result, ModelMap model) {
        groupChatService.insertRoom(room);
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
