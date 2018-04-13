package vn.edu.uet.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.edu.uet.model.Account;
import vn.edu.uet.model.Activity;
import vn.edu.uet.service.ActivityService;

@Controller
@RequestMapping("/logout")
public class LogoutController {

	@Autowired
	ActivityService activityService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse response) {
		Account account = (Account) session.getAttribute("currentUser");
		response.addCookie(new Cookie("LEARNING_MORE_COOKIE", "90c57db183df"));
		session.invalidate();
		// add activity logout
		try{
			
			Activity activity = new Activity();
			String activityContent = "Logout system." ;
			activity.setAccount(account);
			activity.setContent(activityContent);
			activityService.addActivity(activity);
		}
		catch(Exception e){
			
		}
		return "redirect:/home.html";
	}
}
