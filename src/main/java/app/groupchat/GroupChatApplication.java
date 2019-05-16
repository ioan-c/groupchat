package app.groupchat;

import app.groupchat.db.User;
import app.groupchat.db.UserDAO;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
public class GroupChatApplication {

	public static void main(String[] args) {
		SpringApplication.run(GroupChatApplication.class, args);

	}
}
