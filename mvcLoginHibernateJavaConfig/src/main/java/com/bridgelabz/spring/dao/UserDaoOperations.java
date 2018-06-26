package com.bridgelabz.spring.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bridgelabz.spring.model.User;


@Repository
public class UserDaoOperations implements UserDao {
  

	@Autowired
	private SessionFactory sessionFactory;
	
 
	@Override
	public void insert(User user) 
	{
	 Session session=sessionFactory.getCurrentSession();
	 session.save(user);
	 System.out.println("Registration is successfully done...!");
	}

	@Override
	public boolean getUserEmailId(String email) 
	{
		System.out.println("ranu1");
		Session session=sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(User.class).add(Restrictions.eq("email", email))
				.setProjection(Projections.count("email"));
		System.out.println("ranu2");
		List<Long> count = (List<Long>) criteria.list();

		System.out.println("ranu3");
		for (Long value : count) {
			if(value>=1)
			 {
              return true;
			 }
			 else
			 {
			  return false;	 
			 }
		}

		return false;
	}

	@Override
	public boolean getUserPassword(String password, String email) {

		Session session=sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(User.class).add(Restrictions.eq("email",email))
				.add(Restrictions.eq("password", password));

		List<User> users = (List<User>) criteria.list();

		if (!users.isEmpty()) {
			for (User user1 : users) {
				if (user1.getEmail().equals(email) && user1.getPassword().equals(password)) {
					return true;
				}
			}
		} else {
			return false;
		}

		return false;
	}

	@Override
	public List<User> getUserDetails(String email) {
	Session session=sessionFactory.getCurrentSession();
	Criteria criteria = session.createCriteria(User.class)
			           .add(Restrictions.eq("email", email));

	List<User> users = (List<User>) criteria.list();

    return users;	
	
	}
	
	
	

}