package common.rent.manage.vo;

public class TodayReserveTable {

	private int rentno; //예약번호
	private String carid; //예약된 차량번호
	private String carname; //예약된 차량명
	private String memberid; //예약한 고객 아이디
	private String membername; //예약한 고객명
	private String memberphone; //예약한 고객 연락처
	private String total; // 예약 총요금
	
	
	public TodayReserveTable(){
	}

	
	public int getRentno() {
		return rentno;
	}

	public void setRentno(int rentno) {
		this.rentno = rentno;
	}

	public String getCarid() {
		return carid;
	}

	public void setCarid(String carid) {
		this.carid = carid;
	}

	public String getCarname() {
		return carname;
	}

	public void setCarname(String carname) {
		this.carname = carname;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public String getMemberphone() {
		return memberphone;
	}

	public void setMemberphone(String memberphone) {
		this.memberphone = memberphone;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}
	
	
	
}
