package com.scusw.admin.dao;

import java.util.List;

import com.scusw.model.ClassInfo;


public interface ClassDao {
	public List<ClassInfo> queryClass();
	public List<ClassInfo> checkClassForGrade(int id);
}
