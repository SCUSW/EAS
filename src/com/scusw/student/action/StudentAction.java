package com.scusw.student.action;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.login.action.LoginAction;
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
	private List<NoticeInfo> noticeInfo;
	private Map<String,Object> request;
	public static Logger logger = Logger.getLogger(LoginAction.class);

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
	 * 方法描述：学生通过学号查询个人信息，调用service层接口
	 * @param studentNo：学号
	 * @return ："success" ——> showInfo.jsp
	 */
	public String queryStudentByNo(){
		studentInfo = studentService.queryStudentByNo(studentInfo.getStudentNo());
		return "success";
	}
	
	/**
	 * 方法描述：更新之前的查询操作，调用service层接口
	 * @param studentId：学号
	 * @return ："update" ——> updateStudent.jsp
	 */
	public String queryStudentBeforeUpdate(){
		studentInfo = studentService.queryStudentByNo(studentInfo.getStudentNo());
		return "update";
	}
	
	/**
	 * 方法描述：学生修改个人信息，调用service层接口
	 * @param student：包含学生所有信息的实体
	 * @return ：查询更新后的学生信息
	 */
	public String updateStudent(){
		studentService.updateStudent(studentInfo);
		return queryStudentByNo();	
	}
	
	/**
	 * 方法描述：学生报名入学，调用service层接口
	 * @param student：包含学生所有信息的实体
	 * @return ："majorInfo" ——>showMajorInfo.jsp
	 */
	public String apply(){
		majorInfo = studentService.apply(studentInfo);
		return "majorInfo";
	}
	
	/**
	 * 方法描述：查询所有公告信息，调用service层接口
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
		return "noticeContent";
	}
	
	/**
	 * 方法描述：专业信息查询，调用service层接口
	 * @param majorName：专业名
	 * @return ："majorInfo" ——>showMajorInfo.jsp
	 */
	public String majorInfoQuery(){
		majorInfo = studentService.majorInfoQuery(studentInfo.getStudentNo());
		return "majorInfo";
	}
	
}
