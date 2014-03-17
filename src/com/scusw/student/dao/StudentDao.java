package com.scusw.student.dao;

import java.util.List;

import com.scusw.model.CourseInfo;
import com.scusw.model.MajorInfo;
import com.scusw.model.NoticeInfo;
import com.scusw.model.RegisterInfo;
import com.scusw.model.StudentInfo;

/**
 * 类描述：学生可使用的方法的接口
 * @author 曾植
 * @data：日期：2014-3-10 时间：上午10:30:55
 * version 1.0
 */
public interface StudentDao {
	public StudentInfo queryStudentByNo(String studentNo);
	public void updateStudent(StudentInfo student);
	public MajorInfo apply(StudentInfo student);
	public List<NoticeInfo> noticeInfoQuery();
	public MajorInfo majorInfoQuery(String majorName);
	public String queryNoticeContent(int noticeId);
	public List<Object[]> queryCourse(String studentNo);
	public List<CourseInfo> queryAllCourse();
	public boolean checkIsCourseSelect(int studentId,int[] courseInfo);
	public void addRegisterInfo(List<RegisterInfo> registerInfos);
}