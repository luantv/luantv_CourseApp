package vn.edu.uet.dao;

import java.util.List;

import vn.edu.uet.model.Activity;

public interface ActivityDAO {

	String addActivity(Activity activity);
	List<Activity> getActivityByUser(String userID, int numPage);
	long getNumberActivityByUser(String userID);
}
