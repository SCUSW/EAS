package com.scusw.admin.service;

import java.util.List;

import com.scusw.model.ClassInfo;

public interface ClassService {
	public List<ClassInfo> queryClass();
	public List<ClassInfo> checkClassForGrade(int id);
}
