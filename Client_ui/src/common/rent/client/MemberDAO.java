package common.rent.client;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.rent.singleton.SqlSessionFactoryHolder;

public class MemberDAO 
{
	
	private Members vo;

	public void Join(Members vo)
	{
		System.out.println("dao_Join : "+vo.toString());
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		try
		{
			session.insert("client.insertMember", vo);
			System.out.println(vo.getName()+" 고객 가입완료");
		}
		finally
		{
			if (session != null) 
			{
				session.commit();
				session.close();
			}
		} 
	}
	
	public Members Login (String id)
	{
		System.out.println("온다");
		vo = null;
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		try
		{
			vo = (Members)session.selectOne("client.selectMember", id);
			if (vo == null)
				vo = new Members();
		}
		finally
		{
			if (session != null) 
			{
				session.close();
			}
		}
		return vo;
	}
	
	public Members IdCheck (String id)
	{
		vo = null;
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		try
		{
			vo = (Members)session.selectOne("client.selectMember", id);
		}
		finally
		{
			if (session != null) 
			{
				session.close();
			}
		}
		return vo;
	}
	
	public Members ModifyLoad (String id)
	{
		vo = null;
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		try
		{
			vo = (Members)session.selectOne("client.selectMember", id);
		}
		finally
		{
			if (session != null) 
			{
				session.close();
			}
		}
		return vo;
	}
	
	public void ModifyClient (Members vo)
	{
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		try 
		{
			session.update("client.updateClient", vo);
		}
		finally
		{
			if (session != null)
			{
				session.commit();
				session.close();
			}
		}
	}
	
	public void SignOut (String id)
	{
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		try
		{
			session.delete("client.signOut", id);
		}
		finally
		{
			if (session != null)
			{
				session.commit();
				session.close();
			}
		}
	}
	
	public List<RentInfoVo> BookingList(String id) throws Exception
	{
		List<RentInfoVo> list = null;
		System.out.println("예약이력조회"+id);
		SqlSession session = SqlSessionFactoryHolder.getInstance().getSqlSessionFactory().openSession();
		try
		{
			list = session.selectList("client.BookingList", id);
		}
		finally
		{
			if (session != null) session.close();
		}
		return list;
	}
}
