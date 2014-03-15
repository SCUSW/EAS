package com.scusw.admin.service;

import java.util.List;

import com.scusw.model.GradeInfo;

public interface GradeService {
	public List<GradeInfo> queryGrade();
	/**
	 * 删除年级，传入两个参数
	 * @param gradeId 删除的年级号
	 * @param deleteClass 是否删除该年级的班级，如果是则删除所有属于该年级的班级，否则将所有该年级的班级置为null
	 */
	public void deleteGrade(int gradeId,boolean deleteClass);
}
