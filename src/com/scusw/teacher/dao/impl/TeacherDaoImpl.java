package com.scusw.teacher.dao.impl;

import org.hibernate.Query;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.model.CourseInfo;
import com.scusw.model.GroupInfo;
import com.scusw.model.MajorInfo;
import com.scusw.model.PositionInfo;
import com.scusw.model.RegisterInfo;
import com.scusw.model.StaffAttandant;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;
import com.scusw.model.StudentAttendant;
import com.scusw.model.TeacherLevel;
import com.scusw.model.TeachingManageInfo;
import com.scusw.teacher.dao.TeacherDao;


public class TeacherDaoImpl extends HibernateDaoSupport implements TeacherDao {
	
	public TeacherInfo queryByTeacehrId(int staffId){	
		Query q=this.getSession().createQuery("from TeacherInfo t " +
				"where t.staffInfo.staffId=:staffId");
		q.setParameter("staffId",staffId);
		TeacherInfo t=(TeacherInfo)q.uniqueResult();
		return t;
	}

	public void updateTeacherStaff(StaffInfo staff){
		this.getHibernateTemplate().update(staff);
	}
	
	
//	public List<StudentInfo> searchStudentByNo(String studentNo){
//		Query q=this.getSession().createQuery("from StudentInfo s where s.studentNo=:studentNo");
//		q.setParameter("studentNo",studentNo);
//		List<StudentInfo> students=q.list();
//		return students;
//	}
	
