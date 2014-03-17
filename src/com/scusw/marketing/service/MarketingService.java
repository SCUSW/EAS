/**
 * 
 */
package com.scusw.marketing.service;

import java.util.List;

import com.scusw.model.ConsultInfo;
import com.scusw.model.SalesmanInfo;
import com.scusw.model.StudentConsultway;

/**
 * 类描述：营销人员服务层接口类
 * @author Administrator
 * @data：日期：2014-3-11 时间：下午4:36:47
 * version 1.0
 */
public interface MarketingService {
	
	public boolean addConsultInfo(ConsultInfo consultInfo);
	public boolean addSelectConsultwayInfo(int[] selectConsultwayId, ConsultInfo consultInfo);
	public boolean checkSalesmanInfo(String staffNo);
	public SalesmanInfo querySalesmanInfoByNo(String queryNo);
	public List<SalesmanInfo> querySalesmanInfoByName(String queryName);
	public List<SalesmanInfo> queryAllSalesmanInfo();
	public int[][] querySalesmanPerformanceByNo(String queryNo);
	public int[][] queryAllSalesmanPerformance(List<SalesmanInfo> salesman);
	public void setSalesmanRoyaltyRate(float royaltyRate);
	public void updateSalesmanSalary(int[][] allPerformance);
}
