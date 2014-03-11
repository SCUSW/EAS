package com.scusw.teacher.action;

import java.util.Map;



import com.scusw.model.StaffInfo;
import com.scusw.model.TeacherInfo;
import com.scusw.teacher.service.TeacherService;

public class TeacherAction {
	private TeacherService teacherService;
	private TeacherInfo teacher;
	private StaffInfo staff;
	private Map<String,Object> request;
	
	public StaffInfo getStaff() {
		return staff;
	}
	public void setStaff(StaffInfo staff) {
		this.staff = staff;
	}
	public TeacherService getTeacherService() {
		return teacherService;
	}
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}
	public TeacherInfo getTeacher() {
		return teacher;
	}
	public void setTeacher(TeacherInfo teacher) {
		this.teacher = teacher;
	}
	public Map<String, Object> getRequest() {
		return request;
	}
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
}
