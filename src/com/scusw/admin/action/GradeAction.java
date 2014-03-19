package com.scusw.admin.action;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.GradeService;
import com.scusw.model.BranchInfo;
import com.scusw.model.GradeInfo;
import com.scusw.util.CheckPrivilege;

public class GradeAction {
	Logger logger = Logger.getLogger(GradeAction.class);
	private GradeService gradeService;
	private Map<String,Object> request;
	private int gradeId;
	private String gradeName;
	private int branchId;
	
	
	public int getBranchId() {
		return branchId;
	}

	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public int getGradeId() {
		return gradeId;
	}

	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}

	public GradeService getGradeService() {
		return gradeService;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	
	public String queryGrade() {
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		List<GradeInfo> list = gradeService.queryGrade();
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("grade", list);
		//logger.info("queryGrade");
		return "success";
	}
	public String deleteGrade() {
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		gradeService.deleteGrade(gradeId, false);
		return this.queryGrade();
	}
	public String addGrade() {
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		List<BranchInfo> list = gradeService.queryBranch();
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("branch", list);
		return "add_grade";
	}
	public String addGradeInfo() {
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		gradeService.addGrade(gradeName, branchId);
		return this.queryGrade();
	}
}
