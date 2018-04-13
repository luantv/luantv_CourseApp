package vn.edu.uet.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.edu.uet.dao.RoleDAO;
import vn.edu.uet.model.Role;
import vn.edu.uet.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDAO roleDAO;
	
	@Override
	public List<Role> getRoles() {
		return roleDAO.getRoles();
	}

	@Override
	public Role getRoleByID(String roleID) {
		return roleDAO.getRoleByID(roleID);
	}

}
