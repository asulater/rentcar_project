package common.rent.manage.vo;

public class Rent {

	private int rentno;
	private String startday;
	private String endday;
	private String member_id;
	private int insurance;
	private int options;
	private int obtain;
	private int returnchk;
	private String manager_id;
	private String car_id;
	private int overdue;
	private String subdate; // 예약 신청 일자
	private String carname; // 차량이름
	private String fuel; // 사용연료
	private String total; // 총 대여요금
	
	
	
	public Rent(){

	}
	
	
	public int getRentno() {
		return rentno;
	}
	public void setRentno(int rentno) {
		this.rentno = rentno;
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
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getInsurance() {
		return insurance;
	}
	public void setInsurance(int insurance) {
		this.insurance = insurance;
	}
	public int getOptions() {
		return options;
	}
	public void setOptions(int options) {
		this.options = options;
	}
	public int getObtain() {
		return obtain;
	}
	public void setObtain(int obtain) {
		this.obtain = obtain;
	}
	public int getReturnchk() {
		return returnchk;
	}
	public void setReturnchk(int returnchk) {
		this.returnchk = returnchk;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getCar_id() {
		return car_id;
	}
	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}
	public int getOverdue() {
		return overdue;
	}
	public void setOverdue(int overdue) {
		this.overdue = overdue;
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


	public String getFuel() {
		return fuel;
	}


	public void setFuel(String fuel) {
		this.fuel = fuel;
	}


	public String getTotal() {
		return total;
	}


	public void setTotal(String total) {
		this.total = total;
	}
	
	
	
	
}


