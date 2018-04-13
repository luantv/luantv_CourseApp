package vn.edu.uet.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.edu.uet.dao.TeacherDAO;
import vn.edu.uet.model.Teacher;
import vn.edu.uet.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	TeacherDAO teacherDAO;
	@Override
	public boolean updateTeacher(Teacher teacher) {
		return teacherDAO.updateTeacher(teacher);
	}

	@Override
	public Teacher getTeacherByID(String userID) {
		return teacherDAO.getTeacherByID(userID);
	}

	@Override
	public Teacher getTeacherByEmail(String email) {
		return teacherDAO.getTeacherByEmail(email);
	}

}
