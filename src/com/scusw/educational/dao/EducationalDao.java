package com.scusw.educational.dao;

import java.sql.Time;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

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

public class EducationalDao extends HibernateDaoSupport {

	public List<StudentInfo> queryStu(StudentInfo stu) {

		String sql = new String();
		sql = "from StudentInfo u where 1=1";

		if (!"".equals(stu.getStudentName()))
			sql = sql + " and u.studentName=:name";
		if (!"".equals(stu.getStudentNo()))
			sql = sql + " and u.studentNo=:number";
		if (!"".equals(stu.getStudentMajor()))
			sql = sql + " and u.studentMajor=:major";

		Query s = this.getSession().createQuery(sql);

		if (!"".equals(stu.getStudentName()))
			s.setParameter("name", stu.getStudentName());
		if (!"".equals(stu.getStudentNo()))
			s.setParameter("number", stu.getStudentNo());
		if (!"".equals(stu.getStudentMajor()))
			s.setParameter("major", stu.getStudentMajor());

		List<StudentInfo> u = s.list();
		return u;
	}

	public List<StudentAttendant> checkAttendant(StudentInfo stu) {
		List<StudentInfo> st = queryStu(stu);
		StudentInfo s = st.get(0);

		Query rs = this
				.getSession()
				.createQuery(
						"from StudentAttendant s where s.registerInfo.studentInfo.studentId=:id");
		rs.setParameter("id", s.getStudentId());
		List<StudentAttendant> att = rs.list();

		return att;
	}

	public boolean updateAttendant(StudentAttendant att) {
		if (att.getAttendantRemark().equals("情况属实确认录入"))
			this.getHibernateTemplate().update(att);
		else
			this.getHibernateTemplate().delete(att);
		return true;

	}

	public List<TeacherInfo> queryTeacher(TeacherInfo tea) {

		String sql = new String();
		sql = "from TeacherInfo t where 1=1";

		if (!"".equals(tea.getStaffInfo().getStaffName()))
			sql = sql + " and t.staffInfo.staffName=:name";
		if (!"".equals(tea.getTeacherNo()))
			sql = sql + " and t.teacherNo=:number";
		if (!"".equals(tea.getTeacherMajor()))
			sql = sql + " and t.teacherMajor=:major";

		Query s = this.getSession().createQuery(sql);

		if (!"".equals(tea.getStaffInfo().getStaffName()))
			s.setParameter("name", tea.getStaffInfo().getStaffName());
		if (!"".equals(tea.getTeacherNo()))
			s.setParameter("number", tea.getTeacherNo());
		if (!"".equals(tea.getTeacherMajor()))
			s.setParameter("major", tea.getTeacherMajor());
		List<TeacherInfo> ts = s.list();
		return ts;
	}

	public String addTeacher(TeacherInfo tea) {
		if (queryTeacherByIdcard(tea.getStaffInfo().getStaffIdcard()).size() == 1)
			return "Idcard";
		if (queryTeacherByNo(tea.getTeacherNo()).size() == 1)
			return "number";
		Query mas = this.getSession().createQuery("from MajorInfo m where m.majorName=:name");
		mas.setParameter("name", tea.getTeacherMajor());
		List<MajorInfo> ma = mas.list();
		if(ma.size()==0)
			return "major";
			
		Query stn = this.getSession().createQuery("from StaffInfo s where s.staffNo=:account");
		stn.setParameter("account",tea.getStaffInfo().getStaffNo());
		List<StaffInfo> stns = stn.list();
		if(stns.size()==1)
		return "staffNo";
		

		this.getHibernateTemplate().save(tea.getStaffInfo());
		tea.setStaffId(tea.getStaffInfo().getStaffId());
		this.getHibernateTemplate().save(tea);
		return "true";
	}

	// 根据老师号查询老师
	public List<TeacherInfo> queryTeacherByNo(String teaNo) {
		Query teas = this.getSession().createQuery(
				"from TeacherInfo t where t.teacherNo=:num");
		teas.setParameter("num", teaNo);
		List<TeacherInfo> t = teas.list();
		return t;
	}

	// 根据老师省份证号查询
	public List<TeacherInfo> queryTeacherByIdcard(String teaIdcard) {
		Query teas = this.getSession().createQuery(
				"from TeacherInfo t where t.staffInfo.staffIdcard=:Idcard");
		teas.setParameter("Idcard", teaIdcard);
		List<TeacherInfo> t = teas.list();
		return t;
	}

