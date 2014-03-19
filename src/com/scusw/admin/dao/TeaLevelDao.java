package com.scusw.admin.dao;

import java.util.List;

import com.scusw.model.TeacherLevel;

/**
 * 
 * @author liu jiahao
 *
 */

public interface TeaLevelDao {
	
	// interface to list TeacherLevel
	public List<TeacherLevel> queryAllTeaLevel();
	
	// delete TeacherLevel by id
	public boolean delTeaLevelById(int levelId);
	
	// add TeacherLevel
	public boolean addTeaLevel(TeacherLevel teaLevel);
	
	// query TeacherLevel by id
	public TeacherLevel queryTeaLevelById(int levelId);
	
	// update TeacherLevel
	public boolean updateTeaLevel(TeacherLevel teaLevel);
}
