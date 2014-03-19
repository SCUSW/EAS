package com.scusw.admin.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.admin.dao.TeaLevelDao;
import com.scusw.model.TeacherLevel;


/**
 * 
 * @author liu jiahao
 *
 */

public class TeaLevelDaoImpl extends HibernateDaoSupport implements TeaLevelDao {

	
	/**
	 * query all TeacherLevel
	 */
	public List<TeacherLevel> queryAllTeaLevel() {
		
		Query query = this.getSession().createQuery("from TeacherLevel tl where tl.levelAvai=1");
		List<TeacherLevel> list = query.list();
		return list;
	}

	
	/**
	 * delete TeacherLevel by id
	 */
	public boolean delTeaLevelById(int levelId) {
		
		TeacherLevel teaLevel = this.getHibernateTemplate().get(TeacherLevel.class, levelId);
		this.getHibernateTemplate().delete(teaLevel);
		return true;
	}

	/**
	 * add TeacherLevel
	 */
	public boolean addTeaLevel(TeacherLevel teaLevel) {
		
		this.getSession().save(teaLevel);
		return true;
	}

	
	/**
	 * query TeacherLevel by id
	 */
	public TeacherLevel queryTeaLevelById(int levelId) {
		
		return this.getHibernateTemplate().get(TeacherLevel.class, levelId);
	}

	
	/**
	 * update teacherlevel
	 */
	public boolean updateTeaLevel(TeacherLevel teaLevel) {
		
		this.getSession().update(teaLevel);
		return true;
	}

}
