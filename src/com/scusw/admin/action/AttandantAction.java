package com.scusw.admin.action;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.AttandantService;
import com.scusw.model.StudentAttendant;

public class AttandantAction {
	private AttandantService attandantService;
	private int nextPage;
	private int pageSize;
	private int departmentId;
	private String staffName;
	private String staffNo;
	private Map<String,Object> request;
	private Map<String,Object> session;
	public static Logger logger = Logger.getLogger(AttandantAction.class);
	
	public String getStaffNo() {
		return staffNo;
	}

	public void setStaffNo(String staffNo) {
		this.staffNo = staffNo;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public AttandantService getAttandantService() {
		return attandantService;
	}

	public void setAttandantService(AttandantService attandantService) {
		this.attandantService = attandantService;
	}
	public String checkStaffAttendant() {
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		//request.clear();
		if (staffName != null) {
			try {
				String name = new String(this.staffName.getBytes("ISO8859-1"),
						"UTF-8");
				logger.info("name:staffName " + name + "departmentId "
						+ departmentId);
				staffName = name;
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//request.put("department", attandantService.queryDepartmentInfo());
		request.put("departmentId", departmentId);
		request.put("staffName", staffName);
		request.put("staffNo", staffNo);
		logger.info("staffName "+staffName + " departmentId " + departmentId);
		request.put("info", attandantService.queryStaffAttendantByDepartment(nextPage, pageSize, departmentId, staffName,staffNo));
		logger.info("getInfo");
		request.put("total",attandantService.getTotalStaffAttendant(departmentId, staffName,staffNo));
		request.put("pageSize", pageSize);
		request.put("currentPage", nextPage);
		logger.info("应该显示页数："+nextPage +"pagesize:"+pageSize);
		return "staff_success";
	}
	public String checkStuAttendant() {
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		List<StudentAttendant> list = attandantService.queryStuAttendant(1,20);
		request.put("stuinfo", list);
		request.put("total",attandantService.getTotalStuAttendant());
		return "stu_success";
	}
}
