package com.scusw.admin.service.impl;

import java.util.List;

import com.scusw.admin.dao.AttandantDao;
import com.scusw.admin.service.AttandantService;
import com.scusw.admin.service.DepartmentService;
import com.scusw.admin.service.GradeService;
import com.scusw.model.CourseInfo;
import com.scusw.model.DepartmentInfo;
import com.scusw.model.GradeInfo;
import com.scusw.model.StaffAttandant;
import com.scusw.model.StudentAttendant;

public class AttandantServiceImpl implements AttandantService {

	AttandantDao attandantDao;
	DepartmentService departmentService;
	GradeService gradeService;
	
	
	public GradeService getGradeService() {
		return gradeService;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public AttandantDao getAttandantDao() {
		return attandantDao;
	}

	public void setAttandantDao(AttandantDao attandantDao) {
		this.attandantDao = attandantDao;
	}

	public List<StaffAttandant> queryStaffAttendant(int currentPage,int pageSize,String staffName,String staffNo) {
		// TODO Auto-generated method stub
		
		return attandantDao.queryStaffAttendant(currentPage,pageSize, staffName,staffNo);
	}

	

	public int getTotalStaffAttendant(int departmentId, String staffName,String staffNo) {
		// TODO Auto-generated method stub
		if(staffName==null)
			staffName="";
		if (departmentId == 0) {
			return attandantDao.getTotleStaffAttendant(staffName,staffNo);
		} else
			return attandantDao.getTotleStaffAttendant(staffName, departmentId,staffNo);
		
	}

	public List<StaffAttandant> queryStaffAttendantByDepartment(
			int currentPage, int pageSize, int departmentId,String staffName,String staffNo) {
		// TODO Auto-generated method stub
		if (staffName == null)
			staffName="";
		if (staffNo == null)
			staffNo="";
		if(departmentId!=0)
			return attandantDao.queryStaffAttendantByDepartment(currentPage, pageSize, departmentId, staffName,staffNo);
		else
			return this.queryStaffAttendant(currentPage, pageSize,staffName,staffNo);
	}

	public List<DepartmentInfo> queryDepartmentInfo() {
		// TODO Auto-generated method stub
		return departmentService.queryAllDepartment(1, 100);
	}


	
	public List<StudentAttendant> queryStuAttendant(int currentPage,int pageSize,String studentName,String studentNo) {
		// TODO Auto-generated method stub
		return attandantDao.queryStuAttendant(currentPage,pageSize, studentNo, studentNo);
	}

	public List<StudentAttendant> queryStuAttendantByGrade(int currentPage,
			int pageSize, String studentName, String studentNo, int gradeId) {
		// TODO Auto-generated method stub
		return attandantDao.queryStuAttendantByGrade(currentPage, pageSize, studentName, studentNo, gradeId);
	}

	public List<StudentAttendant> queryStuAttendantByCourse(int currentPage,
			int pageSize, String studentName, String studentNo, int courseId) {
		// TODO Auto-generated method stub
		return attandantDao.queryStuAttendantByCourse(currentPage, pageSize, studentName, studentNo, courseId);
	}

	public List<StudentAttendant> queryStuAttendant(int currentPage,
			int pageSize, String studentName, String studentNo, int gradeId,
			int courseId) {
		// TODO Auto-generated method stub
		if (studentName == null) {
			studentName = "";
		}
		if (studentNo == null) {
			studentNo = "";
		}
		if(gradeId == 0 && courseId ==0 ) {
			return attandantDao.queryStuAttendant(currentPage, pageSize, studentName, studentNo);
		} else if (gradeId == 0 && courseId != 0) {
			return attandantDao.queryStuAttendantByCourse(currentPage, pageSize, studentName, studentNo, courseId);
		} else if (gradeId != 0 && courseId == 0) {
			return attandantDao.queryStuAttendantByGrade(currentPage, pageSize, studentName, studentNo, gradeId);
		}
		return attandantDao.queryStuAttendant(currentPage, pageSize, studentName, studentNo,gradeId,courseId);
	}
	
	public int getTotalStuAttendant(String studentName,String studentNo) {
		// TODO Auto-generated method stub
		return attandantDao.getTotleStuAttendant(studentNo, studentNo);
	}

	public int getTotalStuAttendantByGrade(String studentName,
			String studentNo, int gradeId) {
		// TODO Auto-generated method stub
		return attandantDao.getTotleStuAttendantByGrade(studentName, studentNo, gradeId);
	}

	public int getTotalStuAttendantByCourse(String studentName,
			String studentNo, int courseId) {
		// TODO Auto-generated method stub
		return attandantDao.getTotleStuAttendantByCourse(studentName, studentNo, courseId);
	}

	public int getTotalStuAttendant(String studentName, String studentNo,
			int gradeId, int courseId) {
		// TODO Auto-generated method stub
		if (studentName == null) {
			studentName = "";
		}
		if (studentNo == null) {
			studentNo = "";
		}
		if(gradeId == 0 && courseId ==0 ) {
			return attandantDao.getTotleStuAttendant(studentName, studentNo);
		} else if (gradeId == 0 && courseId != 0) {
			return attandantDao.getTotleStuAttendantByCourse(studentName, studentNo, courseId);
		} else if (gradeId != 0 && courseId == 0) {
			return attandantDao.getTotleStuAttendantByGrade(studentName, studentNo, gradeId);
		}
		return attandantDao.getTotleStuAttendant(studentName, studentNo,gradeId,courseId);
	}

	public List<GradeInfo> queryGradeInfo() {
		// TODO Auto-generated method stub
		return gradeService.queryGrade();
	}

	public List<CourseInfo> queryCourseInfo() {
		// TODO Auto-generated method stub
		return attandantDao.queryCourseInfo();
	}

}
