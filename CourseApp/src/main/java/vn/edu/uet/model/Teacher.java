package vn.edu.uet.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;


@Entity
@Table(name="Teacher")
@PrimaryKeyJoinColumn(name="userID")
public class Teacher extends Account {

	/**
	 * 
	 */
	private static final long serialVersionUID = -832578238870919551L;
	
	@Column(name="workAt", nullable=true, length=200)
	private String workAt;
	
	@Column(name="learnAt", nullable=true, length=200)
	private String learnAt;
	
	@Column(name="info", nullable=true, columnDefinition="TEXT")
	private String info;

	public String getWorkAt() {
		return workAt;
	}

	public void setWorkAt(String workAt) {
		this.workAt = workAt;
	}

	public String getLearnAt() {
		return learnAt;
	}

	public void setLearnAt(String learnAt) {
		this.learnAt = learnAt;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
}
