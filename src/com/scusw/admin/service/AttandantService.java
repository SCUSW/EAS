package com.scusw.admin.service;

import java.util.List;

import com.scusw.model.StaffAttandant;
import com.scusw.model.StudentAttendant;

public interface AttandantService {
	public List<StaffAttandant> queryStaffAttendant();
	public List<StudentAttendant> queryStuAttendant();
}
