/**
 * 
 */
package com.scusw.finance.service;

import java.util.List;

import com.scusw.finance.dao.StudentFinanceDao;
import com.scusw.model.StudentFees;
import com.scusw.model.StudentInfo;

/**
 * @author 杨昭远
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

	/* (non-Javadoc)
	 * @see com.scusw.finance.service.StudentFinanceService#findByNo(java.lang.String)
	 */
	public StudentInfo findById(int studentId) {
		// TODO Auto-generated method stub
		return studentFinanceDao.getRecordById(studentId);
	}

	/* (non-Javadoc)
	 * @see com.scusw.finance.service.StudentFinanceService#addStudentFees(int, float)
	 */
	public void addStudentFees(StudentFees studentFees) {
		// TODO Auto-generated method stub
		if(studentFees.getFeesNum() > 0){
			studentFees.setFeesFor("充值");
		}
		else{
			studentFees.setFeesFor("扣费");
		}
		studentFinanceDao.addRecordToFees(studentFees);
	}

	/* (non-Javadoc)
	 * @see com.scusw.finance.service.StudentFinanceService#updateBalance(int, float)
	 */
	public void updateBalance(StudentFees studentFees) {
		// TODO Auto-generated method stub
		float balancePassed = studentFinanceDao.getBalanceById(studentFees.getStudentInfo().getStudentId());
		float balanceNow = balancePassed + studentFees.getFeesNum();
		studentFinanceDao.updateBalanceById(studentFees.getStudentInfo().getStudentId() , balanceNow);
	}

	


}
