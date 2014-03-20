package com.scusw.admin.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.scusw.admin.dao.GradeDao;
import com.scusw.model.GradeInfo;

public class GradeDaoImpl extends HibernateTemplate implements GradeDao {
	public static Logger logger = Logger.getLogger(GradeDaoImpl.class);
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
		logger.info("删除年级："+gradeInfo.getGradeName());
	}

	public void updateClassForDelGrade(int gradeId) {
		// TODO Auto-generated method stub
		String hqlUpdate = "update ClassInfo ci set ci.gradeInfo=null where ci.gradeInfo.gradeId=:gradeId";
		int updatedEntities = this.getSession().createQuery(hqlUpdate).setParameter("gradeId",gradeId).executeUpdate();
		logger.info("更新该年级的班级数量："+updatedEntities);
	}
	public GradeInfo checkGrade(int gradeId) {
		return (GradeInfo) this.getSession().get(GradeInfo.class, gradeId);
	}

	public void addGrade(GradeInfo gi) {
		// TODO Auto-generated method stub
		this.getSession().save(gi);
		logger.info("添加年级：" + gi.getGradeName());
	}
	

}
