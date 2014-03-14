package com.scusw.util;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class CheckLogin {
	public static boolean checkLogin() {
		Map<String, Object> sessionMap = ActionContext.getContext().getSession();
		String role = (String) sessionMap.get("role");
		if ("student".equals(role)||"staff".equals(role)) {
			return true;
		}
		return false;
	}
}
