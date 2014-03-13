/**
 * 
 */
package com.scusw.finance.service;

import java.util.List;

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
	public StudentInfo findByNo(String studentNo);

}
