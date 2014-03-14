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
	private String queryName;
	private String queryNo;
	private int salesmanPerformance;
	private int[] allSalesmanPerformance;
	private StudentConsultway studentConsultway;
	private SalesmanInfo salesmanInfo;
	private float royaltyRate;
	private Map<String,Object> request;
	
	/**
	 * @return the royaltyRate
	 */
	public float getRoyaltyRate() {
		return royaltyRate;
	}
	/**
	 * @param royaltyRate the royaltyRate to set
	 */
	public void setRoyaltyRate(float royaltyRate) {
		this.royaltyRate = royaltyRate;
	}
	/**
	 * @return the allSalesmanPerformance
	 */
	public int[] getAllSalesmanPerformance() {
		return allSalesmanPerformance;
	}
	/**
	 * @param allSalesmanPerformance the allSalesmanPerformance to set
	 */
	public void setAllSalesmanPerformance(int[] allSalesmanPerformance) {
		this.allSalesmanPerformance = allSalesmanPerformance;
	}
	/**
	 * @return the queryNo
	 */
	public String getQueryNo() {
		return queryNo;
	}
	/**
	 * @param queryNo the queryNo to set
	 */
	public void setQueryNo(String queryNo) {
		this.queryNo = queryNo;
	}
	/**
	 * @return the salesmanPerformance
	 */
	public int getSalesmanPerformance() {
		return salesmanPerformance;
	}
	/**
	 * @param salesmanPerformance the salesmanPerformance to set
	 */
	public void setSalesmanPerformance(int salesmanPerformance) {
		this.salesmanPerformance = salesmanPerformance;
	}
	/**
	 * @return the queryName
	 */
	public String getQueryName() {
		return queryName;
	}
	/**
	 * @param queryName the queryName to set
	 */
	public void setQueryName(String queryName) {
		this.queryName = queryName;
	}
	/**
	 * @return the salesmanInfo
	 */
	public SalesmanInfo getSalesmanInfo() {
		return salesmanInfo;
	}
	/**
	 * @param salesmanInfo the salesmanInfo to set
	 */
	public void setSalesmanInfo(SalesmanInfo salesmanInfo) {
		this.salesmanInfo = salesmanInfo;
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
	 * @param staffNo ：员工账号
	 * @return 是->true；否->false
	 */
	public boolean checkSalesmanInfo(String staffNo){
		return marketingService.checkSalesmanInfo(staffNo);
	}
	
	/**
	 * 方法描述：添加咨询信息的方法，调用service层接口
	 * @return true  ："addSuccess" ——> addSuccess.jsp
	 * 		   false ："addDefault" ——> addDefault.jsp
	 */
	public String addConsultInfo(){
		if(checkSalesmanInfo(consultInfo.getSalesmanInfo().getStaffInfo().getStaffNo()) == false)
			return "addDefault";
		boolean flag = marketingService.addConsultInfo(consultInfo,studentConsultway);
		if(flag){
			return "addSuccess";
		}else{
			return "addDefault";
		}
	}
	
	/**
	 * 方法描述：通过员工账号查询员工信息，调用service层接口
	 * @param queryNo ：被查询账号
	 */
	public void querySalesmanInfoByNo(){
		salesmanInfo = marketingService.querySalesmanInfoByNo(queryNo);
	}
	
	/**
	 * 方法描述：查询所有员工的信息，调用service层接口
	 * @return 查询失败："queryDefault" ——> addDefault.jsp
	 * 		     查询成功：null
	 */
	public List<SalesmanInfo> queryAllSalesmanInfo(){
		List<SalesmanInfo> salesman = marketingService.queryAllSalesmanInfo();
		request=(Map)ActionContext.getContext().get("request");
		request.put("salesmanInfo",salesman);
		return salesman;
	}
	
	/**
	 * 方法描述：通过姓名查询营销人员信息，调用service层接口
	 * @param queryName ：被查询姓名
	 * @return ：查询成功："queryDefault" ——> addDefault.jsp
	 * 			  查询失败："queryDefault" ——> queryDefault.jsp
	 */
	public String querySalesmanInfoByName(){
		List<SalesmanInfo> salesman = marketingService.querySalesmanInfoByName(queryName);
		if(salesman.size() == 0)
			return "queryDefault";
		request=(Map)ActionContext.getContext().get("request");
		request.put("salesmanInfo",salesman);
		return "querySuccess";
	}
	
	/**
	 * 方法描述：通过员工账号查询员工绩效，调用service层接口
	 * @return "queryDefault" ——> queryDefault.jsp
	 * 			"performance" ——> performance.jsp
	 * @throws InterruptedException 
	 */
	public String querySalesmanPerformanceByNo(){
		if (!checkSalesmanInfo(queryNo))
			return "queryDefault";
		salesmanPerformance = marketingService.querySalesmanPerformanceByNo(queryNo);
		querySalesmanInfoByNo();
		return "performance";
	}
	
	/**
	 * 方法描述：查询所有营销人员的绩效，调用service层接口
	 * @return
	 */
	public String queryAllSalesmanPerformance(){
		List<SalesmanInfo> salesman = queryAllSalesmanInfo();
		allSalesmanPerformance = marketingService.queryAllSalesmanPerformance(salesman);
		salesman = queryAllSalesmanInfo();
		return "allPerformance";
	}
	
	/**
	 * 方法描述：设置营销人员提成方式，调用service层接口
	 * @return "queryPerformance" ——> queryPerformance.jsp
	 */
	public String setSalesmanRoyaltyRate(){
		marketingService.setSalesmanRoyaltyRate(royaltyRate);
		return "queryPerformance";
	}
	
	public void writeWorkLog(){
		
	}
}
