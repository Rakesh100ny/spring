package com.bridgelabz.rest.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bridgelabz.rest.model.User;



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
	public User isCheckPassword(String email) {

		Session session=sessionFactory.getCurrentSession();
		@SuppressWarnings("deprecation")
		Criteria criteria = session.createCriteria(User.class).add(Restrictions.eq("email",email));

		User user = (User) criteria.uniqueResult();
		System.out.println("userPass : "+user.getPassword());
			
		return user;
	}


	@Override
	public User getUserDetails(String email) {
	Session session=sessionFactory.getCurrentSession();
	@SuppressWarnings("deprecation")
	Criteria criteria = session.createCriteria(User.class)
			           .add(Restrictions.eq("email", email));

	User user = (User) criteria.uniqueResult();

    return user;	
	
	}


	@Override
	public long isUserExist(String email) {
		Session session=sessionFactory.getCurrentSession();
		@SuppressWarnings("deprecation")
		Criteria criteria = session.createCriteria(User.class).add(Restrictions.eq("email", email))
				.setProjection(Projections.count("email"));
		
		long count = (long) criteria.uniqueResult();
		
	  return count;
			   
	}


	@Override
	public User getUserById(int id) {
		Session session=sessionFactory.getCurrentSession();
		@SuppressWarnings("deprecation")
		Criteria criteria = session.createCriteria(User.class).add(Restrictions.eq("id", id));
		
		User user=(User) criteria.uniqueResult();
		return user;
	}


	@Override
	public void updateUser(User user)
	{
     Session session=sessionFactory.getCurrentSession();
     session.update(user);
     System.out.println("User successfully Updated...!");
	}
	
	
	

}