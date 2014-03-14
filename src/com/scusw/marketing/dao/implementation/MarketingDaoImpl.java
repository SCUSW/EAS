/**
 * 
 */
package com.scusw.marketing.dao.implementation;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.marketing.dao.MarketingDao;
import com.scusw.model.ConsultInfo;
import com.scusw.model.SalesmanInfo;
import com.scusw.model.StudentConsultway;

/**
 * 类描述：营销人员可使用的方法的实现
 * @author Administrator
 * @data：日期：2014-3-11 时间：下午4:41:02
 * version 1.0
 */
public class MarketingDaoImpl extends HibernateDaoSupport implements MarketingDao {
	/**
	 * 提成比例
	 */
	private static float royaltyRate = 100;
	
	/**
	 * @return the royaltyRate
	 */
	public static float getRoyaltyRate() {
		return royaltyRate;
	}

	/**
	 * @param royaltyRate the royaltyRate to set
	 */
	public static void setRoyaltyRate(float royaltyRate) {
		MarketingDaoImpl.royaltyRate = royaltyRate;
	}

	/**
	 * 方法描述：检验该员工是否为营销人员
	 * @param staffNo ：员工账号
	 * @return 是->true；否->false
	 */
	public boolean checkSalesmanInfo(String staffNo){
		Query q = this.getSession().createQuery("from SalesmanInfo s where s.staffInfo.staffNo=:staffNo");
		q.setParameter("staffNo", staffNo);
		SalesmanInfo salesman = (SalesmanInfo) q.uniqueResult();
		if (salesman != null)
			return true;
		else
			return false;
	}
	
	/**
	 * 方法描述：添加咨询信息
	 * @param consultInfo ：包含全部咨询信息的实体
	 */
	public void addConsultInfo(ConsultInfo consultInfo,StudentConsultway studentConsultway){
		this.getHibernateTemplate().save(consultInfo);
		this.getHibernateTemplate().save(studentConsultway);
	}
	
	/**
	 * 方法描述：通过员工账号查询员工信息
	 * @param queryNo ：被查询账号
	 * @return salesmanInfo ：包含营销人员全部信息的实体
	 */
	public SalesmanInfo querySalesmanInfoByNo(String queryNo){
		Query q = this.getSession().createQuery("from SalesmanInfo s where s.staffInfo.staffNo=:queryNo");
		q.setParameter("queryNo", queryNo);
		SalesmanInfo salesmanInfo = (SalesmanInfo) q.uniqueResult();
		return salesmanInfo;
	}
	
	/**
	 * 方法描述：通过姓名查询营销人员信息
	 * @param queryName ：被查询姓名
	 * @return ：符合该姓名的所有营销人员的集合
	 */
	public List<SalesmanInfo> querySalesmanInfoByName(String queryName) {
		List<SalesmanInfo> salesman=getHibernateTemplate().find("from SalesmanInfo s where s.staffInfo.staffName=?",queryName);
		return salesman;
	}
	
	/**
	 * 方法描述：查询所有营销人员信息
	 * @return ：所有营销人员的集合
	 */
	public List<SalesmanInfo> queryAllSalesmanInfo(){
		List<SalesmanInfo> salesman=getHibernateTemplate().find("from SalesmanInfo");
		return salesman;
	}
	
	/**
	 * 方法描述：通过营销人员账号查询员工绩效
	 * @param queryNo 被查询账号
	 * @return 与该营销人员有关的咨询表的数量
	 */
	public int querySalesmanPerformanceByNo(String queryNo){
		int performance = getHibernateTemplate().find("from ConsultInfo c where c.salesmanInfo.staffInfo.staffNo=?",queryNo).size();
		updateSalesmanSalary(performance,queryNo);
		return performance;
	}
	
	/**
	 * 方法描述：查询所有营销人员的绩效
	 * @return 包含所有营销人员效绩的int数组
	 */
	public int[] queryAllSalesmanPerformance(List<SalesmanInfo> salesman){
		int salesmanNum = salesman.size();
		int[] allPerformance = new int[salesmanNum];
		for(int i = 0; i < salesmanNum; i++){
			allPerformance[i] = getHibernateTemplate().find("from ConsultInfo c where c.salesmanInfo.staffId=?", salesman.get(i).getStaffId()).size();
			updateSalesmanSalary(allPerformance[i],salesman.get(i).getStaffId());
		}
		return allPerformance;
	}
	
	/**
	 * 方法描述：更新营销人员提成工资
	 * @param performance ：员工绩效 ; queryNo ： 员工账号
	 */
	public void updateSalesmanSalary(int performance, String queryNo){
		float salesmanSalary = royaltyRate * performance;
		int salesmanId = querySalesmanInfoByNo(queryNo).getStaffId();
		SalesmanInfo salesman = (SalesmanInfo)this.getHibernateTemplate().get(SalesmanInfo.class,salesmanId);
		salesman.setSalesmanSalary(salesmanSalary);
		this.getHibernateTemplate().update(salesman);
		this.getSession().beginTransaction().commit();
	}
	
	/**
	 * 方法描述：更新营销人员提成工资
	 * @param performance ：员工绩效 ; salesmanId ： 员工编号
	 */
	public void updateSalesmanSalary(int performance, int salesmanId){
		float salesmanSalary = royaltyRate * performance;
		SalesmanInfo salesman = (SalesmanInfo)this.getHibernateTemplate().get(SalesmanInfo.class,salesmanId);
		salesman.setSalesmanSalary(salesmanSalary);
		this.getHibernateTemplate().update(salesman);
		this.getSession().beginTransaction().commit();
	}
	
	/**
	 * 方法描述：设置营销人员提成方式
	 */
	public void setSalesmanRoyaltyRate(float royaltyRate){
		setRoyaltyRate(royaltyRate);
	}	
}
