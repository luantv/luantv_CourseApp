package vn.edu.uet.service;

import java.util.List;

import vn.edu.uet.model.Activity;

public interface ActivityService {

	String addActivity(Activity activity);
	List<Activity> getActivityByUser(String userID, int numPage);
	long getNumberActivityByUser(String userID);
}
