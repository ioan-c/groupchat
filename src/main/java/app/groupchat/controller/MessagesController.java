package app.groupchat.controller;

import app.groupchat.config.security.util.SecurityUtils;
import app.groupchat.db.Message;
import app.groupchat.db.Room;
import app.groupchat.db.repositories.IMessageRepository;
import app.groupchat.db.repositories.IRoomRepository;
import app.groupchat.service.IGroupChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessagesController {
    private IMessageRepository messageRepository;
    private final IGroupChatService groupChatService;

    @Autowired
    public MessagesController(IMessageRepository messageRepository, IGroupChatService groupChatService) {
        this.messageRepository = messageRepository;
        this.groupChatService = groupChatService;
    }

    @RequestMapping(value = "/addMessage", method = RequestMethod.POST)
    public String addMessage(@ModelAttribute("message") Message message,
                          BindingResult result, ModelMap model) {
        System.out.println("message "+message.getContent()+ " , id "+message.getRoom().getId());
        groupChatService.insertMessage(message);
        model.addAttribute("message",message);
        return "redirect:/rooms?id="+message.getRoom().getId();
    }
}
