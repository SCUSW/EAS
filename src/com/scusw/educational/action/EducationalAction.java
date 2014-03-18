package com.scusw.educational.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.educational.service.EducationalService;
import com.scusw.model.CourseClasshour;
import com.scusw.model.CourseInfo;
import com.scusw.model.GroupInfo;
import com.scusw.model.PositionInfo;
import com.scusw.model.StudentAttendant;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;
import com.scusw.model.TeacherLevel;
import com.scusw.model.TeachingManageInfo;

public class EducationalAction {
	private StudentInfo stu;
	private StudentAttendant attendant;
	private TeacherInfo  teacher;
	private EducationalService educationalService;
	private Map<String,Object> request;
	private CourseInfo course;
	private int  index; 
	
	
	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	
	public CourseInfo getCourse() {
		return course;
	}

	public void setCourse(CourseInfo course) {
		this.course = course;
	}

	public TeacherInfo getTeacher() {
		return teacher;
	}

	public void setTeacher(TeacherInfo teacher) {
		this.teacher = teacher;
	}

	public StudentAttendant getAttendant() {
		return attendant;
	}

	public void setAttendant(StudentAttendant attendant) {
		this.attendant = attendant;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}



	public EducationalService getEducationalService() {
		return educationalService;
	}

	public void setEducationalService(EducationalService educationalService) {
		this.educationalService = educationalService;
	}

	public StudentInfo getStu() {
		return stu;
	}

	public void setStu(StudentInfo stu) {
		this.stu = stu;
	}
//��ʾѧ������Ϣ
	public String list(){
		List list=educationalService.queryStu(stu);
		request=(Map)ActionContext.getContext().get("request");
		request.put("stus",list);
		return "queryStu";
	}
public String queryStu(){
	return list();
}
//显示学生信息
public String listAll(){
	 StudentInfo s=educationalService.queryStu(stu).get(0);
	request=(Map)ActionContext.getContext().get("request");
	request.put("stu",s);
	return "listAll";
}

public String showAllInfo(){
	return listAll();
}

//确认学生考情
public String checkAttendant(){
	if(educationalService.checkAttdant(stu).size()==0){
		return "emptyAttendant";
	}
		
  StudentAttendant	att= educationalService.checkAttdant(stu).get(0);
    request=(Map)ActionContext.getContext().get("request");
	request.put("attendant",att);
	return "checkAttendant";
}
public String updateAttendant(){
	if(educationalService.updateAttendant(attendant))
               return "addAttendant";
	else
		return "failAddAttendant";
}
//老师信息list
public String listTeacher(){
	List list=educationalService.queryTeacher(teacher);
	request=(Map)ActionContext.getContext().get("request");
	request.put("teachers",list);
	return "listTeacher";
}
public String queryTeacher(){
	return listTeacher();
}

public List<TeacherLevel> listTeacherLevel()
{
	return educationalService.listTeacherLevel();
	}
public List<GroupInfo> listGroupInfo(){
	return educationalService.listGroupInfo();
}
public List<PositionInfo>  listPosition(){
	return educationalService.listPosition();
}
public String queryGroupAndLevel(){
	List<TeacherLevel> level=listTeacherLevel();
	List<GroupInfo>  group=listGroupInfo();
	List<PositionInfo> position=listPosition();
	request=(Map)ActionContext.getContext().get("request");
	request.put("level",level);
	request.put("group",group);
	request.put("position",position);
	return "queryGroupAndLevel";
	
}
  public String addTeacher(){	
	  String  flag=educationalService.addTeacher(teacher);
	  if(flag.equals("true"))
		  return "addTeacher";
	
	  request=(Map)ActionContext.getContext().get("request");
		  if(flag.equals("number")){
		      String hasTeacherNo="该教师编号已经存在";
			  request.put("hasTeacherNo",hasTeacherNo);
			  
			}
		  
		  if(flag.equals("Idcard")){
			     String hasIdcard="该身份证号已经存在";
				 request.put("hasIdcard",hasIdcard);
				}
		  
			return queryGroupAndLevel();
     }
  
  public String showAllTeacherInfo()
  { 
	  TeacherInfo	tea= educationalService.showAllTeacherInfo(teacher);
	    request=(Map)ActionContext.getContext().get("request");
		request.put("teacher",tea);
	  return "showAllInfo";
  }
  //显示教师课程信息
  public String queryCourse(){
	 List<CourseInfo> cous= educationalService.queryCourse(teacher);
	 
	    request=(Map)ActionContext.getContext().get("request");
		request.put("courses",cous);
	    return "queryCourse";
  }
  
  //教师工资处理
  
  public String addSalary(){
	 TeacherInfo  tm=educationalService.addSalary(teacher);
	  request=(Map)ActionContext.getContext().get("request");
		request.put("tm",tm);
	  return "addSalary";
  }
  
  //课程信息插入
  public String addCourse() {
	 
	String flag= educationalService.addCourse(course);
	request=(Map)ActionContext.getContext().get("request");
	if(flag=="addCourse"){
	   ArrayList<CourseInfo> courses=new ArrayList<CourseInfo>();
	   courses.add(course);
	   request.put("courses",courses);
		return "queryCourseInfo";
	}
	  if(flag.equals("emptyTeacher"))
		  request.put("strTeacher","emptyTeacher");
	  else if(flag.equals("emptyMajor"))
		  request.put("strMajor","emptyMajor"); 
	  return "empty";
	
}
  //课程信息查询
  public String queryCourseInfo(){
	  List<CourseInfo> cous= educationalService.queryCourseInfo(course);
	    request=(Map)ActionContext.getContext().get("request");
		request.put("courses",cous);
	  return "queryCourseInfo";
  }
  
  public String queryCourseByNT(){
	  
	    CourseInfo cous= educationalService.queryCourseInfo(course).get(0);
	    request=(Map)ActionContext.getContext().get("request");
		request.put("course",cous);
	  return "queryCourseByNameAndTeacher";
  }
  public String updateCourse(){
		String flag= educationalService.updateCourse(course);
		request=(Map)ActionContext.getContext().get("request");
		if(flag=="updateCourse"){
		   ArrayList<CourseInfo> courses=new ArrayList<CourseInfo>();
		   courses.add(course);
		   request.put("courses",courses);
			return "queryCourseInfo";
		}
		  if(flag.equals("emptyTeacher"))
			  request.put("strTeacher","emptyTeacher");
		  else if(flag.equals("emptyMajor"))
			  request.put("strMajor","emptyMajor"); 
		  return queryCourseByNT();
		
  }
  
  public String deleteCourse(){
	  educationalService.deleteCourse(course);
	  course.setCourseId(null);
	  return queryCourseInfo();
  }
  
  public String addCourseIntoTable(){
	  educationalService.addCourseIntoTable(index);
	  request=(Map)ActionContext.getContext().get("request");
	  request=(Map)ActionContext.getContext().get("request");
	  request.put("message","排课成功");
	  return "addCourseIntoTable";
  }
  
  public String querryCourseClasshour(){
	  List<CourseClasshour> list=educationalService.querryCourseClasshour(index);
	  request=(Map)ActionContext.getContext().get("request");
	  request=(Map)ActionContext.getContext().get("request");
	  request.put("list",list);
	 return "querryCourseClasshour";
  }
}
