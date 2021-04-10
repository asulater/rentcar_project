package com.example.board.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.example.board.BoardVo;
import com.example.board.mapper.IBoardDao;
import com.example.board.mapper.IBoardMapper;

import common.rent.singleton.SqlSessionFactoryHolder;

public class BoardDao implements IBoardDao 
{
	private static BoardDao singleton;
	
	private BoardDao() {}
	
	public static BoardDao getInstance()
	{
		if(singleton == null)
			singleton = new BoardDao();
		
		return singleton;
	}
	
	@Override
	public List<BoardVo> BoardList(Object obj) 
	{
		List<BoardVo> result;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		
		SqlSession session = sqlSessionFactory.openSession();
		
		try
		{
			IBoardMapper boardMapper = session.getMapper(IBoardMapper.class);
		
			result = boardMapper.BoardList(obj);
		}
		finally
		{
			if(session != null) session.close();
		}
		
		return result;
	}

	@Override
	public Integer BoardCnt(Object obj) 
	{
		Integer result;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try
		{
			IBoardMapper boardMapper = session.getMapper(IBoardMapper.class);
			result = boardMapper.BoardCnt(obj);
		}
		finally
		{
			if(session != null) session.close();
		}
		
		return result;
	}

	@Override
	public BoardVo BoardOne(Object obj) 
	{
		BoardVo result;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		try
		{
			IBoardMapper boardMapper = session.getMapper(IBoardMapper.class);
			result = boardMapper.BoardOne(obj);
		}
		finally
		{
			if(session != null) session.close();
		}
		
		return result;
	}

	@Override
	public void BoardInsert(BoardVo obj) 
	{
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		try
		{
			IBoardMapper boardMapper = session.getMapper(IBoardMapper.class);
			boardMapper.BoardInsert(obj);
			session.commit();
		}
		finally
		{
			if(session != null) session.close();
		}
	}

	@Override
	public Integer BoardMaxSeq() 
	{
		Integer result;
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		try
		{
			IBoardMapper boardMapper = session.getMapper(IBoardMapper.class);
			result = boardMapper.BoardMaxSeq();
			
			if(result == null)
				result = 0;
		}
		finally
		{
			if(session != null) session.close();
		}
		
		return result;
	}

	@Override
	public void BoardStepUpdate(Object obj) 
	{
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		try
		{
			IBoardMapper boardMapper = session.getMapper(IBoardMapper.class);
			boardMapper.BoardStepUpdate(obj);
			session.commit();
		}
		finally
		{
			if(session != null) session.close();
		}
	}

	@Override
	public void BoardHitUpdate(Object obj) 
	{
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		try
		{
			IBoardMapper boardMapper = session.getMapper(IBoardMapper.class);
			boardMapper.BoardHitUpdate(obj);
			session.commit();
		}
		finally
		{
			if(session != null) session.close();
		}
	}

	@Override
	public void BoardUpdate(BoardVo obj) 
	{
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();

		try
		{
			IBoardMapper boardMapper = session.getMapper(IBoardMapper.class);
			boardMapper.BoardUpdate(obj);
			session.commit();
		}
		finally
		{
			if(session != null) session.close();
		}
	}

	@Override
	public void BoardDelete(Integer seq) 
	{
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		try
		{
			IBoardMapper boardMapper = session.getMapper(IBoardMapper.class);
			boardMapper.BoardDelete(seq);
			session.commit();
		}
		finally
		{
			if(session != null) session.close();
		}
		
	}
	
	
}
