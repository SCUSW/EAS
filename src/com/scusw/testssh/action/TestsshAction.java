package com.scusw.testssh.action;

import com.scusw.model.TestsshTable;
import com.scusw.testssh.service.TestsshService;
import com.scusw.testssh.service.TestsshServiceImpl;

public class TestsshAction {
	private TestsshTable tt;
	private TestsshService testsshService;
	public TestsshTable getTt() {
		return tt;
	}
	public void setTt(TestsshTable tt) {
		this.tt = tt;
	}

	
	public TestsshService getTestsshService() {
		return testsshService;
	}
	public void setTestsshService(TestsshService testsshService) {
		this.testsshService = testsshService;
	}
	public String checkUser(){
		if(testsshService.checkUser(tt)){
			return "success";
		}
		return "error";
	}
	
}
