package vn.edu.uet.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import vn.edu.uet.model.Account;
import vn.edu.uet.model.Role;
import vn.edu.uet.service.AccountService;
import vn.edu.uet.service.RoleService;
import vn.edu.uet.util.ConstantValues;

@Controller
@RequestMapping(value="/admin")
@SessionAttributes(value="currentUser")
public class AdministratorController {
	
	@Autowired
	private AccountService accountService;
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String admin(){
		return "redirect:admin/home";
	}
	
	@RequestMapping(value="home", method=RequestMethod.GET)
	public String homeAdmin(Model model, HttpSession session){
		if(model.containsAttribute("currentUser")){
			Account account = (Account) session.getAttribute("currentUser");
			boolean isAdmin = accountService.checkAdmin(account);
			if(isAdmin){
				
				long numberAccount = accountService.getNumberAccount();
				long numberAccountInActive = accountService.getNumberAccountInactive();
				long numberAccountActive= accountService.getNumberAccountActive();
				long numberAccountBlocked = accountService.getNumberAccountBlocked();
				long numberAccountTeacher = accountService.getNumberAccountTeacher();
				
				model.addAttribute("numberAccount", numberAccount);
				model.addAttribute("numberAccountInActive", numberAccountInActive);
				model.addAttribute("numberAccountActive", numberAccountActive);
				model.addAttribute("numberAccountBlocked", numberAccountBlocked);
				model.addAttribute("numberAccountTeacher", numberAccountTeacher);
				return "admin/home";
			}
			else{
				return "redirect:/home.html";
			}
		}
		else{
			return "redirect:/home.html";
		}
	}
	
	@RequestMapping(value="/search_account", method=RequestMethod.GET)
	public String searchAccount(@RequestParam(value="searchKey") String searchKey,Model model, HttpSession session){
		if(model.containsAttribute("currentUser")){
			Account account = (Account) session.getAttribute("currentUser");
			boolean isAdmin = accountService.checkAdmin(account);
			if(isAdmin){
				List<Account> accountList = accountService.searchAccountByUserName(searchKey);
				List<Role> roleList = roleService.getRoles();
				model.addAttribute("accountList", accountList);
				model.addAttribute("searchKey", searchKey);
				model.addAttribute("roleList", roleList);
				return "admin/list_account_search";
			}
			else{
				return "redirect:/home.html";
			}
		}
		else{
			return "redirect:/home.html";
		}
	}
	
	@RequestMapping(value="/grant_role", method=RequestMethod.POST)
	public @ResponseBody String grantRole(@RequestParam(value="roles") String roles,
			@RequestParam(value="userID") String userID, Model model,HttpSession session){
		if(model.containsAttribute("currentUser")){
			Account account = (Account) session.getAttribute("currentUser");
			boolean isAdmin = accountService.checkAdmin(account);
			if(isAdmin){
				String[] roleIDs = roles.split(",");
				Set<Role> roleSet = new HashSet<Role>();
				Role role;
				for(String r:roleIDs){
					role = roleService.getRoleByID(r);
					roleSet.add(role);
				}
				Account userGranted = accountService.getAccountByID(userID);
				userGranted.setRoles(roleSet);
				if(accountService.updateAccount(userGranted)){
					return "done";
				}
				else{
					return "error";
				}
				
			}
			else{
				return "no_role";
			}
		}
		else{
			return "no_login";
		}
	}
	
