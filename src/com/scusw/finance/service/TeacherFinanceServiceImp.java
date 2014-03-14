/**
 * 
 */
package com.scusw.finance.service;

import java.util.List;

import com.scusw.finance.dao.TeacherFinanceDao;
import com.scusw.model.TeacherInfo;

/**
 * @author 杨昭远
 *
 */
public class TeacherFinanceServiceImp implements TeacherFinanceService{
	private TeacherFinanceDao teacherFinanceDao;
	
	
	public TeacherFinanceDao getTeacherFinanceDao() {
		return teacherFinanceDao;
	}


	public void setTeacherFinanceDao(TeacherFinanceDao teacherFinanceDao) {
		this.teacherFinanceDao = teacherFinanceDao;
	}


	/* (non-Javadoc)
	 * @see com.scusw.finance.service.TeacherFinanceService#searchAll()
	 */
	public List<TeacherInfo> searchAll() {
		List<TeacherInfo> teacher_list = teacherFinanceDao.queryAllTeacher();
		// TODO Auto-generated method stub
		return teacher_list;
	}
	
	public List<TeacherInfo> conditionSearch(String staffName){
		List<TeacherInfo> teacher_list = teacherFinanceDao.queryTeacher(staffName);
		
		return teacher_list;
	}

}
