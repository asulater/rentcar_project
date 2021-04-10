package common.rent.manage.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import common.rent.manage.vo.DetailReserveInfo;
import common.rent.manage.vo.Rent;
import common.rent.manage.vo.ReserveListDefault;
import common.rent.manage.vo.TodayReserveTable;
import common.rent.singleton.SqlSessionFactoryHolder;

public class ScheduleDAO {

	// 특정 차량의 원하는 달 일정 가져오기
	public List<Rent> currentMonthSchedule(HashMap<String, String> map) {
		List<Rent> list;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		try {

			list = session.selectList("common.rent.manage.mapper.scheduleMapper.selectCurrentMonth", map);

			
		} finally {
			if(session != null) session.close();
		}
		
		return list;

	}
	
	// 이번 달 전체 일정 갯수
	public int currentMonthScheduleCount(){
		int result = 0;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		
		try {

			result = session.selectOne("common.rent.manage.mapper.scheduleMapper.selectCurrentMonthScheduleCount");

			
		} finally {
			if(session != null) session.close();
		}
		return result;
	}

	
	// 예약 승인을 위한 신청목록
	public List<ReserveListDefault> reserveScheduleDefault(HashMap<String, Object> map){
		List<ReserveListDefault> list;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		
		try {

			list = session.selectList("common.rent.manage.mapper.scheduleMapper.selectReserveListDefault", map);

			
		} finally {
			if(session != null) session.close();
		}
		
		return list;
	}
	
	
	
	/**
	 * 상세 대여정보 보기
	 * @param rentno
	 * @return
	 */
	public DetailReserveInfo detailReserveInfo(HashMap<String, Object> map){
		DetailReserveInfo result = null;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		
		try {

			result = session.selectOne("common.rent.manage.mapper.scheduleMapper.selectDetailReserveInfo", map);

			
		} finally {
			if(session != null) session.close();
		}
		return result;
	}
	
	
	//현재 사용중인 차량 목록(반납 전)
	public List<ReserveListDefault> isUseListDefaul(HashMap<String, Object> map){
		List<ReserveListDefault> list;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		
		try {

			list = session.selectList("common.rent.manage.mapper.scheduleMapper.selectIsUseListDefault", map);

			
		} finally {
			if(session != null) session.close();
		}
		
		return list;
	}
	
	
	public int settingUsingCarStatus(String carid){
		
		int result = 0;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		try {

			result = session.update("common.rent.manage.mapper.scheduleMapper.updateUsingCarStatus", carid);
			session.commit();
			
		} finally {
			if(session != null) session.close();
		}
		return result;
		
	}
	
	
	/**
	 * 취소 신청 목록
	 * @return
	 */
	public List<ReserveListDefault> rentCancelList(){
		List<ReserveListDefault> list;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		
		try {

			list = session.selectList("common.rent.manage.mapper.scheduleMapper.selectCancelList");

			
		} finally {
			if(session != null) session.close();
		}
		
		return list;
	}
	
	/**\
	 * 특정 예약 기록 삭제
	 * @param rentno 예약 고유번호
	 * @return
	 */
	public int deleteRentInfo(int rentno){
		int result = 0;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		try {

			result = session.delete("common.rent.manage.mapper.scheduleMapper.deleteRentInfo", rentno);
			session.commit();
			
		} finally {
			if(session != null) session.close();
		}
		
		return result;
	}
	
	
	
	/**
	 * 반납시 rent 테이블에서의 연체, 반납 처리와 car 테이블의 상태 및 주행거리 변경
	 * @return
	 */
	public int settingReturnCar(HashMap<String, Object> map){

		int result=0;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		try {

			result = session.update("common.rent.manage.mapper.scheduleMapper.updateRentOfReturnCar", map);
			result = session.update("common.rent.manage.mapper.scheduleMapper.updateReturnCarStatus", map);
			session.commit();
			
		} finally {
			if(session != null) session.close();
		}
		return result;
	}
	
	/**
	 * 특정 대여기록에(rentno) 차량 할당(carid 입력)
	 * @return
	 */
	public int settingAppReserve(HashMap<String, Object> map){
		int result = 0;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		
		try {

			result = session.update("common.rent.manage.mapper.scheduleMapper.updateAppReserveInfo", map);
			result = session.update("common.rent.manage.mapper.scheduleMapper.updateUseCarStatus", map);
			session.commit();
			
		} finally {
			if(session != null) session.close();
		}
		return result;
	}
	
	
	/**
	 * 예약 불승인시, 자동차와 예약 테이블 업데이트
	 * @return
	 */
	public int settingDisappReserve(HashMap<String, Object> map){
		int result = 0;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		try {

			result = session.update("common.rent.manage.mapper.scheduleMapper.updateDisappReserveInfo", map);
			
			//@@ 불승인시, 아직 할당된 차량이 없으므로 status 변경할 필요 없음
			//result = session.update("common.rent.manage.mapper.scheduleMapper.updateWaitingCarStatus", map);
			session.commit();
			
		} finally {
			if(session != null) session.close();
		}
		return result;
	}
	
	
	
	/**
	 * 차량 조건(연료, 차명)과 마지막 대여일 등을 고려하여 해당하는 차량의 고유값(아이디) 가져오기
	 * @param map 차량명, 사용연료
	 * @return carid
	 */
	public List<DetailReserveInfo> searchCarId(HashMap<String, Object> map){
		List<DetailReserveInfo> result = null;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		try {

			result = session.selectList("common.rent.manage.mapper.scheduleMapper.selectCarId", map);
			

		} finally {
			session.close();
		}
		return result;
	}
	
	
	/**
	 * 대여 기록 없는 새 차 중, 차량조건(연료, 차명)에 맞는 차량의 고유값(아이디)가져오기
	 * @param map
	 * @return
	 */
	public List<DetailReserveInfo> searchNewCarId(HashMap<String, Object> map){
		List<DetailReserveInfo> result = null;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		try {
			result = session.selectList("common.rent.manage.mapper.scheduleMapper.selectNewCarId", map);

		} finally {
			session.close();
		}
		return result;
	}
	
	
	public int getReserveListCount(){
		int count;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		try {

			count = session.selectOne("common.rent.manage.mapper.scheduleMapper.selectReserveListCount");
			

		} finally {
			session.close();
		}
		return count;
	}
	
	
	/**
	 * 사용 중인 예약정보 목록 가져오기
	 * @return
	 */
	public int getIsUseListCount(){
		int count;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		try {

			count = session.selectOne("common.rent.manage.mapper.scheduleMapper.selectIsUseListCount");
			

		} finally {
			session.close();
		}
		return count;
	}
	
	/**
	 * 오늘 인도할 예약목록 가져오기
	 * @return
	 */
	public List<TodayReserveTable> showTodayReserveList(){
		List<TodayReserveTable> list = null;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		
		try {

			list = session.selectList("common.rent.manage.mapper.scheduleMapper.selectTodayReserveList");
			
		} finally {
			if(session != null) session.close();
		}
		
		return list;
	}
	
}
