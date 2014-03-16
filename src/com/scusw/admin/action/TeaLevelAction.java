package com.scusw.admin.action;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.TeaLevelService;
import com.scusw.model.TeacherLevel;


/**
 * manage privilege
 * @author liu jiahao
 *
 */

public class TeaLevelAction {
	
	private TeacherLevel teaLevel;
	private TeaLevelService teaLevelService;
	private Map<String,Object> request;
	
	public static Logger logger = Logger.getLogger(TeaLevelAction.class);

	
	
	public TeacherLevel getTeaLevel() {
		return teaLevel;
	}

	public void setTeaLevel(TeacherLevel teaLevel) {
		this.teaLevel = teaLevel;
	}

	public TeaLevelService getTeaLevelService() {
		return teaLevelService;
	}

	public void setTeaLevelService(TeaLevelService teaLevelService) {
		this.teaLevelService = teaLevelService;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public static Logger getLogger() {
		return logger;
	}

	public static void setLogger(Logger logger) {
		TeaLevelAction.logger = logger;
	}

	// list all TeaLeve
	public String listTeaLevel(){

		List<TeacherLevel> list = teaLevelService.queryAllTeaLevel();
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		request.put("teaLevels", list);
		return "listTeaLevel";
	}

	// delete TeaLevel
	public String delTeaLevel(){
		if(teaLevelService.delTeaLevelById(teaLevel.getLevelId())){
			return listTeaLevel();
		}
		return "delError";
	}
	
	// add TeaLevel
	public String addTeaLevel(){
		teaLevel.setLevelAvai(1);
		if(teaLevelService.addTeaLevel(teaLevel)){
			return listTeaLevel();
		}
		return "addError";
	}
	
	// update TeaLevel step 1
	public String updateTeaLevel1(){
		teaLevel = teaLevelService.queryTeaLevelById(teaLevel.getLevelId());
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		request.put("teaLevel", teaLevel);
		return "updateTeaLevel";
	}
	
	// update TeaLevel step 2
	public String updateTeaLevel2(){
		teaLevelService.updateTeaLevel(teaLevel);
		return listTeaLevel();
	}
	
}
