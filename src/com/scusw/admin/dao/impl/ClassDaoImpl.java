package com.scusw.admin.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.scusw.admin.dao.ClassDao;
import com.scusw.model.ClassInfo;

public class ClassDaoImpl extends HibernateTemplate implements ClassDao {
	public static Logger logger = Logger.getLogger(ClassDaoImpl.class);
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
	
	

	public void deleteClass(int classId) {
		// TODO Auto-generated method stub
		ClassInfo ci = (ClassInfo) this.getSession().get(ClassInfo.class, classId);
		this.getSession().delete(ci);
		logger.info("删除班级" + classId);
	}

	public void updateStudentForDelClass(int classId) {
		// TODO Auto-generated method stub
		
	}

	public ClassInfo checkClass(int classId) {
		// TODO Auto-generated method stub
		return (ClassInfo) this.getSession().get(ClassInfo.class, classId);
	}

	public void updateGradeIdOfClass(int classId, int gradeId) {
		// TODO Auto-generated method stub
		String hqlUpdate = "update ClassInfo ci set ci.gradeInfo.gradeId=:gradeId where ci.classId=:classId";
		int updatedEntities = this.getSession().createQuery(hqlUpdate).setParameter("gradeId",gradeId).setParameter("classId", classId).executeUpdate();
		logger.info("更新班级所属年级：" + classId + "--->" + gradeId);
	}
	
	public void updateGradeIdOfClass(int classId) {
		// TODO Auto-generated method stub、
		String hqlUpdate = "update ClassInfo ci set ci.gradeInfo=null where ci.classId=:classId";
		int updatedEntities = this.getSession().createQuery(hqlUpdate).setParameter("classId", classId).executeUpdate();
		logger.info("更新班级所属年级：" + classId + "--->null");
	}

	public void updateClassNameOfClass(int classId, String className) {
		// TODO Auto-generated method stub
		String hqlUpdate = "update ClassInfo ci set ci.className=:className where ci.classId=:classId";
		int updatedEntities = this.getSession().createQuery(hqlUpdate).setParameter("className",className).setParameter("classId", classId).executeUpdate();
		logger.info("更新班级名称：" + classId + "--->" + className);
	}

	public void addClass(ClassInfo ci) {
		// TODO Auto-generated method stub
		this.getSession().save(ci);
		logger.info("添加班级：" + ci.getClassName());
	}
	

}
