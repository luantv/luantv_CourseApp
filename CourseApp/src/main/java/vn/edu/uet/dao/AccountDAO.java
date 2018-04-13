package vn.edu.uet.dao;

import java.util.List;

import vn.edu.uet.model.Account;

public interface AccountDAO {
	
	boolean addAccount(Account account);
	boolean updateAccount(Account account);
	Account getAccountByActiveKey(String activeKey);
	List<Account> getListAccounts();
	Account getAccountByID(String accountID);
	boolean checkExistUsername(String userName);
	boolean checkExistEmail(String email);
	Account getAccountbyEmail(String email);
	List<Account> getAccountPaging(int numPage);
	List<Account> getAccountActivePaging(int numPage);
	List<Account> getAccountBlockedPaging(int numPage);
	List<Account> getAccountInactivePaging(int numPage);
	List<Account> getAccountMemberPaging(int numPage);
	List<Account> getAccountTeacherPaging(int numPage);
	List<Account> getAccountAdminPaging(int numPage);
	
	long getNumberAccount();
	long getNumberAccountActive();
	long getNumberAccountBlocked();
	long getNumberAccountInactive();
	long getNumberAccountAdmin();
	long getNumberAccountMember();
	long getNumberAccountTeacher();
	
	List<Account> searchAccountByUserName(String key);
	List<Account> searchAccountByEmail(String key);
	
	
}
