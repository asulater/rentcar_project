package common.rent.manage;

import java.util.HashMap;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import common.rent.manage.dao.ManagersDAO;
import common.rent.manage.vo.Managers;

public class ManagersAction extends ActionSupport {
	Managers manager; // joinForm 에서 입력한 사원정보
	List<Managers> managersList; //전체 사원 목록
	String selectManagerId; // 검색할 사원의 아이디
	String[] gradeList = {"미분류", "사원", "주임", "지점장"};
	String changedGrade; // 변경할 직급
	String condition; //검색할 조건(신입, 기존)
	
	String managerId; //권한 식별에 사용하기 위한 매니저 아이디(없으면 로그인 하지 않은 상태)
	

	// 사원등록 처리(테이블에 추가)
	public String addManager() throws Exception {
		ManagersDAO mDao = new ManagersDAO();
		mDao.addManager(manager);
		return SUCCESS;
	}
	
	// 사원 목록 가져오기
	public String searchManagersList(){
		
		ManagersDAO mDao = new ManagersDAO();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(condition == null){
			
		}else if(condition.equals("신입")){
			map.put("nb", "미분류"); //신입사원 검색
		}else{
			map.put("ob", "미분류"); // 기존사원 검색
		}
		
		managersList = mDao.getManagersList(map);
		
		return SUCCESS;
	}
	
	// 특정 사원 정보 가져오기
	public String searchManager(){
		
		ManagersDAO mDao = new ManagersDAO();
		manager = mDao.getManager(selectManagerId);

		return SUCCESS;
	}
	
	
	// 특정 사원의 직급 변경하기
	public String updateManagerGrade(){
		
		ManagersDAO mDao = new ManagersDAO();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("managerId", selectManagerId); //직급 변경할 매니저 아이디
		map.put("grade", changedGrade); // 변경할 직급
		
		System.out.println(selectManagerId + " " + changedGrade);
		
		mDao.updateManagerGrade(map);
		
		return SUCCESS;
	}
	
	
	// 세션의 아이디와 같은 매니저를 찾고, 그 직급을 돌려줌
	public String searchGradeOfManager(){
		
		ManagersDAO mDao = new ManagersDAO();
		managerId = (String) ActionContext.getContext().getSession().get("mLoginId");
		
		if(managerId != null) manager = mDao.getManager(managerId);
		
		return SUCCESS;
	}
	
	
	
	// getter, setter
	public Managers getManager() {
		return manager;
	}

	public void setManager(Managers manager) {
		this.manager = manager;
	}

	public List<Managers> getManagersList() {
		return managersList;
	}

	public void setManagersList(List<Managers> managersList) {
		this.managersList = managersList;
	}

	public String getSelectManagerId() {
		return selectManagerId;
	}

	public void setSelectManagerId(String selectManagerId) {
		this.selectManagerId = selectManagerId;
	}

	public String[] getGradeList() {
		return gradeList;
	}

	public void setGradeList(String[] gradeList) {
		this.gradeList = gradeList;
	}

	public String getChangedGrade() {
		return changedGrade;
	}

	public void setChangedGrade(String changedGrade) {
		this.changedGrade = changedGrade;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	
	
	
}
