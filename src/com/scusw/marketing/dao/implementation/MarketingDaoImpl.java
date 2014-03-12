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
	 * 方法描述：检验该员工是否为营销人员
	 * @param staffId ：员工编号
	 * @return 是->true；否->false
	 */
	public boolean checkSalesmanInfo(int staffId){
		Query q = this.getSession().createQuery("from SalesmanInfo s where s.staffId=:staffId");
		q.setParameter("staffId", staffId);
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
	 * 方法描述：通过姓名查询营销人员信息
	 * @param salesmanName ：被查询姓名
	 * @return ：符合该姓名的所有营销人员的集合
	 */
	public List<SalesmanInfo> querySalesmanInfo(String salesmanName) {
		List<SalesmanInfo> salesman=getHibernateTemplate().find("from SalesmanInfo salesman where salesman.staffInfo.staffName=?",salesmanName);
		return salesman;
	}
}
