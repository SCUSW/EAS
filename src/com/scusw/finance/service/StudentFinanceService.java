/**
 * 
 */
package com.scusw.finance.service;

import java.util.List;

import com.scusw.model.StudentInfo;

/**
 * @author Administrator
 *
 */
public interface StudentFinanceService {
	public List<StudentInfo> searchAll();
	public List<StudentInfo> conditionSearch(String studentName);

}
