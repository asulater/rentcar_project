package common.rent.manage.vo;

public class Accident {

	private int accidentno;
	private String carid;
	private String userid;
	private String accidentdate;
	private String comments;
	private String documentno;
	private String managerid;
	
	public Accident(){};
	
	
	public Accident( String carid, String userid, String comments,
			String documentno, String managerid) {
		super();
		this.carid = carid;
		this.userid = userid;
		this.comments = comments;
		this.documentno = documentno;
		this.managerid = managerid;
	}
	
	
	public Accident(String carid2, String userid2, String accidentdate2, String comments2, String documentno2,
			String managerid2) {
		this.carid = carid2;
		this.userid = userid2;
		this.accidentdate =accidentdate2;
		this.comments = comments2;
		this.documentno = documentno2;
		this.managerid = managerid2;
	}


	@Override
	public String toString() {
		return "Accident [accidentno=" + accidentno + ", carid=" + carid + ", userid=" + userid + ", accidentdate="
				+ accidentdate + ", comment=" + comments + ", documentno=" + documentno + ", managerid=" + managerid
				+ "]";
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getAccidentdate() {
		return accidentdate;
	}
	public void setAccidentdate(String accidentdate) {
		this.accidentdate = accidentdate;
	}
	
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getDocumentno() {
		return documentno;
	}
	public void setDocumentno(String documentno) {
		this.documentno = documentno;
	}
	public String getManagerid() {
		return managerid;
	}
	public void setManagerid(String managerid) {
		this.managerid = managerid;
	}
	
	
	
	
	
}
