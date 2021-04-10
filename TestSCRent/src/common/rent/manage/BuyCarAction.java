package common.rent.manage;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import common.rent.manage.dao.CarDAO;
import common.rent.manage.vo.Accident;
import common.rent.manage.vo.Approval;
import common.rent.manage.vo.Authorization;
import common.rent.manage.vo.Car;
import common.rent.manage.vo.CarAuthorization;

public class BuyCarAction extends ActionSupport {

	private String carname;
	private String cartype;
	private String company;
	private String carid;
	private int price = 0;
	private String km;
	private String persons;
	private String fuel;
	private String maxoutput;
	private String capacity;
	private int status = 0;
	private String picture;
	private Car car = new Car();
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private int accidentno;
	private String userid;
	private String accidentdate;
	private String comments;
	private String documentno;
	private String managerid;
	private List<Accident> accList;
	private String dropbox;
	private List<Car> carList = null;
	private HashMap<String, Object> map;
	private Accident acc;
	private String requestid;
	private String category;
	private String appcomment;
	private Approval approval;
	private List<Authorization> authorizationList;
	private String requestdate;
	private List<CarAuthorization> carAuthorizationList;

	CarDAO dao = new CarDAO();

	// 새차등록
	public String insert() {
		managerid = (String) ActionContext.getContext().getSession().get("mLoginId");
		Car car = new Car(carname, cartype, company, carid, price, km, persons, fuel, maxoutput, capacity, picture,
				status);
		car.setStatus(5);
		approval = new Approval(carid, managerid, "차량구입");
		if (upload != null) {
			String basePath = "d:/cardata";
			try {
				String savedfile = new FileService().saveFile(upload, basePath, uploadFileName);
				car.setPicture(basePath + "/" + savedfile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println(car);
		System.out.println(approval);
		dao.insertCarApproval(approval);
		dao.insert(car);
		return SUCCESS;
	}

	// 사고차량등록
	public String addAccident() {
		
		managerid = (String) ActionContext.getContext().getSession().get("mLoginId");
		System.out.println(managerid);
		acc = new Accident(carid, userid, accidentdate, comments, documentno, managerid);
		map = new HashMap<>();
		status = 3;
		map.put("carid", carid);
		map.put("status", status);
		dao.updateStatus(map);
		dao.addAccident(acc);
		return SUCCESS;
	}

	// 사고차량목록
	public String accList() {
		accList = dao.getAllaccList();
		return SUCCESS;
	}

	// 사고차량 상세정보
	//@@ 20151027 특정 사고이력 검색시, 동일 차량번호에 여러 사고기록이 있을 수 있으므로 
	//   파라미터를 carid에서 accidentno로 변경
	public String accDetail() {
		Accident accident = dao.selectAccident(accidentno);
		
		accidentno = accident.getAccidentno();
		comments = accident.getComments();
		
		carid = accident.getCarid();
		
		return SUCCESS;
	}

	// 결제요청
	public String decision() {
		map = new HashMap<>();
		map.put("carid", carid);

		if (category.equals("reinspect")) {
			System.out.println("재점검요청");
			category = "재점검요청";
			status = 6;
			approval = new Approval(accidentno, carid, requestid, appcomment, category);
			map.put("status", status);
			dao.updateStatus(map);
			dao.insertApproval(approval);
		} else if (category.equals("deleteCar")) {
			System.out.println("폐차요청");
			category = "폐차요청";
			status = 7;
			approval = new Approval(accidentno, carid, requestid, appcomment, category);
			map.put("status", status);
			dao.updateStatus(map);
			System.out.println(approval);
			dao.insertApproval(approval);
		} else if (category.equals("block")) {
			System.out.println(category);
			category = "블록해지";
			status = 8;
			approval = new Approval(accidentno, carid, requestid, appcomment, category);
			map.put("status", status);
			dao.updateStatus(map);
			dao.insertApproval(approval);
		}
		return SUCCESS;
	}

	// 결재사항 json
	//@@ 20151027 결재요청 목록 가져오는 데애 car 테이블의 status 대신, approval의 카테고리 값을 사용하는 것으로 변경
	//   블록해지의 경우 블록해지 status를 세팅해주는 작업이 없기 때문에
	public String authorization2() {

		if (dropbox == null) {
			System.out.println(dropbox + "널입니다");
		} else if (dropbox.equals("폐차요청")) {
			status = 7;
			authorizationList = dao.getApprovalList(dropbox);
			System.out.println(authorizationList);
		} else if (dropbox.equals("재점검요청")) {
			System.out.println("재점검요청");
			status = 6;
			authorizationList = dao.getApprovalList(dropbox);
			System.out.println(authorizationList);
		} else if (dropbox.equals("차량구입")) {
			System.out.println("차량구입");
			carAuthorizationList = dao.getAllbuyCar();
		} else if (dropbox.equals("블록해지")) {
			System.out.println("블록해지");
			status = 8;
			category = "블록해지";
			authorizationList = dao.getApprovalList(dropbox);
			System.out.println(authorizationList);
		}
		return SUCCESS;
	}

	
	//@@ 사용하지 않는 메소드 인 것 같아서 주석처리 했습니다 
	// 결재사항
	public String authorization() {
		return SUCCESS;
	}

	public String approval() {
		return SUCCESS;
	}

	
	
	
	public String approved() {
		map = new HashMap<>();
		map.put("carid", carid);
		System.out.println(category+"  여기찍혀땋ㅎㅎㅎ");
		System.out.println(carid);
		
		if (category.equals("차량구입")) {
			status = 0;
			map.put("status", status);
			dao.updateStatus(map);
			dao.deleteApproval(carid);
			
		} else if (category.equals("폐차요청")) {
			System.out.println("폐차요청");
			status = 4;
			map.put("status", status);
			dao.updateStatus(map);
			dao.deleteApproval(carid);
			//관련 사고기록, 렌트 기록이 있으므로 자동차는 폐차로만 status 변경 후 삭제하지 않는다
			//dao.deleteCar(carid);
				
			//@@ 폐차시 accident status 변경
			if(accidentno != 0){
				dao.updateAccidentStatus(accidentno);
			}
			
		} else if (category.equals("재점검요청")) {
			status = 3;
			map.put("status", status);
			dao.updateStatus(map);
			dao.deleteApproval(carid);
	
		} else if (category.equals("블록해지")) {
			status = 0;
			map.put("status", status);
			dao.updateStatus(map);
			dao.deleteApproval(carid);

			
			//@@ 블록해지시 accident status 변경
			if(accidentno != 0){
				dao.updateAccidentStatus(accidentno);
			}
		}
		
		return SUCCESS;
	}

	public String declinded() {
		map = new HashMap<>();
		map.put("carid", carid);
		System.out.println(category+"++++declined");
		
		if (category.equals("차량구입")) {
			dao.deleteCar(carid);
			dao.deleteApproval(carid);
		} else if (category.equals("폐차요청")) {
			status = 3;
			map.put("status", status);
			dao.updateStatus(map);
			dao.deleteApproval(carid);
		} else if (category.equals("재점검요청")) {
			status = 0;
			map.put("status", status);
			dao.updateStatus(map);
			dao.deleteApproval(carid);
		} else if (category.equals("블록해지")) {
			status = 3;
			map.put("status", status);
			dao.updateStatus(map);
			dao.deleteApproval(carid);
		}
	

		return SUCCESS;
	}
	
	

	public List<CarAuthorization> getCarAuthorizationList() {
		return carAuthorizationList;
	}

	public void setCarAuthorizationList(List<CarAuthorization> carAuthorizationList) {
		this.carAuthorizationList = carAuthorizationList;
	}

	public List<Authorization> getAuthorizationList() {
		return authorizationList;
	}

	public void setAuthorizationList(List<Authorization> authorizationList) {
		this.authorizationList = authorizationList;
	}

	public String getRequestdate() {
		return requestdate;
	}

	public void setRequestdate(String requestdate) {
		this.requestdate = requestdate;
	}

	public String getAppcomment() {
		return appcomment;
	}

	public void setAppcomment(String appcomment) {
		this.appcomment = appcomment;
	}

	public Approval getApproval() {
		return approval;
	}

	public void setApproval(Approval approval) {
		this.approval = approval;
	}

	public HashMap<String, Object> getMap() {
		return map;
	}

	public void setMap(HashMap<String, Object> map) {
		this.map = map;
	}

	public String getManagerid() {
		return managerid;
	}

//	public void setManagerid(String managerid) {
//		this.managerid = managerid;
//	}

	public List<Car> getCarList() {
		return carList;
	}

	public void setCarList(List<Car> carList) {
		this.carList = carList;
	}

	public String getDropbox() {
		return dropbox;
	}

	public void setDropbox(String dropbox) {
		this.dropbox = dropbox;
	}

	public String getRequestid() {
		return requestid;
	}

	public void setRequestid(String requestid) {
		this.requestid = requestid;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public List<Accident> getAccList() {
		return accList;
	}

	public void setAccList(List<Accident> accList) {
		this.accList = accList;
	}

	public int getAccidentno() {
		return accidentno;
	}

	public void setAccidentno(int accidentno) {
		this.accidentno = accidentno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getAccidentdate() {
		return accidentdate;
	}

	public void setAccidentdate(String accidentdate) {
		this.accidentdate = accidentdate;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getDocumentno() {
		return documentno;
	}

	public void setDocumentno(String documentno) {
		this.documentno = documentno;
	}

	public CarDAO getDao() {
		return dao;
	}

	public void setDao(CarDAO dao) {
		this.dao = dao;
	}

	public Accident getAcc() {
		return acc;
	}

	public void setAcc(Accident acc) {
		this.acc = acc;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getCarname() {
		return carname;
	}

	public void setCarname(String carname) {
		this.carname = carname;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getCartype() {
		return cartype;
	}

	public void setCartype(String cartype) {
		this.cartype = cartype;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCarid() {
		return carid;
	}

	public void setCarid(String carid) {
		this.carid = carid;
	}

	public String getKm() {
		return km;
	}

	public void setKm(String km) {
		this.km = km;
	}

	public String getPersons() {
		return persons;
	}

	public void setPersons(String persons) {
		this.persons = persons;
	}

	public String getFuel() {
		return fuel;
	}

	public void setFuel(String fuel) {
		this.fuel = fuel;
	}

	public String getMaxoutput() {
		return maxoutput;
	}

	public void setMaxoutput(String maxoutput) {
		this.maxoutput = maxoutput;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
