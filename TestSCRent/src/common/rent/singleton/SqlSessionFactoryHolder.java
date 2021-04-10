package common.rent.singleton;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryHolder 
{
	
	static class InnerHolder
	{
		private static final SqlSessionFactoryHolder INSTANCE;
		static
		{
			try
			{
				INSTANCE = new SqlSessionFactoryHolder();
			}
			catch(Exception e)
			{
					throw new ExceptionInInitializerError(e);
			}//try-catch
		}//static
	}//InnerHolder
	
	public static SqlSessionFactoryHolder getInstance()
	{
		return InnerHolder.INSTANCE;
	}//getInstance.
	
	private SqlSessionFactoryHolder()throws Exception
	{
		init();	
	}
	
	private SqlSessionFactory sqlSessionFactory;
	
	
	private void init()throws Exception
	{
		String resource = "mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}//init()
	
	public SqlSessionFactory getSqlSessionFactory()
	{
		return sqlSessionFactory;
	}
	
}//class
