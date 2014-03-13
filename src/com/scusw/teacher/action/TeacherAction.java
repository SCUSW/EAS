package com.scusw.teacher.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.model.CourseInfo;
import com.scusw.model.RegisterInfo;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;
import com.scusw.model.StudentAttendant;
import com.scusw.teacher.service.TeacherService;
import com.scusw.util.MD5Util;

public class TeacherAction {
	private TeacherService teacherService;
	private TeacherInfo teacher;
	private StaffInfo staff;
	private StudentInfo student;
	private CourseInfo course;
	private RegisterInfo register;
	private StudentAttendant studentAttendantInfo;
	private Map<String,Object> request;
	private Map<String, Object> session;
	
	private String studentName;
	private String studentNo;
	private int courseId;
	private int registerId;
	private float studentCourseScore;
	private String staffNo;
	private String staffName;
	private int staffId;
	
	public StaffInfo getStaff() {
		return staff;
	}
	public void setStaff(StaffInfo staff) {
		this.staff = staff;
	}
	public TeacherService getTeacherService() {
		return teacherService;
	}
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}
	public TeacherInfo getTeacher() {
		return teacher;
	}
	public void setTeacher(TeacherInfo teacher) {
		this.teacher = teacher;
	}
	public Map<String, Object> getRequest() {
		return request;
	}
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}
	public String getStudentNo() {
		return studentNo;
	}
	public void setStudent(StudentInfo student) {
		this.student = student;
	}
	public StudentInfo getStudent() {
		return student;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public void setCourse(CourseInfo course) {
		this.course = course;
	}
	public CourseInfo getCourse() {
		return course;
	}
	public void setRegister(RegisterInfo register) {
		this.register = register;
	}
	public RegisterInfo getRegister() {
		return register;
	}
	public void setRegisterId(int registerId) {
		this.registerId = registerId;
	}
	public int getRegisterId() {
		return registerId;
	}
	public void setStudentCourseScore(float studentCourseScore) {
		this.studentCourseScore = studentCourseScore;
	}
	public float getStudentCourseScore() {
		return studentCourseScore;
	}
	public void setStudentAttendantInfo(StudentAttendant studentAttendantInfo) {
		this.studentAttendantInfo = studentAttendantInfo;
	}
	public StudentAttendant getStudentAttendantInfo() {
		return studentAttendantInfo;
	}
	public void setStaffNo(String staffNo) {
		this.staffNo = staffNo;
	}
	public String getStaffNo() {
		return staffNo;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getStaffName() {
		return staffName;
	}
	public int getStaffId() {
		return staffId;
	}
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	
	
	
	//获取老师个人信息
	public String getOwnTeacherInfo(){
		session = ActionContext.getContext().getSession();
		int staffId = (Integer) session.get("staffID");
		teacher=teacherService.getOwnTeacherInfo(staffId);
		return "getOwnTeacherInfo";
	}
	
	//进入更新页面，更新页面中有老师原本的个人信息提示
	public String updateOwnTeacherInfo1(){
		session = ActionContext.getContext().getSession();
		int staffId = (Integer) session.get("staffID");
		teacher=teacherService.getOwnTeacherInfo(staffId);
		return "updateOwnTeacherInfo1";
	}
	
	//接收需要更新的信息并更新
	public String updateOwnTeacherInfo2(){		
		teacherService.updateTeacher(staff);
		
		session = ActionContext.getContext().getSession();
		int staffId = (Integer) session.get("staffID");
		teacher=teacherService.getOwnTeacherInfo(staffId);
		
		return "updateOwnTeacherInfo2";
	}

	public String searchStudent(){
		request=(Map)ActionContext.getContext().get("request");
		
		if(!studentNo.equals("")){
			List list=teacherService.searchStudentByNo(studentNo);
			request.put("students",list);
		}else if(!studentName.equals("")){
			List list=teacherService.searchStudentByName(studentName);
			request.put("students",list);
		}else{
			List list=teacherService.searchStudentAll();
			request.put("students",list);
		}
		return "searchStudent";
	}
	
	public String getStudentInfo(){
		student=teacherService.getStudentInfo(studentNo);
		return "getStudentInfo";
	}
	
	public String searchTeacherOwnCourse(){
		request=(Map)ActionContext.getContext().get("request");
		
		session = ActionContext.getContext().getSession();
		int staffId = (Integer) session.get("staffID");
		
		List list=teacherService.getTeacherOwnCourse(staffId);
		request.put("courses", list);
		
		return "searchTeacherOwnCourse";
	}

	public String searchOwnStudent(){
		request=(Map)ActionContext.getContext().get("request");
		
		List list=teacherService.searchStudentByCourseId(courseId);
		request.put("students",list);
		
		return "searchOwnStudent";
	}
	
	public String getOwnStudentInfo(){
		student=teacherService.getStudentInfo(studentNo);
		course=teacherService.getCourseById(courseId);
		register=teacherService.getRegisterByStudentIdCourseId(student.getStudentId(),courseId);
		return "getOwnStudentInfo";
	}
	
	public String updateStudentCourseScore(){
		teacherService.updateStudentCourseScore(registerId, studentCourseScore);
		this.getOwnStudentInfo();
		return "updateStudentCourseScore";
	}

	public String getStudentAttendant(){
		request=(Map)ActionContext.getContext().get("request");
		
		List list=teacherService.getStudentAttendant(registerId);
		request.put("studentAttendants",list);
		
		return "getStudentAttendant";
	}
	
	public String addStudentAttendant(){
		StudentAttendant studentAttendant = new StudentAttendant();
		RegisterInfo register=null;
		register=teacherService.getRegisterById(registerId);
		studentAttendant.setAttendantRemark("");
		studentAttendant.setRegisterInfo(register);
		
//		Calendar ca = Calendar.getInstance();
//		String catt;
//		String year = java.lang.String.valueOf(ca.get(1));
//		String month = java.lang.String.valueOf(ca.get(2)+1);
//		if(month.length()==1)
//			month = "0" + month;
//		String day = java.lang.String.valueOf(ca.get(5));
//		if(day.length()==1)
//			day = "0" + day;
//		String hour = java.lang.String.valueOf(ca.get(11));
//		if(hour.length()==1)
//			hour = "0" + hour;
//		String minute = java.lang.String.valueOf(ca.get(12));
//		if(minute.length()==1)
//			minute = "0" + minute;
//		String second = java.lang.String.valueOf(ca.get(13));
//		if(second.length()==1)
//			second = "0" + second;
//		catt = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
//		SimpleDateFormat df = new SimpleDateFormat(catt); 
//		String time = df.format(new java.util.Date());
//		Timestamp ts = Timestamp.valueOf(time);   		
//		studentAttendant.setAttendantTime(ts);
		
	//	Timestamp currTime = new Timestamp(System.currentTimeMillis());
		studentAttendant.setAttendantTime(new Timestamp(System.currentTimeMillis()));
		
		boolean flag=teacherService.addStudentAttendant(studentAttendant);
		if(flag){
			this.getStudentAttendant();
			return "addStudentAttendant";
		}else{
			return "addStudentAttendant_default";
		}
	}
	
	public String searchOwnCommonTeacher(){
		request=(Map)ActionContext.getContext().get("request");
		
		session = ActionContext.getContext().getSession();
		int staffId = (Integer) session.get("staffID");
		
		if(!staffNo.equals("")){
			List list=teacherService.getOwnCommonTeacherByStaffNo(staffId,staffNo);
			request.put("ownCommonTeachers",list);
		}else if(!staffName.equals("")){
			List list=teacherService.getOwnCommonTeacherByStaffName(staffId,staffName);
			request.put("ownCommonTeachers",list);
		}else{
			List list=teacherService.getOwnCommonTeacher(staffId);
			request.put("ownCommonTeachers",list);
		}
		return "searchOwnCommonTeacher";
	}
	
	public String getOwnCommonTeacherInfo(){
		teacher=teacherService.getOwnTeacherInfo(staffId);
		return "getOwnCommonTeacherInfo";
	}

	public String addCommonTeacher1(){
		request=(Map)ActionContext.getContext().get("request");
		
		List list=teacherService.searchteacherLevel();
		request.put("teacherLevels",list);
		
		return "addCommonTeacher1";
	}
	
	public String addCommonTeacher2(){
		teacher.getStaffInfo().setStaffPass(MD5Util.MD5("123456"));
		teacher.getStaffInfo().setPositionInfo(teacherService.getPositionById(2));
		teacher.getStaffInfo().setGroupInfo(teacherService.getGroupInfoById(2));
		teacher.getStaffInfo().setStaffEmplTime(new Timestamp(System.currentTimeMillis()));
		teacher.getStaffInfo().setStaffAvai(1);
		teacher.getStaffInfo().setStaffOthers("");
		teacher.setTeacherSalary((float)0);
		teacher.setTeacherType(0);
		teacher.setTeacherRemark("");
		
		boolean flag=teacherService.addCommonTeacehr(teacher);
		if(flag){
			this.getStudentAttendant();
			return "addCommonTeacher2";
		}else{
			return "addCommonTeacher2_default";
		}
	}
}
