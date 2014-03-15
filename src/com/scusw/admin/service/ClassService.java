package com.scusw.admin.service;

import java.util.List;

import com.scusw.model.ClassInfo;
import com.scusw.model.GradeInfo;

public interface ClassService {
	public List<ClassInfo> queryClass();
	public List<ClassInfo> checkClassForGrade(int id);
	public void deleteClass(int classId);
	public List<GradeInfo> updateClass(int classId);
	public ClassInfo checkClass(int classId);
}
