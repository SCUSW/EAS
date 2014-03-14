package com.scusw.util;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class CheckPrivilege {
	public static boolean checkPrivilege(int privilege_id) {
		Map<String, Object> sessionMap = ActionContext.getContext().getSession();
		List<Integer> list = (List<Integer>) sessionMap.get("privilege");
		if(list != null) {
			return list.contains(privilege_id);
		}
		return false;
	}
}
