/**
 * 
 */
package com.scusw.marketing.dao;

import java.util.List;

import com.scusw.model.ConsultInfo;
import com.scusw.model.SalesmanInfo;
import com.scusw.model.StudentConsultway;
import com.scusw.model.StudentInfo;

/**
 * 类描述：营销人员可使用的方法的接口
 * @author Administrator
 * @data：日期：2014-3-11 时间：下午4:39:49
 * version 1.0
 */
public interface MarketingDao {
	public void addConsultInfo(ConsultInfo consultInfo);
	public void addSelectConsultwayInfo(List<StudentConsultway> studentConsultway);
	public boolean checkSalesmanInfo(String staffNo);
	public SalesmanInfo querySalesmanInfoByNo(String queryNo);
	public List<SalesmanInfo> querySalesmanInfoByName(String queryName);
	public List<SalesmanInfo> queryAllSalesmanInfo();
	public int[][] querySalesmanPerformanceByNo(String queryNo);
	public int[][] queryAllSalesmanPerformance(List<SalesmanInfo> salesman);
	public void setSalesmanRoyaltyRate(float royaltyRate);
	public void updateSalesmanSalary(int performance, int salesmanId);
	public void addStudent(StudentInfo student);
}
