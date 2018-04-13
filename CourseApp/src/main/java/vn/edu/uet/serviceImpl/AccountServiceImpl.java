package vn.edu.uet.serviceImpl;

import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.edu.uet.dao.AccountDAO;
import vn.edu.uet.model.Account;
import vn.edu.uet.model.Role;
import vn.edu.uet.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountDAO accountDAO;

	@Override
	public boolean addAccount(Account account) {
		// int num = accountDAO.getListAccounts().size();
		/*String userID = UUID.randomUUID().toString();
		account.setUserID(userID);*/
		account.setStatus(-1);
		//String passwd = new UU
		return accountDAO.addAccount(account);
	}

	@Override
	public boolean updateAccount(Account account) {
		return accountDAO.updateAccount(account);
	}

	@Override
	public int confirmAccount(String activeKey) {
		Account account = accountDAO.getAccountByActiveKey(activeKey);
		if (account != null) {
			if (account.getStatus() == 1) {
				return 0;
			} else if(account.getStatus() == -1) {
				account.setStatus(1);
				boolean s = accountDAO.updateAccount(account);
				if (s) {
					return 1;
				} else {
					return -1;
				}
			}

		}
		return -1;
	}

	public List<Account> getListAccounts() {
		return accountDAO.getListAccounts();
	}

	@Override
	public Account getAccountByID(String accountID) {
		return accountDAO.getAccountByID(accountID);
	}

	@Override
	public boolean blockAccount(String accountID) {
		Account account = accountDAO.getAccountByID(accountID);
		if (account != null) {
			account.setStatus(0);;
			accountDAO.updateAccount(account);
			return true;
		}
		return false;
	}

	@Override
	public Account getAccountByActiveKey(String activeKey) {
		return accountDAO.getAccountByActiveKey(activeKey);
	}

	@Override
	public boolean checkExistUser(String userName) {
		return accountDAO.checkExistUsername(userName);
	}

	@Override
	public boolean checkExistEmail(String email) {
		return accountDAO.checkExistEmail(email);
	}

	@Override
	public Account getAccountByEmail(String email) {
		return accountDAO.getAccountbyEmail(email);
	}

	@Override
	public boolean checkTeacher(Account account) {
		Set<Role> roles = account.getRoles();
		boolean isTeacher = false;
		for (Role role : roles) {
			if (role.getRoleID().equals("ROLE2")) {
				isTeacher = true;
				break;
			}
		}
		return isTeacher;
	}

	@Override
	public boolean checkAdmin(Account account) {
		Set<Role> roles = account.getRoles();
		boolean isTeacher = false;
		for (Role role : roles) {
			if (role.getRoleID().equals("ROLE3")) {
				isTeacher = true;
				break;
			}
		}
		return isTeacher;
	}

	@Override
	public List<Account> getAccountPaging(int numPage) {
		return accountDAO.getAccountPaging(numPage);
	}

	@Override
	public List<Account> getAccountActivePaging(int numPage) {
		return accountDAO.getAccountActivePaging(numPage);
	}

	@Override
	public List<Account> getAccountBlockedPaging(int numPage) {
		return accountDAO.getAccountBlockedPaging(numPage);
	}

	@Override
	public List<Account> getAccountInactivePaging(int numPage) {
		return accountDAO.getAccountInactivePaging(numPage);
	}

	@Override
	public boolean activeAccount(String accountID) {
		Account account = accountDAO.getAccountByID(accountID);
		if (account != null) {
			account.setStatus(1);;
			accountDAO.updateAccount(account);
			return true;
		}
		return false;
	}

	@Override
	public List<Account> getAccountMemberPaging(int numPage) {
		return accountDAO.getAccountMemberPaging(numPage);
	}

	@Override
	public List<Account> getAccountTeacherPaging(int numPage) {
		return accountDAO.getAccountTeacherPaging(numPage);
	}

	@Override
	public List<Account> getAccountAdminPaging(int numPage) {
		return accountDAO.getAccountAdminPaging(numPage);
	}

	@Override
	public long getNumberAccount() {
		return accountDAO.getNumberAccount();
	}

	@Override
	public long getNumberAccountActive() {
		 return accountDAO.getNumberAccountActive();
	}

	@Override
	public long getNumberAccountBlocked() {
		 return accountDAO.getNumberAccountBlocked();
	}

	@Override
	public long getNumberAccountInactive() {
		 return accountDAO.getNumberAccountInactive();
	}

	@Override
	public long getNumberAccountAdmin() {
		 return accountDAO.getNumberAccountAdmin();
	}

	@Override
	public long getNumberAccountMember() {
		return accountDAO.getNumberAccountMember();
	}

	@Override
	public long getNumberAccountTeacher() {
		return accountDAO.getNumberAccountTeacher();
	}

	@Override
	public List<Account> searchAccountByUserName(String key) {
		return accountDAO.searchAccountByUserName(key);
	}

	@Override
	public List<Account> searchAccountByEmail(String key) {
		return accountDAO.searchAccountByEmail(key);
	}

}
