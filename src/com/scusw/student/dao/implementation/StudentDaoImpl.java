package com.scusw.student.dao.implementation;

import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.student.dao.StudentDao;
import com.scusw.login.action.LoginAction;
import com.scusw.model.ClasshourInfo;
import com.scusw.model.ClassroomInfo;
import com.scusw.model.CourseClasshour;
import com.scusw.model.CourseInfo;
import com.scusw.model.MajorInfo;
import com.scusw.model.NoticeInfo;
import com.scusw.model.RegisterInfo;
import com.scusw.model.StudentInfo;

/**
 * 类描述：学生可使用的方法的实现
 * 
 * @author 曾植
 * @data：日期：2014-3-10 时间：上午10:44:44 version 1.0
 */
public class StudentDaoImpl extends HibernateDaoSupport implements StudentDao {

	public static Logger logger = Logger.getLogger(LoginAction.class);

	/**
	 * 方法描述：学生通过学号查询自己的信息
	 * 
	 * @param studentNo
	 *            ：学生学号
	 * @return studentInfo：包含学生全部信息的实体
	 */
	public StudentInfo queryStudentByNo(String studentNo) {
		Query q = this.getSession().createQuery(
				"from StudentInfo s where s.studentNo=:studentNo");
		q.setParameter("studentNo", studentNo);
		StudentInfo studentInfo = (StudentInfo) q.uniqueResult();
		return studentInfo;
	}

	/**
	 * 方法描述：学生修改自己的信息
	 * 
	 * @param student
	 *            ：包含学生全部信息的实体
	 */
	public void updateStudent(StudentInfo student) {
		this.getHibernateTemplate().update(student);
	}

	/**
	 * 方法描述：学生报名
	 * 
	 * @param student
	 *            ：包含学生全部信息的实体
	 * @return major：学生报名专业所有信息的实体
	 */
	public MajorInfo apply(StudentInfo student) {
		this.getHibernateTemplate().save(student);
		Query q = this.getSession().createQuery(
				"from MajorInfo m where m.majorName=:majorName");
		q.setParameter("majorName", student.getStudentMajor());
		MajorInfo major = (MajorInfo) q.uniqueResult();
		return major;
	}

	/**
	 * 方法描述：学生查询公告信息
	 * 
	 * @return notice：包含公告信息的实体的集合
	 */
	public List<NoticeInfo> noticeInfoQuery() {
		List<NoticeInfo> notice = getHibernateTemplate()
				.find("from NoticeInfo");
		return notice;
	}

	/**
	 * 方法描述：通过公告ID查看公告内容
	 * 
	 * @param noticeId
	 *            公告ID
	 * @return 公告内容
	 */
	public String queryNoticeContent(int noticeId) {
		Query q = this.getSession().createQuery(
				"from NoticeInfo n where n.noticeId=:noticeId");
		q.setParameter("noticeId", noticeId);
		NoticeInfo notice = (NoticeInfo) q.uniqueResult();
		return notice.getNoticeContent();
	}

	/**
	 * 方法描述：学生查询专业信息
	 * 
	 * @param majorName
	 *            ：专业名
	 * @return major：包含专业信息的实体
	 */
	public MajorInfo majorInfoQuery(String studentNo) {
		StudentInfo studentInfo = queryStudentByNo(studentNo);
		Query q = this.getSession().createQuery(
				"from MajorInfo m where m.majorName=:majorName");
		q.setParameter("majorName", studentInfo.getStudentMajor());
		MajorInfo major = (MajorInfo) q.uniqueResult();
		return major;
	}

	/**
	 * 方法描述：学生查询所选课程
	 * 
	 * @param studentNo
	 *            ：学号
	 * @return ：包含课程信息和选课信息的List对象
	 */
	public List<Object[]> queryCourse(String studentNo) {
		int studentId = queryStudentByNo(studentNo).getStudentId();// fuckshen
		List<Object[]> Obj = getHibernateTemplate()
				.find("from CourseInfo c inner join c.registerInfos r where c.courseId = r.courseInfo.courseId and r.studentInfo.studentId=?",
						studentId);
		return Obj;
	}

