/**
 * 
 */
package com.scusw.finance.service;

import java.util.List;

import com.scusw.model.TeacherInfo;

/**
 * @author 杨昭远
 *
 */
public interface TeacherFinanceService {
	public List<TeacherInfo> searchAll();
	public List<TeacherInfo> conditionSearch(String staffName);
}
