package vn.edu.uet.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.uet.dao.RoleDAO;
import vn.edu.uet.model.Role;

@Repository
public class RoleDAOImpl implements RoleDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Role> getRoles() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Role");
		return query.list();
	}

	@Override
	@Transactional
	public Role getRoleByID(String roleID) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Role WHERE roleID = :roleID");
		query.setParameter("roleID", roleID);
		try{
			return (Role) query.list().get(0);
		}
		catch(Exception e){
			return null;
		}
	}

}
