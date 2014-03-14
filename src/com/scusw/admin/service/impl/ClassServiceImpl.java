package com.scusw.admin.service.impl;

import java.util.List;

import com.scusw.admin.dao.ClassDao;
import com.scusw.admin.service.ClassService;
import com.scusw.model.ClassInfo;

public class ClassServiceImpl implements ClassService {
	ClassDao classDao;
	

	public ClassDao getClassDao() {
		return classDao;
	}

	public void setClassDao(ClassDao classDao) {
		this.classDao = classDao;
	}

	public List<ClassInfo> queryClass() {
		// TODO Auto-generated method stub
		return classDao.queryClass();
	}

	public List<ClassInfo> checkClassForGrade(int id) {
		// TODO Auto-generated method stub
		return classDao.checkClassForGrade(id);
	}

}
