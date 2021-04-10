package common.rent.manage;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


import com.opensymphony.xwork2.ActionSupport;

import common.rent.manage.dao.ScheduleDAO;
import common.rent.manage.vo.DetailReserveInfo;
import common.rent.manage.vo.Rent;
import common.rent.manage.vo.ReserveListDefault;


public class ScheduleAction extends ActionSupport {

	private String selectCarId; //선택한 차량의 아이디 값
	private int selectYear; //조회를 원하는 년도
	private int selectMonth; //조회를 원하는 달

	private List<Rent> reserveCurrentMonth; //선택 차량의 이번달 예약목록
	private List<String> reserveDayList; //javascript 전달을 위해 날짜만 배열로
	
	private List<ReserveListDefault> reserveListDefault; //간략한 일정 목록
	private DetailReserveInfo detailReserveInfo; //선택한 일정의 상세 정보
	
	private String selectMemberId; //선택한 일정을 요청한 고객
	private int selectRentNo; //선택한 일정의 고유값
	private String selectCarName; //고객이 요청한 차량명
	private String selectFuel; // 고객이 요청한 차량의 사용 연료
	
	private String settingCarId; //할당된 차량의 고유값, 배차-인도 이후 차량상태 변경에도 쓰임
	
	private int reserveInfoPageNum; //예약신청목록(0), 대여현황 및 반납확인(1)
	private int currentPageNum; //상세보기 시 이용하는 현재 페이지 정보
	
	private String inputReturnDate; //반납한 일자
	private int inputMileage; //주행거리
	
	//page
	private int currentPage = 1; // 현재 페이지
	private int totalCount;	   // 전체 게시물 수
	private int blockCount = 8; // 한 페이지 게시물 수
	private int blockPage = 5;   // 한 화면에 보여질 페이지 수
	private String pagingHtml;
	private PagingAction page;
	HashMap<String, Object> pageMap; //start~end page
	
	private String searchNewCarIdFlag; // 신차 중 배차 가능한 차량 검색("auto" - 자동, "manual" - 수동)
	private List<DetailReserveInfo> selectableList; //배차가능 차량 목록
	
	//배차완료 이후 출고를 위한 객체
	private int selectedCarStatus; //선택된 차량의 상태(배차완료, 사용중)
	
	/**
	 * 달력에 예약 일정 출력을 위한 예약일 목록 가져오기
	 * @return
	 */
	public String showCurrentMonth(){
		
		ScheduleDAO sDAO = new ScheduleDAO();
		Calendar calendar = Calendar.getInstance();

		// 8자리 만들기 '20151015'
		String year = String.valueOf(selectYear);
		String month = String.format("%02d", selectMonth);
		String date = String.format("%02d", 1);
		
		
		//DAO 에서는 날짜(년, 월) 선책 차량으로 조건검색
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("date", year+month+date);
		map.put("carid", selectCarId);
		
		
		reserveCurrentMonth = sDAO.currentMonthSchedule(map);
	
		
		// calendar 출력용 위한 날짜 구하기
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		
		// 예약별 반복
		for(int i = 0; i<reserveCurrentMonth.size(); i++){
			Date startday = null;
			Date endday = null;

			//대여 시작일 부터 반납일 까지의 일자 구하기
			try {
				startday = formatter.parse(reserveCurrentMonth.get(i).getStartday());
				endday = formatter.parse(reserveCurrentMonth.get(i).getEndday());
				
			} catch (ParseException e) {
				e.printStackTrace();
			}

			long diff = endday.getTime() - startday.getTime();
			int diffDays = (int) (diff / (24 * 60 * 60 * 1000));
			
			if(diffDays == 0) diffDays  = 1;
			

			calendar.setTime(startday);
			reserveDayList = new ArrayList<>();
			for(int j = 0; j<=diffDays; j++){
				
				//해당 일수만큼 일자를 저장
				String y = String.valueOf(calendar.get(Calendar.YEAR));
				String m = String.format("%02d", (calendar.get(Calendar.MONTH) + 1) );
				String d = String.format("%02d", calendar.get(Calendar.DAY_OF_MONTH));
				
				String reserveDay = y+m+d;
				if(m.equals(month)){
					reserveDayList.add(reserveDay);

				}
				calendar.add(calendar.DATE, 1);
				
			}
			
		}
		
		
		return SUCCESS;
	}
	
	
	
