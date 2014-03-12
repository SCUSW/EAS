package com.scusw.teacher.dao;

import java.util.List;

import com.scusw.model.StaffInfo;
import com.scusw.model.TeacherInfo;

public interface TeacherDao {
	public TeacherInfo queryByTeacehrId(int staffIdS);
	
	public void updateTeacher(StaffInfo staff);
}
