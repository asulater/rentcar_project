package common.rent.manage.vo;

public class Yearly {

		private String year;
		private int count;
		
		public String getYear() {
			return year;
		}
		public void setYear(String year) {
			this.year = year;
		}
		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
		@Override
		public String toString() {
			return "Yearly [year=" + year + ", count=" + count + "]";
		}
		
		
	
	
}
