package vn.edu.uet.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hsqldb.store.ReusableObjectCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.uet.dao.AccountDAO;
import vn.edu.uet.model.Account;
import vn.edu.uet.model.Role;
import vn.edu.uet.util.ConstantValues;

@Repository
public class AccountDAOImpl implements AccountDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	@Transactional
	public boolean addAccount(Account account) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(account);
			return true;
		} catch (HibernateException e) {
			return false;
		} catch (Exception e) {
			return false;
		}

	}

	@Override
	@Transactional
	public boolean updateAccount(Account account) {
		System.err.println("updateAccount");
		Session session = sessionFactory.getCurrentSession();
		
		session.update(account);
		//session.merge(account);
		session.flush();
		return true;
		/*try {
			
			
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			return false;
		}*/
	}

	@Override
	@Transactional
	public Account getAccountByActiveKey(String activeKey) {
		Account result = null;
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session
					.createQuery("FROM Account WHERE activeKey = :activeKey");
			query.setString("activeKey", activeKey);
			result = (Account) query.list().get(0);
			return result;
		} catch (Exception e) {
			return result;
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Account> getListAccounts() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Account");
		return query.list();
	}

	@Override
	@Transactional
	public Account getAccountByID(String accountID) {
		Account result = null;
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("FROM Account WHERE userID = :accountID ");
			query.setString("accountID", accountID);
			result = (Account) query.list().get(0);
			return result;
		} catch (Exception e) {
			return result;
		}
	}

	@Override
	@Transactional
	public boolean checkExistUsername(String userName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("FROM Account WHERE userName = :userName");
		query.setString("userName", userName);
		int num = query.list().size();
		if(num==0){
			return false;
		}
		else{
			return true;
		}
	}

	@Override
	@Transactional
	public boolean checkExistEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("FROM Account WHERE email = :email");
		query.setString("email", email);
		int num = query.list().size();
		if(num==0){
			return false;
		}
		else{
			return true;
		}
	}


	@Override
	@Transactional
	public Account getAccountbyEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("FROM Account WHERE email = :email");
		query.setString("email", email);
		//int num = query.list().size();
		try{
			return (Account) query.list().get(0);
		}
		catch(Exception e){
			return null;
		}
	}

	@Override
	@Transactional
	public List<Account> getAccountPaging(int numPage) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Account");
		query.setFirstResult((numPage-1)*ConstantValues.NUMBER_ROW_10);
		query.setMaxResults(ConstantValues.NUMBER_ROW_10);
		try{
			return query.list();
		}
		catch(Exception e){
			return new ArrayList<Account>();
		}
	}

	@Override
	@Transactional
	public List<Account> getAccountActivePaging(int numPage) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Account WHERE status = :status");
		query.setParameter("status", 1);
		query.setFirstResult((numPage-1)*ConstantValues.NUMBER_ROW_10);
		query.setMaxResults(ConstantValues.NUMBER_ROW_10);
		try{
			return query.list();
		}
		catch(Exception e){
			return new ArrayList<Account>();
		}
	}

	@Override
	@Transactional
	public List<Account> getAccountBlockedPaging(int numPage) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Account WHERE status = :status");
		query.setParameter("status", 0);
		query.setFirstResult((numPage-1)*ConstantValues.NUMBER_ROW_10);
		query.setMaxResults(ConstantValues.NUMBER_ROW_10);
		try{
			return query.list();
		}
		catch(Exception e){
			return new ArrayList<Account>();
		}
	}

	@Override
	@Transactional
	public List<Account> getAccountInactivePaging(int numPage) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Account WHERE status = :status");
		query.setParameter("status", -1);
		query.setFirstResult((numPage-1)*ConstantValues.NUMBER_ROW_10);
		query.setMaxResults(ConstantValues.NUMBER_ROW_10);
		try{
			return query.list();
		}
		catch(Exception e){
			return new ArrayList<Account>();
		}
	}

	@Override
	@Transactional
	public List<Account> getAccountMemberPaging(int numPage) {
		List<Account> list = getListAccounts();
		List<Account> result=new ArrayList<Account>();
		for(Account account:list){
			for(Role role:account.getRoles()){
				if(role.getRoleID().equals("ROLE1")){
					result.add(account);
				}
			}
		}
		try{
			int max = result.size();
			int from = (numPage-1)*ConstantValues.NUMBER_ROW_10;
			int to = (numPage-1)*ConstantValues.NUMBER_ROW_10 + ConstantValues.NUMBER_ROW_10;
			if(to>max)
				to=max;
			result = result.subList(from, to);
		}
		catch(Exception e){
			
		}
		return result;
	}

	@Override
	@Transactional
	public List<Account> getAccountTeacherPaging(int numPage) {
		
		List<Account> list = getListAccounts();
		List<Account> result=new ArrayList<Account>();
		for(Account account:list){
			for(Role role:account.getRoles()){
				if(role.getRoleID().equals("ROLE2")){
					result.add(account);
				}
			}
		}
		try{
			int max = result.size();
			int from = (numPage-1)*ConstantValues.NUMBER_ROW_10;
			int to = (numPage-1)*ConstantValues.NUMBER_ROW_10 + ConstantValues.NUMBER_ROW_10;
			if(to>max)
				to=max;
			result = result.subList(from, to);
		}
		catch(Exception e){
			
		}
		
		return result;
	}
	
	@Override
	@Transactional
	public List<Account> getAccountAdminPaging(int numPage) {
		List<Account> list = getListAccounts();
		List<Account> result=new ArrayList<Account>();
		for(Account account:list){
			for(Role role:account.getRoles()){
				if(role.getRoleID().equals("ROLE3")){
					result.add(account);
				}
			}
		}
		try{
			int max = result.size();
			int from = (numPage-1)*ConstantValues.NUMBER_ROW_10;
			int to = (numPage-1)*ConstantValues.NUMBER_ROW_10 + ConstantValues.NUMBER_ROW_10;
			if(to>max)
				to=max;
			result = result.subList(from, to);
		}
		catch(Exception e){
			
		}
		return result;
	}

	@Override
	@Transactional
	public long getNumberAccount() {
		return getListAccounts().size();
	}

	@Override
	@Transactional
	public long getNumberAccountActive() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Account WHERE status = :status");
		query.setParameter("status", 1);
		
		try{
			return query.list().size();
		}
		catch(Exception e){
			return 0;
		}
	}

	@Override
	@Transactional
	public long getNumberAccountBlocked() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Account WHERE status = :status");
		query.setParameter("status", 0);
		
		try{
			return query.list().size();
		}
		catch(Exception e){
			return 0;
		}
	}

	@Override
	@Transactional
	public long getNumberAccountInactive() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Account WHERE status = :status");
		query.setParameter("status", -1);
		
		try{
			return query.list().size();
		}
		catch(Exception e){
			return 0;
		}
	}

	@Override
	@Transactional
	public long getNumberAccountAdmin() {
		List<Account> list = getListAccounts();
		List<Account> result=new ArrayList<Account>();
		for(Account account:list){
			for(Role role:account.getRoles()){
				if(role.getRoleID().equals("ROLE3")){
					result.add(account);
				}
			}
		}
		
		return result.size();
	}

	@Override
	@Transactional
	public long getNumberAccountMember() {
		List<Account> list = getListAccounts();
		List<Account> result=new ArrayList<Account>();
		for(Account account:list){
			for(Role role:account.getRoles()){
				if(role.getRoleID().equals("ROLE1")){
					result.add(account);
				}
			}
		}
		
		return result.size();
	}

	@Override
	@Transactional
	public long getNumberAccountTeacher() {
		List<Account> list = getListAccounts();
		List<Account> result=new ArrayList<Account>();
		for(Account account:list){
			for(Role role:account.getRoles()){
				if(role.getRoleID().equals("ROLE2")){
					result.add(account);
				}
			}
		}
		
		return result.size();
	}

	@Override
	@Transactional
	public List<Account> searchAccountByUserName(String key) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Account WHERE userName LIKE :key");
		query.setParameter("key", "%"+key+"%");
		
		try{
			return query.list();
		}
		catch(Exception e){
			return new ArrayList<Account>();
		}
	}

	@Override
	@Transactional
	public List<Account> searchAccountByEmail(String key) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Account WHERE email LIKE :key");
		query.setParameter("key", "%"+key+"%");
		
		try{
			return query.list();
		}
		catch(Exception e){
			return new ArrayList<Account>();
		}
	}

}
