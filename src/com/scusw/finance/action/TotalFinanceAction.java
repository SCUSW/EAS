/**
 * 
 */
package com.scusw.finance.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.finance.service.TotalFinanceService;
import com.scusw.model.FinancialRecords;
import com.scusw.util.CheckPrivilege;

/**
 * @author 杨昭远
 * 
 */
public class TotalFinanceAction {
	private TotalFinanceService totalFinanceService;
	private FinancialRecords financialRecords;
	private int financeType;
	private Map<String, Object> request;
	private double totalMoney;

	public double getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}

	public int getFinanceType() {
		return financeType;
	}

	public void setFinanceType(int financeType) {
		this.financeType = financeType;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
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

	public String totalFinance() {
		if (true) {

			totalMoney = totalFinanceService.getTotalMoney();
//			this.setRequest((Map) ActionContext.getContext().get("request"));
//			this.getRequest().put("total_money",
//					totalFinanceService.getTotalMoney());

			return "default";
		}

		return "no_privilege";
	}

	public String addFinance() {
		if (true) {
//			totalMoney = totalFinanceService.getTotalMoney();
//			System.out.println(totalMoney);

//			if (financialRecords != null) {
//				if (financialRecords.getFinancialFrom() != null
//						&& financialRecords.getFinancialNum() != null) {
//					financialRecords.setFinancialNum(financialRecords
//							.getFinancialNum()
//							* financeType);
//					totalMoney += financialRecords.getFinancialNum();
//					financialRecords.setTotalMoney(totalMoney);
//					System.out.println(financialRecords.getTotalMoney());
//					System.out.println(financialRecords.getFinancialNum());
//					System.out.println(financialRecords.getFinancialFrom());
//					System.out.println(financialRecords.getFinancialRemark());

					totalFinanceService.addFinanceRecord(financialRecords , financeType);
//				}
//			}
			
			totalMoney = totalFinanceService.getTotalMoney();
//			this.setRequest((Map) ActionContext.getContext().get("request"));
//			this.getRequest().put("total_money", totalMoney);

			return "default";
		}

		return "no_privilege";
	}

	public String historyFinance() {
		if(CheckPrivilege.checkPrivilege(2)){
		this.setRequest((Map) ActionContext.getContext().get("request"));
		this.getRequest().put("history_finance",
				totalFinanceService.getHistory());

		return "history";
		}
		
		return "no_privilege";
	}

}
