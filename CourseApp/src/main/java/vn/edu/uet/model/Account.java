package vn.edu.uet.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;

@Entity
@Table(name="Account")
@Inheritance(strategy=InheritanceType.JOINED)
@Repository
public class Account implements Serializable {
	private static final long serialVersionUID = 156258811481137156L;

	@Id
	@Column(name="userID",unique=true,nullable=false)
	private String userID;
	
	@Column(name="userName", unique=true, nullable=false, length=20)
	private String userName;
	
	@Column(name="displayName", nullable=true, length=100)
	private String displayName;
	
	@Column(name="email", unique=true, nullable=false, length=100)
	private String email;
	
	@Column(name="password", nullable=false, length=100)
	private String password;
	
	@Column(name="status", nullable=false)
	private int status;
	
	@Column(name="activeKey",nullable=true, length=100)
	private String activeKey;

	@Column(name="fullName", nullable=true, length=100)
	private String fullName;
	
	@Column(name="gender", nullable=true)
	private boolean gender;
	
	@Column(name="birthdate", nullable=true)
	@DateTimeFormat(pattern="YYYY-MM-DD")
	private Date birthdate;
	
	@Column(name="description", nullable=true, columnDefinition="TEXT")
	private String description;
	
	@Column(name="profileImage", nullable=true)
	private byte[] profileImage;
	
	@Column(name="googleID", nullable=true, length=200)
	private String googleID;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	@JoinTable(name="Account_Role",
			joinColumns={@JoinColumn(name="accountID")},
			inverseJoinColumns={@JoinColumn(name="roleID")})
	private Set<Role> roles = new HashSet<Role>();
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy="account")
	private Set<Activity> activities = new HashSet<Activity>();
	
	
	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	
	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getGoogleID() {
		return googleID;
	}

	public void setGoogleID(String googleID) {
		this.googleID = googleID;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getActiveKey() {
		return activeKey;
	}

	public void setActiveKey(String activeKey) {
		this.activeKey = activeKey;
	}
	
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	
	public boolean getGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	

	public byte[] getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(byte[] profileImage) {
		this.profileImage = profileImage;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Set<Activity> getActivities() {
		return activities;
	}

	public void setActivities(Set<Activity> activities) {
		this.activities = activities;
	}
	
	
	
	
}
