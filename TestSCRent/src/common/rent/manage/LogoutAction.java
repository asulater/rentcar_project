package common.rent.manage;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;


public class LogoutAction implements SessionAware, Action {
	
	private Map<String, Object> session;


	@Override
	public String execute() throws Exception {
		if (session.get("mLoginId") != null) {
			session.remove("mLoginId");
		}

		return "success";
	}



	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;		
	}

}
