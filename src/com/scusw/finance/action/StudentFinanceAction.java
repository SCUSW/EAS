/**
 * 
 */
package com.scusw.finance.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.finance.service.StudentFinanceService;
import com.scusw.finance.service.TotalFinanceService;
import com.scusw.model.FinancialRecords;
import com.scusw.model.StudentFees;
import com.scusw.model.StudentInfo;
import com.scusw.util.CheckPrivilege;

/**
 * @author 杨昭远 学生的财务查询Action
 */
public class StudentFinanceAction {
	private StudentFinanceService studentFinanceService;
	private TotalFinanceService totalFinanceService;
	private FinancialRecords financialRecords;
	private StudentInfo studentInfo;
	private StudentFees studentFees;
	private Map<String, Object> request;

	public StudentFinanceService getStudentFinanceService() {
		return studentFinanceService;
	}

	public void setStudentFinanceService(
			StudentFinanceService studentFinanceService) {
		this.studentFinanceService = studentFinanceService;
	}

	public StudentInfo getStudentInfo() {
		return studentInfo;
	}

	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}

	/**
	 * @param request
	 *            the request to set
	 */
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	/**
	 * @return the request
	 */
	public Map<String, Object> getRequest() {
		return request;
	}

	public StudentFees getStudentFees() {
		return studentFees;
	}

	public void setStudentFees(StudentFees studentFees) {
		this.studentFees = studentFees;
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

	public String searchAll() {
		if (CheckPrivilege.checkPrivilege(4)) {
			this.setRequest((Map) ActionContext.getContext().get("request"));
			this.getRequest().put("student_list",
					studentFinanceService.searchAll());

			return "default";
		}

		return "no_privilege";
	}

	public String conditionSearch() {
		if (CheckPrivilege.checkPrivilege(4)) {
			System.out.println(studentInfo.getStudentName());

			this.setRequest((Map) ActionContext.getContext().get("request"));
			this.getRequest().put(
					"student_list",
					studentFinanceService.conditionSearch(studentInfo
							.getStudentName()));

			return "default";
		}

		return "no_privilege";
	}

	public String detailInfo() {
		if (CheckPrivilege.checkPrivilege(4)) {
			this.setRequest((Map) ActionContext.getContext().get("request"));
			this.getRequest().put("studentInfo",
					studentFinanceService.findById(studentInfo.getStudentId()));

			return "detail";
		}

		return "no_privilege";
	}

	public String changeFees() {
		if (CheckPrivilege.checkPrivilege(5)
				&& CheckPrivilege.checkPrivilege(3)) {
			System.out.println(studentFees.getStudentInfo().getStudentId());
			System.out.println(studentFees.getFeesNum());

			studentFinanceService.updateBalance(studentFees);
			studentFinanceService.addStudentFees(studentFees);

			double totalMoney = totalFinanceService.getTotalMoney();
			System.out.println(totalMoney);

			if (studentFees.getFeesNum() < 0) {
				if (financialRecords == null) {
					financialRecords = new FinancialRecords();
				}
				if (studentInfo == null) {
					studentInfo = studentFinanceService.findById(studentFees
							.getStudentInfo().getStudentId());
				}
				financialRecords.setFinancialNum(0 - studentFees.getFeesNum());
				totalMoney += financialRecords.getFinancialNum();
				financialRecords.setTotalMoney(totalMoney);
				financialRecords.setFinancialFrom("学生扣费");
				financialRecords.setFinancialRemark("学生学号："
						+ studentInfo.getStudentNo() + "学生姓名："
						+ studentInfo.getStudentName());
				System.out.println(financialRecords.getTotalMoney());
				System.out.println(financialRecords.getFinancialNum());
				System.out.println(financialRecords.getFinancialFrom());

				totalFinanceService.addFinanceRecord(financialRecords);
			}

			this.setRequest((Map) ActionContext.getContext().get("request"));
			List<StudentInfo> a = new ArrayList<StudentInfo>();
			a.add(studentFinanceService.findById(studentFees.getStudentInfo()
					.getStudentId()));
			this.getRequest().put("student_list", a);

			return "default";
		}

		return "no_privilege";
	}
}
