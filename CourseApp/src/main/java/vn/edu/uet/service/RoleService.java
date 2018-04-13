package vn.edu.uet.service;

import java.util.List;

import vn.edu.uet.model.Role;

public interface RoleService {

	List<Role> getRoles();
	Role getRoleByID(String roleID);
}
