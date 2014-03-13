/**
 * 
 */
package com.scusw.finance.service;

import java.util.List;

import com.scusw.model.StudentFees;
import com.scusw.model.StudentInfo;

/**
 * @author 杨昭远
 *
 */
public interface StudentFinanceService {
	public List<StudentInfo> searchAll();
	public List<StudentInfo> conditionSearch(String studentName);
	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 */
	public StudentInfo findById(int studentId);
	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 */
	public void updateBalance(StudentFees studentFees);
	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 */
	public void addStudentFees(StudentFees studentFees);

}
