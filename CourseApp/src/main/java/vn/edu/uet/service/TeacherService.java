package vn.edu.uet.service;

import vn.edu.uet.model.Teacher;

public interface TeacherService {

	boolean updateTeacher(Teacher teacher);
	Teacher getTeacherByID(String userID);
	Teacher getTeacherByEmail(String email);
}
