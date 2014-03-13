package com.scusw.admin.dao;

import java.util.List;

import com.scusw.model.StaffAttandant;
import com.scusw.model.StudentAttendant;

public interface AttandantDao {
	public List<StaffAttandant> queryStaffAttendant(int currentPage,int pageSize);
	public List<StudentAttendant> queryStuAttendant(int currentPage,int pageSize);
	public int getTotleStaffAttendant();
	public int getTotleStuAttendant();
}
