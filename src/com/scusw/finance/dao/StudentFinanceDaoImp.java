/**
 * 
 */
package com.scusw.finance.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.model.StudentInfo;

/**
 * @author Administrator
 *
 */
public class StudentFinanceDaoImp  extends HibernateDaoSupport implements StudentFinanceDao{
	public List<StudentInfo> queryAllStudent() {
//		Query q = this.getSession().createQuery("from StudentInfo s naturl join RollState r")s
		List<StudentInfo> students = getHibernateTemplate().find("from StudentInfo");
		return students;
	}
	
	public List<StudentInfo> queryStudent(String studentName){
		//更安全的做法？
		List<StudentInfo> students = getHibernateTemplate().find("from StudentInfo s where s.studentName like '%" + studentName + "%'");
		System.out.println(students);
		return students;
	}
}
