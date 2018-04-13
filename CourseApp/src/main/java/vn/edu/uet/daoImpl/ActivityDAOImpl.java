package vn.edu.uet.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.uet.dao.ActivityDAO;
import vn.edu.uet.model.Activity;
import vn.edu.uet.util.ConstantValues;

@Repository
public class ActivityDAOImpl implements ActivityDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public String addActivity(Activity activity) {
		Session session = sessionFactory.getCurrentSession();
		try{
			session.save(activity);
			return activity.getActivityID();
		}
		catch(Exception e){
			return "";
		}
	}

	@Override
	@Transactional
	public List<Activity> getActivityByUser(String userID, int numPage) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Activity WHERE account.userID = :userID ORDER BY createDate DESC");
		query.setParameter("userID", userID);
		query.setFirstResult((numPage-1)*ConstantValues.NUMBER_ROW_10);
		query.setMaxResults(ConstantValues.NUMBER_ROW_10);
		try{
			return query.list();
		}
		catch(Exception e){
			return new ArrayList<Activity>();
		}
	}

	@Override
	@Transactional
	public long getNumberActivityByUser(String userID) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Activity WHERE account.userID = :userID");
		query.setParameter("userID", userID);
		try{
			return query.list().size();
		}
		catch(Exception e){
			return 0;
		}
	}

}
