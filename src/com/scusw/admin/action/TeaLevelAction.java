package com.scusw.admin.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.TeaLevelService;
import com.scusw.model.TeacherLevel;
import com.scusw.util.CheckPrivilege;


/**
 * 
 * @author liu jiahao
 *
 */

public class TeaLevelAction {
	
	private TeacherLevel teaLevel;
	private TeaLevelService teaLevelService;
	private Map<String,Object> request;
	

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


	
	/**
	 * list all Teacher Level
	 * @return
	 */
	public String listTeaLevel(){
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		List<TeacherLevel> list = teaLevelService.queryAllTeaLevel();
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		request.put("teaLevels", list);
		return "listTeaLevel";
	}

	
	/**
	 * delete TeaLevel
	 * @return
	 */
	public String delTeaLevel(){
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		teaLevel = teaLevelService.queryTeaLevelById(teaLevel.getLevelId());
		if(teaLevelService.delTeaLevel(teaLevel)){
			return listTeaLevel();
		}
		return "delError";
	}
	
	
	/**
	 * add TeaLevel
	 * @return
	 */
	public String addTeaLevel(){
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		if(teaLevelService.addTeaLevel(teaLevel)){
			return listTeaLevel();
		}
		return "addError";
	}
	
	
	/**
	 * update TeaLevel step 1:put current info
	 * @return
	 */
	public String updateTeaLevel1(){
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		teaLevel = teaLevelService.queryTeaLevelById(teaLevel.getLevelId());
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		request.put("teaLevel", teaLevel);
		return "updateTeaLevel";
	}
	
	
	/**
	 * update TeaLevel step 2:update info
	 * @return
	 */
	public String updateTeaLevel2(){
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		teaLevelService.updateTeaLevel(teaLevel);
		return listTeaLevel();
	}

	
}
