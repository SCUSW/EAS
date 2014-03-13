/**
 * 
 */
package com.scusw.finance.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.model.FinancialRecords;
import com.scusw.model.StudentInfo;

/**
 * @author 杨昭远
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

	/* (non-Javadoc)
	 * @see com.scusw.finance.dao.StudentFinanceDao#getRecordByNo(java.lang.String)
	 */
	public StudentInfo getRecordByNo(String studentNo) {
		Query q = this.getSession().createQuery("from StudentInfo s where s.studentNo=:studentNo");
		q.setParameter("studentNo", studentNo);
		StudentInfo studentInfo = (StudentInfo) q.uniqueResult();
		return studentInfo;
	}
}
