package common.rent.manage;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;

import common.rent.manage.dao.CarDAO;
import common.rent.manage.vo.BestCar;
import common.rent.manage.vo.FallbestCar;
import common.rent.manage.vo.FavoriteFuel;
import common.rent.manage.vo.SpringbestCar;
import common.rent.manage.vo.StaticsVO;
import common.rent.manage.vo.SummerbestCar;
import common.rent.manage.vo.WinterbestCar;
import common.rent.manage.vo.Yearly;

public class StaticsAction extends ActionSupport {
	private Map<String, Object> request;
	private String dropbox;
	private List<StaticsVO> viplist;
	private String id;
	private int rank;
	private int sale;
	private List<BestCar> bestCarList;
	private List<FavoriteFuel> fflist;
	private List<Yearly> yearlylist;
	private List<SpringbestCar> springbestCarList;
	private List<SummerbestCar> summerbestCarList;
	private List<FallbestCar> fallbestCarList;
	private List<WinterbestCar> winterbestCarList;
	private String temp;

	public String statics3() {
		CarDAO dao = new CarDAO();

		if (temp.equals("bestcar")) {
	         fflist = dao.getFflist();
	         bestCarList = dao.getBestCarList();
	      } else if (temp.equals("sales")) {
	         yearlylist = dao.getYearlylist();
	         viplist = dao.getStatics1();
	      }else if(temp.equals("seasoncar")){
	         springbestCarList = dao.getSpringbestCarList();
	         summerbestCarList= dao.getSummerbestCarList();
	         fallbestCarList= dao.getFallbestCarList();
	         winterbestCarList= dao.getWinterbestCarList();
	         System.out.println(springbestCarList);
	         System.out.println(summerbestCarList);
	         System.out.println(fallbestCarList);
	         System.out.println(winterbestCarList);
	         
	      }
		return SUCCESS;
	}

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	public List<SpringbestCar> getSpringbestCarList() {
		return springbestCarList;
	}

	public void setSpringbestCarList(List<SpringbestCar> springbestCarList) {
		this.springbestCarList = springbestCarList;
	}

	public List<SummerbestCar> getSummerbestCarList() {
		return summerbestCarList;
	}

	public void setSummerbestCarList(List<SummerbestCar> summerbestCarList) {
		this.summerbestCarList = summerbestCarList;
	}

	public List<FallbestCar> getFallbestCarList() {
		return fallbestCarList;
	}

	public void setFallbestCarList(List<FallbestCar> fallbestCarList) {
		this.fallbestCarList = fallbestCarList;
	}

	public List<WinterbestCar> getWinterbestCarList() {
		return winterbestCarList;
	}

	public void setWinterbestCarList(List<WinterbestCar> winterbestCarList) {
		this.winterbestCarList = winterbestCarList;
	}

	public String getDropbox() {
		return dropbox;
	}

	public List<Yearly> getYearlylist() {
		return yearlylist;
	}

	public void setYearlylist(List<Yearly> yearlylist) {
		this.yearlylist = yearlylist;
	}

	public List<FavoriteFuel> getFflist() {
		return fflist;
	}

	public void setFflist(List<FavoriteFuel> fflist) {
		this.fflist = fflist;
	}

	public void setDropbox(String dropbox) {
		this.dropbox = dropbox;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public List<StaticsVO> getViplist() {
		return viplist;
	}

	public void setViplist(List<StaticsVO> viplist) {
		this.viplist = viplist;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public List<BestCar> getBestCarList() {
		return bestCarList;
	}

	public void setBestCarList(List<BestCar> bestCarList) {
		this.bestCarList = bestCarList;
	}

}
