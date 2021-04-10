package common.rent.client;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RentAction extends ActionSupport
{
	private String fee;
	private String fuel;
	private String total;//결제화면 총 결제금액 표시용
	private String carName;
	private String startDay;
	private String endDay;
	private String loginId;
	private int insurance;
	private String options;
	private int rentNo;
	private String carType;
	private String picture;
	private String contentDisposition;
	private InputStream inputStream;
	private long contentLength;
	private int oilPrice;
	private double distance;

	private RentDAO dao;
	private RentFuelVo vo;
	private BookingVo bVo;
	private RentInfoVo rvo;
	
	public RentInfoVo getRvo() {
		return rvo;
	}

	public void setRvo(RentInfoVo rvo) {
		this.rvo = rvo;
	}

	private Map<String, Object> session;
	private ArrayList<RentList> carList;
	private ArrayList<RentInfoVo> list;
	private ArrayList<Car> car;
	
	
	public ArrayList<RentInfoVo> getList() {
		return list;
	}

	public void setList(ArrayList<RentInfoVo> list) {
		this.list = list;
	}

	public ArrayList<Car> getCar() {
		return car;
	}

	public void setCar(ArrayList<Car> car) {
		this.car = car;
	}

	public int getRentNo() {
		return rentNo;
	}

	public void setRentNo(int rentNo) {
		this.rentNo = rentNo;
	}
	
	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public String getEndDay() {
		return endDay;
	}

	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}

	public int getInsurance() {
		return insurance;
	}

	public void setInsurance(int insurance) {
		this.insurance = insurance;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public String getFuel() {
		return fuel;
	}

	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	
	public RentFuelVo getVo() {
		return vo;
	}

	public void setVo(RentFuelVo vo) {
		this.vo = vo;
	}
	
	public ArrayList<RentList> getCarList() {
		return carList;
	}

	public void setCarList(ArrayList<RentList> carList) {
		this.carList = carList;
	}
	
	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	public String RentCar() throws Exception
	{
		dao = new RentDAO();
		carList = (ArrayList<RentList>)dao.RentCar();
		for (RentList rl : carList) {
			rl.setPrice(rl.getPrice()*24);
			DecimalFormat df = new DecimalFormat("#,##0");
		    rl.setFee(df.format(rl.getPrice()));
		    System.out.println(rl.getFee());
		}
		return SUCCESS;
	}
	
	public String RentFuel() throws Exception
	{
		String [] array;
		dao = new RentDAO();
		System.out.println("차량명 : "+this.carName);
		array = carName.split(" ");
		this.carName = array[0];
		setCarName(carName);
		if (array[1].length() == 5)
		{
			this.fuel = array[1].substring(1, 4);
			setFuel(fuel);
		}
		else if (array[1].length() == 4)
		{
			this.fuel = array[1].substring(1, 3);
			setFuel(fuel);
		}
		
		System.out.println("차량명 : "+this.carName+"|| 연료 : "+this.fuel);

		return SUCCESS;
	}
	
	public String RentFuelCal() throws Exception
	{
		dao = new RentDAO();
		Map map = new HashMap();
		map.put("carName", carName);
		map.put("fuel", fuel);
		
		vo = dao.RentFuel(map);
		if (vo.getFuel().equals("가솔린"))
		{
			setOilPrice(1490);
		}
		else if (vo.getFuel().equals("디젤"))
		{
			setOilPrice(1245);
		}
		else if (vo.getFuel().equals("LPG"))
		{
			setOilPrice(761);
		}
		System.out.println(vo.toString());
		
		return SUCCESS;
	}
	
	public String RentPay() throws Exception 
	{
		return SUCCESS;
	}
	
	public String RentPayChk() throws Exception 
	{
		return SUCCESS;
	}
	
	//예약처리
	public String Rent() throws Exception
	{
		System.out.println("aaaaaaaaaaaaaaaaaa");
		dao = new RentDAO();
		System.out.println("옵션 : "+options);
		session = ActionContext.getContext().getSession();
		loginId = (String)session.get("loginId");
		System.out.println("로그인정보:"+loginId);
		this.startDay = startDay.substring(0, 10)+" "+startDay.substring(13, 15)+":"+startDay.substring(17, 19);
		this.endDay = endDay.substring(0, 10)+" "+endDay.substring(13, 15)+":"+endDay.substring(17, 19);
		System.out.println(startDay+"||"+endDay);
		String [] array;
		array = carName.split(" ");
		this.carName = array[0];
		setCarName(carName);
		
		if (array[1].length() == 5)
		{
			this.fuel = array[1].substring(1, 4);
			setFuel(fuel);
		}
		else if (array[1].length() == 4)
		{
			this.fuel = array[1].substring(1, 3);
			setFuel(fuel);
		}
		if (insurance==0) System.out.println("연료 타입은 "+this.fuel+" || 보험 가입함" + startDay);
		else System.out.println("연료 타입은 "+this.fuel+" || 보험가입안함");
		bVo = new BookingVo(carName, startDay, endDay, loginId, total, insurance, options, fuel);
		this.rentNo = dao.Rent(bVo);
		
		return SUCCESS;
	}
	
	public String RentChk() throws Exception
	{
		System.out.println("예약번호 : "+rentNo);
		dao = new RentDAO();
		rvo = dao.RentInfo(rentNo);
		System.out.println("Action_예약정보확인!!"+rvo.toString());
		return SUCCESS;
	}
	
	public String BookingChk() throws Exception
	{
		dao = new RentDAO();
		session = ActionContext.getContext().getSession();
		loginId = (String)session.get("loginId");
		list = (ArrayList<RentInfoVo>)dao.BookingChk(loginId);
		return SUCCESS;
	}
	
	public String BookingCancel() throws Exception
	{
		System.out.println("삭제할 예약번호 : "+rentNo);
		dao = new RentDAO();
		dao.BookingCancel(rentNo);
		return SUCCESS;
	}
	
	public String CarList() throws Exception
	{
		dao = new RentDAO();
		System.out.println(carType);
		car = (ArrayList<Car>)dao.CarList(carType);
		ArrayList<Car> deleteCarList = new ArrayList<>();
		ArrayList<Car> list = new ArrayList<>();
		
		for (int i = 0; i<car.size() - 1; i++)
		{
			for (int j = i+1; j<car.size(); j++)
			{	
				if (car.get(i).getCarName().equals(car.get(j).getCarName())){
					if (car.get(i).getFuel().equals(car.get(j).getFuel()))
						deleteCarList.add(car.get(i));
				} 
			}
		}
		System.out.println("차량정보 가져옴");
		for(Car c : deleteCarList) 
		{
			car.remove(c);
		}
		return SUCCESS;
	}
	
	public String CarImage() throws Exception
	{
		System.out.println(picture);
		File file = new File(picture);
		contentLength = file.length();
		inputStream = new FileInputStream(file);
		return SUCCESS;
	}
	
	public String Notice() throws Exception
	{
		return SUCCESS;
	}
	
	public String Faq() throws Exception
	{
		return SUCCESS;
	}

	
	//예상 유류비 비교 팝업
	public String CostCompare() throws Exception
	{
		String [] array;
		array = carName.split(" ");
		this.carName = array[0];
		setCarName(carName);
		dao = new RentDAO();
		System.out.println("차이름 : "+carName+"| 거리 : "+distance);
		Double km = 0.0;//연비 담을 변수
		car = (ArrayList<Car>)dao.CostCompare(carName);
		System.out.println("비교정보가져옴");
		for (Car c : car)
		{
			if (c.getFuel().equals("가솔린"))
			{
				String [] array1;
				array1 = c.getKm().split("㎞");
 				km = Double.parseDouble(array1[0]);
 				oilPrice = 1490;
 				Math.round(oilPrice*(distance/km));
 				c.setKm(String.valueOf(Math.round(oilPrice*(distance/km))));
 				System.out.println("가솔린"+c.gettOil());
			}
			else if (c.getFuel().equals("디젤"))
			{
				String [] array1;
				array1 = c.getKm().split("㎞");
				km = Double.parseDouble(array1[0]);
 				oilPrice = 1245;
 				c.setKm(String.valueOf(Math.round(oilPrice*(distance/km))));
 				System.out.println("디젤"+c.gettOil());
			}
			else if (c.getFuel().equals("LPG"))
			{
				String [] array1;
				array1 = c.getKm().split("㎞");
				km = Double.parseDouble(array1[0]);
 				oilPrice = 761;
 				c.setKm(String.valueOf(Math.round(oilPrice*(distance/km))));
 				System.out.println("LPG"+c.gettOil());
			}
		}
		return SUCCESS;
	}
	
	
	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public RentDAO getDao() {
		return dao;
	}

	public void setDao(RentDAO dao) {
		this.dao = dao;
	}

	public BookingVo getbVo() {
		return bVo;
	}

	public void setbVo(BookingVo bVo) {
		this.bVo = bVo;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public int getOilPrice() {
		return oilPrice;
	}

	public void setOilPrice(int oilPrice) {
		this.oilPrice = oilPrice;
	}

	public double getDistance() {
		return distance;
	}

	public void setDistance(double distance) {
		this.distance = distance;
	}
	
	
}
