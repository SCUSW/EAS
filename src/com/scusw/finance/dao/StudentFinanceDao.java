/**
 * 
 */
package com.scusw.finance.dao;

import java.util.List;

import com.scusw.model.StudentInfo;

/**
 * 
 * @author 杨昭远
 *
 */
public interface StudentFinanceDao{
	public List<StudentInfo> queryAllStudent();
	public List<StudentInfo> queryStudent(String studentName);
}
