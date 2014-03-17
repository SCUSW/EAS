/**
 * 
 */
package com.scusw.finance.service;

import java.util.List;

import com.scusw.finance.dao.StudentFinanceDao;
import com.scusw.model.FinancialRecords;
import com.scusw.model.StudentFees;
import com.scusw.model.StudentInfo;

/**
 * @author 杨昭远
 * 
 */
public class StudentFinanceServiceImp implements StudentFinanceService {
	private StudentFinanceDao studentFinanceDao;
	private TotalFinanceService totalFinanceService;
	private FinancialRecords financialRecords;
	private StudentInfo studentInfo;

	public StudentInfo getStudentInfo() {
		return studentInfo;
	}

	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}

	public FinancialRecords getFinancialRecords() {
		return financialRecords;
	}

	public void setFinancialRecords(FinancialRecords financialRecords) {
		this.financialRecords = financialRecords;
	}

	public TotalFinanceService getTotalFinanceService() {
		return totalFinanceService;
	}

	public void setTotalFinanceService(TotalFinanceService totalFinanceService) {
		this.totalFinanceService = totalFinanceService;
	}

	public StudentFinanceDao getStudentFinanceDao() {
		return studentFinanceDao;
	}

	public void setStudentFinanceDao(StudentFinanceDao studentFinanceDao) {
		this.studentFinanceDao = studentFinanceDao;
	}

	public List<StudentInfo> searchAll() {
		List<StudentInfo> st = studentFinanceDao.queryAllStudent();

		return st;
	}

	public List<StudentInfo> conditionSearch(StudentInfo studentInfo) {
		List<StudentInfo> st = studentFinanceDao.queryStudent(studentInfo
				.getStudentName());
		return st;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.scusw.finance.service.StudentFinanceService#findByNo(java.lang.String
	 * )
	 */
	public StudentInfo findById(StudentInfo studentInfo) {
		// TODO Auto-generated method stub
		return studentFinanceDao.getRecordById(studentInfo.getStudentId());
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.scusw.finance.service.StudentFinanceService#addStudentFees(int,
	 * float)
	 */
	public void addStudentFees(StudentFees studentFees) {
		// TODO Auto-generated method stub
		if (studentFees.getFeesNum() > 0) {
			studentFees.setFeesFor("充值");
		} else {
			studentFees.setFeesFor("扣费");
		}
		studentFinanceDao.addRecordToFees(studentFees);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.scusw.finance.service.StudentFinanceService#updateBalance(int,
	 * float)
	 */
	public void updateBalance(StudentFees studentFees) {
		// TODO Auto-generated method stub
		float balancePassed = studentFinanceDao.getBalanceById(studentFees
				.getStudentInfo().getStudentId());
		float balanceNow = balancePassed + studentFees.getFeesNum();
		studentFinanceDao.updateBalanceById(studentFees.getStudentInfo()
				.getStudentId(), balanceNow);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.scusw.finance.service.StudentFinanceService#findById(com.scusw.model
	 * .StudentFees)
	 */
	public StudentInfo findById(StudentFees studentFees) {
		// TODO Auto-generated method stub
		return studentFinanceDao.getRecordById(studentFees.getStudentInfo()
				.getStudentId());
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.scusw.finance.service.StudentFinanceService#updateStudentFees(com
	 * .scusw.model.StudentFees)
	 */
	public void updateStudentFees(StudentFees studentFees) {
		// TODO Auto-generated method stub
		this.updateBalance(studentFees);
		this.addStudentFees(studentFees);

		if (studentFees.getFeesNum() < 0) {
			double totalMoney = totalFinanceService.getTotalMoney();
			if (financialRecords == null) {
				financialRecords = new FinancialRecords();
			}
			if (studentInfo == null) {
				studentInfo = this.findById(studentFees);
			}
			financialRecords.setFinancialNum(0 - studentFees.getFeesNum());
			totalMoney += financialRecords.getFinancialNum();
			financialRecords.setTotalMoney(totalMoney);
			financialRecords.setFinancialFrom("学生扣费");
			financialRecords.setFinancialRemark("学生学号："
					+ studentInfo.getStudentNo() + "学生姓名："
					+ studentInfo.getStudentName());

			totalFinanceService.addFinanceRecord(financialRecords , 1);

		}
	}
}
