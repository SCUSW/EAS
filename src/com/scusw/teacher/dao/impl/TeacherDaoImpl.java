package com.scusw.teacher.dao.impl;

import org.hibernate.Query;
import org.hibernate.mapping.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.model.StaffInfo;
import com.scusw.model.TeacherInfo;
import com.scusw.teacher.dao.TeacherDao;


public class TeacherDaoImpl extends HibernateDaoSupport implements TeacherDao {
	public TeacherInfo queryByTeacehrId(int staffId){	
		Query q=this.getSession().createQuery("from TeacherInfo t " +
				"where t.staffId=:staffId");
		q.setParameter("staffId",staffId);
		TeacherInfo t=(TeacherInfo)q.uniqueResult();
		return t;
	}

	public void updateTeacher(StaffInfo staff){
		this.getHibernateTemplate().update(staff);
	}
}
