package com.scusw.student.dao.implementation;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.student.dao.StudentDao;
import com.scusw.login.action.LoginAction;
import com.scusw.model.MajorInfo;
import com.scusw.model.NoticeInfo;
import com.scusw.model.StudentInfo;

/**
 * 类描述：学生可使用的方法的实现
 * @author 曾植
 * @data：日期：2014-3-10 时间：上午10:44:44
 * version 1.0
 */
public class StudentDaoImpl extends HibernateDaoSupport implements StudentDao {
	
	public static Logger logger = Logger.getLogger(LoginAction.class);
		
	/**
	 * 方法描述：学生通过学号查询自己的信息
	 * @param studentNo：学生学号
	 * @return studentInfo：包含学生全部信息的实体
	 */
	public StudentInfo queryStudentByNo(String studentNo) {
		Query q = this.getSession().createQuery("from StudentInfo s where s.studentNo=:studentNo");
		q.setParameter("studentNo", studentNo);
		StudentInfo studentInfo = (StudentInfo) q.uniqueResult();
		return studentInfo;
	}
	
	/**
	 * 方法描述：学生修改自己的信息
	 * @param student：包含学生全部信息的实体
	 */
	public void updateStudent(StudentInfo student) {
		logger.info(student.getStudentName());
		this.getHibernateTemplate().update(student);
	}
	
	/**
	 * 方法描述：学生报名
	 * @param student：包含学生全部信息的实体
	 * @return major：学生报名专业所有信息的实体
	 */
	public MajorInfo apply(StudentInfo student) {
		this.getHibernateTemplate().save(student);
		Query q = this.getSession().createQuery("from MajorInfo m where m.majorName=:majorName");
		q.setParameter("majorName", student.getStudentMajor());
		MajorInfo major = (MajorInfo) q.uniqueResult();
		return major;
	}
	
	/**
	 * 方法描述：学生查询公告信息
	 * @return notice：包含公告信息的实体的集合
	 */
	public List<NoticeInfo> noticeInfoQuery() {
		List<NoticeInfo> notice=getHibernateTemplate().find("from NoticeInfo");
		return notice;
	}
	
	/**
	 * 方法描述：学生查询专业信息
	 * @param majorName：专业名
	 * @return major：包含专业信息的实体
	 */
	public MajorInfo majorInfoQuery(String studentNo) {
		StudentInfo studentInfo = queryStudentByNo(studentNo);
		Query q = this.getSession().createQuery("from MajorInfo m where m.majorName=:majorName");
		q.setParameter("majorName", studentInfo.getStudentMajor());
		MajorInfo major = (MajorInfo) q.uniqueResult();
		return major;
	}
}
