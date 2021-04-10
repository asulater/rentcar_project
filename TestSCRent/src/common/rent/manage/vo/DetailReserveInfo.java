package common.rent.manage.vo;

public class DetailReserveInfo {

	private int rentno;
	private String member_id;
	private String member_name;
	private String licensedate;
	private int totalrent_count; //총 대여횟수
	private int overdue_count; //연체횟수
	private int acc_count; //사고횟수
	private String subdate; //예약신청일자
	private String startday;
	private String endday;
	private String carname;
	private String fuel;
	private String insurance; //보험종류
	private String options; //옵션내용
	private String lastday; //마지막 대여일
	private String wash_car = "YES";
	private String carid;
	
	
	
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
	public int getTotalrent_count() {
		return totalrent_count;
	}
	public void setTotalrent_count(int totalrent_count) {
		this.totalrent_count = totalrent_count;
	}
	public int getOverdue_count() {
		return overdue_count;
	}
	public void setOverdue_count(int overdue_count) {
		this.overdue_count = overdue_count;
	}
	public int getAcc_count() {
		return acc_count;
	}
	public void setAcc_count(int acc_count) {
		this.acc_count = acc_count;
	}
	public String getSubdate() {
		return subdate;
	}
	public void setSubdate(String subdate) {
		this.subdate = subdate;
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
	public String getCarname() {
		return carname;
	}
	public void setCarname(String carname) {
		this.carname = carname;
	}
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	public String getInsurance() {
		return insurance;
	}
	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public String getLastday() {
		return lastday;
	}
	public void setLastday(String lastday) {
		this.lastday = lastday;
	}
	public String getWash_car() {
		return wash_car;
	}
	public void setWash_car(String wash_car) {
		this.wash_car = wash_car;
	}
	public String getCarid() {
		return carid;
	}
	public void setCarid(String carid) {
		this.carid = carid;
	}

	
	
	
}
