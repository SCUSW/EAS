package com.scusw.admin.service.impl;

import java.util.List;

import com.scusw.admin.dao.GradeDao;
import com.scusw.admin.service.GradeService;
import com.scusw.model.GradeInfo;

public class GradeServiceImpl implements GradeService{

	private GradeDao gradeDao;
	
	public GradeDao getGradeDao() {
		return gradeDao;
	}

	public void setGradeDao(GradeDao gradeDao) {
		this.gradeDao = gradeDao;
	}

	public List<GradeInfo> queryGrade() {
		// TODO Auto-generated method stub
		return gradeDao.queryGrade();
	}

}
