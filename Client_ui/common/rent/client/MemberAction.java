package common.rent.client;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MemberAction extends ActionSupport implements SessionAware{

	private MemberDAO dao;
	
	private Members vo;
	private String address;
	private String id;
	private String pw;
	private String searchText;//가입시 아이디 중복확인
	private boolean idCheck;
	private String str;
	
	public MemberDAO getDao() {
		return dao;
	}

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	private ArrayList<RentInfoVo> list;

	public ArrayList<RentInfoVo> getList() {
		return list;
	}

	public void setList(ArrayList<RentInfoVo> list) {
		this.list = list;
	}

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	private int loginChk;//로그인 정상 처리 : 0 || 등록된 아이디 없음 : 1 || 비밀번호 불일치 : 2
 
	public int getLoginChk() {
		return loginChk;
	}

	public void setLoginChk(int loginChk) {
		this.loginChk = loginChk;
	}

	//로그인 유지
	private Map<String, Object> session;
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Map<String, Object> getSession() {
		return session;
	}
	
	public Members getVo() {
		return vo;
	}
	public void setVo(Members vo) {
		this.vo = vo;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public boolean isIdCheck() {
		return idCheck;
	}

	public void setIdCheck(boolean idCheck) {
		this.idCheck = idCheck;
	}

	public String Join() throws Exception
	{
		dao = new MemberDAO();
		vo.setAddress(vo.getZipcode()+"_"+vo.getAddress()+"_"+vo.getAddress1());
		System.out.println(vo.getAddress());
		dao.Join(vo);
		return SUCCESS;
	}
	
	public String IdCheck() throws Exception 
	{
		dao = new MemberDAO();
		vo = dao.IdCheck(searchText);
		//중복된 아이디가 있으면
		if (vo != null) 
		{
			return INPUT;
		}
		//사용 가능한 아이디이면 true 리턴
		idCheck = true;
		return SUCCESS;
	}
	
	public String Login() throws Exception 
	{
		dao = new MemberDAO();
		System.out.println("로그인 아이디 : "+id);
		vo = dao.Login(id);
		
		//등록된 id가 있을때
		if(vo.getId() != null)
		{
			if (vo.getId().equals(id)) 
			{
				//비밀번호 일치할때
				if (vo.getPassword().equals(pw))
				{
					this.loginChk = 0;
					session = ActionContext.getContext().getSession();
					session.put("loginId", vo.getId());
					session.put("loginName", vo.getName());
					return SUCCESS;
				}
				//비밀번호 일치하지 않을때
				else 
				{
					this.loginChk = 2;
					return SUCCESS;
				}
			}
			else
			{
				return SUCCESS;
			}
		}
		//등록되지 않은 id 입력시
		else
		{
			System.out.println("가입되지 않음");
			this.loginChk = 1;
			return SUCCESS;
		}
	}
	
	public String Logout() throws Exception 
	{
		session = ActionContext.getContext().getSession();
		System.out.println("세션 저장결과 : "+session.toString());
		session.clear();
		return SUCCESS;
	}
	
	public String ModifyForm() throws Exception
	{
		dao = new MemberDAO();
		session = ActionContext.getContext().getSession();
		id = (String)session.get("loginId");
		System.out.println("정보수정 : "+id);
		vo = dao.Login(id);
		String [] array = vo.getLicenseDate().split(" ");
		vo.setLicenseDate(array[0]);
		System.out.println("면허 "+vo.getLicenseDate());
		array = vo.getAddress().split("_");
		vo.setZipcode(array[0]);
		vo.setAddress(array[1]);
		vo.setAddress1(array[2]);
 		return SUCCESS;
	}
	
	public String ModifyClient() throws Exception
	{
		dao = new MemberDAO();
		System.out.println("정보수정합니다");
		session = ActionContext.getContext().getSession();
		vo.setId((String)session.get("loginId"));
		System.out.println(vo.getId() + vo.getPassword());
		vo.setAddress(vo.getZipcode()+"_"+vo.getAddress()+"_"+vo.getAddress1());
		dao.ModifyClient(vo);
		return SUCCESS;
	}
	
	//탈퇴처리시 비밀번호 체크
	public String PwCheck() throws Exception
	{
		dao = new MemberDAO();
		session = ActionContext.getContext().getSession();
		id = (String)session.get("loginId");
		vo = dao.IdCheck(id);
		//비밀번호 일치할때
		if (vo.getPassword().equals(pw)) 
		{
			this.loginChk = 0;
			return SUCCESS;
		}
		else
			this.loginChk = 1;
		return SUCCESS;
	}
	
	public String SignOut() throws Exception
	{
		dao = new MemberDAO();
		session = ActionContext.getContext().getSession();
		id = (String)session.get("loginId");
		session.clear();
		dao.SignOut(id);
		return SUCCESS;
	}
	
	public String BookingList() throws Exception
	{
		str = "예약 이력 조회";
		dao = new MemberDAO();
		session = ActionContext.getContext().getSession();
		id = (String)session.get("loginId");
		System.out.println("접속정보 : "+id);
		list = (ArrayList<RentInfoVo>)dao.BookingList(id);
		System.out.println(list);
		return SUCCESS;
	}
}