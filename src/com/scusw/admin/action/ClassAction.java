package com.scusw.admin.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.ClassService;
import com.scusw.admin.service.GradeService;
import com.scusw.model.ClassInfo;
import com.scusw.model.GradeInfo;

public class ClassAction {
	private ClassService classService;
	private int gradeId;
	private int classId;
	private Map<String,Object> request;
	

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public int getGradeId() {
		return gradeId;
	}

	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}

	public ClassService getClassService() {
		return classService;
	}

	public void setClassService(ClassService classService) {
		this.classService = classService;
	}
	public String checkClassForGrade() {
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		List<ClassInfo> list = classService.checkClassForGrade(gradeId);
		request.put("class", list);
		return "success";
	}
	public String queryClass() {
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		List<ClassInfo> list = classService.queryClass();
		request.put("class", list);
		return "success";
	}
	public String deleteClass() {
		classService.deleteClass(classId);
		return this.queryClass();
	}
	public String updateClass() {
		List<GradeInfo> list = classService.updateClass(classId);
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("grade", list);
		ClassInfo classInfo = classService.checkClass(classId);
		request.put("classInfo", classInfo);
		return "update_success";
	}
}
