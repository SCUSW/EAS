package com.scusw.marketing.service.implementation;

import java.util.ArrayList;
import java.util.List;

import com.scusw.marketing.dao.MarketingDao;
import com.scusw.marketing.service.MarketingService;
import com.scusw.model.ConsultInfo;
import com.scusw.model.ConsultwayInfo;
import com.scusw.model.SalesmanInfo;
import com.scusw.model.StudentConsultway;
import com.scusw.model.StudentInfo;

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
	 * 方法描述：检验该员工是否为营销人员
	 * @param staffNo ：员工账号
	 * @return 是->true；否->false
	 */
	public boolean checkSalesmanInfo(String staffNo){
		return marketingDao.checkSalesmanInfo(staffNo);
	}
	
	/**
	 * 方法描述：添加咨询信息的方法
	 * @param consultInfo ：包含全部咨询信息的实体
	 * @return Exception->false  else->true
	 */
	public boolean addConsultInfo(ConsultInfo consultInfo){	
		try {
			marketingDao.addConsultInfo(consultInfo);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}		
		return true;
	}
	
	/**
	 * 方法描述：添加学生
	 * @param student：包含学生全部信息的实体
	 * @return ：添加成功——>true
	 * 			 添加失败——>false
	 */
	public boolean addStudent(StudentInfo student) {
		try {
			marketingDao.addStudent(student);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}		
		return true;
	}
	
	/**
	 * 方法描述：添加学生了解渠道信息关系
	 * @param selectConsultwayId ：被添加的了解渠道编号
	 * @param consultInfo ：该学生的咨询信息
	 * @return ：添加成功——>true
	 * 			 添加失败——>false
	 */
	public boolean addSelectConsultwayInfo(int[] selectConsultwayId, ConsultInfo consultInfo){
		List<StudentConsultway> studentConsultway = new ArrayList<StudentConsultway>();
		for(int i = 0; i < selectConsultwayId.length; i ++){
			StudentConsultway consultway = new StudentConsultway();
			consultway.setConsultInfo(consultInfo);
			ConsultwayInfo consultwayInfo = new ConsultwayInfo();
			consultwayInfo.setConsultwayId(selectConsultwayId[i]);
			consultway.setConsultwayInfo(consultwayInfo);
			studentConsultway.add(consultway);
		}
		try {
			marketingDao.addSelectConsultwayInfo(studentConsultway);
		} catch (Exception e) {
			return false;
		}		
		return true;
	}
	
	/**
	 * 方法描述：通过员工账号查询员工信息
	 * @param queryNo ：被查询账号
	 * @return salesmanInfo ：包含员工全部信息的实体
	 */
	public SalesmanInfo querySalesmanInfoByNo(String queryNo){
		return marketingDao.querySalesmanInfoByNo(queryNo);
		
	}
	/**
	 * 方法描述：通过姓名查询营销人员信息
	 * @param queryName ：被查询姓名
	 * @return ：符合该姓名的所有营销人员的集合
	 */
	public List<SalesmanInfo> querySalesmanInfoByName(String queryName) {
		return marketingDao.querySalesmanInfoByName(queryName);
	}
	
	/**
	 * 方法描述：查询所有营销人员信息
	 * @return ：所有营销人员的集合
	 */
	public List<SalesmanInfo> queryAllSalesmanInfo(){
		return marketingDao.queryAllSalesmanInfo();
	}
	
	/**
	 * 方法描述：通过员工账号查询员工绩效
	 * @return 与该员工有关的咨询表的数量
	 */
	public int[][] querySalesmanPerformanceByNo(String queryNo){
		return marketingDao.querySalesmanPerformanceByNo(queryNo);
		
	}
	
	/**
	 * 方法描述：查询所有员工绩效
	 * @return 所有员工的效绩
	 */
	public int[][] queryAllSalesmanPerformance(List<SalesmanInfo> salesman){
		return marketingDao.queryAllSalesmanPerformance(salesman);
	}
	
	/**
	 * 方法描述：设置营销人员提成方式
	 */
	public void setSalesmanRoyaltyRate(float royaltyRate){
		marketingDao.setSalesmanRoyaltyRate(royaltyRate);
	}
	
	/**
	 * 方法描述：更新营销人员提成工资
	 * @param allPerformance ： 包含所有营销人员ID与绩效的二维数组
	 */
	public void updateSalesmanSalary(int[][] allPerformance){
		for(int i = 0; i < allPerformance[0].length; i++)
			marketingDao.updateSalesmanSalary(allPerformance[0][i],allPerformance[1][i]);
	}
	
	/**
	 * 方法描述：检查学生学号是否已经存在
	 * @param studentNo ：学生学号
	 * @return ：存在——>true
	 * 			 不存在——>false
	 */
	public boolean checkIsStudentExit(String studentNo){
		StudentInfo student = marketingDao.checkIsStudentExit(studentNo);
		if( student != null)
			return true;
		else
			return false;
	}
}
 