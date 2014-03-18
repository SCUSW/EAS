package com.scusw.educational.dao;


import java.sql.Time;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import java.util.List;



import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.model.ClasshourInfo;
import com.scusw.model.ClassroomInfo;
import com.scusw.model.CourseClasshour;
import com.scusw.model.CourseInfo;
import com.scusw.model.GroupInfo;
import com.scusw.model.MajorInfo;
import com.scusw.model.PositionInfo;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentAttendant;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;
import com.scusw.model.TeacherLevel;


public class EducationalDao extends HibernateDaoSupport{
	

	public List<StudentInfo> queryStu(StudentInfo stu) {
		
	
		String sql=new String();
		sql="from StudentInfo u where 1=1";
		
		if(!"".equals(stu.getStudentName()))
			sql=sql+" and u.studentName=:name";
		if(!"".equals(stu.getStudentNo()))
			sql=sql+" and u.studentNo=:number";
		if(!"".equals(stu.getStudentMajor()))
			sql=sql+" and u.studentMajor=:major";
	
		Query s=this.getSession().createQuery(sql);
		
		if(!"".equals(stu.getStudentName()))
		   s.setParameter("name",stu.getStudentName());
		if(!"".equals(stu.getStudentNo()))
	       s.setParameter("number",stu.getStudentNo());
		if(!"".equals(stu.getStudentMajor()))
	       s.setParameter("major",stu.getStudentMajor());
	   
		List<StudentInfo> u=s.list();		
		return u;
	}
	public List<StudentAttendant> checkAttendant(StudentInfo stu){
		List<StudentInfo> st=queryStu(stu);
		StudentInfo s=st.get(0);
       
        Query rs=this.getSession().createQuery("from StudentAttendant s where s.registerInfo.studentInfo.studentId=:id");
		rs.setParameter("id",s.getStudentId()); 
		List<StudentAttendant> att=rs.list();
	   
		return att;
	}
	
	
	public boolean updateAttendant(StudentAttendant att)
	{
		if(att.getAttendantRemark().equals("情况属实确认录入"))
		   this.getHibernateTemplate().update(att);
		else
			this.getHibernateTemplate().delete(att);
	    return true;
			
	}
	
	
	public List<TeacherInfo> queryTeacher(TeacherInfo tea){
		
		String sql=new String();
		sql="from TeacherInfo t where 1=1";
		
		if(!"".equals(tea.getStaffInfo().getStaffName()))
			sql=sql+" and t.staffInfo.staffName=:name";
		if(!"".equals(tea.getTeacherNo()))
			sql=sql+" and t.teacherNo=:number";
		if(!"".equals(tea.getTeacherMajor()))
			sql=sql+" and t.teacherMajor=:major";
	
		Query s=this.getSession().createQuery(sql);
		
		if(!"".equals(tea.getStaffInfo().getStaffName()))
		   s.setParameter("name",tea.getStaffInfo().getStaffName());
		if(!"".equals(tea.getTeacherNo()))
	       s.setParameter("number",tea.getTeacherNo());
		if(!"".equals(tea.getTeacherMajor()))
	       s.setParameter("major",tea.getTeacherMajor());
		List<TeacherInfo> ts=s.list();	
		return ts;
	}
	public String addTeacher(TeacherInfo tea) {
		if(queryTeacherByIdcard(tea.getStaffInfo().getStaffIdcard()).size()==1)
			return "Idcard";
		if(queryTeacherByNo(tea.getTeacherNo()).size()==1)
			return "number";
		
          this.getHibernateTemplate().save(tea.getStaffInfo());        
     	 tea.setStaffId(tea.getStaffInfo().getStaffId());
		 this.getHibernateTemplate().save(tea);
		 return "true";	
	}
	
	//根据老师号查询老师
	public List<TeacherInfo> queryTeacherByNo(String teaNo)
	{
		Query teas=this.getSession().createQuery("from TeacherInfo t where t.teacherNo=:num");
	      teas.setParameter("num",teaNo);
	      List<TeacherInfo> t=teas.list();	      
	    return t;
	}
	//根据老师省份证号查询
	public List<TeacherInfo> queryTeacherByIdcard(String teaIdcard)
	{
		Query teas=this.getSession().createQuery("from TeacherInfo t where t.staffInfo.staffIdcard=:Idcard");
	      teas.setParameter("Idcard",teaIdcard);
	      List<TeacherInfo> t=teas.list();	      
	    return t;
	}
  public TeacherInfo showAllTeacherInfo(TeacherInfo tea){
	  
	
      TeacherInfo t=queryTeacherByNo(tea.getTeacherNo()).get(0);
      
      Query sta=this.getSession().createQuery("from StaffInfo t where t.staffId=:id");
      sta.setParameter("id",t.getStaffId());
		 StaffInfo staff=(StaffInfo)sta.uniqueResult();
		 
		 t.setStaffInfo(staff);  
	return t;
}
  
