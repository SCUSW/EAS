package com.scusw.teacher.dao.impl;

import org.hibernate.Query;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;
import com.scusw.teacher.dao.TeacherDao;


public class TeacherDaoImpl extends HibernateDaoSupport implements TeacherDao {
	
	public TeacherInfo queryByTeacehrId(int staffId){	
		Query q=this.getSession().createQuery("from TeacherInfo t " +
				"where t.staffInfo.staffId=:staffId");
		q.setParameter("staffId",staffId);
		TeacherInfo t=(TeacherInfo)q.uniqueResult();
		return t;
	}

	public void updateTeacher(StaffInfo staff){
		this.getHibernateTemplate().update(staff);
	}
	
	
	public List<StudentInfo> searchStudentByNo(String studentNo){
		Query q=this.getSession().createQuery("from StudentInfo s where s.studentNo=:studentNo");
		q.setParameter("studentNo",studentNo);
		List<StudentInfo> students=q.list();
		return students;
	}
	
	public List<StudentInfo> searchStudentByName(String studentName){
		Query q=this.getSession().createQuery("from StudentInfo s where s.studentName=:studentName");
		q.setParameter("studentName",studentName);
		List<StudentInfo> students=q.list();
		return students;
	}
	
	public List<StudentInfo> searchStudentAll(){
		Query q=this.getSession().createQuery("from StudentInfo");
		List<StudentInfo> students=q.list();
		return students;
	}
	
	public StudentInfo queryByStudentNo(String studentNo){
		Query q=this.getSession().createQuery("from StudentInfo s " +
		"where s.studentNo=:studedntNo");
		q.setParameter("studedntNo",studentNo);
		StudentInfo s=(StudentInfo)q.uniqueResult();
		return s;
	}
}
