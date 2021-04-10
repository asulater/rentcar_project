package common.rent.manage.vo;

public class CarAuthorization {
	
	private String requestid;
	private String category;
	private String carname;
	private String cartype;
	private String company;
	private String carid;
	private int price=0;
	private String km;
	private String persons;
	private String fuel;
	private String maxoutput;
	private String capacity;
	private String picture;
	private int status;
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRequestid() {
		return requestid;
	}
	public void setRequestid(String requestid) {
		this.requestid = requestid;
	}
	public String getCarname() {
		return carname;
	}
	public void setCarname(String carname) {
		this.carname = carname;
	}
	public String getCartype() {
		return cartype;
	}
	public void setCartype(String cartype) {
		this.cartype = cartype;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCarid() {
		return carid;
	}
	public void setCarid(String carid) {
		this.carid = carid;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getKm() {
		return km;
	}
	public void setKm(String km) {
		this.km = km;
	}
	public String getPersons() {
		return persons;
	}
	public void setPersons(String persons) {
		this.persons = persons;
	}
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	public String getMaxoutput() {
		return maxoutput;
	}
	public void setMaxoutput(String maxoutput) {
		this.maxoutput = maxoutput;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "CarAuthorization [requestid=" + requestid + ", carname=" + carname + ", cartype=" + cartype
				+ ", company=" + company + ", carid=" + carid + ", price=" + price + ", km=" + km + ", persons="
				+ persons + ", fuel=" + fuel + ", maxoutput=" + maxoutput + ", capacity=" + capacity + ", picture="
				+ picture + ", status=" + status + "]";
	}

	
	

}
