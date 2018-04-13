package vn.edu.uet.dao;

import vn.edu.uet.model.Teacher;

public interface TeacherDAO {

	boolean updateTeacher(Teacher teacher);
	Teacher getTeacherByID(String userID);
	Teacher getTeacherByEmail(String email);
	
}
