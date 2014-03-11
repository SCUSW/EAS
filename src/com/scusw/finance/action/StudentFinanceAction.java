/**
 * 
 */
package com.scusw.finance.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.finance.service.StudentFinanceService;
import com.scusw.model.StudentInfo;

/**
 * @author 杨昭远
 * 学生的财务查询Action
 */
public class StudentFinanceAction {
	private StudentFinanceService studentFinanceService;
	private StudentInfo studentInfo;
	private Map<String , Object> request;

	public StudentFinanceService getStudentFinanceService() {
		return studentFinanceService;
	}

	public void setStudentFinanceService(StudentFinanceService studentFinanceService) {
		this.studentFinanceService = studentFinanceService;
	}
	
	public StudentInfo getStudentInfo() {
		return studentInfo;
	}

	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}

	/**
	 * @param request the request to set
	 */
	public void setRequest(Map<String , Object> request) {
		this.request = request;
	}

	/**
	 * @return the request
	 */
	public Map<String , Object> getRequest() {
		return request;
	}

	public String searchAll(){
		this.setRequest((Map)ActionContext.getContext().get("request"));
		this.getRequest().put("student_list", studentFinanceService.searchAll());
		
		return "default";
	}
	
	public String conditionSearch(){
		System.out.println(studentInfo.getStudentName());

		this.setRequest((Map)ActionContext.getContext().get("request"));
		this.getRequest().put("student_list", studentFinanceService.conditionSearch(studentInfo.getStudentName()));
		
		return "default";
	}
}
