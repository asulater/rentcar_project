package common.rent.manage;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		ActionContext context = invocation.getInvocationContext();
		Map<String, Object> session = context.getSession();
		String loginId = (String) session.get("mLoginId");
		
		if(loginId == null) return Action.LOGIN; // 다시 로그인 액션 실행하여 로그인 폼으로 돌아감
		
		return invocation.invoke();
	}

}
