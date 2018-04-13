package vn.edu.uet.daoImpl;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.uet.dao.TeacherDAO;
import vn.edu.uet.model.Teacher;

@Repository
public class TeacherDAOmpl implements TeacherDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public boolean updateTeacher(Teacher teacher) {
		Session session = sessionFactory.getCurrentSession();
		try{
			session.update(teacher);
			return true;
		}
		catch(HibernateException e){
			e.printStackTrace();
			return true;
		}
	}

	@Override
	@Transactional
	public Teacher getTeacherByID(String userID) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Account WHERE userID = :userID");
		query.setParameter("userID", userID);
		try{
			return (Teacher) query.list().get(0);
		}
		catch(HibernateException e){
			return null;
		}
	}

	@Override
	@Transactional
	public Teacher getTeacherByEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Account WHERE email = :email");
		query.setParameter("email", email);
		try{
			return (Teacher) query.list().get(0);
		}
		catch(HibernateException e){
			return null;
		}
	}

}
