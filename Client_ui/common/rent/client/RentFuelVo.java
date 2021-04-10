package common.rent.client;

public class RentFuelVo 
{
	private String carname;
	private String fuel;
	private String km;
	
	public RentFuelVo(String carname, String fuel, String km) 
	{
		this.carname = carname;
		this.fuel = fuel;
		this.km = km;
	}
	
	
	
	public String getCarname() 
	{
		return carname;
	}
	public void setCarname(String carname) 
	{
		this.carname = carname;
	}

	public String getFuel() 
	{
		return fuel;
	}
	public void setFuel(String fuel) 
	{
		this.fuel = fuel;
	}

	public String getKm() 
	{
		return km;
	}
	public void setKm(String km) 
	{
		this.km = km;
	}

	
	@Override
	public String toString() 
	{
		return "RentFuelVo [carname=" + carname + ", fuel=" + fuel + ", km=" + km + "]";
	}
	
	
}
