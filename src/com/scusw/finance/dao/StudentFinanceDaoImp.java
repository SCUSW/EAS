/**
 * 
 */
package com.scusw.finance.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.model.FinancialRecords;
import com.scusw.model.StudentFees;
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
	public StudentInfo getRecordById(int studentId) {
		Query q = this.getSession().createQuery("from StudentInfo s where s.studentId=:studentId");
		q.setParameter("studentId", studentId);
		StudentInfo studentInfo = (StudentInfo) q.uniqueResult();
		return studentInfo;
	}

	/* (non-Javadoc)
	 * @see com.scusw.finance.dao.StudentFinanceDao#getBalanceById(int)
	 */
	public float getBalanceById(int studentId) {
		// TODO Auto-generated method stub
		Query q = this.getSession().createQuery("from StudentInfo s where s.studentId=:studentId");
		q.setParameter("studentId", studentId);
		StudentInfo studentInfo = (StudentInfo) q.uniqueResult();
		
		return studentInfo.getStudentBalance();
	}

	/* (non-Javadoc)
	 * @see com.scusw.finance.dao.StudentFinanceDao#updateBalanceById(int, float)
	 */
	public void updateBalanceById(int studentId, float balanceNow) {
		// TODO Auto-generated method stub
		Query q = this.getSession().createQuery("from StudentInfo s where s.studentId=:studentId");
		q.setParameter("studentId", studentId);
		StudentInfo studentInfo = (StudentInfo) q.uniqueResult();
		studentInfo.setStudentBalance(balanceNow);
		
		this.getHibernateTemplate().update(studentInfo);
		
	}

	/* (non-Javadoc)
	 * @see com.scusw.finance.dao.StudentFinanceDao#addRecordToFees(com.scusw.model.StudentFees)
	 */
	public void addRecordToFees(StudentFees studentFees) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(studentFees);
		
	}
	
	
}
