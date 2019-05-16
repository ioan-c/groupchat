package app.groupchat.db;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

@Repository
public class UserDAO implements IUserDAO{

    @PersistenceContext
    private EntityManager entityManager;

    public User findUser(String username){

        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

        CriteriaQuery criteriaQuery = criteriaBuilder.createQuery();
        Root user = criteriaQuery.from(User.class);
        criteriaQuery.where(criteriaBuilder.equal(user.get("username"), username));//greaterThan(employee.get("salary"), 100000));
        Query query = entityManager.createQuery(criteriaQuery);
        User result = (User) query.getSingleResult();

        return result;
    }
}
