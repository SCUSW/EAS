package com.scusw.admin.dao;

import java.util.List;

import com.scusw.model.GradeInfo;

public interface GradeDao {
	public List<GradeInfo> queryGrade();
	public void deleteGrade(int gradeId);
	public void updateClassForDelGrade(int gradeId);
}
