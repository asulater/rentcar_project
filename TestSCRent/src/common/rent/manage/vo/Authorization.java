package common.rent.manage.vo;

public class Authorization {
	
	private String requestdate;
	private String category;
	private int accidentno;
	private String requestid;
	private String carid;
	private String appcomment;
	public String getRequestdate() {
		return requestdate;
	}
	public void setRequestdate(String requestdate) {
		this.requestdate = requestdate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getAccidentno() {
		return accidentno;
	}
	public void setAccidentno(int accidentno) {
		this.accidentno = accidentno;
	}
	public String getRequestid() {
		return requestid;
	}
	public void setRequestid(String requestid) {
		this.requestid = requestid;
	}
	public String getCarid() {
		return carid;
	}
	public void setCarid(String carid) {
		this.carid = carid;
	}
	public String getAppcomment() {
		return appcomment;
	}
	public void setAppcomment(String appcomment) {
		this.appcomment = appcomment;
	}
	@Override
	public String toString() {
		return "Authorization [requestdate=" + requestdate + ", category=" + category + ", accidentno=" + accidentno
				+ ", requestid=" + requestid + ", carid=" + carid + ", appcomment=" + appcomment + "]";
	}
	
	
	
}