	public TeacherInfo showAllTeacherInfo(TeacherInfo tea) {

		TeacherInfo t = queryTeacherByNo(tea.getTeacherNo()).get(0);

		Query sta = this.getSession().createQuery(
				"from StaffInfo t where t.staffId=:id");
		sta.setParameter("id", t.getStaffId());
		StaffInfo staff = (StaffInfo) sta.uniqueResult();

		t.setStaffInfo(staff);
		return t;
	}

	// 查询老师课程信息
	public List<CourseClasshour> queryCourse(TeacherInfo tea) {

		TeacherInfo t = queryTeacherByNo(tea.getTeacherNo()).get(0);
		Query c = this.getSession().createQuery("from CourseInfo c where c.teacherInfo.staffId=:id");
		c.setParameter("id", t.getStaffId());
		List<CourseInfo> cs = c.list();
		List<CourseClasshour> clh1=new ArrayList<CourseClasshour>();
		for(int i=0;i<cs.size();i++){
			
			Query  clh2= this.getSession().createQuery("from  CourseClasshour c where c.courseInfo.courseId=:id");
			clh2.setParameter("id", cs.get(i).getCourseId());
			List<CourseClasshour> clh=clh2.list();
			for(int j=0;j<clh.size();j++){
			ClasshourInfo hour=querryClasshourinfo(clh.get(j));
			clh.get(j).setClasshourInfo(hour);
			ClassroomInfo room=querryClassroomInfo(clh.get(j));
			clh.get(j).setClassroomInfo(room);
			clh1.add(clh.get(j));
			}
		}
		return clh1;
	}
	public ClassroomInfo querryClassroomInfo(CourseClasshour classhour){
		Query c = this.getSession().createQuery("from ClassroomInfo c where c.classroomId=:id");
		c.setParameter("id", classhour.getClassroomInfo().getClassroomId());
		ClassroomInfo clh= (ClassroomInfo)c.uniqueResult();
		return clh;
	}
	public ClasshourInfo querryClasshourinfo(CourseClasshour classhour){
		Query c = this.getSession().createQuery("from ClasshourInfo c where c.classhourId=:id");
		c.setParameter("id", classhour.getClasshourInfo().getClasshourId());
		ClasshourInfo clh= (ClasshourInfo)c.uniqueResult();
		return clh;
	}
	public TeacherInfo addSalary(TeacherInfo teacher) {
		// 插寻到老师
		TeacherInfo t = queryTeacherByNo(teacher.getTeacherNo()).get(0);
		float salary = t.getTeacherSalary();

		// 查询到老师课程信息
		Query c = this.getSession().createQuery(
				"from CourseInfo c where c.teacherInfo.staffId=:id");
		c.setParameter("id", t.getStaffId());
		List<CourseInfo> cs = c.list();
		for (int i = 0; i < cs.size(); i++) {
			if (cs.get(i).getCourseAvai() != 0) {
				salary = salary + cs.get(i).getCoursePrice();
			}
			cs.get(i).setCourseAvai(0);
		}
		t.setTeacherSalary(salary);
		this.getHibernateTemplate().update(t);
		return t;
	}

	public String addcourse(CourseInfo course) {

		Query sns = this.getSession().createQuery(
				"from TeacherInfo t where t.staffInfo.staffName=:name");
		sns.setParameter("name", course.getTeacherInfo().getStaffInfo()
				.getStaffName());
		TeacherInfo s = (TeacherInfo) sns.uniqueResult();
		if (sns.list().size() == 0)
			return "emptyTeacher";

		Query mas = this.getSession().createQuery(
				"from MajorInfo m where m.majorName=:name");
		mas.setParameter("name", course.getMajorInfo().getMajorName());
		MajorInfo ma = (MajorInfo) mas.uniqueResult();
		if (mas.list().size() == 0 || ma.getMajorAvai() == 0)
			return "emptyMajor";

		Query ts = this.getSession().createQuery(
				"from TeacherInfo t where t.staffId=:id");
		ts.setParameter("id", s.getStaffId());
		TeacherInfo t = (TeacherInfo) ts.uniqueResult();
		course.setTeacherInfo(t);
		course.setMajorInfo(ma);
		this.getHibernateTemplate().save(course);
		return "addCourse";
	}

