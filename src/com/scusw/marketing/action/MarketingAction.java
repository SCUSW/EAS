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
import com.scusw.model.StudentInfo;

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
	private int[][] allSalesmanPerformance;
	private int[] selectConsultwayId;
	private SalesmanInfo salesmanInfo;
	private float royaltyRate;
	private StudentInfo studentInfo;
	private String message;
	private Map<String,Object> request;
	
	
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	/**
	 * @return the studentInfo
	 */
	public StudentInfo getStudentInfo() {
		return studentInfo;
	}
	/**
	 * @param studentInfo the studentInfo to set
	 */
	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}
	/**
	 * @return the selectConsultwayId
	 */
	public int[] getSelectConsultwayId() {
		return selectConsultwayId;
	}
	/**
	 * @param selectConsultwayId the selectConsultwayId to set
	 */
	public void setSelectConsultwayId(int[] selectConsultwayId) {
		this.selectConsultwayId = selectConsultwayId;
	}
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
	/**
	 * @return the queryNo
	 */
	public String getQueryNo() {
		return queryNo;
	}
	/**
	 * @return the allSalesmanPerformance
	 */
	public int[][] getAllSalesmanPerformance() {
		return allSalesmanPerformance;
	}
	/**
	 * @param allSalesmanPerformance the allSalesmanPerformance to set
	 */
	public void setAllSalesmanPerformance(int[][] allSalesmanPerformance) {
		this.allSalesmanPerformance = allSalesmanPerformance;
	}
	/**
	 * @param queryNo the queryNo to set
	 */
	public void setQueryNo(String queryNo) {
		this.queryNo = queryNo;
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
	 * 方法描述：检验该员工是否为营销人员
	 * @param staffNo ：员工账号
	 * @return 是->true；否->false
	 */
	public boolean checkSalesmanInfo(String staffNo){
		return marketingService.checkSalesmanInfo(staffNo);
	}
	
	/**
	 * 方法描述：添加咨询信息的方法
	 * @return true  ："addConsultInfoSuccess" ——> addSuccess.jsp
	 * 		   false ："addDefault" ——> addConsultInfo.jsp
	 */
	public String addConsultInfo(){
		if(!marketingService.checkSalesmanInfo(consultInfo.getSalesmanInfo().getStaffInfo().getStaffNo())){
			message = "您不是营销人员！";
			return "addDefault";
		}
		boolean flag1 = marketingService.addConsultInfo(consultInfo);
		boolean flag2 = marketingService.addSelectConsultwayInfo(selectConsultwayId, consultInfo);
		if(flag1 && flag2){
			message = "添加成功";
			return "addConsultInfoSuccess";
		}else{
			return "addDefault";
		}
	}
	
	/**
	 * 方法描述：添加学生了解渠道信息
	 * @param selectConsultwayId ：被添加的所有的渠道信息编号
	 * @param consultInfo ：该学生的咨询信息
	 * @return ：添加成功——>true
	 * 			 添加失败——>false
	 */
	public boolean addSelectConsultwayInfo(int[] selectConsultwayId, ConsultInfo consultInfo){
		return marketingService.addSelectConsultwayInfo(selectConsultwayId, consultInfo);
	}
	
	/**
	 * 方法描述：通过员工账号查询员工信息
	 * @param queryNo ：被查询账号
	 */
	public void querySalesmanInfoByNo(){
		salesmanInfo = marketingService.querySalesmanInfoByNo(queryNo);
	}
	
	/**
	 * 方法描述：查询所有员工的信息
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
	 * 方法描述：通过姓名查询营销人员信息
	 * @param queryName ：被查询姓名
	 * @return ：查询成功："queryDefault" ——> addDefault.jsp
	 * 			  查询失败："queryDefault" ——> queryDefault.jsp
	 */
	public String querySalesmanInfoByName(){
		List<SalesmanInfo> salesman;
		if(queryName.equals("")){
			salesman = queryAllSalesmanInfo();
		} else {
			salesman = marketingService.querySalesmanInfoByName(queryName);
			if(salesman.size() == 0) {
				message = "该姓名的营销人员不存在！";
				return "queryDefault";
			}
			request=(Map)ActionContext.getContext().get("request");
			request.put("salesmanInfo",salesman);
		}
		return "querySuccess";
	}
	
	/**
	 * 方法描述：通过员工账号查询员工绩效
	 * @return "queryDefault" ——> queryDefault.jsp
	 * 			"performance" ——> performance.jsp
	 */
	public String querySalesmanPerformanceByNo(){
		if (!checkSalesmanInfo(queryNo)) {
			message = "该账号的营销人员不存在！";
			return "queryDefault";
		}
		allSalesmanPerformance = marketingService.querySalesmanPerformanceByNo(queryNo);
		marketingService.updateSalesmanSalary(allSalesmanPerformance);
		querySalesmanInfoByNo();
		return "performance";
	}
	
	/**
	 * 方法描述：查询所有营销人员的绩效
	 * @return "allPerformance" ——> allPerformance.jsp
	 */
	public String queryAllSalesmanPerformance(){
		List<SalesmanInfo> salesman = queryAllSalesmanInfo();
		allSalesmanPerformance = marketingService.queryAllSalesmanPerformance(salesman);
		marketingService.updateSalesmanSalary(allSalesmanPerformance);
		salesman = queryAllSalesmanInfo();
		return "allPerformance";
	}
	
	/**
	 * 方法描述：设置营销人员提成方式
	 * @return "queryPerformance" ——> queryPerformance.jsp
	 */
	public String setSalesmanRoyaltyRate(){
		marketingService.setSalesmanRoyaltyRate(royaltyRate);
		return "queryPerformance";
	}
	
	/**
	 * 方法描述：添加学生
	 * @param student：包含学生所有信息的实体
	 * @return ："addStudentInfoSuccess" ——>addStudentInfo.jsp
	 * 			 "addDefault" ——>addDefault.jsp
	 */
	public String addStudent(){
		if(marketingService.checkIsStudentExit(studentInfo.getStudentNo())){
			message = "该学号已存在！";
			return "addDefault";
		}
		if(!marketingService.checkIsClassExit(studentInfo.getClassInfo().getClassId())) {
			message = "该班级不存在！";
			return "addDefault";
		}
		if(marketingService.addStudent(studentInfo)) {
			message = "添加成功";
			return "addStudentInfoSuccess";
		}
		else
			return "addDefault";
	}
	
	public void writeWorkLog(){
		
	}
}
