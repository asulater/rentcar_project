package common.rent.manage.vo;

public class FavoriteFuel {
	

	private String fuel;
	private int sale;
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	@Override
	public String toString() {
		return "FavoriteFuel [fuel=" + fuel + ", sale=" + sale + "]";
	}
	
	
}
