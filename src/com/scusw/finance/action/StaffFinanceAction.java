/**
 * 
 */
package com.scusw.finance.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.finance.service.StaffFinanceService;
import com.scusw.finance.service.TotalFinanceService;
import com.scusw.model.FinancialRecords;
import com.scusw.model.SalesmanInfo;
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
	private TotalFinanceService totalFinanceService;
	private FinancialRecords financialRecords;
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

	public TotalFinanceService getTotalFinanceService() {
		return totalFinanceService;
	}

	public void setTotalFinanceService(TotalFinanceService totalFinanceService) {
		this.totalFinanceService = totalFinanceService;
	}

	public FinancialRecords getFinancialRecords() {
		return financialRecords;
	}

	public void setFinancialRecords(FinancialRecords financialRecords) {
		this.financialRecords = financialRecords;
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
			
			test = 1;

			return "default";
		}

		return "no_privilege";
	}

	public String searchStaff() {
		if (CheckPrivilege.checkPrivilege(6)) {
			System.out.println(staffInfo.getStaffName());
			this.setRequest((Map) ActionContext.getContext().get("request"));
			this.getRequest().put(
					"staff_list",
					staffFinanceService.conditionSearch(staffInfo
							.getStaffName()));
			// staffInfo =
			// staffFinanceService.conditionSearch(staffInfo.getStaffName()).get(0);
			// if(!staffInfo.getSalesmanInfos().isEmpty()){
			// System.out.println("22222222222");
			// System.out.println(staffInfo.getSalesmanInfos().size());
			// System.out.println(((SalesmanInfo)staffInfo.getSalesmanInfos().iterator().next()).getSalesmanSalary());
			// }
			return "default";
		}

		return "no_privilege";
	}

	public String payStaff() {
		if (CheckPrivilege.checkPrivilege(8)
				&& CheckPrivilege.checkPrivilege(9)
				&& CheckPrivilege.checkPrivilege(1)
				&& CheckPrivilege.checkPrivilege(3)) {
			System.out.println("1111111");
			staffFees.setSfeesFrom("支付职工工资");
			staffFinanceService.addStaffFees(staffFees);

			double totalMoney = totalFinanceService.getTotalMoney();
			System.out.println(totalMoney);

			if (staffFees.getSfeesNum() > 0) {
				if (financialRecords == null) {
					financialRecords = new FinancialRecords();
				}
				staffInfo = staffFinanceService.findById(staffFees
						.getStaffInfo().getStaffId());
				financialRecords.setFinancialNum(0 - staffFees.getSfeesNum());
				totalMoney += financialRecords.getFinancialNum();
				financialRecords.setTotalMoney(totalMoney);
				financialRecords.setFinancialFrom("支付职工工资");
				financialRecords.setFinancialRemark("职工编号："
						+ staffInfo.getStaffNo() + "职工姓名："
						+ staffInfo.getStaffName());
				System.out.println(financialRecords.getTotalMoney());
				System.out.println(financialRecords.getFinancialNum());
				System.out.println(financialRecords.getFinancialFrom());

				totalFinanceService.addFinanceRecord(financialRecords);
			}

			this.setRequest((Map) ActionContext.getContext().get("request"));
			this.getRequest()
					.put("staff_list", staffFinanceService.searchAll());

			return "paysalary_success";
		}

		return "no_privilege";

	}

	public String checkHistoryById() {
		if (CheckPrivilege.checkPrivilege(7)) {
			this.setRequest((Map) ActionContext.getContext().get("request"));
			this.getRequest().put(
					"stafffees_history",
					staffFinanceService.getFeesHistory(staffFees.getStaffInfo()
							.getStaffId()));

			return "history";
		}

		return "no_privilege";
	}

}
