package com.scusw.student.service;

import java.util.List;

import com.scusw.model.MajorInfo;
import com.scusw.model.NoticeInfo;
import com.scusw.model.StudentInfo;

/**
 * 类描述：学生服务层接口类
 * @author 曾植
 * @data：日期：2014-3-10 时间：上午11:38:39
 * version 1.0
 */
public interface StudentService {
	public StudentInfo queryStudentByNo(String studentNo);
	public void updateStudent(StudentInfo student);
	public MajorInfo apply(StudentInfo student);
	public List<NoticeInfo> noticeInfoQuery();
	public MajorInfo majorInfoQuery(String studentNo);
}
