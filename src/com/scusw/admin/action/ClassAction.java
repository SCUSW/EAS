package com.scusw.admin.action;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.ClassService;
import com.scusw.model.ClassInfo;
import com.scusw.model.GradeInfo;
import com.scusw.util.CheckPrivilege;

public class ClassAction {
	private ClassService classService;
	private int gradeId;
	private String gradeIdStr;
	private int classId;
	private String className;
	private Map<String,Object> request;
	public static Logger logger = Logger.getLogger(ClassAction.class);
	
	public String getGradeIdStr() {
		return gradeIdStr;
	}

	public void setGradeIdStr(String gradeIdStr) {
		this.gradeIdStr = gradeIdStr;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

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
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		List<ClassInfo> list = classService.checkClassForGrade(gradeId);
		request.put("class", list);
		return "success";
	}
	public String queryClass() {
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		List<ClassInfo> list = classService.queryClass();
		request.put("class", list);
		return "success";
	}
	public String deleteClass() {
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		classService.deleteClass(classId);
		return this.queryClass();
	}
	public String updateClass() {
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		List<GradeInfo> list = classService.queryGrade(classId);
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("grade", list);
		ClassInfo classInfo = classService.checkClass(classId);
		request.put("classInfo", classInfo);
		return "update_success";
	}
	public String updateClassInfo() {
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		logger.info(classId+" " + className + " " + gradeId);
		classService.updateClassInfo(classId, className, gradeId);
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("flush", true);
		return "update_success";
	}
	public String addClass() {
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		List<GradeInfo> list = classService.queryGrade(classId);
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("grade", list);
		return "add_class";
	}
	public String addClassInfo() {
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		classService.addClass(className, gradeId);
		return this.queryClass();
	}
}
