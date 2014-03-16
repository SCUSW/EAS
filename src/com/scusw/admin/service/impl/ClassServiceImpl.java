package com.scusw.admin.service.impl;

import java.util.List;

import com.scusw.admin.dao.ClassDao;
import com.scusw.admin.service.ClassService;
import com.scusw.admin.service.GradeService;
import com.scusw.model.ClassInfo;
import com.scusw.model.GradeInfo;

public class ClassServiceImpl implements ClassService {
	ClassDao classDao;
	private GradeService gradeService;

	public GradeService getGradeService() {
		return gradeService;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}

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

	public void deleteClass(int classId) {
		// TODO Auto-generated method stub
		classDao.updateStudentForDelClass(classId);
		classDao.deleteClass(classId);
	}

	public List<GradeInfo> updateClass(int classId) {
		// TODO Auto-generated method stub
		return gradeService.queryGrade();
	}

	public ClassInfo checkClass(int classId) {
		// TODO Auto-generated method stub
		return classDao.checkClass(classId);
	}

	public void updateClassInfo(int classId, String className, int gradeId) {
		// TODO Auto-generated method stub
		ClassInfo ci = this.checkClass(classId);
		if (!ci.getClassName().equals(className)) {
			classDao.updateClassNameOfClass(classId, className);
		}
		if (ci.getGradeInfo() != null & gradeId != 0 & ci.getGradeInfo().getGradeId() != gradeId) {
			classDao.updateGradeIdOfClass(classId, gradeId);
		} else if (ci.getGradeInfo() != null & gradeId ==0) {
			classDao.updateGradeIdOfClass(classId);
		} else if (ci.getGradeInfo() == null & gradeId !=0) {
			classDao.updateGradeIdOfClass(classId, gradeId);
		}
		
	}

}
