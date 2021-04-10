package com.example.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.example.board.Dao.BoardDao;
import com.opensymphony.xwork2.Action;

public class ListAction implements Action 
{
	private BoardDao dao;
	private String bname="bbs";
	
	// 여기부터 getter / setter
	private List<BoardVo> list = new ArrayList<BoardVo>();
	private int currentPage=1; // 현재 페이지
	private int totalCount;	   // 전체 게시물 수
	private int blockCount=10; // 한 페이지 게시물 수
	private int blockPage=5;   // 한 화면에 보여질 페이지 수
	private String pagingHtml;
	private PagingAction page;
		
	public ListAction() throws IOException 
	{
		dao = BoardDao.getInstance();
	}

	@Override
	public String execute() throws Exception 
	{
		HashMap map = new HashMap();
		map.put("bname", bname);
		
		totalCount = dao.BoardCnt(map);
		
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage);
		
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
		{
			lastCount = page.getEndCount() + 1;
		}
		
		map.put("start", page.getStartCount() + 1);
		map.put("end", lastCount);
		
		list = dao.BoardList(map);
		
		return SUCCESS;
	}
	

	public List<BoardVo> getList() 
	{
		return list;
	}
	public void setList(List<BoardVo> list) 
	{
		this.list = list;
	}

	public int getCurrentPage() 
	{
		return currentPage;
	}
	public void setCurrentPage(int currentPage)
	{
		this.currentPage = currentPage;
	}

	public int getTotalCount() 
	{
		return totalCount;
	}
	public void setTotalCount(int totalCount)
	{
		this.totalCount = totalCount;
	}

	public int getBlockCount() 
	{
		return blockCount;
	}
	public void setBlockCount(int blockCount) 
	{
		this.blockCount = blockCount;
	}

	public int getBlockPage() 
	{
		return blockPage;
	}
	public void setBlockPage(int blockPage) 
	{
		this.blockPage = blockPage;
	}

	public String getPagingHtml() 
	{
		return pagingHtml;
	}
	public void setPagingHtml(String pagingHtml)
	{
		this.pagingHtml = pagingHtml;
	}

	public PagingAction getPage()
	{
		return page;
	}
	public void setPage(PagingAction page) 
	{
		this.page = page;
	}
	
}
