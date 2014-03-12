package com.scusw.admin.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.AttandantService;
import com.scusw.model.StudentAttendant;

public class AttandantAction {
	AttandantService attandantService;
	private Map<String,Object> request;
	private Map<String,Object> session;
	public AttandantService getAttandantService() {
		return attandantService;
	}

	public void setAttandantService(AttandantService attandantService) {
		this.attandantService = attandantService;
	}
	public String checkStaffAttendant() {
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("info", attandantService.queryStaffAttendant());
		return "staff_success";
	}
	public String checkStuAttendant() {
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		List<StudentAttendant> list = attandantService.queryStuAttendant();
		request.put("testre", list.get(0).getAttendantTime());
		request.put("stuinfo", list);
		return "stu_success";
	}
}
