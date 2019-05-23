package app.groupchat.db;

import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

@Repository
public class UserDAO implements IUserDAO{

    @PersistenceContext
    private EntityManager entityManager;

    public User findUser(String username){
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery query = criteriaBuilder.createQuery();
        Root<User> userRoot = query.from( User.class );
        Predicate usernameRestriction =
                criteriaBuilder.equal( userRoot.get( "username" ), username );
        query.select(userRoot);
        query.where( usernameRestriction );
        Query q = entityManager.createQuery(query);
        if (q.getResultList() == null || q.getResultList().isEmpty()) {
            return null;
        }else{
            return (User) q.getResultList().get(0);
        }

    }
}
