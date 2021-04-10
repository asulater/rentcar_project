package common.rent.manage.vo;

public class Car {
	private String carid; //차량번호
	private String carname; //차량명(ex SM5)
	private String cartype; //차종(승용, 소형)
	private String company; //차량 제조사
	private int price; //렌트 가격(시간단위)
	private String km; //연비(km/ℓ)
	private String persons; //승차인원
	private String fuel; //사용연료
	private String maxoutput; //최고출력
	private String capacity; //배기량
	private String picture; //차량 이미지의 저장경로
	private int status; //차량 현황(0 사용가능, 1 정비중, 2 폐차, 3 구입신청(승인 전 상태)
	private String mileage;
	
	public Car(){
		
	}
	
	public Car(String carid, String carname, String cartype, String company, int price, String km, String persons,
			String fuel, String maxoutput, String capacity, String picture) {
		super();
		this.carid = carid;
		this.carname = carname;
		this.cartype = cartype;
		this.company = company;
		this.price = price;
		this.km = km;
		this.persons = persons;
		this.fuel = fuel;
		this.maxoutput = maxoutput;
		this.capacity = capacity;
		this.picture = picture;
	}

	

	
	
	public Car(String carname2, String cartype2, String company2, String carid2, int price2, String km2,
			String persons2, String fuel2, String maxoutput2, String capacity2, String picture2, int status2) {
		this.carid = carid2;
		this.carname = carname2;
		this.cartype = cartype2;
		this.company = company2;
		this.price = price2;
		this.km = km2;
		this.persons = persons2;
		this.fuel = fuel2;
		this.maxoutput = maxoutput2;
		this.capacity = capacity2;
		this.picture = picture2;
		this.status = status2;
	
	}
	
	public Car(String carid, String carname, String cartype, String company, int price, String km, String persons,
			String fuel, String maxoutput, String capacity, String picture, int status, String mileage) {
		super();
		this.carid = carid;
		this.carname = carname;
		this.cartype = cartype;
		this.company = company;
		this.price = price;
		this.km = km;
		this.persons = persons;
		this.fuel = fuel;
		this.maxoutput = maxoutput;
		this.capacity = capacity;
		this.picture = picture;
		this.status = status;
		this.mileage = mileage;
	}

	public String getMileage() {
		return mileage;
	}

	public void setMileage(String mileage) {
		this.mileage = mileage;
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
		return "Car [carid=" + carid + ", carname=" + carname + ", cartype=" + cartype + ", company=" + company
				+ ", price=" + price + ", km=" + km + ", persons=" + persons + ", fuel=" + fuel + ", maxoutput="
				+ maxoutput + ", capacity=" + capacity + ", picture=" + picture + ", status=" + status + ", mileage="
				+ mileage + "]";
	}
	
	
}
