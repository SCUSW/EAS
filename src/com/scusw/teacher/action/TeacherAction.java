package com.scusw.teacher.action;

import java.util.List;
import java.util.Map;



import com.opensymphony.xwork2.ActionContext;
import com.scusw.model.StaffInfo;
import com.scusw.model.TeacherInfo;
import com.scusw.teacher.service.TeacherService;

public class TeacherAction {
	private TeacherService teacherService;
	private TeacherInfo teacher;
	private StaffInfo staff;
	private Map<String,Object> request;
	private Map<String, Object> session;
	
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
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	
	//获取老师个人信息
	public String getOwnTeacherInfo(){
		session = ActionContext.getContext().getSession();
		int staffId = (Integer) session.get("staffID");
		teacher=teacherService.getOwnTeacherInfo(staffId);
		return "getOwnTeacherInfo";
	}
	
	//进入更新页面，更新页面中有老师原本的个人信息提示
	public String updateOwnTeacherInfo1(){
		session = ActionContext.getContext().getSession();
		int staffId = (Integer) session.get("staffID");
		teacher=teacherService.getOwnTeacherInfo(staffId);
		return "updateOwnTeacherInfo1";
	}
	
	//接收需要更新的信息并更新
	public String updateOwnTeacherInfo2(){
		String staffPhone = staff.getStaffPhone();
		String staffQq = staff.getStaffQq();
		session = ActionContext.getContext().getSession();
		int staffId = (Integer) session.get("staffID");
		teacher=teacherService.getOwnTeacherInfo(staffId);
		staff.setStaffPhone(staffPhone);
		staff.setStaffQq(staffQq);
		teacherService.updateTeacher(staff);
		System.out.println(teacher.getStaffInfo().getStaffPhone());
		return "updateOwnTeacherInfo2";
	}
}
