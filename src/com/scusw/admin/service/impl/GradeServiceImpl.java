package com.scusw.admin.service.impl;

import java.util.List;

import com.scusw.admin.dao.GradeDao;
import com.scusw.admin.service.BranchService;
import com.scusw.admin.service.GradeService;
import com.scusw.model.BranchInfo;
import com.scusw.model.GradeInfo;

public class GradeServiceImpl implements GradeService{

	private GradeDao gradeDao;
	private BranchService branchService;
	
	public BranchService getBranchService() {
		return branchService;
	}

	public void setBranchService(BranchService branchService) {
		this.branchService = branchService;
	}

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

	public void deleteGrade(int gradeId, boolean deleteClass) {
		// TODO Auto-generated method stub
		if (deleteClass) {
			
		} else {
			gradeDao.updateClassForDelGrade(gradeId);
			gradeDao.deleteGrade(gradeId);
		}
		
	}

	public GradeInfo checkGrade(int gradeId) {
		// TODO Auto-generated method stub
		return gradeDao.checkGrade(gradeId);
	}

	public void addGrade(String gradeName, int branchId) {
		// TODO Auto-generated method stub
		GradeInfo gi = new GradeInfo();
		gi.setGradeName(gradeName);
		gi.setBranchInfo(branchService.queryBranchById(branchId));
		gradeDao.addGrade(gi);
	}

	public List<BranchInfo> queryBranch() {
		// TODO Auto-generated method stub
		return branchService.queryAllBranch();
	}

}
