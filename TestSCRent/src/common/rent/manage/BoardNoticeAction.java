package common.rent.manage;

import java.util.HashMap;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import common.rent.manage.dao.CarNoticeDAO;
import common.rent.manage.vo.CarNotice;

public class BoardNoticeAction extends ActionSupport {

	//page
	private int currentPage = 1; // 현재 페이지
	private int totalCount;	   // 전체 게시물 수
	private int blockCount = 8; // 한 페이지 게시물 수
	private int blockPage = 5;   // 한 화면에 보여질 페이지 수
	private String pagingHtml;
	private PagingAction page;
	HashMap<String, Object> pageMap; //start~end page
	
	//공지사항
	private List<CarNotice> noticeList; //공지 리스트
	private String noticeTitle; //등록할 공지 제목
	private String noticeContent; //등록할 공지 내용
	private int noticeNo; // 일람, 수정할 공지사항의 고유번호
	private CarNotice notice; // 조회할 공지사항
	
	
	public String showNoticeList() {
		
		CarNoticeDAO cDao = new CarNoticeDAO();
		
		totalCount = cDao.getcarNoticeListCount(); // 예약신청, 반납 각 해당하는 예약의 전체 갯수
		
		pageMap = new HashMap<>();
		
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, "showNoticeList");
		
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
		{
			lastCount = page.getEndCount() + 1;
		}
		
		pageMap.put("start", page.getStartCount() + 1);
		pageMap.put("end", lastCount);
		

		noticeList = cDao.carNoticeList(pageMap);
		
		return SUCCESS;
	}

	
	public String writeNotice(){
		
		CarNoticeDAO cDao = new CarNoticeDAO();
		HashMap<String, Object> map = new HashMap<>(); //제목과 글내용을 전달할 맵
		
		map.put("title", noticeTitle);
		map.put("content", noticeContent);
		
		cDao.writeNotice(map);
		
		return SUCCESS;
	}
	
	
	public String showNotice(){
		
		CarNoticeDAO cDao = new CarNoticeDAO();
		
		notice = cDao.carNoticeContent(noticeNo); //해당 공지 가져오기
		
		return SUCCESS;
		
	}
	
	public String updateNotice(){
		
		CarNoticeDAO cDao = new CarNoticeDAO();
		HashMap<String, Object> map = new HashMap<>(); //제목과 글내용을 전달할 맵
		
		map.put("title", noticeTitle);
		map.put("content", noticeContent);
		map.put("noticeno", noticeNo);
		
		cDao.updateCarNotice(map);
		
		return SUCCESS;
		
	}
	
	
	public String deleteNotice(){
		
		CarNoticeDAO cDao = new CarNoticeDAO();
		cDao.deleteCarNotice(noticeNo);
		
		return SUCCESS;
	}
	
	
	
	public List<CarNotice> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(List<CarNotice> noticeList) {
		this.noticeList = noticeList;
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

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public CarNotice getNotice() {
		return notice;
	}

	public void setNotice(CarNotice notice) {
		this.notice = notice;
	}

	

	
}
