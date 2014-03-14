package com.scusw.marketing.service.implementation;

import java.util.List;

import com.scusw.marketing.dao.MarketingDao;
import com.scusw.marketing.service.MarketingService;
import com.scusw.model.ConsultInfo;
import com.scusw.model.SalesmanInfo;
import com.scusw.model.StudentConsultway;

/**
 * 类描述：营销人员服务层接口实现类
 * @author Administrator
 * @data：日期：2014-3-11 时间：下午4:39:08
 * version 1.0
 */
public class MarketingServiceImpl implements MarketingService {
	
	private MarketingDao marketingDao;

	/**
	 * @return the marketingDao
	 */
	public MarketingDao getMarketingDao() {
		return marketingDao;
	}
	/**
	 * @param marketingDao the marketingDao to set
	 */
	public void setMarketingDao(MarketingDao marketingDao) {
		this.marketingDao = marketingDao;
	}
	
	/**
	 * 方法描述：检验该员工是否为营销人员，调用dao层接口
	 * @param staffNo ：员工账号
	 * @return 是->true；否->false
	 */
	public boolean checkSalesmanInfo(String staffNo){
		return marketingDao.checkSalesmanInfo(staffNo);
	}
	
	/**
	 * 方法描述：添加咨询信息的方法，调用dao层接口
	 * @param consultInfo ：包含全部咨询信息的实体
	 * @return Exception->false  else->true
	 */
	public boolean addConsultInfo(ConsultInfo consultInfo,StudentConsultway studentConsultway){
		try {
			marketingDao.addConsultInfo(consultInfo,studentConsultway);
		} catch (Exception e) {
			return false;
		}		
		return true;
	}
	
	/**
	 * 方法描述：通过员工账号查询员工信息，调用dao层接口
	 * @param queryNo ：被查询账号
	 * @return salesmanInfo ：包含员工全部信息的实体
	 */
	public SalesmanInfo querySalesmanInfoByNo(String queryNo){
		return marketingDao.querySalesmanInfoByNo(queryNo);
		
	}
	/**
	 * 方法描述：通过姓名查询营销人员信息，调用dao层接口
	 * @param queryName ：被查询姓名
	 * @return ：符合该姓名的所有营销人员的集合
	 */
	public List<SalesmanInfo> querySalesmanInfoByName(String queryName) {
		return marketingDao.querySalesmanInfoByName(queryName);
	}
	
	/**
	 * 方法描述：查询所有营销人员信息，调用dao层接口
	 * @return ：所有营销人员的集合
	 */
	public List<SalesmanInfo> queryAllSalesmanInfo(){
		return marketingDao.queryAllSalesmanInfo();
	}
	
	/**
	 * 方法描述：通过员工账号查询员工绩效，调用dao层接口
	 * @return 与该员工有关的咨询表的数量
	 */
	public int[][] querySalesmanPerformanceByNo(String queryNo){
		return marketingDao.querySalesmanPerformanceByNo(queryNo);
		
	}
	
	/**
	 * 方法描述：查询所有员工绩效，调用dao层接口
	 * @return 所有员工的效绩
	 */
	public int[][] queryAllSalesmanPerformance(List<SalesmanInfo> salesman){
		return marketingDao.queryAllSalesmanPerformance(salesman);
	}
	
	/**
	 * 方法描述：设置营销人员提成方式，调用dao层接口
	 */
	public void setSalesmanRoyaltyRate(float royaltyRate){
		marketingDao.setSalesmanRoyaltyRate(royaltyRate);
	}
	
	public void updateSalesmanSalary(int[][] allPerformance){
		for(int i = 0; i < allPerformance[0].length; i++)
			marketingDao.updateSalesmanSalary(allPerformance[0][i],allPerformance[1][i]);
	}
}
