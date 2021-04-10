package common.rent.client;

public class Car {
	
	private String carId;
	private String carName;
	private String carType;
	private String company;
	private int price;
	private String km;
	private String persons;
	private String fuel;
	private String maxOutPut;
	private String capacity;
	private String picture;
	private int status;
	private String tOil;
	
	public String gettOil() {
		return tOil;
	}
	public void settOil(String tOil) {
		this.tOil = tOil;
	}
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
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
	public String getMaxOutPut() {
		return maxOutPut;
	}
	public void setMaxOutPut(String maxOutPut) {
		this.maxOutPut = maxOutPut;
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
		return "Car [carId=" + carId + ", carName=" + carName + ", carType=" + carType + ", company=" + company
				+ ", price=" + price + ", km=" + km + ", persons=" + persons + ", fuel=" + fuel + ", maxOutPut="
				+ maxOutPut + ", capacity=" + capacity + ", picture=" + picture + ", status=" + status + "]";
	}

	
}
