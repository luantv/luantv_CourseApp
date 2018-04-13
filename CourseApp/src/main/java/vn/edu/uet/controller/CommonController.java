package vn.edu.uet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import vn.edu.uet.model.Account;
import vn.edu.uet.service.AccountService;
import vn.edu.uet.util.MailMail;

@Controller
@SessionAttributes(value="currentUser")
public class CommonController {

	@Autowired
	MailMail mailMail;
	@Autowired
	AccountService accountService;
	
	@RequestMapping(value="/home.html", method=RequestMethod.GET)
	public String goHomepage(@CookieValue(value="LEARNING_MORE_COOKIE", defaultValue="90c57db183df") String cookie,
			Model model){
		System.out.println(cookie);
		Account account = accountService.getAccountByID(cookie);
		if(account!=null){
			System.out.println(account.getUserName());
			model.addAttribute("currentUser", account);
		}
		return "home";
	}
	
	
	@RequestMapping(value="/dashboard", method=RequestMethod.GET)
	public String goDashboard(Model model,HttpSession session){
		if(model.containsAttribute("currentUser")){
			Account account = (Account) session.getAttribute("currentUser");
			//Set<Role> roles = account.getRoles();
			//boolean isTeacher = ;
			if(accountService.checkTeacher(account)){
				return "redirect:/management_course/list";
			}
			else if(accountService.checkAdmin(account)){
				return "redirect:/home.html";
			}
			else{
				return "redirect:/profile/my_courses";
			}

		}
		else{
			return "redirect:/home.html";
		}
	}
	
//	
//	@RequestMapping(value="/sendmail.html", method=RequestMethod.GET)
//	public String sendMail(){
//		mailMail.sendMail("abc@gmail.com",
//	    		   "xyz@gmail.com",
//	    		   "Test send mail", 
//	    		   "Testing only \n\n Hello Spring Email Sender \n www.tuoitre.vn");
//		return "home";
//	}
}