	@RequestMapping(value="/list_account", method=RequestMethod.GET)
	public String listUser(
			@RequestParam(value="numPage", required=false) String numPage, 
			Model model, HttpSession session){
		
		if(model.containsAttribute("currentUser")){
			Account account = (Account) session.getAttribute("currentUser");
			boolean isAdmin = accountService.checkAdmin(account);
			if(isAdmin){
				if(numPage==null) numPage="1";
				List<Account> accountList = accountService.getAccountPaging(Integer.parseInt(numPage));
				List<Account> list = accountService.getListAccounts();
				int pageCount = list.size()/ConstantValues.NUMBER_ROW_10 + (list.size()%ConstantValues.NUMBER_ROW_10 == 0 ? 0:1);
				List<Role> roleList = roleService.getRoles();
				model.addAttribute("pageCount", pageCount);
				model.addAttribute("accountList", accountList);
				model.addAttribute("numPage", numPage);
				model.addAttribute("roleList", roleList);
				return "admin/list_account";
			}
			else{
				return "redirect:/home.html";
			}
		}
		else{
			return "redirect:/home.html";
		}
	}
	
	
	@RequestMapping(value="/list_account_active", method=RequestMethod.GET)
	public String listUserActive(
			@RequestParam(value="numPage", required=false) String numPage, 
			Model model, HttpSession session){
		
		if(model.containsAttribute("currentUser")){
			Account account = (Account) session.getAttribute("currentUser");
			boolean isAdmin = accountService.checkAdmin(account);
			if(isAdmin){
				if(numPage==null) numPage="1";
				List<Account> accountList = accountService.getAccountActivePaging(Integer.parseInt(numPage));
				long numAccount = accountService.getNumberAccountActive();
				long pageCount = numAccount/ConstantValues.NUMBER_ROW_10 + (numAccount%ConstantValues.NUMBER_ROW_10 == 0 ? 0:1);
				List<Role> roleList = roleService.getRoles();
				model.addAttribute("pageCount", pageCount);
				model.addAttribute("accountList", accountList);
				model.addAttribute("numPage", numPage);
				model.addAttribute("roleList", roleList);

				return "admin/list_account_active";
			}
			else{
				return "redirect:/home.html";
			}
		}
		else{
			return "redirect:/home.html";
		}
	}
	
	@RequestMapping(value="/list_account_inactive", method=RequestMethod.GET)
	public String listUserInActive(
			@RequestParam(value="numPage", required=false) String numPage, 
			Model model, HttpSession session){
		
		if(model.containsAttribute("currentUser")){
			Account account = (Account) session.getAttribute("currentUser");
			boolean isAdmin = accountService.checkAdmin(account);
			if(isAdmin){
				if(numPage==null) numPage="1";
				List<Account> accountList = accountService.getAccountInactivePaging(Integer.parseInt(numPage));
				long numAccount = accountService.getNumberAccountInactive();
				long pageCount = numAccount/ConstantValues.NUMBER_ROW_10 + (numAccount%ConstantValues.NUMBER_ROW_10 == 0 ? 0:1);
				List<Role> roleList = roleService.getRoles();
				model.addAttribute("pageCount", pageCount);
				model.addAttribute("accountList", accountList);
				model.addAttribute("numPage", numPage);
				model.addAttribute("roleList", roleList);

				return "admin/list_account_inactive";
			}
			else{
				return "redirect:/home.html";
			}
		}
		else{
			return "redirect:/home.html";
		}
	}
	
	@RequestMapping(value="/list_account_admin", method=RequestMethod.GET)
	public String listUserAdmin(
			@RequestParam(value="numPage", required=false) String numPage, 
			Model model, HttpSession session){
		
		if(model.containsAttribute("currentUser")){
			Account account = (Account) session.getAttribute("currentUser");
			boolean isAdmin = accountService.checkAdmin(account);
			if(isAdmin){
				if(numPage==null) numPage="1";
				List<Account> accountList = accountService.getAccountAdminPaging(Integer.parseInt(numPage));
				long numAccount = accountService.getNumberAccountAdmin();
				long pageCount = numAccount/ConstantValues.NUMBER_ROW_10 + (numAccount%ConstantValues.NUMBER_ROW_10 == 0 ? 0:1);
				List<Role> roleList = roleService.getRoles();
				model.addAttribute("pageCount", pageCount);
				model.addAttribute("accountList", accountList);
				model.addAttribute("numPage", numPage);
				model.addAttribute("roleList", roleList);

				return "admin/list_account_admin";
			}
			else{
				return "redirect:/home.html";
			}
		}
		else{
			return "redirect:/home.html";
		}
	}
	
