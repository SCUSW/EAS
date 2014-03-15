package com.scusw.admin.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.scusw.admin.dao.ClassDao;
import com.scusw.model.ClassInfo;

public class ClassDaoImpl extends HibernateTemplate implements ClassDao {

	public List<ClassInfo> queryClass() {
		// TODO Auto-generated method stub
		Query query = this.getSession().createQuery("from ClassInfo ci");
		List<ClassInfo> list = query.list();
		return list;
	}

	public List<ClassInfo> checkClassForGrade(int id) {
		// TODO Auto-generated method stub
		Query query = this.getSession().createQuery("from ClassInfo ci where ci.gradeInfo.gradeId=:gradeId");
		query.setParameter("gradeId", id);
		List<ClassInfo> list = query.list();
		return list;
	}

	public void deleteClassForGrade(int gradeId) {
		// TODO Auto-generated method stub
		List<ClassInfo> list = (List<ClassInfo>) this.getSession().get(ClassInfo.class,gradeId);
		this.getSession().delete(list);
	}

	public void deleteClass() {
		// TODO Auto-generated method stub
		
	}

}
