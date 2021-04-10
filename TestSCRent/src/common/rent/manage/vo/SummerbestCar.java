package common.rent.manage.vo;

public class SummerbestCar {
		
	
	private int rank;
	private String carname;
	private int sale;
	
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getCarname() {
		return carname;
	}
	public void setCarname(String carname) {
		this.carname = carname;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	@Override
	public String toString() {
		return "SummerbestCar [rank=" + rank + ", carname=" + carname + ", sale=" + sale + "]";
	}
	
	
	
}
