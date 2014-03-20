package com.scusw.student.service.implementation;

import java.util.ArrayList;
import java.util.List;

import com.scusw.model.CourseInfo;
import com.scusw.model.MajorInfo;
import com.scusw.model.NoticeInfo;
import com.scusw.model.RegisterInfo;
import com.scusw.model.StudentInfo;
import com.scusw.student.dao.StudentDao;
import com.scusw.student.service.StudentService;

/**
 * 类描述：学生服务层接口实现类
 * @author 曾植
 * @data：日期：2014-3-10 时间：上午11:44:44
 * version 1.0
 */
public class StudentServiceImpl implements StudentService {

	private List<Object[]> Obj;
	private StudentDao studentDao;
	
	/**
	 * @return the studentDao
	 */
	public StudentDao getStudentDao() {
		return studentDao;
	}
	/**
	 * @param studentDao the studentDao to set
	 */
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	/**
	 * 方法描述：学生通过学号查询自己的信息
	 * @param studentNo：学生学号
	 * @return ：包含学生全部信息的实体
	 */
	public StudentInfo queryStudentByNo(String studentNo) {
		return studentDao.queryStudentByNo(studentNo);
	}

	/**
	 * 方法描述：学生修改自己的信息
	 * @param ：包含学生全部信息的实体
	 */
	public void updateStudent(StudentInfo student, String studentNo) {
		StudentInfo si = this.queryStudentByNo(studentNo);
		si.setStudentAge(student.getStudentAge());
		si.setStudentAddr(student.getStudentAddr());
		si.setStudentSchool(student.getStudentSchool());
		si.setStudentPhone(student.getStudentPhone());
		si.setStudentRemark(student.getStudentRemark());
		studentDao.updateStudent(si);
	}

	/**
	 * 方法描述：学生查询公告信息
	 * @return ：包含公告信息的实体的集合
	 */
	public List<NoticeInfo> noticeInfoQuery() {
		return studentDao.noticeInfoQuery();
	}

	public String queryNoticeContent(int noticeId){
		return studentDao.queryNoticeContent(noticeId);
	}
	
	/**
	 * 方法描述：学生查询专业信息
	 * @param majorName：专业名
	 * @return ：包含专业信息的实体
	 */
	public MajorInfo majorInfoQuery(String studentNo) {
		return studentDao.majorInfoQuery(studentNo);
	}
	
	/**
	 * 方法描述：查询所选课程，并将数据类型转换为CourseInfo
	 * @param studentNo ： 学生学号
	 * @return ：包含该学生所有课程的List对象
	 */
	public List<CourseInfo> queryCourse(String studentNo){
		Obj = studentDao.queryCourse(studentNo);
		List<CourseInfo> courseInfo = new ArrayList<CourseInfo>();
		for(int i = 0; i < Obj.size(); i++) {
			courseInfo.add((CourseInfo)(Obj.get(i))[0]);
		}
		return courseInfo;
	}
	
	/**
	 * 方法描述：查询所有课程
	 * @return ：包含所有课程信息的实体的集合
	 */
	public List<CourseInfo> queryAllCourse(){
		return studentDao.queryAllCourse();
	}
	
	/**
	 * 方法描述：查询学生所选课程成绩
	 * @param courseInfo ：所选课程
	 * @param studentNo ：学生学号
	 * @return ：所选课程成绩
	 */
	public float[] queryScore(List<CourseInfo> courseInfo, String studentNo){
		int size = courseInfo.size();
		int[] courseId = new int[size];
		for(int i = 0; i < size; i ++){
			courseId[i] = courseInfo.get(i).getCourseId();
		}
		float[] studentScore = studentDao.queryScore(courseId, studentNo);
		return studentScore;
	}
	
	/**
	 * 方法描述：查询上课地点
	 * @param courseInfo ：所有被查询课程
	 * @return ：所有课程的所有上课地点
	 */
	public String[][] queryClassroom(List<CourseInfo> courseInfo){
		return studentDao.queryClassroom(courseInfo);
	}
	
	/**
	 * 方法描述：查询上课时间
	 * @param courseInfo ：所有被查询课程
	 * @return ：所有课程的所有上课时间
	 */
	public String[][] queryClasshour(List<CourseInfo> courseInfo){
		return studentDao.queryClasshour(courseInfo);
	}
	
