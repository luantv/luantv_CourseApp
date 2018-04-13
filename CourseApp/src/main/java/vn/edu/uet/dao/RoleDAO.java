package vn.edu.uet.dao;

import java.util.List;

import vn.edu.uet.model.Role;

public interface RoleDAO {
	List<Role> getRoles();
	Role getRoleByID(String roleID);
}
