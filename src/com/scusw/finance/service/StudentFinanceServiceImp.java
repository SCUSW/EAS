/**
 * 
 */
package com.scusw.finance.service;

import java.util.List;

import com.scusw.finance.dao.StudentFinanceDao;
import com.scusw.model.StudentInfo;

/**
 * @author Administrator
 *
 */
public class StudentFinanceServiceImp implements StudentFinanceService{
	private StudentFinanceDao studentFinanceDao;

	public StudentFinanceDao getStudentFinanceDao() {
		return studentFinanceDao;
	}

	public void setStudentFinanceDao(StudentFinanceDao studentFinanceDao) {
		this.studentFinanceDao = studentFinanceDao;
	}
	
	public List<StudentInfo> searchAll(){
		List<StudentInfo> st = studentFinanceDao.queryAllStudent();
				
		return st;
	}

	public List<StudentInfo> conditionSearch(String studentName) {
		List<StudentInfo> st = studentFinanceDao.queryStudent(studentName);
		
		return st;
	}


}
