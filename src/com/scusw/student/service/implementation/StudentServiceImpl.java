package com.scusw.student.service.implementation;

import java.util.List;

import com.scusw.model.MajorInfo;
import com.scusw.model.NoticeInfo;
import com.scusw.model.StudentInfo;
import com.scusw.student.dao.StudentDao;
import com.scusw.student.service.StudentService;

/**
 * 类描述：学生服务层接口实现类
 * @author 曾植
 * @data：日期：2014-3-10 时间：上午11:44:44
 * version 1.0
 */
public class StudentServiceImpl implements StudentService {

	private StudentDao studentDao;
	
	/**
	 * @return the studentDao
	 */
	public StudentDao getStudentDao() {
		return studentDao;
	}
	/**
	 * @param studentDao the studentDao to set
	 */
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	/**
	 * 方法描述：学生通过学号查询自己的信息，调用Dao层接口
	 * @param studentNo：学生学号
	 * @return ：包含学生全部信息的实体
	 */
	public StudentInfo queryStudentByNo(String studentNo) {
		return studentDao.queryStudentByNo(studentNo);
	}

	/**
	 * 方法描述：学生修改自己的信息，调用Dao层接口
	 * @param ：包含学生全部信息的实体
	 */
	public void updateStudent(StudentInfo student) {
		studentDao.updateStudent(student);
	}

	/**
	 * 方法描述：学生报名，调用Dao层接口
	 * @param student：包含学生全部信息的实体
	 * @return ：学生报名专业所有信息的实体
	 */
	public MajorInfo apply(StudentInfo student) {
		return studentDao.apply(student);
	}

	/**
	 * 方法描述：学生查询公告信息，调用Dao层接口
	 * @return ：包含公告信息的实体的集合
	 */
	public List<NoticeInfo> noticeInfoQuery() {
		return studentDao.noticeInfoQuery();
	}

	/**
	 * 方法描述：学生查询专业信息，调用Dao层接口
	 * @param majorName：专业名
	 * @return ：包含专业信息的实体
	 */
	public MajorInfo majorInfoQuery(String studentNo) {
		return studentDao.majorInfoQuery(studentNo);
	}

}
