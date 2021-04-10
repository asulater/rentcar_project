package common.rent.client;

import java.util.ArrayList;
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
			if (session != null) session.close();
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
				//고객이 차량 예약시 차 번호 지정해줄 필요 없음
				/*list = session.selectList("client.selectNo", vo);
				for (int i = 0; i<list.size(); i++) {
					carId = list.get(i);
				}
				System.out.println(carId);
				System.out.println("차번호 뜸 ");*/
				session.insert("client.rentInsert", vo);
				session.commit();
				rentNo = session.selectOne("client.rentNo", vo);
				System.out.println(rentNo);
			}
			else if (count == 0) 
			{
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
		int obtain = 0;
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		try
		{
			System.out.println("dao 취소 들어옴");
			obtain = session.selectOne("client.obtainChk", rentNo);
			System.out.println(obtain);
			//관리자가 예약 확정 처리하기 전
			if (obtain == 0) 
			{
				session.delete("client.bookingCancel1", rentNo);
			}
			//관리자가 예약 확정 처리 후
			else if (obtain == 1)
			{
				session.update("client.bookingCancel2", rentNo);
			}
			session.commit();
		}
		finally
		{
			if (session != null) session.close();
		}
	}
	
	public List<Car> CarList(String carType) throws Exception
	{
		List<Car> list;
		System.out.println("리스트 받으러옴");
		System.out.println(carType);
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		try
		{
			System.out.println("그래");
			list = session.selectList("client.carList", carType);
			System.out.println(list.toString());
		}
		finally
		{
			if (session != null) session.close();
		}
		return list;
	}
	
	public List<Car> CostCompare(String carName) throws Exception
	{
		List<Car> list;
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		try
		{
			list = session.selectList("client.CostCompare", carName);
		}
		finally
		{
			if (session != null) session.close();
		}
		return list;
	}
}