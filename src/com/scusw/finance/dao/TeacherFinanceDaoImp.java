/**
 * 
 */
package com.scusw.finance.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;

/**
 * @author 杨昭远
 *
 */
public class TeacherFinanceDaoImp extends HibernateDaoSupport implements TeacherFinanceDao{

	/* (non-Javadoc)
	 * @see com.scusw.finance.dao.TeacherFinanceDao#queryAllTeacher()
	 */
	public List<TeacherInfo> queryAllTeacher() {
		// TODO Auto-generated method stub
		List<TeacherInfo> teachers = getHibernateTemplate().find("from TeacherInfo");
		return teachers;
	}

	/* (non-Javadoc)
	 * @see com.scusw.finance.dao.TeacherFinanceDao#queryTeacher(java.lang.String)
	 */
	public List<TeacherInfo> queryTeacher(String staffName) {
		// TODO Auto-generated method stub
		List<TeacherInfo> teachers = getHibernateTemplate().find("from TeacherInfo t where t.staffInfo.staffName like '%" + staffName + "%'");
		return teachers;
	}

}
