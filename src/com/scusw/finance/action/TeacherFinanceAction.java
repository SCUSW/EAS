/**
 * 
 */
package com.scusw.finance.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.finance.service.TeacherFinanceService;
import com.scusw.model.TeacherInfo;

/**
 * @author 杨昭远
 *
 */
public class TeacherFinanceAction {
	private TeacherFinanceService teacherFinanceService;
	private TeacherInfo teacherInfo;
	private Map<String , Object> request;
	
	public TeacherFinanceService getTeacherFinanceService() {
		return teacherFinanceService;
	}
	public void setTeacherFinanceService(TeacherFinanceService teacherFinanceService) {
		this.teacherFinanceService = teacherFinanceService;
	}
	public TeacherInfo getTeacherInfo() {
		return teacherInfo;
	}
	public void setTeacherInfo(TeacherInfo teacherInfo) {
		this.teacherInfo = teacherInfo;
	}
	public Map<String, Object> getRequest() {
		return request;
	}
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	public String searchAll(){
		this.setRequest((Map)ActionContext.getContext().get("request"));
		this.getRequest().put("teacher_list", teacherFinanceService.searchAll());

		return "default";
	}
	
	public String searchTeacher(){
		this.setRequest((Map)ActionContext.getContext().get("request"));
		this.getRequest().put("teacher_list", teacherFinanceService.conditionSearch(teacherInfo.getStaffInfo().getStaffName()));

		return "default";
	}
}
