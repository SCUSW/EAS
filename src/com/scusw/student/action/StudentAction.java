package com.scusw.student.action;

import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.login.action.LoginAction;
import com.scusw.model.CourseInfo;
import com.scusw.model.MajorInfo;
import com.scusw.model.NoticeInfo;
import com.scusw.model.StudentInfo;
import com.scusw.student.service.StudentService;

/**
 * 类描述：学生动作层实现类
 * @author 曾植
 * @data：日期：2014-3-10 时间：下午3:38:07
 * version 1.0
 */
public class StudentAction {
	
	private StudentService studentService;
	private StudentInfo studentInfo;
	private MajorInfo majorInfo;
	private String noticeContent;
	private int noticeId;
	private List<NoticeInfo> noticeInfo;
	private List<CourseInfo> courseInfo;
	private List<CourseInfo> allCourseInfo;
	private Map<String,Object> request;
	private int[] selectCourseId;
	private String[][] classroom;
	private String[][] classhourEveryWeek;
	private boolean[] flags;
	private Map<String, Object> session;
	public static Logger logger = Logger.getLogger(LoginAction.class);

	/**
	 * @return the flags
	 */
	public boolean[] getFlags() {
		return flags;
	}
	/**
	 * @param flags the flags to set
	 */
	public void setFlags(boolean[] flags) {
		this.flags = flags;
	}
	/**
	 * @return the allCourseInfo
	 */
	public List<CourseInfo> getAllCourseInfo() {
		return allCourseInfo;
	}
	/**
	 * @param allCourseInfo the allCourseInfo to set
	 */
	public void setAllCourseInfo(List<CourseInfo> allCourseInfo) {
		this.allCourseInfo = allCourseInfo;
	}
	/**
	 * @return the classhourEveryWeek
	 */
	public String[][] getClasshourEveryWeek() {
		return classhourEveryWeek;
	}
	/**
	 * @param classhourEveryWeek the classhourEveryWeek to set
	 */
	public void setClasshourEveryWeek(String[][] classhourEveryWeek) {
		this.classhourEveryWeek = classhourEveryWeek;
	}
	/**
	 * @return the classroom
	 */
	public String[][] getClassroom() {
		return classroom;
	}
	/**
	 * @param classroom the classroom to set
	 */
	public void setClassroom(String[][] classroom) {
		this.classroom = classroom;
	}
	/**
	 * @return the courseInfo
	 */
	public List<CourseInfo> getCourseInfo() {
		return courseInfo;
	}
	/**
	 * @param courseInfo the courseInfo to set
	 */
	public void setCourseInfo(List<CourseInfo> courseInfo) {
		this.courseInfo = courseInfo;
	}
	/**
	 * @return the selectCourseId
	 */
	public int[] getSelectCourseId() {
		return selectCourseId;
	}
	/**
	 * @param selectCourseId the selectCourseId to set
	 */
	public void setSelectCourseId(int[] selectCourseId) {
		this.selectCourseId = selectCourseId;
	}
	/**
	 * @return the noticeId
	 */
	public int getNoticeId() {
		return noticeId;
	}
	/**
	 * @param noticeId the noticeId to set
	 */
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	/**
	 * @return the studentService
	 */
	public StudentService getStudentService() {
		return studentService;
	}
	/**
	 * @param studentService the studentService to set
	 */
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	/**
	 * @return the studentInfo
	 */
	public StudentInfo getStudentInfo() {
		return studentInfo;
	}
	/**
	 * @param studentInfo the studentInfo to set
	 */
	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}
	/**
	 * @return the majorInfo
	 */
	public MajorInfo getMajorInfo() {
		return majorInfo;
	}
	/**
	 * @param majorInfo the majorInfo to set
	 */
	public void setMajorInfo(MajorInfo majorInfo) {
		this.majorInfo = majorInfo;
	}
	/**
	 * @return the noticeContent
	 */
	public String getNoticeContent() {
		return noticeContent;
	}
	/**
	 * @param noticeContent the noticeContent to set
	 */
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	/**
	 * @return the noticeInfo
	 */
	public List<NoticeInfo> getNoticeInfo() {
		return noticeInfo;
	}
	/**
	 * @param noticeInfo the noticeInfo to set
	 */
	public void setNoticeInfo(List<NoticeInfo> noticeInfo) {
		this.noticeInfo = noticeInfo;
	}
	/**
	 * @return the request
	 */
	public Map<String, Object> getRequest() {
		return request;
	}
	/**
	 * @param request the request to set
	 */
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	/**
	 * 方法描述：学生通过学号查询个人信息
	 * @param studentNo：学号
	 * @return ："success" ——> showInfo.jsp
	 */
	public String queryStudentByNo(){
		studentInfo = studentService.queryStudentByNo(studentInfo.getStudentNo());
		return "success";
	}
	
	/**
	 * 方法描述：更新之前的查询操作
	 * @param studentId：学号
	 * @return ："update" ——> updateStudent.jsp
	 */
	public String queryStudentBeforeUpdate(){
		studentInfo = studentService.queryStudentByNo(studentInfo.getStudentNo());
		return "update";
	}
	
	/**
	 * 方法描述：学生修改个人信息
	 */
	public String updateStudent(){
		session = ActionContext.getContext().getSession();
		String studentNo = (String) session.get("studentNo");
		studentService.updateStudent(studentInfo, studentNo);
		return queryStudentByNo();	
	}
	
	/**
	 * 方法描述：学生报名入学
	 * @param student：包含学生所有信息的实体
	 * @return ："majorInfo" ——>showMajorInfo.jsp
	 */
	public String apply(){
		majorInfo = studentService.apply(studentInfo);
		return "majorInfo";
	}
	
	/**
	 * 方法描述：查询所有公告信息
	 * @return : "notice" ——> showNotice.jsp
	 */
	public String noticeInfoQuery(){
		noticeInfo = studentService.noticeInfoQuery();
		request=(Map)ActionContext.getContext().get("request");
		request.put("noticeInfo",noticeInfo);
		return "notice";
	}
	
	/**
	 * 方法描述：显示公告内容
	 * @return ："noticeContent" ——> showNoticeContent.jsp
	 */
	public String showNoticeContent(){
		noticeContent = studentService.queryNoticeContent(noticeId);
		return "noticeContent";
	}
	
	/**
	 * 方法描述：专业信息查询
	 * @param majorName：专业名
	 * @return ："majorInfo" ——>showMajorInfo.jsp
	 */
	public String majorInfoQuery(){
		majorInfo = studentService.majorInfoQuery(studentInfo.getStudentNo());
		return "majorInfo";
	}
	
	/**
	 * 方法描述：查询所选课程
	 * @return ："courseInfo" ——> queryCourseInfo.jsp
	 */
	public String queryCourse(){
		courseInfo = studentService.queryCourse(studentInfo.getStudentNo());
		request=(Map)ActionContext.getContext().get("request");
		request.put("courseInfo",courseInfo);
		queryClassroom(courseInfo);
		queryClasshour(courseInfo);
		return "courseInfo";
	}
	/**
	 * 方法描述：查询所选课程
	 */
	public void queryCourseButNoReturn(){
		courseInfo = studentService.queryCourse(studentInfo.getStudentNo());
		CourseInfo[] c = new CourseInfo[courseInfo.size()];
		for(int i = 0; i < courseInfo.size(); i ++){
			c[i] = courseInfo.get(i);
		}
		request=(Map)ActionContext.getContext().get("request");
		request.put("selectCourse",c);
	}
	
	/**
	 * 方法描述：查询所有课程
	 * @return ："allCourseInfo" ——>  selectCourses.jsp
	 */
	public String queryAllCourse(){
		allCourseInfo = studentService.queryAllCourse();
		request=(Map)ActionContext.getContext().get("request");
		request.put("allCourseInfo",allCourseInfo);
		queryClassroom(allCourseInfo);
		queryClasshour(allCourseInfo);
		queryCourseButNoReturn();
		flags = studentService.checkIsCourseSelect(courseInfo, allCourseInfo);
		return "allCourseInfo";
	}
	
	/**
	 * 方法描述：查询上课地点
	 * @param courseInfo ： 所有被查询课程
	 */
	public void queryClassroom(List<CourseInfo> courseInfo){
		classroom = studentService.queryClassroom(courseInfo);
	}
	
	/**
	 * 方法描述：查询上课时间
	 * @param courseInfo ：所有被查询课程
	 */
	public void queryClasshour(List<CourseInfo> courseInfo){
		classhourEveryWeek = studentService.queryClasshour(courseInfo);
	}
	/**
	 * 方法描述：添加学生所选课程
	 * @return ： true ——> queryCourse()
	 * 			 false ——> selectCourseDefault.jsp
	 */
	public String addRegisterInfo(){
		boolean flag = studentService.addRegisterInfo(selectCourseId,studentInfo.getStudentNo());
		if(flag)
			return queryCourse();
		else
			return "selectCourseDefault";
	}
}
