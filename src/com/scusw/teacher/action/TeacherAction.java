package com.scusw.teacher.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;  
import org.apache.struts2.util.ServletContextAware;

import java.io.File;  
import java.io.FileInputStream;  
import java.io.FileNotFoundException;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import java.io.OutputStream;  
import java.util.List; 

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.scusw.model.CourseInfo;
import com.scusw.model.MajorInfo;
import com.scusw.model.RegisterInfo;
import com.scusw.model.StaffAttandant;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;
import com.scusw.model.StudentAttendant;
import com.scusw.model.TeacherLevel;
import com.scusw.model.TeachingManageInfo;
import com.scusw.teacher.service.TeacherService;
import com.scusw.util.MD5Util;

public class TeacherAction extends ActionSupport{
	private TeacherService teacherService;
	private TeacherInfo teacher;
	private StaffInfo staff;
	private StudentInfo student;
	private CourseInfo course;
	private RegisterInfo register;
	private StudentAttendant studentAttendantInfo;
	private MajorInfo major;
	private TeacherLevel teacherLevel;
	private TeachingManageInfo teachingManage;
	private Map<String,Object> request;
	private Map<String, Object> session;	
	
	private InputStream downloadInputStream;

	private File doc;
	
	private String errorMessage ; 
/*	private String fileName;   
    private String contentType;
    private ServletContext context; 

	
    public void setDocFileName(String fileName) {   
        this.fileName = fileName;   
    }   
       
    public void setDocContentType(String contentType) {   
        this.contentType = contentType;   
    }   
       
    public void setServletContext(ServletContext context) {   
        this.context = context;   
    }   
    */
	
	
	public StaffInfo getStaff() {
		return staff;
	}
	public void setStaff(StaffInfo staff) {
		this.staff = staff;
	}
	public TeacherService getTeacherService() {
		return teacherService;
	}
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}
	public TeacherInfo getTeacher() {
		return teacher;
	}
	public void setTeacher(TeacherInfo teacher) {
		this.teacher = teacher;
	}
	public Map<String, Object> getRequest() {
		return request;
	}
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setStudent(StudentInfo student) {
		this.student = student;
	}
	public StudentInfo getStudent() {
		return student;
	}
	public void setCourse(CourseInfo course) {
		this.course = course;
	}
	public CourseInfo getCourse() {
		return course;
	}
	public void setRegister(RegisterInfo register) {
		this.register = register;
	}
	public RegisterInfo getRegister() {
		return register;
	}
	public void setStudentAttendantInfo(StudentAttendant studentAttendantInfo) {
		this.studentAttendantInfo = studentAttendantInfo;
	}
	public StudentAttendant getStudentAttendantInfo() {
		return studentAttendantInfo;
	}
	public void setMajor(MajorInfo major) {
		this.major = major;
	}
	public MajorInfo getMajor() {
		return major;
	}
	public TeacherLevel getTeacherLevel() {
		return teacherLevel;
	}
	public void setTeacherLevel(TeacherLevel teacherLevel) {
		this.teacherLevel = teacherLevel;
	}
	public String downloadTeachingPlan(){
		return "downloadTeachingPlan";
	}
	public void setDownloadInputStream(InputStream downloadInputStream) {
		this.downloadInputStream = downloadInputStream;
	}
	public InputStream getDownloadInputStream() {
		return downloadInputStream;
	}
	public void setTeachingManage(TeachingManageInfo teachingManage) {
		this.teachingManage = teachingManage;
	}
	public TeachingManageInfo getTeachingManage() {
		return teachingManage;
	}
	public File getDoc() {
		return doc;
	}
	public void setDoc(File doc) {
		this.doc = doc;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	
	
	//获取老师个人信息
	public String getOwnTeacherInfo(){
		try{
			session = ActionContext.getContext().getSession();
			int staffId = (Integer) session.get("staffId");
			teacher=teacherService.getOwnTeacherInfo(staffId);
			return "getOwnTeacherInfo";
		}catch(Exception e){
			return "default";
		}
	}
	
	//进入更新页面，更新页面中有老师原本的个人信息提示
	public String updateOwnTeacherInfo1(){
		
		try{
			session = ActionContext.getContext().getSession();
			int staffId = (Integer) session.get("staffId");
			teacher=teacherService.getOwnTeacherInfo(staffId);
			return "updateOwnTeacherInfo1";
		}catch(Exception e){
			return "default";
		}
	}
	
	//接收需要更新的信息并更新
	public String updateOwnTeacherInfo2(){		
		try{
			teacherService.updateTeacherStaff(staff);
			
			session = ActionContext.getContext().getSession();
			int staffId = (Integer) session.get("staffId");
			teacher=teacherService.getOwnTeacherInfo(staffId);
			
			return "updateOwnTeacherInfo2";
		}catch(Exception e){
			return "updateOwnTeacherInfo2_default";
		}
	}

	public String searchStudent() {
		try {
			request = (Map) ActionContext.getContext().get("request");

			if (!student.getStudentNo().equals("")) {
				List list = teacherService.searchStudentByNo(student
						.getStudentNo());
				request.put("students", list);
			} else if (!student.getStudentName().equals("")) {
				List list = teacherService.searchStudentByName(student
						.getStudentName());
				request.put("students", list);
			} else {
				List list = teacherService.searchStudentAll();
				request.put("students", list);
			}
			return "searchStudent";
		} catch (Exception e) {
			return "default";
		}
		
	}
	
	public String getStudentInfo(){
		try {
			student=teacherService.getStudentInfo(student.getStudentNo());
			return "getStudentInfo";
		} catch (Exception e) {
			return "default";
		}
		
	}
	
	public String searchTeacherOwnCourse(){
		try {
			request=(Map)ActionContext.getContext().get("request");
		
		session = ActionContext.getContext().getSession();
		int staffId = (Integer) session.get("staffId");
		
		List list=teacherService.getTeacherOwnCourse(staffId);
		request.put("courses", list);
		
		return "searchTeacherOwnCourse";
		} catch (Exception e) {
			return "default";
		}
	}

	public String searchOwnStudent(){
		try {
			request=(Map)ActionContext.getContext().get("request");
		
		List list=teacherService.searchStudentByCourseId(course.getCourseId());
		request.put("students",list);
		
		return "searchOwnStudent";
		} catch (Exception e) {
			return "default";
		}
	}
	
	public String getOwnStudentInfo(){
		try {
			student = teacherService.getStudentInfo(student.getStudentNo());
			course = teacherService.getCourseById(course.getCourseId());
			register = teacherService.getRegisterByStudentIdCourseId(student
					.getStudentId(), course.getCourseId());
			return "getOwnStudentInfo";
		} catch (Exception e) {
			return "default";
		}
	}
	
	public String updateStudentCourseScore(){
		try {
			teacherService.updateStudentCourseScore(register.getRegisterId(),
					register.getStudentCourseScore());
			this.getOwnStudentInfo();
			return "updateStudentCourseScore";
		} catch (Exception e) {
			return "default";
		}
	}

	public String getStudentAttendant(){
		
		try {
			request = (Map) ActionContext.getContext().get("request");

			List list = teacherService.getStudentAttendant(register
					.getRegisterId());
			request.put("studentAttendants", list);

			return "getStudentAttendant";
		} catch (Exception e) {
			return "default";
		}
	}
	
	public String addStudentAttendant(){
		
		try {
			StudentAttendant studentAttendant = new StudentAttendant();
			register = teacherService.getRegisterById(register.getRegisterId());
			studentAttendant.setAttendantRemark("");
			studentAttendant.setRegisterInfo(register);

			// Calendar ca = Calendar.getInstance();
			// String catt;
			// String year = java.lang.String.valueOf(ca.get(1));
			// String month = java.lang.String.valueOf(ca.get(2)+1);
			// if(month.length()==1)
			// month = "0" + month;
			// String day = java.lang.String.valueOf(ca.get(5));
			// if(day.length()==1)
			// day = "0" + day;
			// String hour = java.lang.String.valueOf(ca.get(11));
			// if(hour.length()==1)
			// hour = "0" + hour;
			// String minute = java.lang.String.valueOf(ca.get(12));
			// if(minute.length()==1)
			// minute = "0" + minute;
			// String second = java.lang.String.valueOf(ca.get(13));
			// if(second.length()==1)
			// second = "0" + second;
			// catt = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
			// SimpleDateFormat df = new SimpleDateFormat(catt);
			// String time = df.format(new java.util.Date());
			// Timestamp ts = Timestamp.valueOf(time);
			// studentAttendant.setAttendantTime(ts);

			// Timestamp currTime = new Timestamp(System.currentTimeMillis());
			studentAttendant.setAttendantTime(new Timestamp(System
					.currentTimeMillis()));

			boolean flag = teacherService.addStudentAttendant(studentAttendant);
			if (flag) {
				this.getStudentAttendant();
				return "addStudentAttendant";
			} else {
				return "addStudentAttendant_default";
			}
		} catch (Exception e) {
			return "addStudentAttendant_default";
		}
		
	}
	
	public String searchOwnCommonTeacher(){
		
		try {
			request = (Map) ActionContext.getContext().get("request");

			session = ActionContext.getContext().getSession();
			int staffId = (Integer) session.get("staffId");

			if (!staff.getStaffNo().equals("")) {
				List list = teacherService.getOwnCommonTeacherByStaffNo(
						staffId, staff.getStaffNo());
				request.put("ownCommonTeachers", list);
			} else if (!staff.getStaffName().equals("")) {
				List list = teacherService.getOwnCommonTeacherByStaffName(
						staffId, staff.getStaffName());
				request.put("ownCommonTeachers", list);
			} else {
				List list = teacherService.getOwnCommonTeacher(staffId);
				request.put("ownCommonTeachers", list);
			}
			return "searchOwnCommonTeacher";
		} catch (Exception e) {
			return "default";
		}

	}
	
	public String getOwnCommonTeacherInfo(){
		try {
			teacher = teacherService.getOwnTeacherInfo(staff.getStaffId());
			return "getOwnCommonTeacherInfo";
		} catch (Exception e) {
			return "default";
		}
	}

	public String addCommonTeacher1(){
		try {
			request = (Map) ActionContext.getContext().get("request");

			List list = teacherService.searchteacherLevel();
			request.put("teacherLevels", list);

			return "addCommonTeacher1";
		} catch (Exception e) {
			return "default";
		}
	}
	
	public String addCommonTeacher2(){
		try {
			int flag = teacherService.addCommonTeacher(teacher,teacherLevel.getLevelId(), staff);
			
			if (flag == 0) {
				return "addCommonTeacher2";
			}else if (flag == 1) {
				errorMessage = "已有此账号";
			}else if (flag == 2) {
				errorMessage = "已有此身份证号";
			}else if (flag == 3) {
				errorMessage = "已有此教师证号";
			}else {
				return "default";
			}

			return "addCommonTeacher2_default";
			
		} catch (Exception e) {
			return "default";
		}
	}
	
	public String getCommonTeacherAttandant(){
		try {
			request = (Map) ActionContext.getContext().get("request");

			List list = teacherService.getCommonTeacherAttandantByStaffId(staff
					.getStaffId());
			request.put("commonTeacherAttandants", list);

			return "getCommonTeacherAttandant";
		} catch (Exception e) {
			return "default";
		}
	}

	public String addCommonTeacherAttandant(){
		try {
			StaffAttandant staffAttandant = new StaffAttandant();
			staffAttandant.setStaffInfo(teacherService.getOwnTeacherInfo(staff.getStaffId()).getStaffInfo());
			staffAttandant.setAttendantRemark("");
			staffAttandant.setAttendantTime(new Timestamp(System.currentTimeMillis()));
			
			boolean flag=teacherService.addStaffAttandant(staffAttandant);
			if(flag){
				this.getCommonTeacherAttandant();
				return "addCommonTeacherAttandant";
			}else{
				return "addCommonTeacherAttandant_default";
			}
		} catch (Exception e) {
			return "addCommonTeacherAttandant_default";
		}
	}
	
	public String getOwnCourse(){
		try {
			request = (Map) ActionContext.getContext().get("request");

			session = ActionContext.getContext().getSession();
			int staffId = (Integer) session.get("staffId");

			List list = teacherService.searchOwnCourseByStaffId(staffId);
			request.put("courses", list);

			return "getOwnCourse";
		} catch (Exception e) {
			return "default";
		}
	}
	
	public String addOwnCourse1(){
		try {
			request = (Map) ActionContext.getContext().get("request");

			List list = teacherService.searchMajor();
			request.put("majors", list);

			return "addOwnCourse1";
		} catch (Exception e) {
			return "default";
		}
	}
	public String addOwnCourse2(){
		try {
			session = ActionContext.getContext().getSession();
			int staffId = (Integer) session.get("staffId");

			course
					.setMajorInfo(teacherService.getMajorById(major
							.getMajorId()));
			course.setCoursePrice((float) 0);
			course.setTeacherInfo(teacherService.getOwnTeacherInfo(staffId));
			course.setCourseAvai((int) 1);

			boolean flag = teacherService.addOwnCourse(course);
			if (flag) {
				// System.out.println(course.getMajorInfo().getMajorName());
				// System.out.println(course.getTeacherInfo().getStaffInfo().getStaffName());
				// System.out.println(course.getCourseName());
				// System.out.println(course.getCourseStart());
				// System.out.println(course.getCourseEnd());
				// System.out.println(course.getCoursePrice());
				// System.out.println(course.getCourseAvai());
				// System.out.println(course.getCourseDesc());

				this.getOwnCourse();
				return "addOwnCourse2";
			} else {
				return "addOwnCourse2_default";
			}
		} catch (Exception e) {
			return "addOwnCourse2_default";
		}
		
	}
	
	public String getCommonTeacherCourseList(){
		try {
			request = (Map) ActionContext.getContext().get("request");

			List list = teacherService.searchOwnCourseByStaffId(staff
					.getStaffId());
			request.put("courses", list);

			return "getCommonTeacherCourseList";
		} catch (Exception e) {
			return "default";
		}
	}
	
	public String commonTeacherCourseInfo(){
		try {
			course = teacherService.getCourseById(course.getCourseId());
			return "commonTeacherCourseInfo";
		} catch (Exception e) {
			return "default";
		}
	}
	
	public String updateCommonTeacherCoursePrice(){
		try {
			float coursePrice = course.getCoursePrice();

			course = teacherService.getCourseById(course.getCourseId());

			if (course.getCoursePrice() != 0)
				return "updateCommonTeacherCoursePrice_default";

			course.setCoursePrice(coursePrice);
			teacherService.updateCourse(course);
			teacher = course.getTeacherInfo();
			teacher.setTeacherSalary(course.getCoursePrice()
					+ teacher.getTeacherSalary());
			teacherService.updateTeacher(teacher);
			this.commonTeacherCourseInfo();
			return "updateCommonTeacherCoursePrice";
		} catch (Exception e) {
			return "updateCommonTeacherCoursePrice_default";
		}
		
	}
	
	public String ownCourseInfo(){
		try {
			course = teacherService.getCourseById(course.getCourseId());
			return "ownCourseInfo";
		} catch (Exception e) {
			return "default";
		}
	}
	
	public String getOwnTeachingManageList(){
		try {
			request = (Map) ActionContext.getContext().get("request");

			List list = teacherService.searchOwnTeachingManageByCourseId(course
					.getCourseId());
			request.put("ownTeachingManageInfos", list);

			return "getOwnTeachingManageList";
		} catch (Exception e) {
			return "default";
		}
	}
	
//	public String uploadTeachPlan(){
//	try{
//		 InputStream in = new FileInputStream(file);
//		 course=teacherService.getCourseById(course.getCourseId());
//		 String path=UPLOADDIR+course.getTeacherInfo().getStaffInfo().getStaffName()+"//"+course.getCourseName();
//         String dir = ServletActionContext.getRequest().getRealPath(path);  
//         File fileLocation = new File(dir);  
//         //此处也可以在应用根目录手动建立目标上传目录  
//         if(!fileLocation.exists()){  
//             boolean isCreated  = fileLocation.mkdir();  
//             if(!isCreated) {  
//                 //目标上传目录创建失败,可做其他处理,例如抛出自定义异常等,一般应该不会出现这种情况。  
//                 return "uploadTeachPlan_default";  
//             }  
//         }  
//         String fileName=file.getName();  
//         File uploadFile = new File(dir, fileName);   
//         OutputStream out = new FileOutputStream(uploadFile);   
//         byte[] buffer = new byte[1024 * 1024];   
//         int length;   
//         while ((length = in.read(buffer)) > 0) {   
//             out.write(buffer, 0, length);   
//         }   
//         in.close();   
//         out.close();   
//         
//         this.getOwnTeachingManageList();
//         
//         return "uploadTeachPlan";
//     } catch (Exception e) {   
//    	 System.out.println(e);
//         e.printStackTrace();   
//         return "uploadTeachPlan_default";
//     } 
//	}
	
//	public String uploadTeachPlan(){  
//        try {
//        	String targetDirectory = ServletActionContext.getServletContext().getRealPath("/upload");
//        	
////            String targetFileName = course.getTeacherInfo().getStaffInfo().getStaffName()
////            +"_"+course.getCourseName()+"_"+Calendar.getInstance();
//            
//        	
//        	String targetFileName = doc.getName();
//        	
//            File target = new File(targetDirectory, targetFileName);   
//            
//			FileUtils.copyFile(doc, target);
//			
//			TeachingManageInfo teachingManage = new TeachingManageInfo();
//			teachingManage.setCourseInfo(teacherService.getCourseById(course.getCourseId()));
//			teachingManage.setExamState(0);
//			teachingManage.setSetTime(new Timestamp(System.currentTimeMillis()));
//			teachingManage.setTeachPlan("upload/"+targetFileName);
//			
//			
//			
//			boolean flag=teacherService.addTeachingManage(teachingManage);
//			if(flag){
//				this.getOwnTeachingManageList();
//		        return "uploadTeachPlan";  
//			}else{
//				return "uploadTeachPlan_default";
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "uploadTeachPlan_default";
//		}   
//	}	
	
	public String uploadTeachPlan(){  
        try {
        	String targetDirectory = ServletActionContext.getServletContext().getRealPath("/upload");
       
        	course=teacherService.getCourseById(course.getCourseId());
       
        	
    		Calendar ca = Calendar.getInstance();
    		String catt;
    		String year = java.lang.String.valueOf(ca.get(1));
    		String month = java.lang.String.valueOf(ca.get(2)+1);
    		if(month.length()==1)
    			month = "0" + month;
    		String day = java.lang.String.valueOf(ca.get(5));
    		if(day.length()==1)
    			day = "0" + day;
    		String hour = java.lang.String.valueOf(ca.get(11));
    		if(hour.length()==1)
    			hour = "0" + hour;
    		String minute = java.lang.String.valueOf(ca.get(12));
    		if(minute.length()==1)
    			minute = "0" + minute;
    		String second = java.lang.String.valueOf(ca.get(13));
    		if(second.length()==1)
    			second = "0" + second;
    		catt = year+"-"+month+"-"+day+"_"+hour+"-"+minute+"-"+second;

        	
            String targetFileName = course.getCourseId()+"_"+"teachPlan"+"_"+catt+".doc";
        	 	
            File target = new File(targetDirectory, targetFileName);   
            
			FileUtils.copyFile(doc, target);
			
			
			
			
			TeachingManageInfo teachingManage = new TeachingManageInfo();
			teachingManage.setCourseInfo(teacherService.getCourseById(course.getCourseId()));
			teachingManage.setExamState(0);
			teachingManage.setSetTime(new Timestamp(System.currentTimeMillis()));
			teachingManage.setTeachPlan("upload/"+targetFileName);
			
			
			
			boolean flag=teacherService.addTeachingManage(teachingManage);
			if(flag){
				this.getOwnTeachingManageList();
		        return "uploadTeachPlan";  
			}else{
				return "uploadTeachPlan_default";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "uploadTeachPlan_default";
		}   
	}
	
	
//	public String uploadTeachPlan(){  
//        try {
//        	String targetDirectory = ServletActionContext.getServletContext().getRealPath("/upload");
//        	
////            String targetFileName = course.getTeacherInfo().getStaffInfo().getStaffName()
////            +"_"+course.getCourseName()+"_"+Calendar.getInstance();
//            
//        	System.out.println(fileName);
//        	
//        	String targetFileName = generateFileName(fileName);
//        	
//            File target = new File(targetDirectory, targetFileName);   
//            
//			FileUtils.copyFile(doc, target);
//			
//			TeachingManageInfo teachingManage = new TeachingManageInfo();
//			teachingManage.setCourseInfo(teacherService.getCourseById(course.getCourseId()));
//			teachingManage.setExamState(0);
//			teachingManage.setSetTime(new Timestamp(System.currentTimeMillis()));
//			teachingManage.setTeachPlan("upload/"+targetFileName);
//
//			boolean flag=teacherService.addTeachingManage(teachingManage);
//			if(flag){
//				this.getOwnTeachingManageList();
//		        return "uploadTeachPlan";  
//			}else{
//				return "uploadTeachPlan_default";
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "uploadTeachPlan_default";
//		}   
//	}

//	private String generateFileName(String fileName) {   
//        DateFormat format = new SimpleDateFormat("yyMMddHHmmss");   
//        String formatDate = format.format(new Date());   
//           
//        int random = new Random().nextInt(10000);   
//           
//        int position = fileName.lastIndexOf(".");   
//        String extension = fileName.substring(position);   
//           
//        return formatDate + random + extension;   
//    }      
	

	public String uploadLessonPlan(){
		try {
        	String targetDirectory = ServletActionContext.getServletContext().getRealPath("/upload");    	
            
        	course=teacherService.getCourseById(course.getCourseId());
       
    		Calendar ca = Calendar.getInstance();
    		String catt;
    		String year = java.lang.String.valueOf(ca.get(1));
    		String month = java.lang.String.valueOf(ca.get(2)+1);
    		if(month.length()==1)
    			month = "0" + month;
    		String day = java.lang.String.valueOf(ca.get(5));
    		if(day.length()==1)
    			day = "0" + day;
    		String hour = java.lang.String.valueOf(ca.get(11));
    		if(hour.length()==1)
    			hour = "0" + hour;
    		String minute = java.lang.String.valueOf(ca.get(12));
    		if(minute.length()==1)
    			minute = "0" + minute;
    		String second = java.lang.String.valueOf(ca.get(13));
    		if(second.length()==1)
    			second = "0" + second;
    		catt = year+"-"+month+"-"+day+"_"+hour+"-"+minute+"-"+second;

        	
            String targetFileName = course.getCourseId()+"_"+"lessonPlan"+"_"+catt+".doc";
  
            File target = new File(targetDirectory, targetFileName);   
            
			FileUtils.copyFile(doc, target);
			
			teachingManage = teacherService.getTeachingManageById(teachingManage.getTeachingManageId());
			teachingManage.setLessonPlan("upload/"+targetFileName);
			
			teacherService.updateTeachingManage(teachingManage);
			
			this.getOwnTeachingManageList();
			return "uploadLessonPlan";
			
		} catch (Exception e) {
			e.printStackTrace();
			return "uploadLessonPlan_default";
		}   
	}
	
	public String uploadTeacherSummary(){
		try {
			String targetDirectory = ServletActionContext.getServletContext().getRealPath("/upload");
		       
        	course=teacherService.getCourseById(course.getCourseId());
       
        	
    		Calendar ca = Calendar.getInstance();
    		String catt;
    		String year = java.lang.String.valueOf(ca.get(1));
    		String month = java.lang.String.valueOf(ca.get(2)+1);
    		if(month.length()==1)
    			month = "0" + month;
    		String day = java.lang.String.valueOf(ca.get(5));
    		if(day.length()==1)
    			day = "0" + day;
    		String hour = java.lang.String.valueOf(ca.get(11));
    		if(hour.length()==1)
    			hour = "0" + hour;
    		String minute = java.lang.String.valueOf(ca.get(12));
    		if(minute.length()==1)
    			minute = "0" + minute;
    		String second = java.lang.String.valueOf(ca.get(13));
    		if(second.length()==1)
    			second = "0" + second;
    		catt = year+"-"+month+"-"+day+"_"+hour+"-"+minute+"-"+second;

        	
            String targetFileName = course.getCourseId()+"_"+"teacherSummary"+"_"+catt+".doc";
  
            File target = new File(targetDirectory, targetFileName);   
            
			FileUtils.copyFile(doc, target);
			
			teachingManage = teacherService.getTeachingManageById(teachingManage.getTeachingManageId());
			teachingManage.setTeacherSummary("upload/"+targetFileName);
			
			teacherService.updateTeachingManage(teachingManage);
			
			this.getOwnTeachingManageList();
			return "uploadTeacherSummary";
			
		} catch (Exception e) {
			e.printStackTrace();
			return "uploadTeacherSummary_default";
		}   
	}
	
	public String getCommonTeachingManageList() {
		try {
			request = (Map) ActionContext.getContext().get("request");

			List list = teacherService.searchOwnTeachingManageByCourseId(course
					.getCourseId());
			request.put("ownTeachingManageInfos", list);

			return "getCommonTeachingManageList";
		} catch (Exception e) {
			return "default";
		}
	}
	
	public String examTeachingManage() {
		try {
			int examState = teachingManage.getExamState();
			teachingManage = teacherService
					.getTeachingManageById(teachingManage.getTeachingManageId());
			teachingManage.setExamState(examState);
			teacherService.updateTeachingManage(teachingManage);

			this.getOwnTeachingManageList();
			return "examTeachingManage";
		} catch (Exception e) {
			return "examTeachingManage_default";
		}
	}

}
