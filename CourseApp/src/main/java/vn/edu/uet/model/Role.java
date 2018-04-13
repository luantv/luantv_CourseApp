package vn.edu.uet.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="Role")
public class Role implements Serializable {
	private static final long serialVersionUID = -6065693729920945071L;

	@Id
	@Column(name="roleID")
	private String roleID;
	
	@Column(name="roleName", nullable=false, length=10)
	private String roleName;

	@ManyToMany(mappedBy="roles")
	private Set<Account> accounts = new HashSet<Account>();
	
	public String getRoleID() {
		return roleID;
	}

	public void setRoleID(String roleID) {
		this.roleID = roleID;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Set<Account> getAccounts() {
		return accounts;
	}

	public void setAccounts(Set<Account> accounts) {
		this.accounts = accounts;
	}
	
	
}
