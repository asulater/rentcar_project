package common.rent.manage;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import common.rent.manage.dao.CarDAO;
import common.rent.manage.dao.ScheduleDAO;
import common.rent.manage.vo.TodayReserveTable;

public class MainPageAction extends ActionSupport {

	private int reserveCount; //이번 달 예약 건수
	private int accRate; //이번 달 사고비율
	private int safetyCheckCount; //점검필요 차량
	private List<TodayReserveTable> reserveList; //배차완료 되어있고, 오늘 고객이 방문할 예약 목록
	
	
	
	
	public String showMainPage(){
		
		ScheduleDAO sDAO = new ScheduleDAO();
		reserveCount = sDAO.currentMonthScheduleCount();
		
		CarDAO cDao = new CarDAO();
		
		accRate = (int) Math.round(((cDao.currentMonthAccCount()*1.0) / reserveCount)*100);
		
		safetyCheckCount = cDao.inspectCarCount();
		
		reserveList = sDAO.showTodayReserveList();
		
		return SUCCESS;
	}



	
	public int getReserveCount() {
		return reserveCount;
	}

	public void setReserveCount(int reserveCount) {
		this.reserveCount = reserveCount;
	}

	public int getAccRate() {
		return accRate;
	}

	public void setAccRate(int accRate) {
		this.accRate = accRate;
	}

	public int getSafetyCheckCount() {
		return safetyCheckCount;
	}

	public void setSafetyCheckCount(int safetyCheckCount) {
		this.safetyCheckCount = safetyCheckCount;
	}

	public List<TodayReserveTable> getReserveList() {
		return reserveList;
	}

	public void setReserveList(List<TodayReserveTable> reserveList) {
		this.reserveList = reserveList;
	}
	
	

	
}
