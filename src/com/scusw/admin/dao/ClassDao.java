package com.scusw.admin.dao;

import java.util.List;

import com.scusw.model.ClassInfo;


public interface ClassDao {
	public List<ClassInfo> queryClass();
	public List<ClassInfo> checkClassForGrade(int gradeId);
	public void deleteClassForGrade(int gradeId);
	public void deleteClass(int classId);
	public void updateStudentForDelClass(int classId);
	public ClassInfo checkClass(int classId);
	public void updateGradeIdOfClass(int classId,int gradeId);
	public void updateGradeIdOfClass(int classId);
	public void updateClassNameOfClass(int classId,String className);
	public void addClass(ClassInfo ci);
}
