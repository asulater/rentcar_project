package common.rent.client;

public class BookingVo 
{
	private String carName;
	private String startDay;
	private String endDay;
	private String member_id;
	private String total;
	private int insurance;
	private String options;
	private String fuel;
	
	public BookingVo(String carName, String startDay, String endDay, String member_id, String total, int insurance,
			String options, String fuel) {
		
		this.carName = carName;
		this.startDay = startDay;
		this.endDay = endDay;
		this.member_id = member_id;
		this.total = total;
		this.insurance = insurance;
		this.options = options;
		this.fuel = fuel;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
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
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
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
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	@Override
	public String toString() {
		return "BookingVo [carName=" + carName + ", startDay=" + startDay + ", endDay=" + endDay + ", id=" + member_id
				+ ", total=" + total + ", insurance=" + insurance + ", options=" + options + ", fuel=" + fuel + "]";
	}
}