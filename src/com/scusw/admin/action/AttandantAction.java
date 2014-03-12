package com.scusw.admin.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.AttandantService;

public class AttandantAction {
	AttandantService attandantService;
	private Map<String,Object> request;
	public AttandantService getAttandantService() {
		return attandantService;
	}

	public void setAttandantService(AttandantService attandantService) {
		this.attandantService = attandantService;
	}
	public String execute() {
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("info", attandantService.queryStaffAttdant());
		request.put("test", "test123");
		return "success";
	}
}