	/**
	 * 方法描述：添加学生所选课程，并判断是否冲突
	 * @param selectCourseId ：包含学生所选所有课程的ID
	 * @param studentNo ：该学生学号
	 * @return  添加成功——>true
	 * 			添加失败——>false
	 */
	public boolean addRegisterInfo(int[] selectCourseId, String studentNo){
		if(selectCourseId == null || selectCourseId.length == 0 )
			return false;
		StudentInfo studentInfo= queryStudentByNo(studentNo);//fuckshen
		if(checkIsConflict(selectCourseId,studentNo))
			return false;
		List<RegisterInfo> registerInfos = new ArrayList<RegisterInfo>();
		for(int i = 0; i < selectCourseId.length; i ++){
			RegisterInfo registerInfo = new RegisterInfo();
			StudentInfo student = new StudentInfo();
			student.setStudentId(studentInfo.getStudentId());
			CourseInfo course = new CourseInfo();
			course.setCourseId(selectCourseId[i]);
			registerInfo.setStudentInfo(student);
			registerInfo.setCourseInfo(course);
			registerInfo.setStudentCourseScore((float) 0);
			registerInfos.add(registerInfo);
		}
		
		try{
			studentDao.addRegisterInfo(registerInfos);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * 方法描述：判断课程是否已经被选择
	 * @param selectCourse ：已选课程
	 * @param allCourse ：所有课程
	 * @return ：所有课程是否已被选择
	 */
	public boolean[] checkIsCourseSelect(List<CourseInfo> selectCourse, List<CourseInfo> allCourse){
		boolean[] flags = new boolean[allCourse.size()];
		for(int i = 0; i < allCourse.size(); i++){
			flags[i] = false;
			for(int j = 0; j < selectCourse.size(); j++){
				if(allCourse.get(i).getCourseId() == selectCourse.get(j).getCourseId())
					flags[i] = true;
			}
		}
		return flags;
	}
	
	/**
	 * 方法描述：判断选课时选择勾选课程的上课时间是否冲突
	 * @param chooseCourseId ：所选择课程的ID
	 * @param studentNo ：学生学号
	 * @return ：冲突——>true
	 * 			 不冲突——>false
	 */
	public boolean checkIsConflict(int[] chooseCourseId,String studentNo){
		List<CourseInfo> selectCourse = queryCourse(studentNo);
		List<CourseInfo> chooseCourse = studentDao.queryCourse(chooseCourseId);
		int[][] selectCourseClasshourId = studentDao.queryCourseClasshourId(selectCourse);
		int[][] chooseCourseClasshourId = studentDao.queryCourseClasshourId(chooseCourse);
		for(int i = 0; i < selectCourseClasshourId.length; i++){
			for(int j = 0; j < selectCourseClasshourId[i].length; j++){
				for(int m = 0; m < chooseCourseClasshourId.length; m++){
					for(int n = 0; n < chooseCourseClasshourId[m].length; n++){
						if(selectCourseClasshourId[i][j] == chooseCourseClasshourId[m][n] &&
								(chooseCourse.get(m).getCourseStart().after(selectCourse.get(i).getCourseStart()) 
										&& chooseCourse.get(m).getCourseEnd().before(selectCourse.get(i).getCourseEnd()))  ||  
								(selectCourse.get(i).getCourseStart().after(chooseCourse.get(m).getCourseStart()) 
										&& selectCourse.get(i).getCourseStart().before(chooseCourse.get(m).getCourseEnd()))  ||
								(selectCourse.get(i).getCourseEnd().after(chooseCourse.get(m).getCourseStart())
										&& selectCourse.get(i).getCourseEnd().before(chooseCourse.get(m).getCourseEnd()))  || 
								(selectCourse.get(i).getCourseStart().after(chooseCourse.get(m).getCourseStart())
										&& selectCourse.get(i).getCourseEnd().before(chooseCourse.get(m).getCourseEnd()))	||
								(selectCourse.get(i).getCourseStart().equals(chooseCourse.get(m).getCourseStart()))		||
								(selectCourse.get(i).getCourseStart().equals(chooseCourse.get(m).getCourseEnd()))	||
								(selectCourse.get(i).getCourseEnd().equals(chooseCourse.get(m).getCourseStart()))	||
								(selectCourse.get(i).getCourseEnd().equals(chooseCourse.get(m).getCourseEnd()))	
							)
							return true;
					}
				}
			}
		}
		return false;
	}
}
