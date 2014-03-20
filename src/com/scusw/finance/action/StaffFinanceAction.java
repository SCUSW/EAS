/**
 * 
 */
package com.scusw.finance.action;

import java.sql.Timestamp;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.finance.service.StaffFinanceService;
import com.scusw.model.StaffFees;
import com.scusw.model.StaffInfo;
import com.scusw.util.CheckPrivilege;

/**
 * @author Administrator
 * 
 */
public class StaffFinanceAction {
	private StaffInfo staffInfo;
	private StaffFees staffFees;
	private StaffFinanceService staffFinanceService;
	private Map<String, Object> request;
	private Map<String, String> lastPayTime;
	private int test;

	public int getTest() {
		return test;
	}

	public void setTest(int test) {
		this.test = test;
	}

	public StaffFees getStaffFees() {
		return staffFees;
	}

	public void setStaffFees(StaffFees staffFees) {
		this.staffFees = staffFees;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public StaffFinanceService getStaffFinanceService() {
		return staffFinanceService;
	}

	public void setStaffFinanceService(StaffFinanceService staffFinanceService) {
		this.staffFinanceService = staffFinanceService;
	}

	public StaffInfo getStaffInfo() {
		return staffInfo;
	}

	public void setStaffInfo(StaffInfo staffInfo) {
		this.staffInfo = staffInfo;
	}

	public Map<String, String> getLastPayTime() {
		return lastPayTime;
	}

	public void setLastPayTime(Map<String, String> lastPayTime) {
		this.lastPayTime = lastPayTime;
	}

	public String searchAll() {
		if (CheckPrivilege.checkPrivilege(6)) {
			this.setRequest((Map) ActionContext.getContext().get("request"));
			this.getRequest()
					.put("staff_list", staffFinanceService.searchAll());

			lastPayTime = staffFinanceService.getLastPayTime();

			return "default";
		}

		return "no_privilege";
	}

	public String searchStaff() {
		if (CheckPrivilege.checkPrivilege(6)) {
			this.setRequest((Map) ActionContext.getContext().get("request"));
			this.getRequest().put("staff_list",
					staffFinanceService.conditionSearch(staffInfo));

			lastPayTime = staffFinanceService.getLastPayTime();
			return "default";
		}

		return "no_privilege";
	}

	public String payStaff() {
		if (CheckPrivilege.checkPrivilege(8)
				&& CheckPrivilege.checkPrivilege(9)
				&& CheckPrivilege.checkPrivilege(3)) {

			staffFinanceService.addStaffSalaryFees(staffFees);

//			this.setRequest((Map) ActionContext.getContext().get("request"));
//			this.getRequest()
//					.put("staff_list", staffFinanceService.searchAll());

			return "paysalary_success";
		}

		return "no_privilege";

	}

	public String checkHistoryById() {
		if (CheckPrivilege.checkPrivilege(7)) {
			this.setRequest((Map) ActionContext.getContext().get("request"));
			this.getRequest().put("stafffees_history",
					staffFinanceService.getFeesHistory(staffFees));

			return "history";
		}

		return "no_privilege";
	}

}
