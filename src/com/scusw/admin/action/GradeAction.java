package com.scusw.admin.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.GradeService;
import com.scusw.model.GradeInfo;

public class GradeAction {
	private GradeService gradeService;
	private Map<String,Object> request;
	public GradeService getGradeService() {
		return gradeService;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	
	public String queryGrade() {
		List<GradeInfo> list = gradeService.queryGrade();
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("grade", list);
		return "success";
	}
}
