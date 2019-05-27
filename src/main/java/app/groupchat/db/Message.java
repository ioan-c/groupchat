package app.groupchat.db;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by Elena on 5/10/2019.
 */
@Entity
@Table(name = "messages")
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "message_ids")
    @SequenceGenerator(name="message_ids", sequenceName = "messages_seq")
    @Column(name = "id_message")
    private Long messageId;

    @Column(name = "content")
    private String content;

    @ManyToOne
    @JoinColumn(name = "id_user", referencedColumnName = "id_user")
    private User user;

    @ManyToOne
    @JoinColumn(name = "id_room", referencedColumnName = "id_room")
    private Room room;

    @Column(name = "date")
    private Timestamp date;

    public Long getMessageId() {
        return messageId;
    }

    public void setMessageId(Long messageId) {
        this.messageId = messageId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public static Message from(Long id, String content, User user, Room room, Timestamp date){
        Message message = new Message() ;
        message.setMessageId(id);
        message.setContent(content);
        message.setUser(user);
        message.setRoom(room);
        message.setDate(date);
        return message;
    }
}
