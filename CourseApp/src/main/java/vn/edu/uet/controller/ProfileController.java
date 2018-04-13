package vn.edu.uet.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import vn.edu.uet.model.Account;
import vn.edu.uet.model.Activity;
import vn.edu.uet.service.AccountService;
import vn.edu.uet.service.ActivityService;
import vn.edu.uet.util.ConstantValues;

@Controller
@SessionAttributes(value = "currentUser")
@RequestMapping(value="profile")
public class ProfileController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	ActivityService activityService;
	
	@RequestMapping(value="profile_info")
	public String displayProfileInfo(Model model){
		if(model.containsAttribute("currentUser")){
			return "profile/profile_info";
		}
		else{
			return "redirect:/home.html";
		}
	}
	@RequestMapping(value="profile_edit",method=RequestMethod.POST)
	public String editProfile(@ModelAttribute("account") Account account,
				@ModelAttribute("currentUser")Account currentUser) {
		/*System.out.print(account.getPassword());
		System.out.print(accountService.updateAccount(account));*/
		/*System.out.println(account.getFullName());
		System.out.println(account.getDisplayName());
		System.out.println(account.getBirthdate());*/
		
		/*currentUser.setFullName(account.getFullName());
		currentUser.setDisplayName(account.getDisplayName());
		currentUser.setBirthdate(account.getBirthdate());
		currentUser.setDescription(account.getDescription());*/
		accountService.updateAccount(currentUser);
		// add activity
		try {

			Activity activity = new Activity();
			String activityContent = "Edit profile.";
			activity.setAccount(account);
			activity.setContent(activityContent);
			activityService.addActivity(activity);
		} catch (Exception e) {

		}
		return "redirect:/profile/profile_info";
	}

	
	@RequestMapping(value="profile_edit", method=RequestMethod.GET)
	public String displayProfileEdit(Model model, HttpSession session){
		if(model.containsAttribute("currentUser")){
			
			Account sessionObj = (Account) session.getAttribute("currentUser");
			Account account = accountService.getAccountByEmail(sessionObj.getEmail());
			
			model.addAttribute("account", account);
			return "profile/profile_edit";
		}
		else{
			return "redirect:/home.html";
		}
	}
	
	
	@RequestMapping(value="profile_change_password", method=RequestMethod.GET)
	public String displayChangePassword(Model model, HttpSession session){
		if(model.containsAttribute("currentUser")){
			return "profile/change_password";
		}
		else{
			return "redirect:/home.html";
		}
		
	}
	
	@RequestMapping(value="profile_change_password", method=RequestMethod.POST)
	public String changePassword(@RequestParam String currentPassword, @RequestParam String newPassword,
			@RequestParam String confirmPassword, Model model, HttpSession session){
		if(model.containsAttribute("currentUser")){
			System.out.println(currentPassword + "-" + newPassword + "- " + confirmPassword);
			
			Account account = (Account) session.getAttribute("currentUser");
			if(currentPassword.equals(account.getPassword())){
				if(newPassword.equals(confirmPassword)){
					Account acc = accountService.getAccountByEmail(account.getEmail());
					acc.setPassword(newPassword);
					accountService.updateAccount(acc);
					model.addAttribute("result", "Password mới đã được lưu thành công.");
					try {

						Activity activity = new Activity();
						String activityContent = "Change password.";
						activity.setAccount(account);
						activity.setContent(activityContent);
						activityService.addActivity(activity);
					} catch (Exception e) {

					}
				}
				else{
					model.addAttribute("result", "Password mới chưa chính xác.");
				}
			}
			else{
				model.addAttribute("result", "Current Password không chính xác.");
			}
			return "profile/change_password";
		}
		else{
			return "redirect:/home.html";
		}
	}
	
	
	@RequestMapping(value="change_profile_image", method=RequestMethod.GET)
	public String changProfileInage(Model model,
			HttpSession session){
		if(model.containsAttribute("currentUser")){
			return "profile/change_profile_image";
		}
		else{
			return "redirect:/home.html";
		}
	}
	
	@RequestMapping(value = "upload_profile_img", method = RequestMethod.POST)
	public String uploadImage(@RequestParam(value = "userID") String userID,
			@RequestParam CommonsMultipartFile[] fileUpload, Model model,
			HttpServletRequest request) {
		if (fileUpload != null && fileUpload.length > 0) {
			
			for (CommonsMultipartFile aFile : fileUpload) {

				Account account = accountService.getAccountByID(userID);

				byte[] file = aFile.getBytes();

				account.setProfileImage(file);
				accountService.updateAccount(account);
				
				// add activity
				try {

					Activity activity = new Activity();
					String activityContent = "Upload profile image.";
					activity.setAccount(account);
					activity.setContent(activityContent);
					activityService.addActivity(activity);
				} catch (Exception e) {

				}
			}
			return "redirect:/profile/profile_info";
			
		}
		else{
			return "redirect:/home.html";
		}

	}
	
	@RequestMapping(value = "profile_image/{userID}", method = RequestMethod.GET)
	public void findImage(@PathVariable("userID") String userID,
			HttpServletResponse response) {

		Account account = accountService.getAccountByID(userID);
		response.setContentType(MediaType.IMAGE_JPEG_VALUE);
		response.setContentLength(account.getProfileImage().length);

		final BufferedInputStream in = new BufferedInputStream(
				new ByteArrayInputStream(account.getProfileImage()));
		try {
			FileCopyUtils.copy(in, response.getOutputStream());
			response.flushBuffer();
		} catch (final IOException e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping(value="my_activities",method=RequestMethod.GET)
	public String getMyActivity(
			@RequestParam(value="numPage", required=false) String numPage,
			Model model, 
			HttpSession session){
		if(model.containsAttribute("currentUser")){
			if(numPage==null) numPage = "1";
			Account account = (Account) session.getAttribute("currentUser");
			List<Activity> activityList = activityService.getActivityByUser(account.getUserID(), Integer.parseInt(numPage));
			long numActivity = activityService.getNumberActivityByUser(account.getUserID());
			long pageCount = numActivity/ConstantValues.NUMBER_ROW_10 + 
					(numActivity%ConstantValues.NUMBER_ROW_10 == 0 ? 0:1);
			model.addAttribute("activityList", activityList);
			model.addAttribute("pageCount", pageCount);
			return "profile/my_activities";
		}
		else{
			return "redirect:/home.html";
		}
	}
	
	
	
	@InitBinder
	protected void initBinder( WebDataBinder binder) throws ServletException {
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	            dateFormat.setLenient(false);
	            binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
}
