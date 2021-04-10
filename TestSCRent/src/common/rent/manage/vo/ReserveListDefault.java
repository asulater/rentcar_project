package common.rent.manage.vo;

public class ReserveListDefault {

	private int rentno;
	private String subdate;
	private String member_id;
	private String member_name;
	private String licensedate;
	private String startday;
	private String endday;
	private String carname;
	private String fuel;
	private String total;
	private int obtain;
	private int limit; // 차량배정 가능여부(대여 시작일로부터 7일 이내인가) 0 - 승인대기 / 1 - 배정가능
	private String carid; // 취소할 경우 취소할 차량의 아이디가 들어갈 변수
	private int carstatus; // 차량상태 (1: 배차되었으나 실제 사용중은 아님 / 2: 손님이 차량 사용중
	
	
	public int getRentno() {
		return rentno;
	}
	public void setRentno(int rentno) {
		this.rentno = rentno;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getSubdate() {
		return subdate;
	}
	public void setSubdate(String subdate) {
		this.subdate = subdate;
	}
	public String getCarname() {
		return carname;
	}
	public void setCarname(String carname) {
		this.carname = carname;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getLicensedate() {
		return licensedate;
	}
	public void setLicensedate(String licensedate) {
		this.licensedate = licensedate;
	}

	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public int getObtain() {
		return obtain;
	}
	public void setObtain(int obtain) {
		this.obtain = obtain;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public String getCarid() {
		return carid;
	}
	public void setCarid(String carid) {
		this.carid = carid;
	}
	public int getCarstatus() {
		return carstatus;
	}
	public void setCarstatus(int carstatus) {
		this.carstatus = carstatus;
	}
	
	
	
}
