package common.rent.client;

public class RentInfoVo {
	
	private String carName;
	private String fuel;
	private String startDay;
	private String endDay;
	private int insurance;
	private String options;
	private String total;
	private String subDate;
	private int rentNo;
	
	public int getRentNo() {
		return rentNo;
	}
	public void setRentNo(int rentNo) {
		this.rentNo = rentNo;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public int getInsurance() {
		return insurance;
	}
	public void setInsurance(int insurance) {
		this.insurance = insurance;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getSubDate() {
		return subDate;
	}
	public void setSubDate(String subDate) {
		this.subDate = subDate;
	}
	
	@Override
	public String toString() {
		return "RentInfoVo [carName=" + carName + ", fuel=" + fuel + ", startDay=" + startDay + ", endDay=" + endDay
				+ ", insurance=" + insurance + ", options=" + options + ", total=" + total + ", subDate=" + subDate
				+ "]";
	}

}
