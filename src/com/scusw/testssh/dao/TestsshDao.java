package com.scusw.testssh.dao;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.model.TestsshTable;

public class TestsshDao extends HibernateDaoSupport {
	//����һ
	/*private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}*/
	
	public TestsshTable checkUser(TestsshTable tt) {
		//����һ
		/*Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query q =session.createQuery("from TestsshTable t " +
				"where t.userName=:username and " +
				"t.userPass=:userpass");
		q.setParameter("username", tt.getUserName());
		q.setParameter("userpass", tt.getUserPass());
		TestsshTable tt_return = (TestsshTable) q.uniqueResult();
		session.getTransaction().commit();
		session.close();
		return tt_return;*/
		//������
		/*Query q = HibernateSessionFactory.getSession().createQuery("from TestsshTable t " +
				"where t.userName=:username and " +
				"t.userPass=:userpass");
		q.setParameter("username", tt.getUserName());
		q.setParameter("userpass", tt.getUserPass());
		TestsshTable tt_return = (TestsshTable) q.uniqueResult();
		HibernateSessionFactory.closeSession();
		return tt_return;*/
		//������
		Query q = this.getSession().createQuery("from TestsshTable t " +
				"where t.userName=:username and " +
				"t.userPass=:userpass");
		q.setParameter("username", tt.getUserName());
		q.setParameter("userpass", tt.getUserPass());
		TestsshTable tt_return = (TestsshTable) q.uniqueResult();
		return tt_return;
	}
	
}
