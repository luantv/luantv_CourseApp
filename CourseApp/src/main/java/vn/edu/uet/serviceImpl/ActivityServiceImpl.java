package vn.edu.uet.serviceImpl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.edu.uet.dao.ActivityDAO;
import vn.edu.uet.model.Activity;
import vn.edu.uet.service.ActivityService;

@Service
public class ActivityServiceImpl implements ActivityService {

	@Autowired
	private ActivityDAO activityDAO;
	
	@Override
	public String addActivity(Activity activity) {
		String ID = UUID.randomUUID().toString();
		activity.setActivityID("ACT-"+ID);
		activity.setCreateDate(new Date());
		return activityDAO.addActivity(activity);
	}

	@Override
	public List<Activity> getActivityByUser(String userID, int numPage) {
		return activityDAO.getActivityByUser(userID, numPage);
	}

	@Override
	public long getNumberActivityByUser(String userID) {
		return activityDAO.getNumberActivityByUser(userID);
	}

}
