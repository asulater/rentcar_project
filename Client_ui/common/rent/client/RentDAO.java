package common.rent.client;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import common.rent.singleton.SqlSessionFactoryHolder;

public class RentDAO {
	
	public List<RentList> RentCar() throws Exception 
	{
		List<RentList> carList = null;
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		try 
		{
			carList = session.selectList("client.rentList");
			System.out.println("dao : "+carList);
		} 
		finally 
		{
			if (session != null)
				session.close();
		}
		return carList;
	}
	
	public RentFuelVo RentFuel(Map obj) throws Exception
	{
		RentFuelVo vo;
		
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		
		try
		{
			vo = session.selectOne("client.rentFuel", obj);
			
			System.out.println("vo : " + vo.toString());
		}
		finally
		{
			if(session != null) session.close();
		}
		
		return vo;
	}
	/*
	 * 차량 대수 1 이상인지 먼저 확인 후 예약처리!!(실시간 예약,,,)
	 * */
	public Integer Rent(BookingVo vo) throws Exception
	{
		System.out.println("dao : " + vo.toString());
		Integer rentNo = 0;
		int count = 0;
		List<String> list = null;
		String carId = null;
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		System.out.println("BBb");
		try
		{
			System.out.println("ccc");
			count = session.selectOne("client.rentChk", vo);
			System.out.println(count);
		
			if (count != 0)
			{
				System.out.println("들어옴");
				System.out.println(vo.toString());
				list = session.selectList("client.selectNo", vo);
				for (int i = 0; i<list.size(); i++) {
					carId = list.get(i);
				}
				System.out.println(carId);
				System.out.println("차번호 뜸 ");
				session.insert("client.rentInsert", vo);
				System.out.println("완료");
			//	session.update("client.stChange", carId);
				System.out.println("지나옴");
				session.commit();
				rentNo = session.selectOne("client.rentNo", vo);
				System.out.println(rentNo);
			}
			else if (count == 0) 
			{
				System.out.println("여긴오면안되");
				rentNo = 0;
			}	
		}
		finally
		{
			if (session != null) session.close();
		}
		return rentNo;
	}
	
	public RentInfoVo RentInfo(int rentNo) throws Exception
	{
		RentInfoVo result = null;
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		try 
		{
			result = session.selectOne("client.rentInfo", rentNo);
			System.out.println(result.toString());
		}
		finally
		{
			if (session != null) session.close();
		}
		return result;
	}
	
	public List<RentInfoVo> BookingChk(String member_id) throws Exception
	{
		List<RentInfoVo> list = null;
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		try
		{
			list = session.selectList("client.rentCheck", member_id);
		}
		finally
		{
			if (session != null) session.close();
		}
		return list;
	}
	
	public void BookingCancel(int rentNo) throws Exception
	{
		RentInfoVo vo = null;
		Map<String, Object> map = new HashMap<String, Object>();
		String carId = null;
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		try
		{
			System.out.println("dao 취소 들어옴");
			vo = session.selectOne("client.carInfo", rentNo);
			System.out.println("2.");
			System.out.println(vo.getCarName()+"|"+vo.getFuel());
			map.put("carName", vo.getCarName());
			map.put("fuel", vo.getFuel());
			System.out.println(map.toString());
			carId = session.selectOne("client.searchCarId", map);
			System.out.println("3.");
			System.out.println(carId);
		//	session.update("client.statusChg", carId);
			session.delete("client.bookingCancel", rentNo);
			session.commit();
		}
		finally
		{
			if (session != null) session.close();
		}
	}
	
	public List<Car> CarList() throws Exception
	{
		List<Car> list = null;
		System.out.println("리스트 받으러옴");
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		try
		{
			list = session.selectList("client.carList");
		}
		finally
		{
			if (session != null) session.close();
		}
		return list;
	}
}