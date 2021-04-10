package common.rent.manage;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import common.rent.manage.dao.ManagersDAO;
import common.rent.manage.vo.Managers;


public class LoginAction implements SessionAware, Action {
	
	private Map<String, Object> session;
	private String id;
	private String password;
	
	@Override
	public String execute() throws Exception {
		
		ManagersDAO mDao = new ManagersDAO();
		Managers manager = null;
		
		manager = mDao.getManager(id);
		
		if(manager!=null && manager.getPassword().equals(password)){
			session.put("mLoginId", id);

		} else {
			return "login";
		}
		
		return "success";
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;		
	}

}
