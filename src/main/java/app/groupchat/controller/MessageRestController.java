package app.groupchat.controller;

import app.groupchat.db.Message;
import app.groupchat.db.repositories.IMessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/groupchat")
public class MessageRestController {
    private final IMessageRepository messageRepository;

    @Autowired
    public MessageRestController(IMessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    @GetMapping("/messages")
    public List<Message> getAllMessages() {

        return messageRepository.findAll();
    }

    @PostMapping("/insertMessage")
    public String createMessage(@RequestBody Message message){

        messageRepository.save(message);
        return "success";
    }

    @PutMapping("/updateMessage")
    public String updateMessage(@RequestBody Message message){
        messageRepository.save(message);
        return "success";
    }

    @DeleteMapping("/deleteMessage")
    public String deleteMessage(@RequestBody Long id){
        Message message = messageRepository.findById(id).get();
        messageRepository.delete(message);
        return "success";
    }
}