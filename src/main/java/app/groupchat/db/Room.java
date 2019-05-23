package app.groupchat.db;

import javax.persistence.*;

@Entity
@Table(name = "rooms")
//@EntityListeners(AuditingEntityListener.class)
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "room_ids")
    @SequenceGenerator(name="room_ids", sequenceName = "rooms_seq")
    @Column(name = "id_room")
    private Long id;
    @Column(name = "name", nullable = false)
    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}