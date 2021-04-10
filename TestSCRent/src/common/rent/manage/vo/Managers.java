package common.rent.manage.vo;

public class Managers {

	private String id; //사원이 사용할 id
	private String password; //비밀번호
	private String name; //사원명
	private String phone; //사원 전화번소
	private String email; //사원 메일주소
	private String grade = "미분류"; //사원의 직급, 기본은 미분류이며 지점장의 직급 변경 이후 메뉴 사용가능
	
	
	
	public Managers(){
		
	}
	
	public Managers(String id, String password, String name, String phone, String email) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.email = email;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGrade() {
		return grade;
	}


	
	
}