	/**
	 * 예약승인 대기중인 신청 목록
	 * @return
	 */
	public String showReserveScheduleList(){
		
		reserveInfoPageNum = 0;
		
		ScheduleDAO sDAO = new ScheduleDAO();
		totalCount = sDAO.getReserveListCount(); // 예약신청, 반납 각 해당하는 예약의 전체 갯수
		
		settingPaging();
		
		reserveListDefault = sDAO.reserveScheduleDefault(pageMap);
		
		// 각 일정이 배정가능한 상태인지 체크
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date today = Calendar.getInstance().getTime();
		Date startday = null;
		for(int i = 0; i<reserveListDefault.size(); i++){
			try {
				startday = formatter.parse(reserveListDefault.get(i).getStartday());
				long diff = startday.getTime() - today.getTime();
				int diffDays = (int) (diff / (24 * 60 * 60 * 1000));
				System.out.println(diff + " --------음수면?");
				if(diffDays <= 7 && diffDays >=0 && diff >=0){
					reserveListDefault.get(i).setLimit(1);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
			
		return SUCCESS;
	}

	
	/**
	 * 사용 중인 차량 목록(반납 예정)
	 * @return
	 */
	public String showIsUseList(){
		
		reserveInfoPageNum = 1;
		
		ScheduleDAO sDAO = new ScheduleDAO();
		totalCount = sDAO.getIsUseListCount(); // 예약신청, 반납 각 해당하는 예약의 전체 갯수
		
		settingPaging();
		
		reserveListDefault = sDAO.isUseListDefaul(pageMap);
		
		return SUCCESS;
		
	}
	
	
	
	/**
	 * 예약 취소한 목록
	 * @return
	 */
	public String shwoRentCancelList(){
		
		ScheduleDAO sDAO = new ScheduleDAO();
		
		reserveListDefault = sDAO.rentCancelList();
		
		return SUCCESS;
	}
	
	
	public String deleteRentInfo(){
		
		ScheduleDAO sDAO = new ScheduleDAO();
		
		sDAO.deleteRentInfo(selectRentNo);
		
		return SUCCESS;
	}
	
	
	//페이지처리를 위한 준비
	private void settingPaging(){
		
		pageMap = new HashMap<>();
		
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, reserveInfoPageNum);
		
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
		{
			lastCount = page.getEndCount() + 1;
		}
		
		pageMap.put("start", page.getStartCount() + 1);
		pageMap.put("end", lastCount);
		
		System.out.println((page.getStartCount()+1) + " " + lastCount);
		
		return;
	}
	
	
	/**
	 * 예약신청시 승인을 위한 상세정보 검색
	 * @return
	 */
	public String showDetailReserveInfo(){
		
		
		ScheduleDAO sDAO = new ScheduleDAO();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("memberId", selectMemberId);
		map.put("rentNo", selectRentNo);
		
		detailReserveInfo = sDAO.detailReserveInfo(map);
		
		//반납예정인 일정일 경우 이미 할당되어 있는 차량 고유번호를 변수에 저장
		if(currentPageNum == 1) settingCarId = detailReserveInfo.getCarid();
		
		return SUCCESS;
	}
	
	
	/**
	 * 차량 반납
	 */
	public String settingReturnCar(){
		
		ScheduleDAO sDAO = new ScheduleDAO();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("rentno", selectRentNo);
		//map.put("carid", settingCarId);
		map.put("mileage", inputMileage);
		map.put("returnDate", inputReturnDate);

		sDAO.settingReturnCar(map);
		
		
		return SUCCESS;
	}
	
	
	/**
	 * 배차완료된 차량을 손님에게 인도했을 경우 car의 status 변경
	 * @return
	 */
	public String settingUsingCar(){
		
		ScheduleDAO sDAO = new ScheduleDAO();
		sDAO.settingUsingCarStatus(settingCarId);
		
		return SUCCESS;
	}
	
	
	
	/**
	 * 고객이 실제 사용할 자동차를 DB에 저장 (승인)
	 * @return
	 */
	public String settingAppReserve(){
		
		ScheduleDAO sDAO = new ScheduleDAO();
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("rentno", selectRentNo);
		map.put("carid", settingCarId);
		sDAO.settingAppReserve(map);
		
		return SUCCESS;
	}
	
	
	/**
	 * 예약 신청을 불승인 할 경우
	 * @return
	 */
	public String settingDisappReserve(){
		
		ScheduleDAO sDAO = new ScheduleDAO();
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("rentno", selectRentNo);
		
		//@@ 차량 번호는 할당되지 않았으므로 불승인시에는 필요 없음(map이라 DAO 쪽에서 주석처리함)
		map.put("carid", settingCarId);
		sDAO.settingDisappReserve(map);
		
		return SUCCESS;
	}
	
	
	/**
	 * 차량검색조건(차량명, 연료)에 맞는 자동차 고유번호 찾기
	 * @return
	 */
	public String searchingCarId(){
		
		ScheduleDAO sDAO = new ScheduleDAO();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 차량 아이디 구하기
		map.put("carname", selectCarName);
		map.put("fuel", selectFuel);
		map.put("condition", searchNewCarIdFlag);
		
		
		//새 차 중에서 먼저 검색
		selectableList = sDAO.searchNewCarId(map);
		if(searchNewCarIdFlag.equals("auto")){
			detailReserveInfo = selectableList.get(0); // 자동 검색의 경우
		}
		
		if(selectableList == null) {
			selectableList = sDAO.searchCarId(map); // 수동 검색을 위한, 자동차 목록
			if(searchNewCarIdFlag.equals("auto")) {
				detailReserveInfo = selectableList.get(0);
			}
		}
		
		return SUCCESS;
	}

	
	
	
	//getter setter
	public String getSelectCarId() {
		return selectCarId;
	}

	public void setSelectCarId(String selectCarId) {
		this.selectCarId = selectCarId;
	}

	public List<Rent> getReserveCurrentMonth() {
		return reserveCurrentMonth;
	}

	public void setReserveCurrentMonth(List<Rent> reserveCurrentMonth) {
		this.reserveCurrentMonth = reserveCurrentMonth;
	}

	public List<String> getReserveDayList() {
		return reserveDayList;
	}

	public void setReserveDayList(List<String> reserveDayList) {
		this.reserveDayList = reserveDayList;
	}

	public int getSelectYear() {
		return selectYear;
	}

	public void setSelectYear(int selectYear) {
		this.selectYear = selectYear;
	}

	public int getSelectMonth() {
		return selectMonth;
	}

	public void setSelectMonth(int selectMonth) {
		this.selectMonth = selectMonth;
	}

	public int getSelectRentNo() {
		return selectRentNo;
	}

	public void setSelectRentNo(int selectRentNo) {
		this.selectRentNo = selectRentNo;
	}

	public List<ReserveListDefault> getReserveListDefault() {
		return reserveListDefault;
	}

	public DetailReserveInfo getDetailReserveInfo() {
		return detailReserveInfo;
	}

	public String getSelectMemberId() {
		return selectMemberId;
	}

	public void setSelectMemberId(String selectMemberId) {
		this.selectMemberId = selectMemberId;
	}

	public String getSelectCarName() {
		return selectCarName;
	}

	public void setSelectCarName(String selectCarName) {
		this.selectCarName = selectCarName;
	}

	public String getSelectFuel() {
		return selectFuel;
	}

	public void setSelectFuel(String selectFuel) {
		this.selectFuel = selectFuel;
	}

	public String getSettingCarId() {
		return settingCarId;
	}

	public void setSettingCarId(String settingCarId) {
		this.settingCarId = settingCarId;
	}

	public void setReserveListDefault(List<ReserveListDefault> reserveListDefault) {
		this.reserveListDefault = reserveListDefault;
	}

	public void setDetailReserveInfo(DetailReserveInfo detailReserveInfo) {
		this.detailReserveInfo = detailReserveInfo;
	}

	public String getInputReturnDate() {
		return inputReturnDate;
	}

	public void setInputReturnDate(String inputReturnDate) {
		this.inputReturnDate = inputReturnDate;
	}

	public int getInputMileage() {
		return inputMileage;
	}

	public void setInputMileage(int inputMileage) {
		this.inputMileage = inputMileage;
	}

	public int getReserveInfoPageNum() {
		return reserveInfoPageNum;
	}

	public void setReserveInfoPageNum(int reserveInfoPageNum) {
		this.reserveInfoPageNum = reserveInfoPageNum;
	}

	public int getCurrentPageNum() {
		return currentPageNum;
	}

	public void setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
	}

	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}


	public int getBlockCount() {
		return blockCount;
	}


	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}


	public int getBlockPage() {
		return blockPage;
	}


	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}


	public String getPagingHtml() {
		return pagingHtml;
	}


	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}


	public PagingAction getPage() {
		return page;
	}


	public void setPage(PagingAction page) {
		this.page = page;
	}



	public String getSearchNewCarIdFlag() {
		return searchNewCarIdFlag;
	}



	public void setSearchNewCarIdFlag(String searchNewCarIdFlag) {
		this.searchNewCarIdFlag = searchNewCarIdFlag;
	}



	public List<DetailReserveInfo> getSelectableList() {
		return selectableList;
	}



	public void setSelectableList(List<DetailReserveInfo> selectableList) {
		this.selectableList = selectableList;
	}


	public int getSelectedCarStatus() {
		return selectedCarStatus;
	}


	public void setSelectedCarStatus(int selectedCarStatus) {
		this.selectedCarStatus = selectedCarStatus;
	}

	
	
	
}
