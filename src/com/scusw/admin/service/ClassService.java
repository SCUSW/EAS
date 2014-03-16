package com.scusw.admin.service;

import java.util.List;

import com.scusw.model.ClassInfo;
import com.scusw.model.GradeInfo;

public interface ClassService {
	public List<ClassInfo> queryClass();
	public List<ClassInfo> checkClassForGrade(int id);
	public void deleteClass(int classId);
	public List<GradeInfo> queryGrade(int classId);
	public ClassInfo checkClass(int classId);
	public void updateClassInfo(int classId,String className, int gradeId);
	public void addClass(String className, int gradeId);
}
