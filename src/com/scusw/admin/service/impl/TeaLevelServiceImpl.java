package com.scusw.admin.service.impl;

import java.util.List;

import org.apache.log4j.Logger;

import com.scusw.admin.dao.TeaLevelDao;
import com.scusw.admin.service.TeaLevelService;
import com.scusw.model.TeacherLevel;

/**
 * 
 * @author liu jiahao
 *
 */

public class TeaLevelServiceImpl implements TeaLevelService {

	private TeaLevelDao teaLevelDao;
	public static Logger logger = Logger.getLogger(TeaLevelServiceImpl.class);
	
	
	public static Logger getLogger() {
		return logger;
	}

	public static void setLogger(Logger logger) {
		TeaLevelServiceImpl.logger = logger;
	}

	public TeaLevelDao getTeaLevelDao() {
		return teaLevelDao;
	}

	public void setTeaLevelDao(TeaLevelDao teaLevelDao) {
		this.teaLevelDao = teaLevelDao;
	}

	
	/**
	 * query all TeacherLevel
	 */
	public List<TeacherLevel> queryAllTeaLevel() {
		
		return teaLevelDao.queryAllTeaLevel();
	}
	
	
	/**
	 * delete TeacherLevel by id
	 * actually to make its unavaiable
	 */
	public boolean delTeaLevel(TeacherLevel teaLevel) {
		
		logger.info("Delete TeacherLevel --- " + "levelid: " + teaLevel.getLevelId() 
				+ " levelName: " + teaLevel.getLevelName());
		teaLevel.setLevelAvai(0);
		return teaLevelDao.updateTeaLevel(teaLevel);
	}


	/**
	 * add TeacherLevel
	 */
	public boolean addTeaLevel(TeacherLevel teaLevel) {
		
		logger.info("Add TeacherLevel --- " + "levelid: " + teaLevel.getLevelId() 
				+ " levelName: " + teaLevel.getLevelName());
		teaLevel.setLevelAvai(1);
		return teaLevelDao.addTeaLevel(teaLevel);
	}

	/**
	 * query TeacherLevel By Id
	 */
	public TeacherLevel queryTeaLevelById(int levelId) {
		
		return teaLevelDao.queryTeaLevelById(levelId);
	}

	/**
	 * update TeacherLevel
	 */
	public boolean updateTeaLevel(TeacherLevel teaLevel) {
		
		logger.info("Update TeacherLevel --- " + "levelid: " + teaLevel.getLevelId() 
				+ " levelName: " + teaLevel.getLevelName());
		return teaLevelDao.updateTeaLevel(teaLevel);
	}

}
