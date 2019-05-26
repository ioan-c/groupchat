package app.groupchat.db;

import app.groupchat.config.security.util.SecurityUtils;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.Date;

@Repository
public class GroupChatDAO implements IGroupChatDAO {

    @PersistenceContext
    private EntityManager entityManager;

    public User findUser(User user){
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery query = criteriaBuilder.createQuery();
        Root<User> userRoot = query.from( User.class );
        Predicate usernameRestriction =
                criteriaBuilder.equal( userRoot.get( "username" ), user.getUsername() );
        query.select(userRoot);
        query.where( usernameRestriction );
        Query q = entityManager.createQuery(query);
        if (q.getResultList() == null || q.getResultList().isEmpty()) {
            return null;
        }else{
            return (User) q.getResultList().get(0);
        }

    }

    @Transactional
    public void insertUser(User user) {
        Query query = entityManager.createNativeQuery(GroupChatQuery.INSERT_USER);
        query.setParameter("password", user.getPassword());
        query.setParameter("username", user.getUsername());
        query.setParameter("email", user.getEmail());
        query.setParameter("phone", user.getPhone());
        query.setParameter("country", user.getCountry());
        query.setParameter("city", user.getCity());
        query.executeUpdate();
    }

    @Transactional
    public void insertRoom(Room room) {
        Query query = entityManager.createNativeQuery(GroupChatQuery.INSERT_ROOM);
        query.setParameter("name", room.getName());
        query.executeUpdate();
    }

    @Transactional
    public void insertMessage(Message message) {
        long time = new Date().getTime();
        message.setDate(new Timestamp(time));
        User currentUser = new User();
        currentUser.setUsername(SecurityUtils.getAuthenticatedUsername());
        message.setUser(findUser(currentUser));
        Query query = entityManager.createNativeQuery(GroupChatQuery.INSERT_MESSAGE);
        query.setParameter("content", message.getContent());
        query.setParameter("id_user", message.getUser().getId());
        query.setParameter("date", message.getDate());
        query.setParameter("id_room", message.getRoom().getId());
        query.executeUpdate();
    }
}
