package com.scusw.admin.service.impl;

import java.util.List;

import com.scusw.admin.dao.TeaLevelDao;
import com.scusw.admin.service.TeaLevelService;
import com.scusw.model.TeacherLevel;

/**
 * manage privilege
 * @author liu jiahao
 *
 */

public class TeaLevelServiceImpl implements TeaLevelService {

	private TeaLevelDao teaLevelDao;


	public TeaLevelDao getTeaLevelDao() {
		return teaLevelDao;
	}

	public void setTeaLevelDao(TeaLevelDao teaLevelDao) {
		this.teaLevelDao = teaLevelDao;
	}

	// query all TeacherLevel
	public List<TeacherLevel> queryAllTeaLevel() {
		return teaLevelDao.queryAllTeaLevel();
	}
	
	// delete TeacherLevel by id
	public boolean delTeaLevelById(int levelId) {
		return teaLevelDao.delTeaLevelById(levelId);
	}


	// add TeacherLevel
	public boolean addTeaLevel(TeacherLevel teaLevel) {
		return teaLevelDao.addTeaLevel(teaLevel);
	}


	public TeacherLevel queryTeaLevelById(int levelId) {
		return teaLevelDao.queryTeaLevelById(levelId);
	}


	public boolean updateTeaLevel(TeacherLevel teaLevel) {
		return teaLevelDao.updateTeaLevel(teaLevel);
	}

}
