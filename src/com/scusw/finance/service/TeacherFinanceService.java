/**
 * 
 */
package com.scusw.finance.service;

import java.util.List;

import com.scusw.model.TeacherInfo;

/**
 * @author Administrator
 *
 */
public interface TeacherFinanceService {
	public List<TeacherInfo> searchAll();
	public List<TeacherInfo> conditionSearch(String staffName);
}