	/**
	 * 方法描述：通过课程编号查询课程
	 * 
	 * @param courseId
	 *            ：所有被查询课程编号
	 * @return ：查询到的课程集合
	 */
	public List<CourseInfo> queryClass(int[] courseId) {
		List<CourseInfo> course = new ArrayList<CourseInfo>();
		Query q1 = this.getSession().createQuery(
				"from CourseInfo c where c.courseId=:courseId");
		for (int i = 0; i < courseId.length; i++) {
			q1.setParameter("courseId", courseId[i]);
			course.add(((CourseInfo) q1.uniqueResult()));
		}
		return course;
	}

	/**
	 * 方法描述：查询所有课程
	 * 
	 * @return ：包含所有课程信息的实体的集合
	 */
	public List<CourseInfo> queryAllCourse() {
		List<CourseInfo> courseInfo = getHibernateTemplate().find(
				"from CourseInfo c where c.courseAvai=?", 1);
		return courseInfo;
	}

	/**
	 * 方法描述：查询上课地点
	 * 
	 * @param courseInfo
	 *            ：所有被查询课程
	 * @return ：所有课程的所有上课地点
	 */
	public String[][] queryClassroom(List<CourseInfo> courseInfo) {
		int size = courseInfo.size();
		String[][] classroom = new String[size][];
		Query q = this.getSession().createQuery(
				"from ClassroomInfo c where c.classroomId=:classroomId");
		for (int i = 0; i < size; i++) {
			List<CourseClasshour> courseClasshour = getHibernateTemplate()
					.find("from CourseClasshour c  where c.courseInfo.courseId =?",
							courseInfo.get(i).getCourseId());
			classroom[i] = new String[courseClasshour.size()];
			for (int j = 0; j < courseClasshour.size(); j++) {
				q.setParameter("classroomId", courseClasshour.get(j)
						.getClassroomInfo().getClassroomId());
				ClassroomInfo c = (ClassroomInfo) q.uniqueResult();
				classroom[i][j] = c.getClassroomAddr();
			}
		}
		return classroom;
	}

	/**
	 * 方法描述：查询上课时间
	 * 
	 * @param courseInfo
	 *            ：所有被查询课程
	 * @return ：所有课程的所有上课时间
	 */
	public String[][] queryClasshour(List<CourseInfo> courseInfo) {
		int size = courseInfo.size();
		String[][] classhourEveryWeek = new String[size][];
		Query q = this.getSession().createQuery(
				"from ClasshourInfo c where c.classhourId=:classhourId");
		for (int i = 0; i < size; i++) {
			List<CourseClasshour> courseClasshour = getHibernateTemplate()
					.find("from CourseClasshour c  where c.courseInfo.courseId =?",
							courseInfo.get(i).getCourseId());
			classhourEveryWeek[i] = new String[courseClasshour.size()];
			for (int j = 0; j < courseClasshour.size(); j++) {
				q.setParameter("classhourId", courseClasshour.get(j)
						.getClasshourInfo().getClasshourId());
				classhourEveryWeek[i][j] = ((ClasshourInfo) q.uniqueResult())
						.getClasshourName();
			}
		}
		return classhourEveryWeek;
	}

	/**
	 * 方法描述：查询课程课时信息编号
	 * 
	 * @param course
	 *            ：所有被查询课程
	 * @return ：被查询课程的所有课程课时编号
	 */
	public int[][] queryCourseClasshourId(List<CourseInfo> course) {
		int[][] courseClasshourId = new int[course.size()][];
		for (int i = 0; i < course.size(); i++) {
			List<CourseClasshour> courseClasshour = getHibernateTemplate()
					.find("from CourseClasshour c  where c.courseInfo.courseId =?",
							course.get(i).getCourseId());
			courseClasshourId[i] = new int[courseClasshour.size()];
			for (int j = 0; j < courseClasshour.size(); j++) {
				courseClasshourId[i][j] = courseClasshour.get(j)
						.getClasshourInfo().getClasshourId();
			}
		}
		return courseClasshourId;
	}

	/**
	 * 方法描述：添加所选课程
	 * 
	 * @param registerInfos
	 *            选课信息
	 */
	public void addRegisterInfo(List<RegisterInfo> registerInfos) {
		for (int i = 0; i < registerInfos.size(); i++) {
			this.getHibernateTemplate().save(registerInfos.get(i));
		}
	}
}
