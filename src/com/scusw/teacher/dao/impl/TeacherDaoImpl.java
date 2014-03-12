package com.scusw.teacher.dao.impl;

import org.hibernate.Query;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.model.CourseInfo;
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
	
	public List<StudentInfo> queryStudentByTeacherId(int staffId){
		
	//	01.from Brand as b inner join fetch b.styles as s where s.styleId=?  

		Query q=this.getSession().createQuery("from StudentInfo as s " +
				"inner join fetch s.registerInfos as r where r.courseInfo.teacherInfo.staffId=:staffId");
	//	"where s.registerInfos.courseInfo.teacherInfo.staffId=:staffId");
		q.setParameter("staffId",staffId);
		List<StudentInfo> students=q.list();
		return students;
	}
	
	public List queryTeacherOenCourse(int staffId){
		Query q=this.getSession().createQuery("from CourseInfo c where c.teacherInfo.staffId=:staffId");
		q.setParameter("staffId", staffId);
		List courses=q.list();
		return courses;
	}
	
	public List queryStudentByCourseId(int courseId){
		Query q=this.getSession().createQuery("from StudentInfo as s " +
		"inner join fetch s.registerInfos as r where r.courseInfo.courseId=:courseId");
		q.setParameter("courseId",courseId);
		List<StudentInfo> students=q.list();
		return students;
	}
	
	public CourseInfo queryCourseById(int courseId){
		Query q=this.getSession().createQuery("from CourseInfo c " +
		"where c.courseId=:courseId");
		q.setParameter("courseId",courseId);
		CourseInfo c=(CourseInfo)q.uniqueResult();
		return c;
	}
}
