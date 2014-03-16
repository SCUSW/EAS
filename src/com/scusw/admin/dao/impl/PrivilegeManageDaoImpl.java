package com.scusw.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.admin.dao.PrivilegeManageDao;
import com.scusw.model.GroupInfo;
import com.scusw.model.GroupPrivilege;
import com.scusw.model.PrivilegeInfo;


/**
 * manage privilege
 * @author liu jiahao
 *
 */

public class PrivilegeManageDaoImpl extends HibernateDaoSupport implements PrivilegeManageDao {
	
	// query all info of privileges
	public List<PrivilegeInfo> queryAllPrivilege() {
		Query query = this.getSession().createQuery("from PrivilegeInfo pi");
		List<PrivilegeInfo> list = query.list();
		return list;
	}

	// add a record of privilege
	public boolean addPrivilege(PrivilegeInfo privInfo) {
		this.getSession().save(privInfo);
		return true;
	}

	// query all info of groups
	public List<GroupInfo> queryAllGroup() {
		Query query = this.getSession().createQuery("from GroupInfo gi where gi.groupAvai=1");
		List<GroupInfo> list = query.list();
		return list;
	}

	// add a record of group
//	public boolean addGroup(GroupInfo groupInfo,ArrayList<GroupPrivilege> list) {
//		this.getSession().save(groupInfo);
//		for(GroupPrivilege gp:list){
//			this.getSession().save(gp);
//			logger.info("add groupprivilege:" + gp.getGroupInfo().getGroupName() + "&" + gp.getPrivilegeInfo().getPrivilegeName());
//		}
//		return true;
//	}
	
//	public boolean addGroup(GroupInfo groupInfo) {	
//		this.getSession().save(groupInfo);
//		return true;
//	}
	
//	public int addGroup(GroupInfo groupInfo) {	
//		return (Integer)this.getSession().save(groupInfo);
//		
//	}
	
	public boolean addGroup(GroupInfo groupInfo) {	
		this.getSession().save(groupInfo);
		return true;
		
	}
	
	
	
	
	public boolean addGroupPrivilege(GroupPrivilege gp) {	
		logger.info("add groupprivilege:" + gp.getGroupInfo().getGroupId() + "&" + gp.getPrivilegeInfo().getPrivilegeName());
//		this.getSession().beginTransaction();
		this.getSession().save(gp);
//		this.getSession().getTransaction().commit();
		return true;
	}

	// get group_privileges by groupId
	public List<PrivilegeInfo> queryPrivByGroupId(int groupId) {
		Query query = this.getSession().createQuery("from PrivilegeInfo as pi " +
				"inner join fetch pi.groupPrivileges as gp where gp.groupInfo.groupId=:groupId");
		query.setParameter("groupId", groupId);
		List<PrivilegeInfo> list = query.list();
		return list;
	}

	public PrivilegeInfo getPrivilegeInfoById(int privilegeId) {
		
		return (PrivilegeInfo) this.getSession().get(PrivilegeInfo.class, privilegeId);
	}

	public GroupInfo getGroupById(int groupId) {
		
		return (GroupInfo) this.getHibernateTemplate().get(GroupInfo.class, groupId);
	}

	public boolean delGroupById(int groupId) {
		// unimplement
		return false;
	}
	
	// get GroupPrivielge by groupId
	public List<GroupPrivilege> queryGroupPrivlegeByGroupId(int groupId){
		Query query = this.getSession().createQuery("from GroupPrivilege gp " +
				"where gp.groupInfo.groupId=:groupId");
		query.setParameter("groupId", groupId);
		return query.list();
		
	}

	// delete groupPrivilege
	public boolean delGroupPrivilege(GroupPrivilege gp) {
		this.getSession().delete(gp);
		return true;
	}

	// update groupInfo
	public boolean updateGroup(GroupInfo groupInfo) {
		this.getSession().update(groupInfo);
		return true;
	}

}
