package vn.edu.uet.service;

import java.util.List;

import vn.edu.uet.model.Account;

public interface AccountService {

	boolean addAccount(Account account);
	boolean updateAccount(Account account);
	/** 
	 * Active a new account
	 * @param activeKey : the unique random key of account
	 * @return		-1: if error <br>
	 * 				 0: if đã active <br>
	 * 				 1: if thành công
	 */
	int confirmAccount(String activeKey);
	List<Account> getListAccounts();
	Account getAccountByID(String accountID);
	Account getAccountByActiveKey(String activeKey);
	boolean blockAccount(String accountID);
	boolean activeAccount(String accountID);
	boolean checkExistUser(String userName);
	boolean checkExistEmail(String email);
	Account getAccountByEmail(String email);
	
	boolean checkTeacher(Account account);
	boolean checkAdmin(Account account);
	
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
