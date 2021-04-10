package common.rent.manage.vo;

public class StaticsVO 
{
	
	private int rank;
	private String id;
	private int sale;
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	@Override
	public String toString() {
		return "StaticsVO [rank=" + rank + ", id=" + id + ", sale=" + sale + "]";
	}
	
	
}