	public List<CourseInfo> queryAllCourse() {
		Query c = this.getSession().createQuery("from CourseInfo");
		List<CourseInfo> cs = c.list();
		return cs;
	}

	public List<CourseInfo> queryCourseInfo(CourseInfo course) {

		String sql = new String();
		sql = "from CourseInfo c where 1=1";
		if (course.getCourseId() != null)
			sql = sql + "and c.courseId=:id";
		if (!"".equals(course.getCourseName()))
			sql = sql + " and c.courseName=:name";
		if (course.getCourseStart() != null)
			sql = sql + " and c.courseStart=:date";
		Query cs = this.getSession().createQuery(sql);
		if (course.getCourseId() != null)
			cs.setParameter("id", course.getCourseId());
		if (!"".equals(course.getCourseName()))
			cs.setParameter("name", course.getCourseName());
		if (course.getCourseStart() != null)
			cs.setParameter("date", course.getCourseStart());
		List<CourseInfo> c = cs.list();
		return c;
	}

	// 遍历用户主表
	public List<GroupInfo> listGroupInfo() {
		Query gr = this.getSession().createQuery("from GroupInfo");
		List<GroupInfo> gs = gr.list();
		return gs;
	}

	// 遍历教师等级表
	public List<TeacherLevel> listTeacherLevel() {
		Query tl = this.getSession().createQuery("from TeacherLevel");
		List<TeacherLevel> tls = tl.list();
		return tls;
	}

	public List<PositionInfo> listPosition() {

		Query p = this.getSession().createQuery("from PositionInfo");
		List<PositionInfo> ps = p.list();
		return ps;
	}

	public String updateCourse(CourseInfo course) {
		Query sns = this.getSession().createQuery(
				"from TeacherInfo t where t.staffInfo.staffName=:name");
		sns.setParameter("name", course.getTeacherInfo().getStaffInfo()
				.getStaffName());
		TeacherInfo s = (TeacherInfo) sns.uniqueResult();
		if (sns.list().size() == 0)
			return "emptyTeacher";

		Query mas = this.getSession().createQuery(
				"from MajorInfo m where m.majorName=:name");
		mas.setParameter("name", course.getMajorInfo().getMajorName());
		MajorInfo ma = (MajorInfo) mas.uniqueResult();
		if (mas.list().size() == 0 || ma.getMajorAvai() == 0)
			return "emptyMajor";

		course.setMajorInfo(ma);
		course.setTeacherInfo(s);

		this.getHibernateTemplate().update(course);
		return "updateCourse";

	}

	public void deleteCourse(CourseInfo course) {
		this.getHibernateTemplate().delete(course);
	}

	
	  //删除表CourseClasshour 
	  private void deleteAllCourseClasshour() {
		    Query list=this.getSession().createQuery("from CourseClasshour");
	        List<CourseClasshour> lists=list.list(); 
	        for(int i=0;i<lists.size();i++)
	          this.getHibernateTemplate().delete(lists.get(i)); 
	       }
	  //删除表ClassroomInfo
	  private void deleteAllClassroomInfo() {
	   Query list=this.getSession().createQuery("from ClasshourInfo");
	  List<ClasshourInfo> lists=list.list(); for(int i=0;i<lists.size();i++)
	 this.getHibernateTemplate().delete(lists.get(i)); } 
	  //删除表ClasshourInfo
	  private void deleteAllClasshourInfo() { 
	     Query list=this.getSession().createQuery("from ClassroomInfo");
	     List<ClassroomInfo> lists=list.list(); 
	     for(int i=0;i<lists.size();i++)
	       this.getHibernateTemplate().delete(lists.get(i)); 
	     } 
	 
