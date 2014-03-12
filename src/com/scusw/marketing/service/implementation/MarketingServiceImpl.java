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
	 * @param staffId ：员工编号
	 * @return 是->true；否->false
	 */
	public boolean checkSalesmanInfo(int staffId){
		return marketingDao.checkSalesmanInfo(staffId);
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
	 * 方法描述：通过姓名查询营销人员信息，调用dao层接口
	 * @param salesmanName ：被查询姓名
	 * @return ：符合该姓名的所有营销人员的集合
	 */
	public List<SalesmanInfo> querySalesmanInfo(String salesmanName) {
		return marketingDao.querySalesmanInfo(salesmanName);
	}
}
