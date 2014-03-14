package com.scusw.teacher.service.impl;

import java.sql.Timestamp;
import java.util.List;

import com.scusw.model.CourseInfo;
import com.scusw.model.GroupInfo;
import com.scusw.model.MajorInfo;
import com.scusw.model.PositionInfo;
import com.scusw.model.RegisterInfo;
import com.scusw.model.StaffAttandant;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;
import com.scusw.model.StudentAttendant;
import com.scusw.model.TeacherLevel;
import com.scusw.teacher.dao.TeacherDao;
import com.scusw.teacher.service.TeacherService;
import com.scusw.util.MD5Util;


public class TeacherServiceImpl implements TeacherService{

	private TeacherDao teacherDao;
	

	
	public TeacherDao getTeacherDao() {
		return teacherDao;
	}

	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}

	/**
	 * 获取老师个人信息
	 */
	public TeacherInfo getOwnTeacherInfo(int staffId){
		return teacherDao.queryByTeacehrId(staffId);
	}

	/**
	 * 更新老师个人信息
	 */
	public void updateTeacherStaff(StaffInfo staff) {
		StaffInfo ss=this.getOwnTeacherInfo(staff.getStaffId()).getStaffInfo();
		ss.setStaffPhone(staff.getStaffPhone());
		ss.setStaffQq(staff.getStaffQq());
		ss.setStaffPass(MD5Util.MD5(staff.getStaffPass()));
		teacherDao.updateTeacherStaff(ss);
	}

	/**
	 * 按学号查找学生
	 */
	public List<StudentInfo> searchStudentByNo(String studentNo){
		return teacherDao.searchStudentByNo(studentNo);
	}
	
	public List<StudentInfo> searchStudentByName(String studentName){
		return teacherDao.searchStudentByName(studentName);
	}
	
	public List<StudentInfo> searchStudentAll(){
		return teacherDao.searchStudentAll();
	}
	
	public StudentInfo getStudentInfo(String studentNo){
		return teacherDao.queryByStudentNo(studentNo);
	}
	
	public List searchStudentOwn(int staffId){
		return teacherDao.queryStudentByTeacherId(staffId);
	}
	
	public List getTeacherOwnCourse(int staffId){
		return teacherDao.queryTeacherOenCourse(staffId);
	}
	
	public List searchStudentByCourseId(int courseId){
		return teacherDao.queryStudentByCourseId(courseId);
	}
	
	public CourseInfo getCourseById(int courseId){
		return teacherDao.queryCourseById(courseId);
	}
	
	public RegisterInfo getRegisterByStudentIdCourseId(int studentId, int courseId){
		return teacherDao.queryRegisterByStudentIdCourseId(studentId,courseId);
	}
	
	public void updateStudentCourseScore(int registerId, float studentCourseScore){
		RegisterInfo rr=teacherDao.queryRegisterByRegisterId(registerId);
		rr.setStudentCourseScore(studentCourseScore);
		teacherDao.updateStudentCourseScore(rr);
	}
	
	public List getStudentAttendant(int registerId){
		return teacherDao.queryStudentAttendantByRegisterId(registerId);
	}
	
	public boolean addStudentAttendant(StudentAttendant studentAttendantInfo){
		try {
			teacherDao.addStudentAttendant(studentAttendantInfo);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public RegisterInfo getRegisterByStudentAttendantId(int studentAttendantId){
		return teacherDao.queryRegisterByStudentAttendantId(studentAttendantId);
	}
	
	public RegisterInfo getRegisterById(int registerId){
		return teacherDao.queryRegisterByRegisterId(registerId);
	}
	
	public List getOwnCommonTeacher(int staffId){
		int branchId = teacherDao.queryByTeacehrId(staffId).getStaffInfo().getPositionInfo().getDepartmentInfo().getBranchInfo().getBranchId();
		return teacherDao.queryOwnCommonTeacher(branchId);
	}
	
	public List getOwnCommonTeacherByStaffNo(int staffId, String staffNo){
		int branchId = teacherDao.queryByTeacehrId(staffId).getStaffInfo().getPositionInfo().getDepartmentInfo().getBranchInfo().getBranchId();
		return teacherDao.queryOwnCommonTeacherByStaffNo(branchId, staffNo);
	}
	
	public List getOwnCommonTeacherByStaffName(int staffId, String staffName){
		int branchId = teacherDao.queryByTeacehrId(staffId).getStaffInfo().getPositionInfo().getDepartmentInfo().getBranchInfo().getBranchId();
		return teacherDao.queryOwnCommonTeacherByStaffName(branchId, staffName);
	}
	
	public List searchteacherLevel(){
		return teacherDao.queryAllTeacherLevel();
	}
	
	public PositionInfo getPositionById(int vocationId){
		return	teacherDao.queryPositionById(vocationId);
	}
	
	public GroupInfo getGroupInfoById(int groupId){
		return teacherDao.queryGroupById(groupId);
	}
	
	public boolean addCommonTeacher(TeacherInfo teacher, int levelId,StaffInfo staff){
		String pass="123456";
		staff.setStaffPass(MD5Util.MD5(pass));
		staff.setPositionInfo(this.getPositionById(2));
		staff.setGroupInfo(this.getGroupInfoById(2));
		staff.setStaffEmplTime(new Timestamp(System.currentTimeMillis()));
		staff.setStaffAvai((int)1);
		staff.setStaffOthers("其它信息");

		float teacherSalary=staff.getPositionInfo().getWageBase();
		
		teacher.setTeacherSalary(teacherSalary);
		teacher.setTeacherType((int)0);
		teacher.setTeacherRemark("备注信息");
		teacher.setTeacherLevel(this.getTeacherLevelById(levelId));

		if((StaffInfo)teacherDao.queryStaffByNo(staff.getStaffNo())!=null){
			return false;
		}
			
		
		if((StaffInfo)teacherDao.queryStaffByIdcard(staff.getStaffIdcard())!=null){
			return false;
		}
		
		if((TeacherInfo)teacherDao.queryTeacherByNo(teacher.getTeacherNo())!=null){
			return false;
		}

		try {
			teacherDao.addStaff(staff);
			teacher.setStaffInfo(teacherDao.queryStaffByNo(staff.getStaffNo()));
			teacher.setStaffId(staff.getStaffId());
			teacherDao.addCommonTeacehr(teacher);
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
		return true;
	}

	public TeacherLevel getTeacherLevelById(int levelId) {
		return teacherDao.queryTeacherLevelById(levelId);
	}
	
	public List getCommonTeacherAttandantByStaffId(Integer staffId){
		return teacherDao.queryStaffAttandantByStaffId(staffId);
	}
	
	public boolean addStaffAttandant(StaffAttandant staffAttandant){
		try {
			teacherDao.addStaffAttandant(staffAttandant);
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
		return true;
	}
	
	public List searchOwnCourseByStaffId(int staffId){
		return teacherDao.queryCourseByStaffId(staffId);
	}
	
	public List searchMajor(){
		return teacherDao.queryAllMajor();
	}
	
	public boolean addOwnCourse(CourseInfo course){
		try{
			teacherDao.addCourse(course);
			return true;
		}catch(Exception e){
			System.out.println(e);
			return false;
		}
	}
	
	public MajorInfo getMajorById(Integer majorId){
		return teacherDao.queryMajorById(majorId);
	}
	
	public void updateCourse(CourseInfo course){
		teacherDao.updateCourse(course);
	}
	
	public void updateTeacher(TeacherInfo teacher){
		teacherDao.updateTeacher(teacher);
	}
	
	public List searchOwnTeachingManageByCourseId(Integer courseId){
		return teacherDao.queryOwnTeachingManageByCourseId(courseId);
	}
}
