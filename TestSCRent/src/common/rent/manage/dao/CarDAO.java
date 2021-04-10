package common.rent.manage.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import common.rent.manage.vo.Accident;
import common.rent.manage.vo.AccidentListOfCar;
import common.rent.manage.vo.Approval;
import common.rent.manage.vo.Authorization;
import common.rent.manage.vo.BestCar;
import common.rent.manage.vo.Car;
import common.rent.manage.vo.CarAuthorization;
import common.rent.manage.vo.FallbestCar;
import common.rent.manage.vo.FavoriteFuel;
import common.rent.manage.vo.InspectInfo;
import common.rent.manage.vo.SpringbestCar;
import common.rent.manage.vo.StaticsVO;
import common.rent.manage.vo.SummerbestCar;
import common.rent.manage.vo.WinterbestCar;
import common.rent.manage.vo.Yearly;
import common.rent.singleton.SqlSessionFactoryHolder;


public class CarDAO {

	
public List<Yearly> getYearlylist(){
		
		List<Yearly> yearlylist= null;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			yearlylist = session.selectList("common.rent.manage.mapper.managermapper.getYearlylist");
			
		} finally {
			session.close();
		}
		
		return yearlylist;
	}
	
	public List<SpringbestCar> getSpringbestCarList(){
		List<SpringbestCar> springbestCarList= null;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			springbestCarList = session.selectList("common.rent.manage.mapper.managermapper.getSpringbestCarList");
			
		} finally {
			session.close();
		}
		return springbestCarList;
	}
	
	public List<SummerbestCar> getSummerbestCarList(){
		List<SummerbestCar> summerbestCarList= null;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			summerbestCarList = session.selectList("common.rent.manage.mapper.managermapper.getSummerbestCarList");
			
		} finally {
			session.close();
		}
		return summerbestCarList;
		
	}
	
	public List<FallbestCar> getFallbestCarList(){
		List<FallbestCar> fallbestCarList= null;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			fallbestCarList = session.selectList("common.rent.manage.mapper.managermapper.getFallbestCarList");
		} finally {
			session.close();
		}
		return fallbestCarList;
	}
	
	public List<WinterbestCar> getWinterbestCarList(){
		
		List<WinterbestCar> winterbestCarList= null;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			winterbestCarList = session.selectList("common.rent.manage.mapper.managermapper.getWinterbestCarList");
		} finally {
			session.close();
		}
		return winterbestCarList;
	}
	
	public List<FavoriteFuel> getFflist(){
		List<FavoriteFuel> fflist = null;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			fflist = session.selectList("common.rent.manage.mapper.managermapper.getFflist");
			System.out.println(fflist+"디에오");
		} finally {
			session.close();
		}
		return fflist;
	}
	
	public List<BestCar> getBestCarList() {
		List<BestCar> bestCarList = null;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			bestCarList = session.selectList("common.rent.manage.mapper.managermapper.getBestCarList");

		} finally {
			session.close();
		}
		return bestCarList;

	}

	public List<StaticsVO> getStatics1() {
		List<StaticsVO> list = null;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			System.out.println("여긴?");
			list = session.selectList("common.rent.manage.mapper.managermapper.getStatics1");

		} finally {
			session.close();
		}
		return list;

	}
	
	
	public int getTotal() {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		try {

			int result = session.selectOne("common.rent.manage.mapper.carInfoMapper.getTotal");
			return result;

		} finally {
			if(session != null) session.close();
		}

	}

	
	/**
	 * 보유 중인 자동차 목록과 그 정보 가져오기
	 * @return
	 */
	public List<Car> carList() {

		List<Car> list = null;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		try {

			list = session.selectList("common.rent.manage.mapper.carInfoMapper.selectCarList");
			session.commit();
			return list;

		} finally {
			if(session != null) session.close();
		}
		
	}
	
	
	/**
	 * 선택한 차량의 상세 정보 가져오기
	 * @param carid
	 * @return
	 */
	public Car detailInfo(String carid){
		Car car = null;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		try {

			car = session.selectOne("common.rent.manage.mapper.carInfoMapper.selectCarInfo", carid);
			session.commit();
			return car;

		} finally {
			if(session != null) session.close();
		}
		
	}
	
	/**
	 * 선택한 차량의 사고내역 가져오기
	 * @param carid
	 * @return
	 */
	public List<AccidentListOfCar> showAccList(String carid){
		List<AccidentListOfCar> list = null;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		
		try {

			list = session.selectList("common.rent.manage.mapper.carInfoMapper.selectAccList", carid);
			session.commit();
			return list;

		} finally {
			if(session != null) session.close();
		}
	}
	
	/**
	 * 점검 필요한 차 목록 가져오기
	 * @return
	 */
	public List<InspectInfo> showInspectCarList(){
		List<InspectInfo> list = null;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		try {

			list = session.selectList("common.rent.manage.mapper.carInfoMapper.selectInspectCarList");

		} finally {
			if(session != null) session.close();
		}
		
		return list;
	}
	
	public int inspectCarCount(){
		int result = 0;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		try {

			result = session.selectOne("common.rent.manage.mapper.carInfoMapper.selectInspectCarCount");

		} finally {
			if(session != null) session.close();
		}
		
		return result;
	}
	
	
	public void insert(Car car) {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			System.out.println(car);
			session.insert("common.rent.manage.mapper.managermapper.insert", car);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
			{

			}
		}
	}

	public void insertCarApproval(Approval approval) {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			System.out.println(approval.toString());
			session.insert("common.rent.manage.mapper.managermapper.insertCarApproval", approval);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

	}

	public void addAccident(Accident acc) {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			System.out.println(acc);
			session.insert("common.rent.manage.mapper.managermapper.addAccident", acc);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
			{

			}
		}

	}

	public List<Accident> getAllaccList() {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		List<Accident> accList = null;
		try {
			accList = session.selectList("common.rent.manage.mapper.managermapper.getAllaccList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return accList;
	}

	public List<Accident> getAuthorizationList(int status) {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		List<Accident> accList = null;
		try {
			accList = session.selectList("common.rent.manage.mapper.managermapper.getAuthorizationList", status);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return accList;
	}

	public List<CarAuthorization> getAllbuyCar() {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		List<CarAuthorization> carAuthorizationList = null;
		try {
			carAuthorizationList = session.selectList("common.rent.manage.mapper.managermapper.getAllCar", 5);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return carAuthorizationList;
	}

	public void updateStatus(HashMap<String, Object> map) {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
				System.out.println("updateStatus11");
		try {
			System.out.println(map.get("status")+"11111111111111111111");
			session.update("common.rent.manage.mapper.managermapper.updateStatus", map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

	}

	// 파라미터를 carid에서 accidentno로 변경함
	public Accident selectAccident(int accidentno) {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		Accident accident = null;
		try {
			accident = session.selectOne("common.rent.manage.mapper.managermapper.selectAccident", accidentno);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return accident;

	}

	public void insertApproval(Approval approval) {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		try {
			session.insert("common.rent.manage.mapper.managermapper.insertApproval", approval);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public List<Authorization> getApprovalList(String category) {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		List<Authorization> approvalList = null;
		try {
			approvalList = session.selectList("common.rent.manage.mapper.managermapper.getApprovalList", category);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return approvalList;

	}

	public void deleteApproval(String carid) {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.delete("common.rent.manage.mapper.managermapper.deleteApproval", carid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

	}

	public void deleteCar(String carid) {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.delete("common.rent.manage.mapper.managermapper.deleteCar", carid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

	}
	
	
	public void updateAccidentStatus(int accidentno){
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.delete("managermapper.updateAccidentStatus", accidentno);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	/**
	 * 이번달 사고 건수
	 * @return
	 */
	public int currentMonthAccCount(){
		int result = 0;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		try {

			result = session.selectOne("common.rent.manage.mapper.carInfoMapper.selectCurrentMonthAccCount");

		} finally {
			if(session != null) session.close();
		}
		return result;
	}
	

	
	
}
