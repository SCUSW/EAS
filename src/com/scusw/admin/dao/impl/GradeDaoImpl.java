package com.scusw.admin.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.scusw.admin.dao.GradeDao;
import com.scusw.model.GradeInfo;

public class GradeDaoImpl extends HibernateTemplate implements GradeDao {

	public List<GradeInfo> queryGrade() {
		// TODO Auto-generated method stub
		Query query = this.getSession().createQuery("from GradeInfo");
		List<GradeInfo> list = query.list();
		return list;
	}

}