	public String addCourseIntoTable() {
		deleteAllCourseClasshour();
		List<CourseInfo> cs = queryAllCourse();
		if(cs.size()==0)
			return "emptyCourse";

		for (int i = 0; i < cs.size(); i++) {
			CourseInfo course = cs.get(i);
			int ct = course.getCourseTimes();
			while (ct>0) {
				ct=ct-1;
				CourseClasshour courseClassHour = new CourseClasshour();
				boolean button = true;
				while (button) {
					
					// 生成一个1-20的随机数，作为classhourInfo的i					
					Random random = new Random();
					boolean flag = true;
					int index=0;// 记录随机生成的时间片index=0;
					while (flag) {
						int j = Math.abs(random.nextInt()) % 20 + 1;
						index = j;	 
						if (isMixTime(course, j))
							flag = false;	
					}
					ClasshourInfo timeInfo = (ClasshourInfo) this.getHibernateTemplate().get(ClasshourInfo.class,index);
					// 如果该时间片没被分配课程，选折数据库中第一个教室作为，上课教室
					if (querryCourseClasshourByClasshourInfo(index).size()==0) {
						courseClassHour.setClasshourInfo(timeInfo);
						courseClassHour.setCourseInfo(course);
						courseClassHour.setClassroomInfo(queryClassRoom().get(0));
						this.getHibernateTemplate().save(courseClassHour);
						button=false;
					}
					
					// 如果有课程排除法
					else{
						int n = isMixRoom(index);
						if (n!= 0) {
							ClassroomInfo room=new ClassroomInfo();
							room.setClassroomId(n);
							courseClassHour.setClasshourInfo(timeInfo);
							courseClassHour.setCourseInfo(course);
							courseClassHour.setClassroomInfo(room);
							this.getHibernateTemplate().save(courseClassHour);
							button=false;		
						} else
							button = true;
					}
				}
			}
		}
		return "successAdd";

	}

	// 判断在给顶的时间片index,是否有教室能用，返回该教室的id号，没有返回0；
	public int isMixRoom(int index) {
		List<ClassroomInfo> roomList = queryClassRoom();
		List<ClassroomInfo> roomBeUsed = queryClassRoom(index);
		boolean flag = false;
		for (int i = 0; i < roomList.size(); i++) {
			for (int j = 0; j < roomBeUsed.size(); j++)
				if (roomList.get(i).getClassroomId() != roomBeUsed.get(j).getClassroomId())
					flag = true;
			if (flag)
				return roomList.get(i).getClassroomId();
		}
		return 0;
	}

	// 判断同一老师的同一门课是否在同一时间
	public boolean isMixTime(CourseInfo c, int index) {
		Query cl = this.getSession().createQuery("from CourseClasshour c where c.courseInfo.courseId=:id");
		cl.setParameter("id", c.getCourseId());
		List<CourseClasshour> cls = cl.list();
		if(cls.size()==0)
		   return true;
		
		else{
			int j=0;
		  for (int i = 0; i < cls.size(); i++){
			  if (cls.get(i).getClasshourInfo().getClasshourId()==index)
				  j++;
		  }
		  if(j>0)
			  return false;
		  else
		       return true;
		}
	}

	// 查询classrromInfo表中的所有记录返回list
	public List<ClassroomInfo> queryClassRoom(){
		Query list = this.getSession().createQuery("from ClassroomInfo ");
		List<ClassroomInfo> lists = list.list();
		return lists;
	}

	// 通过时间片id查找coursehoucalss
	public List<CourseClasshour> querryCourseClasshourByClasshourInfo(int index) {
		Query list = this.getSession().createQuery("from CourseClasshour c where c.classhourInfo.classhourId=:id");
		list.setParameter("id",index);
		List<CourseClasshour> lists = list.list();
		return lists;
	}

	// 同过时间片的index，链表查出，改时间片下，已经被使用的教室，返回教室信息的list
	public List<ClassroomInfo> queryClassRoom(int index) {
		List<CourseClasshour> course = querryCourseClasshourByClasshourInfo(index);
		 ArrayList<ClassroomInfo> listRoom=new ArrayList<ClassroomInfo>();
		 for(int i=0;i<course.size();i++){
		    Query list = this.getSession().createQuery("from ClassroomInfo c where c.classroomId=:id");
	        list.setParameter("id",course.get(i).getClassroomInfo().getClassroomId());
	        ClassroomInfo room=(ClassroomInfo)list.uniqueResult();
	        listRoom.add(room);
		 }		 
		return listRoom;
	}

	public List<CourseClasshour> querryCourseClasshour(Integer index) {
		Query list = this.getSession().createQuery("from CourseClasshour c where c.classhourInfo.classhourId=:id");
		list.setParameter("id",index);
		List<CourseClasshour> lists = list.list();
		return lists;
	}
	
}
