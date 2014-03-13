/**
 * 
 */
package com.scusw.finance.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.model.FinancialRecords;
import com.scusw.model.StudentInfo;

/**
 * @author 杨昭远
 *
 */
public class TotalFinanceDaoImp extends HibernateDaoSupport implements TotalFinanceDao{

	/* (non-Javadoc)
	 * @see com.scusw.finance.dao.TotalFinanceDao#getTotalMoney()
	 */
	public FinancialRecords getTotalMoney() {
		Query q = this.getSession().createQuery("from FinancialRecords fr order by fr.financialTime desc");
		q.setFirstResult(0);
		q.setMaxResults(1);
		FinancialRecords financialRecords = (FinancialRecords) q.uniqueResult();
		return financialRecords;
	}

	/* (non-Javadoc)
	 * @see com.scusw.finance.dao.TotalFinanceDao#addRecord(com.scusw.model.FinancialRecords)
	 */
	public void addRecord(FinancialRecords financialRecords) throws Exception{
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(financialRecords);
	}
	
	public List<FinancialRecords> getAllRecords(){
		List<FinancialRecords> finacialRecords = getHibernateTemplate().find("from FinancialRecords");
		return finacialRecords;
	}

}
