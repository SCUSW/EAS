/**
 * 
 */
package com.scusw.marketing.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.marketing.service.MarketingService;
import com.scusw.model.ConsultInfo;
import com.scusw.model.SalesmanInfo;
import com.scusw.model.StudentConsultway;

/**
 * 类描述：营销人员动作层实现类
 * @author Administrator
 * @data：日期：2014-3-11 时间：下午4:35:51
 * version 1.0
 */
public class MarketingAction {
	private MarketingService marketingService;
	private ConsultInfo consultInfo;
	private String salesmanName;
	private StudentConsultway studentConsultway;
	private Map<String,Object> request;
	
	/**
	 * @return the salesmanName
	 */
	public String getSalesmanName() {
		return salesmanName;
	}
	/**
	 * @param salesmanName the salesmanName to set
	 */
	public void setSalesmanName(String salesmanName) {
		this.salesmanName = salesmanName;
	}
	/**
	 * @return the request
	 */
	public Map<String, Object> getRequest() {
		return request;
	}
	/**
	 * @param request the request to set
	 */
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	/**
	 * @return the marketingService
	 */
	public MarketingService getMarketingService() {
		return marketingService;
	}
	/**
	 * @param marketingService the marketingService to set
	 */
	public void setMarketingService(MarketingService marketingService) {
		this.marketingService = marketingService;
	}
	/**
	 * @return the consultInfo
	 */
	public ConsultInfo getConsultInfo() {
		return consultInfo;
	}
	/**
	 * @param consultInfo the consultInfo to set
	 */
	public void setConsultInfo(ConsultInfo consultInfo) {
		this.consultInfo = consultInfo;
	}
	/**
	 * @return the studentConsultway
	 */
	public StudentConsultway getStudentConsultway() {
		return studentConsultway;
	}
	/**
	 * @param studentConsultway the studentConsultway to set
	 */
	public void setStudentConsultway(StudentConsultway studentConsultway) {
		this.studentConsultway = studentConsultway;
	}
	/**
	 * 方法描述：检验该员工是否为营销人员，调用service层接口
	 * @param staffId ：员工编号
	 * @return 是->true；否->false
	 */
	public boolean checkSalesmanInfo(int staffId){
		return marketingService.checkSalesmanInfo(staffId);
	}
	
	/**
	 * 方法描述：添加咨询信息的方法，调用service层接口
	 * @return true  ："addSuccess" ——> addSuccess.jsp
	 * 		   false ："addDefault" ——> addDefault.jsp
	 */
	public String addConsultInfo(){
		if(checkSalesmanInfo(consultInfo.getSalesmanInfo().getStaffId()) == false)
			return "addDefault";
		boolean flag=marketingService.addConsultInfo(consultInfo,studentConsultway);
		if(flag){
			return "addSuccess";
		}else{
			return "addDefault";
		}
	}
	
	public void writeWorkLog(){
		
	}
	
	/**
	 * 方法描述：通过姓名查询营销人员信息，调用service层接口
	 * @param salesmanName ：被查询姓名
	 * @return ：符合该姓名的所有营销人员的集合
	 */
	public String querySalesmanInfo(){
		System.out.println(salesmanName);
		List<SalesmanInfo> salesman=marketingService.querySalesmanInfo(salesmanName);
		request=(Map)ActionContext.getContext().get("request");
		request.put("salesmanInfo",salesman);
		return "querySuccess";
	}
	public void setMarketerSalary(){
		
	}
	public void setSalaryCalculation(){
		
	}
}
