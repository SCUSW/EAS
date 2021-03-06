package com.scusw.admin.service;

import java.util.List;

import com.scusw.model.TeacherLevel;

/**
 * 
 * @author liu jiahao
 *
 */

public interface TeaLevelService {
	
	// list TeacherLevel
	public List<TeacherLevel> queryAllTeaLevel();
	
	// query TeacherLevel by id
	public TeacherLevel queryTeaLevelById(int levelId);
	
	// delete TeacherLevel by id
	public boolean delTeaLevel(TeacherLevel teaLevel);
	
	// add TeacherLevel
	public boolean addTeaLevel(TeacherLevel teaLevel);
	
	// update TeacherLevel
	public boolean updateTeaLevel(TeacherLevel teaLevel);
}
