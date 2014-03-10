package com.scusw.testssh.service;

import com.scusw.model.TestsshTable;
import com.scusw.testssh.dao.TestsshDao;

public class TestsshServiceImpl implements TestsshService{
	private TestsshDao testsshDao;

	public TestsshDao getTestsshDao() {
		return testsshDao;
	}

	public void setTestsshDao(TestsshDao testsshDao) {
		this.testsshDao = testsshDao;
	}

	public boolean checkUser(TestsshTable tt) {
		if(testsshDao.checkUser(tt)!=null){
			return true;
		}
		return false;
	}
	
}
