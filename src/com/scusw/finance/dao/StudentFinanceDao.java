/**
 * 
 */
package com.scusw.finance.dao;

import java.util.List;

import com.scusw.model.StudentFees;
import com.scusw.model.StudentInfo;

/**
 * 
 * @author 杨昭远
 *
 */
public interface StudentFinanceDao{
	public List<StudentInfo> queryAllStudent();
	public List<StudentInfo> queryStudent(String studentName);
	public StudentInfo getRecordById(int studentId);
	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 */
	public float getBalanceById(int studentId);
	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 */
	public void updateBalanceById(int studentId, float balanceNow);
	
	public void addRecordToFees(StudentFees studentFees);

}
