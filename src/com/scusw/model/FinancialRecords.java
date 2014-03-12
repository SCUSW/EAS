package com.scusw.model;

import java.sql.Timestamp;

/**
 * FinancialRecords entity. @author MyEclipse Persistence Tools
 */

public class FinancialRecords implements java.io.Serializable {

	// Fields

	private Integer financialId;
	private BranchInfo branchInfo;
	private Float financialNum;
	private Timestamp financialTime;
	private Double totalMoney;
	private String financialFrom;
	private String financialRemark;

	// Constructors

	/** default constructor */
	public FinancialRecords() {
	}

	/** minimal constructor */
	public FinancialRecords(Timestamp financialTime) {
		this.financialTime = financialTime;
	}

	/** full constructor */
	public FinancialRecords(BranchInfo branchInfo, Float financialNum,
			Timestamp financialTime, Double totalMoney, String financialFrom,
			String financialRemark) {
		this.branchInfo = branchInfo;
		this.financialNum = financialNum;
		this.financialTime = financialTime;
		this.totalMoney = totalMoney;
		this.financialFrom = financialFrom;
		this.financialRemark = financialRemark;
	}

	// Property accessors

	public Integer getFinancialId() {
		return this.financialId;
	}

	public void setFinancialId(Integer financialId) {
		this.financialId = financialId;
	}

	public BranchInfo getBranchInfo() {
		return this.branchInfo;
	}

	public void setBranchInfo(BranchInfo branchInfo) {
		this.branchInfo = branchInfo;
	}

	public Float getFinancialNum() {
		return this.financialNum;
	}

	public void setFinancialNum(Float financialNum) {
		this.financialNum = financialNum;
	}

	public Timestamp getFinancialTime() {
		return this.financialTime;
	}

	public void setFinancialTime(Timestamp financialTime) {
		this.financialTime = financialTime;
	}

	public Double getTotalMoney() {
		return this.totalMoney;
	}

	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}

	public String getFinancialFrom() {
		return this.financialFrom;
	}

	public void setFinancialFrom(String financialFrom) {
		this.financialFrom = financialFrom;
	}

	public String getFinancialRemark() {
		return this.financialRemark;
	}

	public void setFinancialRemark(String financialRemark) {
		this.financialRemark = financialRemark;
	}

}