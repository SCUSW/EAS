/**
 * 
 */
package com.scusw.finance.action;

import com.scusw.model.StaffInfo;

/**
 * @author Administrator
 *
 */
public class StaffFinanceAction {
	private StaffInfo staffInfo;
	
	
	
	public StaffInfo getStaffInfo() {
		return staffInfo;
	}

	public void setStaffInfo(StaffInfo staffInfo) {
		this.staffInfo = staffInfo;
	}

	public String searchAll(){
		return "default";
	}
	
	public String searchStaff(){
		return "default";
	}

}
