package com.scusw.teacher.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.model.CourseInfo;
import com.scusw.model.MajorInfo;
import com.scusw.model.RegisterInfo;
import com.scusw.model.StaffAttandant;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;
import com.scusw.model.StudentAttendant;
import com.scusw.model.TeacherLevel;
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
	private MajorInfo major;
	private TeacherLevel teacherLevel;
	private Map<String,Object> request;
	private Map<String, Object> session;
	
	
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
	public void setStudent(StudentInfo student) {
		this.student = student;
	}
	public StudentInfo getStudent() {
		return student;
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
	public void setStudentAttendantInfo(StudentAttendant studentAttendantInfo) {
		this.studentAttendantInfo = studentAttendantInfo;
	}
	public StudentAttendant getStudentAttendantInfo() {
		return studentAttendantInfo;
	}
	public void setMajor(MajorInfo major) {
		this.major = major;
	}
	public MajorInfo getMajor() {
		return major;
	}
	public TeacherLevel getTeacherLevel() {
		return teacherLevel;
	}
	public void setTeacherLevel(TeacherLevel teacherLevel) {
		this.teacherLevel = teacherLevel;
	}
	
	
	
	//获取老师个人信息
	public String getOwnTeacherInfo(){
		session = ActionContext.getContext().getSession();
		int staffId = (Integer) session.get("staffId");
		teacher=teacherService.getOwnTeacherInfo(staffId);
		return "getOwnTeacherInfo";
	}
	
	//进入更新页面，更新页面中有老师原本的个人信息提示
	public String updateOwnTeacherInfo1(){
		session = ActionContext.getContext().getSession();
		int staffId = (Integer) session.get("staffId");
		teacher=teacherService.getOwnTeacherInfo(staffId);
		return "updateOwnTeacherInfo1";
	}
	
	//接收需要更新的信息并更新
	public String updateOwnTeacherInfo2(){		
		teacherService.updateTeacherStaff(staff);
		
		session = ActionContext.getContext().getSession();
		int staffId = (Integer) session.get("staffId");
		teacher=teacherService.getOwnTeacherInfo(staffId);
		
		return "updateOwnTeacherInfo2";
	}

	public String searchStudent(){
		request=(Map)ActionContext.getContext().get("request");
		
		if(!student.getStudentNo().equals("")){
			List list=teacherService.searchStudentByNo(student.getStudentNo());
			request.put("students",list);
		}else if(!student.getStudentName().equals("")){
			List list=teacherService.searchStudentByName(student.getStudentName());
			request.put("students",list);
		}else{
			List list=teacherService.searchStudentAll();
			request.put("students",list);
		}
		return "searchStudent";
	}
	
	public String getStudentInfo(){
		student=teacherService.getStudentInfo(student.getStudentNo());
		return "getStudentInfo";
	}
	
	public String searchTeacherOwnCourse(){
		request=(Map)ActionContext.getContext().get("request");
		
		session = ActionContext.getContext().getSession();
		int staffId = (Integer) session.get("staffId");
		
		List list=teacherService.getTeacherOwnCourse(staffId);
		request.put("courses", list);
		
		return "searchTeacherOwnCourse";
	}

	public String searchOwnStudent(){
		request=(Map)ActionContext.getContext().get("request");
		
		List list=teacherService.searchStudentByCourseId(course.getCourseId());
		request.put("students",list);
		
		return "searchOwnStudent";
	}
	
	public String getOwnStudentInfo(){
		student=teacherService.getStudentInfo(student.getStudentNo());
		course=teacherService.getCourseById(course.getCourseId());
		register=teacherService.getRegisterByStudentIdCourseId(student.getStudentId(),course.getCourseId());
		return "getOwnStudentInfo";
	}
	
	public String updateStudentCourseScore(){
		teacherService.updateStudentCourseScore(register.getRegisterId(), register.getStudentCourseScore());
		this.getOwnStudentInfo();
		return "updateStudentCourseScore";
	}

	public String getStudentAttendant(){
		request=(Map)ActionContext.getContext().get("request");
		
		List list=teacherService.getStudentAttendant(register.getRegisterId());
		request.put("studentAttendants",list);
		
		return "getStudentAttendant";
	}
	
	public String addStudentAttendant(){
		StudentAttendant studentAttendant = new StudentAttendant();
		register=teacherService.getRegisterById(register.getRegisterId());
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
		int staffId = (Integer) session.get("staffId");
		
		if(!staff.getStaffNo().equals("")){
			List list=teacherService.getOwnCommonTeacherByStaffNo(staffId,staff.getStaffNo());
			request.put("ownCommonTeachers",list);
		}else if(!staff.getStaffName().equals("")){
			List list=teacherService.getOwnCommonTeacherByStaffName(staffId,staff.getStaffName());
			request.put("ownCommonTeachers",list);
		}else{
			List list=teacherService.getOwnCommonTeacher(staffId);
			request.put("ownCommonTeachers",list);
		}
		return "searchOwnCommonTeacher";
	}
	
	public String getOwnCommonTeacherInfo(){
		teacher=teacherService.getOwnTeacherInfo(staff.getStaffId());
		return "getOwnCommonTeacherInfo";
	}

	public String addCommonTeacher1(){
		request=(Map)ActionContext.getContext().get("request");
		
		List list=teacherService.searchteacherLevel();
		request.put("teacherLevels",list);
		
		return "addCommonTeacher1";
	}
	
	public String addCommonTeacher2(){
		boolean flag=teacherService.addCommonTeacher(teacher, teacherLevel.getLevelId(), staff);
		if(flag){
			return "addCommonTeacher2";
		}else{
			return "addCommonTeacher2_default";
		}
	}
	
	public String getCommonTeacherAttandant(){
		request=(Map)ActionContext.getContext().get("request");
		
		List list=teacherService.getCommonTeacherAttandantByStaffId(staff.getStaffId());
		request.put("commonTeacherAttandants",list);
		
		return "getCommonTeacherAttandant";
	}

	public String addCommonTeacherAttandant(){
		StaffAttandant staffAttandant = new StaffAttandant();
		staffAttandant.setStaffInfo(teacherService.getOwnTeacherInfo(staff.getStaffId()).getStaffInfo());
		staffAttandant.setAttendantRemark("");
		staffAttandant.setAttendantTime(new Timestamp(System.currentTimeMillis()));
		
		boolean flag=teacherService.addStaffAttandant(staffAttandant);
		if(flag){
			this.getCommonTeacherAttandant();
			return "addCommonTeacherAttandant";
		}else{
			return "addCommonTeacherAttandant_default";
		}
	}
	
	public String getOwnCourse(){
		request=(Map)ActionContext.getContext().get("request");
		
		session = ActionContext.getContext().getSession();
		int staffId = (Integer) session.get("staffId");
		
		List list=teacherService.searchOwnCourseByStaffId(staffId);
		request.put("courses",list);
		
		return "getOwnCourse";
	}
	
	public String addOwnCourse1(){
		request=(Map)ActionContext.getContext().get("request");
		
		List list=teacherService.searchMajor();
		request.put("majors",list);
		
		return "addOwnCourse1";
	}
	public String addOwnCourse2(){
		session = ActionContext.getContext().getSession();
		int staffId = (Integer) session.get("staffId");
		
		course.setMajorInfo(teacherService.getMajorById(major.getMajorId()));
		course.setCoursePrice((float)0);
		course.setTeacherInfo(teacherService.getOwnTeacherInfo(staffId));
		course.setCourseAvai((int)1);
		

		
		boolean flag=teacherService.addOwnCourse(course);
		if(flag){
//			System.out.println(course.getMajorInfo().getMajorName());
//			System.out.println(course.getTeacherInfo().getStaffInfo().getStaffName());
//			System.out.println(course.getCourseName());
//			System.out.println(course.getCourseStart());
//			System.out.println(course.getCourseEnd());
//			System.out.println(course.getCoursePrice());
//			System.out.println(course.getCourseAvai());
//			System.out.println(course.getCourseDesc());
			
			this.getOwnCourse();
			return "addOwnCourse2";
		}else{
			return "addOwnCourse2_default";
		}
	}
	
	public String getCommonTeacherCourseList(){
		request=(Map)ActionContext.getContext().get("request");
		
		List list=teacherService.searchOwnCourseByStaffId(staff.getStaffId());
		request.put("courses",list);
		
		return "getCommonTeacherCourseList";
	}
	
	public String commonTeacherCourseInfo(){
		course=teacherService.getCourseById(course.getCourseId());
		return "commonTeacherCourseInfo";
	}
	
	public String updateCommonTeacherCoursePrice(){
		float coursePrice=course.getCoursePrice();
		if(coursePrice!=0)
			return	"updateCommonTeacherCoursePrice_default";
		course=teacherService.getCourseById(course.getCourseId());
		course.setCoursePrice(coursePrice);
		teacherService.updateCourse(course);
		teacher=course.getTeacherInfo();
		teacher.setTeacherSalary(course.getCoursePrice()+teacher.getTeacherSalary());
		teacherService.updateTeacher(teacher);
		this.commonTeacherCourseInfo();
		return "updateCommonTeacherCoursePrice";
	}
}
