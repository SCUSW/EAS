package com.scusw.login.service;

import com.scusw.model.StudentInfo;

public interface AccountService {
	public boolean updatePassword(String loginNo,String newPassword,String oldPassword,String role);
}
