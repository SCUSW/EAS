/**
 * 
 */
package com.scusw.marketing.dao;

import java.util.List;

import com.scusw.model.ConsultInfo;
import com.scusw.model.SalesmanInfo;
import com.scusw.model.StudentConsultway;

/**
 * 类描述：营销人员可使用的方法的接口
 * @author Administrator
 * @data：日期：2014-3-11 时间：下午4:39:49
 * version 1.0
 */
public interface MarketingDao {
	public void addConsultInfo(ConsultInfo consultInfo,StudentConsultway studentConsultway);
	public boolean checkSalesmanInfo(int staffId);
	public List<SalesmanInfo> querySalesmanInfo(String salesmanName);
}