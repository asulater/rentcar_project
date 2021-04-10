package common.rent.client;

public class Members {
	
	private String id;
	private String password;
	private String name;
	private String licenseDate;
	private String zipcode;//우편번호()
	private String address;//주소객체 전체가 담길 변수(앞부분)
	private String address1;//상세주소
	private String phone;
	private String email;
	
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
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
	public String getLicenseDate() {
		return licenseDate;
	}
	public void setLicenseDate(String licenseDate) {
		this.licenseDate = licenseDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	
	@Override
	public String toString() {
		return "Members [id=" + id + ", password=" + password + ", name=" + name + ", licenseDate=" + licenseDate
				+ ", zipcode=" + zipcode + ", address=" + address + ", address1=" + address1 + ", phone=" + phone
				+ ", email=" + email + "]";
	}
	
}