	public List<StudentInfo> searchStudentByNo(String studentNo){
		Query q=this.getSession().createQuery("from StudentInfo s where s.studentNo like '"+studentNo+"%'");
		List<StudentInfo> students=q.list();
		return students;
	}
	
//	public List<StudentInfo> searchStudentByName(String studentName){
//		Query q=this.getSession().createQuery("from StudentInfo s where s.studentName=:studentName");
//		q.setParameter("studentName",studentName);
//		List<StudentInfo> students=q.list();
//		return students;
//	}
	public List<StudentInfo> searchStudentByName(String studentName){
		Query q=this.getSession().createQuery("from StudentInfo s where s.studentName like '%"+studentName+"%'");
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
	
	public RegisterInfo queryRegisterByStudentIdCourseId(int studentId,int courseId){
		Query q=this.getSession().createQuery("from RegisterInfo r " +
				"where r.studentInfo.studentId=:studentId and r.courseInfo.courseId=:courseId");
		q.setParameter("studentId", studentId);
		q.setParameter("courseId",courseId);
		RegisterInfo r=(RegisterInfo)q.uniqueResult();
		return r;
	}
	
	public RegisterInfo queryRegisterByRegisterId(int registerId){
		Query q=this.getSession().createQuery("from RegisterInfo r where r.registerId=:registerId");
		q.setParameter("registerId", registerId);
		RegisterInfo r=(RegisterInfo)q.uniqueResult();
		return r;
	}
	
	public void updateStudentCourseScore(RegisterInfo rr){
		this.getHibernateTemplate().update(rr);
	}
	
	public List queryStudentAttendantByRegisterId(int registerId){
		Query q=this.getSession().createQuery("from StudentAttendant s where s.registerInfo.registerId=:registerId");
		q.setParameter("registerId", registerId);
		List<StudentAttendant> studentAttendants=q.list();
		return studentAttendants;	
	}
	
	public StudentAttendant queryStudentAttendantByStudentAttendantId(int studentAttendantId){
		Query q=this.getSession().createQuery("from StudentAttendant s where s.attendantId=:studentAttendantId");
		q.setParameter("studentAttendantId", studentAttendantId);
		StudentAttendant studentAttendant=(StudentAttendant)q.uniqueResult();
		return studentAttendant;
	}
	
	
	public RegisterInfo queryRegisterByStudentAttendantId(int studentAttendantId){
		Query q=this.getSession().createQuery("from RegisterInfo r " +
				"inner join fetch r.studentAttendants s where s.attendantId=:studentAttendantId");
		q.setParameter("studentAttendantId", studentAttendantId);
		RegisterInfo register=(RegisterInfo)q.uniqueResult();
		return register;
	}
	
	public void addStudentAttendant(StudentAttendant studentAttendantInfo){
		this.getHibernateTemplate().save(studentAttendantInfo);
	}
	
	public List queryOwnCommonTeacher(int branchId){
		Query q=this.getSession().createQuery("from TeacherInfo t where t.teacherType=0 " +
				"and t.staffInfo.positionInfo.departmentInfo.branchInfo.branchId=:branchId");
		q.setParameter("branchId", branchId);
		List commonTeachers=q.list();
		return commonTeachers;
	}
	
	public List queryOwnCommonTeacherByStaffNo(int branchId, String staffNo){
		Query q=this.getSession().createQuery("from TeacherInfo t where t.teacherType=0 " +
		"and t.staffInfo.positionInfo.departmentInfo.branchInfo.branchId=:branchId and t.staffInfo.staffNo like '"+staffNo+"%'");
		q.setParameter("branchId", branchId);
		List commonTeachers=q.list();
		return commonTeachers;
	}
	
	public List queryOwnCommonTeacherByStaffName(int branchId, String staffName){
		Query q=this.getSession().createQuery("from TeacherInfo t where t.teacherType=0 " +
		"and t.staffInfo.positionInfo.departmentInfo.branchInfo.branchId=:branchId and t.staffInfo.staffName like '%"+staffName+"%'");
		q.setParameter("branchId", branchId);
		List commonTeachers=q.list();
		return commonTeachers;
	}
	
	public List queryAllTeacherLevel(){
		Query q=this.getSession().createQuery("from TeacherLevel");
		List teacherLevels=q.list();
		return teacherLevels;
	}
	
	public PositionInfo queryPositionById(int vocationId){
		Query q=this.getSession().createQuery("from PositionInfo p where p.vocationId=:vocationId");
		q.setParameter("vocationId", vocationId);
		PositionInfo positionInfo=(PositionInfo) q.uniqueResult();
		return positionInfo;
	}
	
	public GroupInfo queryGroupById(int groupId){
		Query q=this.getSession().createQuery("from GroupInfo p where p.groupId=:groupId");
		q.setParameter("groupId", groupId);
		GroupInfo groupInfo=(GroupInfo) q.uniqueResult();
		return groupInfo;
	}
	
	public void addCommonTeacehr(TeacherInfo teacher){
		this.getHibernateTemplate().save(teacher);
	}
	
	public TeacherLevel queryTeacherLevelById(int levelId){
		Query q=this.getSession().createQuery("from TeacherLevel f where f.levelId=:levelId");
		q.setParameter("levelId", levelId);
		TeacherLevel teacherLevel=(TeacherLevel) q.uniqueResult();
		return teacherLevel;
	}
	
	public void addStaff(StaffInfo staff){
		this.getHibernateTemplate().save(staff);
	}
	
	public StaffInfo queryStaffByNo(String staffNo){
		Query q=this.getSession().createQuery("from StaffInfo s where s.staffNo=:staffNo");
		q.setParameter("staffNo", staffNo);
		StaffInfo staff=(StaffInfo) q.uniqueResult();
		return staff;
	}
	
	public TeacherInfo queryTeacherByNo(String teacherNo){
		Query q=this.getSession().createQuery("from TeacherInfo t where t.teacherNo=:teacherNo");
		q.setParameter("teacherNo", teacherNo);
		TeacherInfo teacher=(TeacherInfo) q.uniqueResult();
		return teacher;
	}
	
	public StaffInfo queryStaffByIdcard(String staffIdcard){
		Query q=this.getSession().createQuery("from StaffInfo s where s.staffIdcard=:staffIdcard");
		q.setParameter("staffIdcard", staffIdcard);
		StaffInfo staff=(StaffInfo) q.uniqueResult();
		return staff;
	}
	
	public List queryStaffAttandantByStaffId(Integer staffId){
		Query q=this.getSession().createQuery("from StaffAttandant s where s.staffInfo.staffId=:staffId");
		q.setParameter("staffId", staffId);
		List staffAttandants=q.list();
		return  staffAttandants;
	}
	
	public void addStaffAttandant(StaffAttandant staffAttandant){
		this.getHibernateTemplate().save(staffAttandant);
	}
	
	public List queryCourseByStaffId(int staffId){
		Query q=this.getSession().createQuery("from CourseInfo c where c.teacherInfo.staffId=:staffId");
		q.setParameter("staffId", staffId);
		List courses=q.list();
		return courses;
	}
	
	public List queryAllMajor(){
		Query q=this.getSession().createQuery("from MajorInfo m");
		List majors=q.list();
		return majors;
	}
	
	public void addCourse(CourseInfo course){
		this.getHibernateTemplate().save(course);
	}
	
	public MajorInfo queryMajorById(Integer majorId){
		Query q=this.getSession().createQuery("from MajorInfo m where m.majorId=:majorId");
		q.setParameter("majorId", majorId);
		MajorInfo major=(MajorInfo) q.uniqueResult();
		return major;
	}
	
	public void updateCourse(CourseInfo course){
		this.getHibernateTemplate().update(course);
	}
	
	public void updateTeacher(TeacherInfo teacher){
		this.getHibernateTemplate().update(teacher);
	}
	
	public List queryOwnTeachingManageByCourseId(Integer courseId){
		Query q=this.getSession().createQuery("from TeachingManageInfo t where t.courseInfo.courseId=:courseId");
		q.setParameter("courseId", courseId);
		List teachingManageInfos=q.list();
		return teachingManageInfos;
	}
	
	public void addTeachingManage(TeachingManageInfo teachingManage){
		this.getHibernateTemplate().save(teachingManage);
	}
	
	public TeachingManageInfo queryTeachingManageById(Integer teachingManageId){
		Query q=this.getSession().createQuery("from TeachingManageInfo t where t.teachingManageId=:teachingManageId");
		q.setParameter("teachingManageId", teachingManageId);
		TeachingManageInfo teachingManage=(TeachingManageInfo) q.uniqueResult();
		return teachingManage;
	}

	public void updateTeachingManage(TeachingManageInfo teachingManage){
		this.getHibernateTemplate().update(teachingManage);
	}
}
