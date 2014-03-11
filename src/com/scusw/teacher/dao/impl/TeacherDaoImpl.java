package com.scusw.teacher.dao.impl;

import org.hibernate.Query;
import org.hibernate.mapping.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.model.StaffInfo;
import com.scusw.model.TeacherInfo;
import com.scusw.teacher.dao.TeacherDao;


public class TeacherDaoImpl extends HibernateDaoSupport implements TeacherDao {
	public TeacherInfo queryByTeacehrId(int staffId){
		return null;
	}

}
