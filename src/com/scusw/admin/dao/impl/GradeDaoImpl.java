package com.scusw.admin.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.scusw.admin.dao.GradeDao;
import com.scusw.model.ClassInfo;
import com.scusw.model.GradeInfo;

public class GradeDaoImpl extends HibernateTemplate implements GradeDao {

	public List<GradeInfo> queryGrade() {
		// TODO Auto-generated method stub
		Query query = this.getSession().createQuery("from GradeInfo");
		List<GradeInfo> list = query.list();
		return list;
	}

	public void deleteGrade(int gradeId) {
		// TODO Auto-generated method stub
		GradeInfo gradeInfo = (GradeInfo) this.getSession().get(GradeInfo.class, gradeId);
		this.getSession().delete(gradeInfo);
	}

	public void updateClassForDelGrade(int gradeId) {
		// TODO Auto-generated method stub
		String hqlUpdate = "update ClassInfo ci set ci.gradeInfo=null where ci.gradeInfo.gradeId=:gradeId";
		int updatedEntities = this.getSession().createQuery(hqlUpdate).setParameter("gradeId",gradeId).executeUpdate();
		System.out.println("更新数据数量："+updatedEntities);
	}
	

}