	@RequestMapping(value="/list_account_blocked", method=RequestMethod.GET)
	public String listUserBlocked(
			@RequestParam(value="numPage", required=false) String numPage, 
			Model model, HttpSession session){
		
		if(model.containsAttribute("currentUser")){
			Account account = (Account) session.getAttribute("currentUser");
			boolean isAdmin = accountService.checkAdmin(account);
			if(isAdmin){
				if(numPage==null) numPage="1";
				List<Account> accountList = accountService.getAccountBlockedPaging(Integer.parseInt(numPage));
				long numAccount = accountService.getNumberAccountBlocked();
				long pageCount = numAccount/ConstantValues.NUMBER_ROW_10 + (numAccount%ConstantValues.NUMBER_ROW_10 == 0 ? 0:1);
				List<Role> roleList = roleService.getRoles();
				model.addAttribute("pageCount", pageCount);
				model.addAttribute("accountList", accountList);
				model.addAttribute("numPage", numPage);
				model.addAttribute("roleList", roleList);

				return "admin/list_account_blocked";
			}
			else{
				return "redirect:/home.html";
			}
		}
		else{
			return "redirect:/home.html";
		}
	}
	
	@RequestMapping(value="/list_account_member", method=RequestMethod.GET)
	public String listUserMember(
			@RequestParam(value="numPage", required=false) String numPage, 
			Model model, HttpSession session){
		
		if(model.containsAttribute("currentUser")){
			Account account = (Account) session.getAttribute("currentUser");
			boolean isAdmin = accountService.checkAdmin(account);
			if(isAdmin){
				if(numPage==null) numPage="1";
				List<Account> accountList = accountService.getAccountMemberPaging(Integer.parseInt(numPage));
				long numAccount = accountService.getNumberAccountMember();
				long pageCount = numAccount/ConstantValues.NUMBER_ROW_10 + (numAccount%ConstantValues.NUMBER_ROW_10 == 0 ? 0:1);
				List<Role> roleList = roleService.getRoles();
				model.addAttribute("pageCount", pageCount);
				model.addAttribute("accountList", accountList);
				model.addAttribute("numPage", numPage);
				model.addAttribute("roleList", roleList);

				return "admin/list_account_member";
			}
			else{
				return "redirect:/home.html";
			}
		}
		else{
			return "redirect:/home.html";
		}
	}
	
	@RequestMapping(value="/list_account_teacher", method=RequestMethod.GET)
	public String listUserTeacher(
			@RequestParam(value="numPage", required=false) String numPage, 
			Model model, HttpSession session){
		
		if(model.containsAttribute("currentUser")){
			Account account = (Account) session.getAttribute("currentUser");
			boolean isAdmin = accountService.checkAdmin(account);
			if(isAdmin){
				if(numPage==null) numPage="1";
				List<Account> accountList = accountService.getAccountTeacherPaging(Integer.parseInt(numPage));
				long numAccount = accountService.getNumberAccountTeacher();
				System.err.println(numAccount);
				long pageCount = numAccount/ConstantValues.NUMBER_ROW_10 + (numAccount%ConstantValues.NUMBER_ROW_10 == 0 ? 0:1);
				List<Role> roleList = roleService.getRoles();
				model.addAttribute("pageCount", pageCount);
				model.addAttribute("accountList", accountList);
				model.addAttribute("numPage", numPage);
				model.addAttribute("roleList", roleList);

				return "admin/list_account_teacher";
			}
			else{
				return "redirect:/home.html";
			}
		}
		else{
			return "redirect:/home.html";
		}
	}
	
	@RequestMapping(value="/active_account", method=RequestMethod.GET)
	public @ResponseBody String activeAccount(
			@RequestParam(value="userID") String userID,
			Model model, HttpSession session){
		if(model.containsAttribute("currentUser")){
			Account account = (Account) session.getAttribute("currentUser");
			boolean isAdmin = accountService.checkAdmin(account);
			if(isAdmin){
				//Account accountActive = accountService.getAccountByID(userID);
				//accountActive.setStatus(1);
				if(accountService.activeAccount(userID)){
					return "done";
				}
				else{
					return "error";
				}
			}
			else{
				return "no_role";
			}
		}
		else{
			return "no_login";
		}
	}
	
	@RequestMapping(value="/block_account", method=RequestMethod.GET)
	public @ResponseBody String blockAccount(
			@RequestParam(value="userID") String userID,
			Model model, HttpSession session){
		if(model.containsAttribute("currentUser")){
			Account account = (Account) session.getAttribute("currentUser");
			boolean isAdmin = accountService.checkAdmin(account);
			if(isAdmin){
				if(accountService.blockAccount(userID)){
					return "done";
				}
				else{
					return "error";
				}
			}
			else{
				return "no_role";
			}
		}
		else{
			return "no_login";
		}
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) throws ServletException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, false));
	}
}
