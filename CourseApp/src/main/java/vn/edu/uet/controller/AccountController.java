package vn.edu.uet.controller;

import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import vn.edu.uet.model.Account;
import vn.edu.uet.model.Activity;
import vn.edu.uet.service.AccountService;
import vn.edu.uet.service.ActivityService;
import vn.edu.uet.util.MailMail;

@Controller
@SessionAttributes(value = "currentUser")
public class AccountController {

	@Autowired
	AccountService accountService;
	@Autowired
	MailMail mailMail;
	
	@Autowired
	ActivityService activityService;

	@RequestMapping(value = "/signup.html", method = RequestMethod.GET)
	public String displaySignupAccount(
			@ModelAttribute("account") Account account, Model model) {
		System.out.println("Vao sign up.......");
		if (model.containsAttribute("currentUser")) {
			return "home";
		} else {
			model.addAttribute("account", account);
			return "signup";
		}

	}

	// produces = MediaType.APPLICATION_JSON_VALUE, consumes =
	// MediaType.APPLICATION_JSON_VALUE
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public @ResponseBody String submitSignupAccount(
		@RequestBody Account account, HttpServletRequest request,
		@CookieValue(value="LEARNING_MORE_COOKIE") String cookie) {
		
		try {
			String activeKey = UUID.randomUUID().toString();
			account.setActiveKey(activeKey);

			String message = "";
			message += "Hi " + account.getUserName() + ",\n\n";
			message += "A new account has been requested at 'Learning more' using your email address."
					+ "\n";
			message += "To confirm your new account, please go to this web address:"
					+ "\n";
			message += request.getRequestURL().substring(0,
					request.getRequestURL().length() - 6)
					+ "confirm_email?activeKey=" + activeKey + "\n";
			message += "In most mail programs, this should appear as a blue link "
					+ "which you can just click on. If that doesn't work,"
					+ "then cut and paste the address into the address"
					+ "line at the top of your web browser window." + "\n";
			message += "If you need help, please contact the site administrator,"
					+ "Admin User";

			accountService.addAccount(account);
			mailMail.sendMail("uetlearning@gmail.com", account.getEmail(),
					"Learing more: account confirmation", message);
			
			return "true";
		} catch (Exception e) {
			return e.getMessage();
		}
	}

	@RequestMapping(value = "/confirm_email", method = RequestMethod.GET)
	public String confirmEmail(@RequestParam String activeKey, Model model) {
		System.out.println(activeKey);
		int result = accountService.confirmAccount(activeKey);
		model.addAttribute("result", result);
		return "confirm_email";
	}

	@RequestMapping(value="/forgot_password", method=RequestMethod.GET)
	public String forgetPassword(Model model){
		return "forget_password";
	}
	
	
	@RequestMapping(value = "/forgot_password", method = RequestMethod.POST)
	public @ResponseBody String submitForgetPassword(
			@RequestParam(value="email") String email,
			 HttpServletRequest request) {
		System.out.println("nnnnnnn"+email);
		try {
			String activeKey = UUID.randomUUID().toString();
			Account account = accountService.getAccountByEmail(email);
			
			if(account!=null){
				account.setActiveKey(activeKey);
				String message = "";
				message += "Hi " + account.getUserName() + ",\n\n";
				message += "You recently requested a password reset."
						+ "\n";
				message += "To change your password, click or paste the following link into your browser:"
						+ "\n";
				message += request.getRequestURL().substring(0,
						request.getRequestURL().length() - 15)
						+ "reset_password?key=" + activeKey  +"&email="+ email + "\n";
				message += "Thanks for using Learning More!"
						+ "\n";
				message += "If you need help, please contact the site administrator,"
						+ "The Learning More Admin ";

				accountService.updateAccount(account);
				mailMail.sendMail("uetlearning@gmail.com", account.getEmail(),
						"Learning more: reset password", message);
				return "done";
			}
			return "email_invalid";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping(value = "/reset_password", method = RequestMethod.GET)
	public String resetPassword(@RequestParam(value="key") String key,
			@RequestParam(value="email") String email,
			Model model) {
		Account account = accountService.getAccountByActiveKey(key);
		String result = "";
		if(account!=null){
			if(account.getEmail().equals(email)){
				model.addAttribute("email", email);
				return "reset_password";
			}
			else{
				return "redirect:/home.html";
			}
		}
		else{
			return "redirect:/home.html";
		}
	}
	
	@RequestMapping(value = "/reset_password", method = RequestMethod.POST)
	public @ResponseBody String resetPasswordSubmit(
			@RequestParam(value="newPassword") String newPassword,
			@RequestParam(value="email") String email,
			Model model) {
		Account account = accountService.getAccountByEmail(email);
		if(account!=null){
			account.setPassword(newPassword);
			boolean result = accountService.updateAccount(account);
			if(result){
				return "done";
			}
			else{
				return "error";
			}
		}
		else{
			return "email_invalid";
		}
	}
	
	@RequestMapping(value = "/demo.html", method = RequestMethod.POST)
	public @ResponseBody String demo(@RequestBody Account account) {
		System.out.println("Vao signup post");
		return "asd";
	}

	@RequestMapping(value = "/validate_username", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String validateUsername(@RequestParam String userName) {
		System.out.println(userName);
		if (accountService.checkExistUser(userName)) {
			return "{\"valid\": false}";
		} else {
			return "{\"valid\": true}";
		}
	}

	@RequestMapping(value = "/validate_email", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String validateEmail(@RequestParam String email) {
		System.out.println(email);
		if (accountService.checkExistEmail(email)) {
			return "{\"valid\": false}";
		} else {
			return "{\"valid\": true}";
		}
	}

	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public @ResponseBody String signin(@RequestParam String email,
			@RequestParam String password,
			@RequestParam(required = false) boolean remember, Model model,HttpServletResponse response) {
		System.out.println(email + " " + password + " " + remember);
		
		Account account = new Account();
		account = accountService.getAccountByEmail(email);
		if (account != null) {
			if (account.getStatus() == 1 || account.getStatus() == 0) { // neu da kich hoat tai khoan
				if (account.getPassword().equals(password)) {
					model.addAttribute("currentUser", account);
					if (remember == true) {
						// create cookie
						Cookie cookie = new Cookie("LEARNING_MORE_COOKIE",
								account.getUserID());

						response.addCookie(cookie);
					}
					
					// add activity login
					Activity activity = new Activity();
					String activityContent = "Login to system";
					activity.setAccount(account);
					activity.setContent(activityContent);
					activityService.addActivity(activity);
					return "yes";
				}
				else{
					return "no";
				}
			}
			else if(account.getStatus() == -1){
				return "not_confirm";
			}
		}
		return "no";
	}
}
