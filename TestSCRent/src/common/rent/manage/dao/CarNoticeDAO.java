package common.rent.manage.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import common.rent.manage.vo.CarNotice;
import common.rent.singleton.SqlSessionFactoryHolder;

public class CarNoticeDAO {

	public List<CarNotice> carNoticeList(HashMap<String, Object> map) {
		List<CarNotice> noticeList = null;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			
			noticeList = session.selectList("common.rent.manage.mapper.noticeMapper.selectNoticeList", map);

		} finally {
			session.close();
		}
		return noticeList;

	}
	
	
	public int getcarNoticeListCount(){
		int result = 0;
	
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		
		try {
			
			result = session.selectOne("common.rent.manage.mapper.noticeMapper.selectNoticeListCount");

		} finally {
			session.close();
		}
		
		return result;
	}
	
	
	public int writeNotice(HashMap<String, Object> map){
	
		int result = 0;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		
		try {
			
			result = session.insert("common.rent.manage.mapper.noticeMapper.insertNotice", map);
			session.commit();
			
		} finally {
			session.close();
		}
		
		return result;
		
	}
	
	
	public CarNotice carNoticeContent(int noticeno){
		
		CarNotice notice = null;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		
		try {
			
			notice = session.selectOne("common.rent.manage.mapper.noticeMapper.selectNotice", noticeno);
			
		} finally {
			session.close();
		}
		
		return notice;
		
	}
	
	
	
	public int updateCarNotice(HashMap<String, Object> map){
		
		int result = 0;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		
		try {
			
			result = session.update("common.rent.manage.mapper.noticeMapper.updateNotice", map);
			session.commit();
			
		} finally {
			session.close();
		}
		
		return result;
		
	}
	
	
	public int deleteCarNotice(int noticeno){
		int result = 0;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		
		try {
			
			result = session.delete("common.rent.manage.mapper.noticeMapper.deleteNotice", noticeno);
			session.commit();
			
		} finally {
			session.close();
		}
		
		return result;
	}
	
	
}
