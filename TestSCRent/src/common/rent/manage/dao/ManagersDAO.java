package common.rent.manage.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import common.rent.manage.vo.Managers;
import common.rent.singleton.SqlSessionFactoryHolder;

public class ManagersDAO {

	
	// 특정 사원 정보 가져오기
	public Managers getManager(String id) {

		Managers result = null;

		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		try {
			result = session.selectOne("common.rent.manage.mapper.managersMapper.selectManager", id);
		} finally {
			
			if (session != null) session.close();
			
		}

		return result;
	}
	
	/**
	 * 전체 사원 목록 가져오기
	 * @return
	 */
	public List<Managers> getManagersList(HashMap<String, Object> map){
		
		List<Managers> list = null;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		try {
			list = session.selectList("common.rent.manage.mapper.managersMapper.selectManagersList", map);
		} finally {
			
			if (session != null) session.close();
			
		}
		return list;
	}
	
	// 사원등롣
	public int addManager(Managers manager){
		
		int result = 0;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession(true);
		
		try {

			result = session.insert("common.rent.manage.mapper.managersMapper.insertManager", manager);
			
		} finally {
			
			if (session != null) session.close();
		}

		return result;	
	}

	//
	public int updateManagerGrade(HashMap<String, Object> map){
		
		int result = 0;
		
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession(true);
		
		try {

			result = session.update("common.rent.manage.mapper.managersMapper.updateManagerGrade", map);
			
		} finally {
			
			if (session != null) session.close();
		}

		return result;	
	}
	
	
}