  //查询老师课程信息
 public List<CourseInfo> queryCourse(TeacherInfo tea){
	 

		TeacherInfo t=queryTeacherByNo(tea.getTeacherNo()).get(0); 
		 Query c=this.getSession().createQuery("from CourseInfo c where c.teacherInfo.staffId=:id");
	     c.setParameter("id",t.getStaffId());
	     List<CourseInfo> cs=c.list();
	     return cs;
 }
public TeacherInfo addSalary(TeacherInfo teacher) {
     //插寻到老师
	 TeacherInfo t=queryTeacherByNo(teacher.getTeacherNo()).get(0);
	 float salary=t.getTeacherSalary();
	 
	 //查询到老师课程信息
	 Query c=this.getSession().createQuery("from CourseInfo c where c.teacherInfo.staffId=:id");
     c.setParameter("id",t.getStaffId());
     List<CourseInfo> cs=c.list();
	 for(int i=0;i<cs.size();i++)
	 {
	        if(cs.get(i).getCourseAvai()!=0){
	    	  salary=salary+cs.get(i).getCoursePrice();
	     }
	        cs.get(i).setCourseAvai(0);
	 }
     t.setTeacherSalary(salary);
     this.getHibernateTemplate().update(t);
	return t;
}


public String addcourse(CourseInfo course) {
	
	Query sns=this.getSession().createQuery("from TeacherInfo t where t.staffInfo.staffName=:name");
    sns.setParameter("name",course.getTeacherInfo().getStaffInfo().getStaffName());
    TeacherInfo s=(TeacherInfo)sns.uniqueResult();
		 if(sns.list().size()==0)
			return "emptyTeacher";
		 
		 Query mas=this.getSession().createQuery("from MajorInfo m where m.majorName=:name");
		    mas.setParameter("name",course.getMajorInfo().getMajorName());
		    MajorInfo ma=(MajorInfo)mas.uniqueResult();
				 if(mas.list().size()==0||ma.getMajorAvai()==0)
					return "emptyMajor";
		
		 Query ts=this.getSession().createQuery("from TeacherInfo t where t.staffId=:id");
		    ts.setParameter("id",s.getStaffId());
				 TeacherInfo t=(TeacherInfo)ts.uniqueResult(); 
				 course.setTeacherInfo(t);
				 course.setMajorInfo(ma);
				 this.getHibernateTemplate().save(course);
		 return "addCourse";
}
public List<CourseInfo> queryAllCourse(){
	Query c=this.getSession().createQuery("from CourseInfo");
	List<CourseInfo> cs=c.list();
	return cs;
}
public List<CourseInfo> queryCourseInfo(CourseInfo course) {
	
	String sql=new String();
	sql="from CourseInfo c where 1=1";
	if(course.getCourseId()!= null)
		sql=sql+"and c.courseId=:id";
	if(!"".equals(course.getCourseName()))
		sql=sql+" and c.courseName=:name";
	if(course.getCourseStart()!=null)
		sql=sql+" and c.courseStart=:date";
	Query cs=this.getSession().createQuery(sql);
	if(course.getCourseId() != null)
		 cs.setParameter("id",course.getCourseId());
	if(!"".equals(course.getCourseName()))
	   cs.setParameter("name",course.getCourseName());
	if(course.getCourseStart()!=null)
       cs.setParameter("date",course.getCourseStart());
	List<CourseInfo> c=cs.list();	
	return c;
}
//遍历用户主表
public List<GroupInfo> listGroupInfo() {
	Query gr=this.getSession().createQuery("from GroupInfo");
	List<GroupInfo> gs=gr.list();
	return gs;
}
//遍历教师等级表
public List<TeacherLevel> listTeacherLevel() {
	Query tl=this.getSession().createQuery("from TeacherLevel");
	List<TeacherLevel> tls=tl.list();
	return tls;
}
public List<PositionInfo> listPosition() {
	
		Query p=this.getSession().createQuery("from PositionInfo");
	List<PositionInfo> ps=p.list();
	return ps;
	}
public String updateCourse(CourseInfo course) {
	Query sns=this.getSession().createQuery("from TeacherInfo t where t.staffInfo.staffName=:name");
    sns.setParameter("name",course.getTeacherInfo().getStaffInfo().getStaffName());
    TeacherInfo s=(TeacherInfo)sns.uniqueResult();
		 if(sns.list().size()==0)
			return "emptyTeacher";
		 
		 Query mas=this.getSession().createQuery("from MajorInfo m where m.majorName=:name");
		    mas.setParameter("name",course.getMajorInfo().getMajorName());
		    MajorInfo ma=(MajorInfo)mas.uniqueResult();
				 if(mas.list().size()==0||ma.getMajorAvai()==0)
					return "emptyMajor";
				 
		course.setMajorInfo(ma);
	    course.setTeacherInfo(s);
		
		 this.getHibernateTemplate().update(course);
		 return "updateCourse";
	
}
public void deleteCourse(CourseInfo course){
	this.getHibernateTemplate().delete(course);
}

public void addCourseIntoTable(int index){
	int size=index;
	 
	//进行排课前删除以前排课信息
	deleteAllCourseClasshour();
	deleteAllClassroomInfo();
	deleteAllClasshourInfo();

    ArrayList<Time> tSample=solveTime();
	List<CourseInfo> cs=queryAllCourse();
	CourseInfo c=new CourseInfo();
	int i = 0;
	for(int j=0;i<cs.size()&&j<size;j++)		
	   for(;i<cs.size()&&i<20;i++)
	   {
		  CourseClasshour  course=new CourseClasshour();
			int flag=i+20*j;
			//添加课程开始日期
			c=cs.get(flag);
			 course.setCourseInfo(c);
			 this.getHibernateTemplate().update(c);
			 
			//设置课程日期
			 ClasshourInfo classTime=new ClasshourInfo();
			     
			     classTime.setClasshourStart(tSample.get(2*(i%4)));
			     			
				 classTime.setClasshourEnd(tSample.get(2*(i%4)+1));
				 classTime.setClasshourAvai(1);
				 this.getHibernateTemplate().save(classTime);
				 course.setClasshourInfo(classTime);
				 
				 //设定教室
				 ClassroomInfo room=new ClassroomInfo();
				 room.setClassroomAddr("教室"+j);
				 room.setClassroomAvai(1);
				 room.setClassroomType("教学教室");
				 room.setClassroomCapacity(40);
				 room.setClassroomRemark("教室已经被调用");
				 this.getHibernateTemplate().save(room);
				 course.setClassroomInfo(room);
				 this.getHibernateTemplate().save(course);				 
		}
}
//删除表CourseClasshour
private void deleteAllCourseClasshour() {
	// TODO Auto-generated method stub
	Query list=this.getSession().createQuery("from CourseClasshour");
    List<CourseClasshour> lists=list.list();
    for(int i=0;i<lists.size();i++)
    	 this.getHibernateTemplate().delete(lists.get(i));	
}
//删除表ClassroomInfo
private void deleteAllClassroomInfo() {
	// TODO Auto-generated method stub
	Query list=this.getSession().createQuery("from ClasshourInfo");
    List<ClasshourInfo> lists=list.list();
    for(int i=0;i<lists.size();i++)
    	 this.getHibernateTemplate().delete(lists.get(i));	
}
//删除表ClasshourInfo
private void deleteAllClasshourInfo() {
	// TODO Auto-generated method stub
	Query list=this.getSession().createQuery("from ClassroomInfo");
    List<ClassroomInfo> lists=list.list();
    for(int i=0;i<lists.size();i++)
    	 this.getHibernateTemplate().delete(lists.get(i));	
}
//每日上课时间段;
public ArrayList<Time> solveTime()
{
	ArrayList<Time> ts=new ArrayList<Time>();
	ts.add(developTime(8,30,00));
	ts.add(developTime(10,00,00));
	ts.add(developTime(10,30,00));
	ts.add(developTime(12,00,00));
	ts.add(developTime(14,00,00));
	ts.add(developTime(15,30,00));
	ts.add(developTime(16,00,00));
	ts.add(developTime(15,30,00));
	return ts;
}
//获得一个Time类型
public Time developTime(int h,int m,int s){
	Time t=new Time(h,m,s);
	return t;
}
public List<CourseClasshour> querryCourseClasshour(Integer index) {
	
	Query list=this.getSession().createQuery("from CourseClasshour");
	List<CourseClasshour> lists=list.list();
	ArrayList<CourseClasshour> lits=new ArrayList<CourseClasshour>();
	for(int i=0;i<lists.size();i++)
	{
		
	      if((i%21+1)==index)
	    	  lits.add(lists.get(i));
	    	  
	}
	return lits;
}
}
