package com.scusw.admin.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.AttandantService;
import com.scusw.model.StudentAttendant;

public class AttandantAction {
	private AttandantService attandantService;
	private int nextPage;
	private int pageSize;
	
	private Map<String,Object> request;
	private Map<String,Object> session;
	
	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public AttandantService getAttandantService() {
		return attandantService;
	}

	public void setAttandantService(AttandantService attandantService) {
		this.attandantService = attandantService;
	}
	public String checkStaffAttendant() {
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("info", attandantService.queryStaffAttendant(nextPage,pageSize));
		request.put("total",attandantService.getTotalStaffAttendant());
		request.put("pageSize", pageSize);
		request.put("currentPage", nextPage);
		return "staff_success";
	}
	public String checkStuAttendant() {
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		List<StudentAttendant> list = attandantService.queryStuAttendant(1,20);
		request.put("stuinfo", list);
		request.put("total",attandantService.getTotalStuAttendant());
		return "stu_success";
	}
}
