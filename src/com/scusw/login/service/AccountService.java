package com.scusw.login.service;

public interface AccountService {
	public void updateStudentPassword(int studentId,String newPassword);
	public void updateStaffPassword(int staffId,String newPassword);
	public void updatePassword(int id,String newPassword,String role);
}
