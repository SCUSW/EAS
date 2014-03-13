/**
 * 
 */
package com.scusw.finance.dao;

import java.util.List;

import com.scusw.model.TeacherInfo;

/**
 * @author 杨昭远
 *
 */
public interface TeacherFinanceDao {
	public List<TeacherInfo> queryAllTeacher();
	public List<TeacherInfo> queryTeacher(String staffName);

}
