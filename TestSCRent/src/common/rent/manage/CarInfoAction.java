package common.rent.manage;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import common.rent.manage.dao.CarDAO;
import common.rent.manage.vo.AccidentListOfCar;
import common.rent.manage.vo.Car;
import common.rent.manage.vo.InspectInfo;

public class CarInfoAction extends ActionSupport {

	CarDAO cDao; // DAO
	
	private String selectCarId; // 목록 중에서 선택한 자동차의 차량번호(고유값)
	private Car car; // 자동차 정보
	private List<Car> carList; // 자동차 목록
	private File carImageFile; // 서버에 저장된 이미지를 file 로 불러옴
	private InputStream stream; // 자동차의 이미지
	private String contentDisposition; // 스트림의 원래 이름
	private long contentLength; //스트림의 크기
	
	private List<AccidentListOfCar> accList; //사고내역 목록
	private List<InspectInfo> inspectList; //정기점검 필요한 차량목록
	

	// 보유 중 자동차 목록
	public String showCarList() {

		cDao = new CarDAO();

		carList = cDao.carList();

		return SUCCESS;
	}

	// 특정 자동차 정보 가져오기
	public String showDetailInfo() {

		cDao = new CarDAO();
		car = cDao.detailInfo(selectCarId);

		return SUCCESS;
	}
	
	// img 태그에 이미지 띄우기
	public String viewCarImage(){
		
		cDao = new CarDAO();
		car = cDao.detailInfo(selectCarId);
		carImageFile = new File(car.getPicture());
		
		setContentLength(carImageFile.length());
		setContentDisposition(car.getCarname()); //이미지 이름(==차량이름)
		
		try {
			setStream(new FileInputStream(carImageFile));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	
	// 특정 차량의 사고내역목록 가져오기	
	public String showAccList(){
		
		cDao = new CarDAO();
		car = cDao.detailInfo(selectCarId);
		accList = cDao.showAccList(selectCarId);
		
		//SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i = 0; i<accList.size(); i++){
			accList.get(i).setAccidentdate(accList.get(i).getAccidentdate().substring(0, 10));
		}
		
		return SUCCESS;
	}

	
	// 정기점검 목록
	public String showInspectCarList(){
		
		cDao = new CarDAO();
		inspectList = cDao.showInspectCarList();
		
		return SUCCESS;
		
	}
	

	
	

	public String getSelectCarId() {
		return selectCarId;
	}

	public void setSelectCarId(String selectCarId) {
		this.selectCarId = selectCarId;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public List<Car> getCarList() {
		return carList;
	}

	public File getCarImageFile() {
		return carImageFile;
	}

	public void setCarImageFile(File carImageFile) {
		this.carImageFile = carImageFile;
	}

	public InputStream getStream() {
		return stream;
	}

	public void setStream(InputStream stream) {
		this.stream = stream;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}

	public List<AccidentListOfCar> getAccList() {
		return accList;
	}

	public List<InspectInfo> getInspectList() {
		return inspectList;
	}

	public void setInspectList(List<InspectInfo> inspectList) {
		this.inspectList = inspectList;
	}
	
	
	
}
