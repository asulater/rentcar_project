package common.rent.manage.vo;

public class Approval {

	private int approvalno;
	private int accidentno;
	private String requestid;
	private String category;
	private String carid;
	private String appcomment;
	private String requestdate;
	
	
	public Approval(int accidentno, String carid, String requestid, String appcomment, String category) {
		super();
		this.accidentno = accidentno;
		this.carid = carid;
		this.requestid = requestid;
		this.category = category;
		this.appcomment = appcomment;
	}
	public Approval(String carid, String requestid, String category) {
		super();
		this.carid = carid;
		this.requestid = requestid;
		this.category = category;
	}
	public String getAppcomment() {
		return appcomment;
	}
	public void setAppcomment(String appcomment) {
		this.appcomment = appcomment;
	}
	public int getApprovalno() {
		return approvalno;
	}
	public void setApprovalno(int approvalno) {
		this.approvalno = approvalno;
	}
	public int getAccidentno() {
		return accidentno;
	}
	public void setAccidentno(int accidentno) {
		this.accidentno = accidentno;
	}
	public String getCarid() {
		return carid;
	}
	public void setCarid(String carid) {
		this.carid = carid;
	}
	public String getRequestid() {
		return requestid;
	}
	public void setRequestid(String requestid) {
		this.requestid = requestid;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRequestdate() {
		return requestdate;
	}
	public void setRequestdate(String requestdate) {
		this.requestdate = requestdate;
	}


	@Override
	public String toString() {
		return "Approval [approvalno=" + approvalno + ", accidentid=" + accidentno + ", requestid=" + requestid
				+ ", category=" + category + ", appcomment=" + appcomment + ", requestdate=" + requestdate + "]";
	}
	
	
	
}
