package vn.edu.uet.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="activity")
public class Activity implements Serializable {
	private static final long serialVersionUID = 2364281235739097127L;
	
	@Id
	@Column(name="activityID")
	private String activityID;
	
	@Column(name="content", nullable=false, columnDefinition="TEXT")
	private String content;
	
	@Column(name="createDate", nullable=false)
	private Date createDate;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="userID", nullable=false)
	private Account account;

	public String getActivityID() {
		return activityID;
	}

	public void setActivityID(String activityID) {
		this.activityID = activityID;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
	
	
}
