package com.example.board;

public class BoardVo 
{
	private int seq;
	private String writer;
	private String title;
	private String content;
	private int hit;
	private int groups;
	private int step;
	private int levels;
	private String bname;
	private String regdate;
	
	public int getSeq() 
	{
		return seq;
	}
	public void setSeq(int seq) 
	{
		this.seq = seq;
	}
	public String getWriter() 
	{
		return writer;
	}
	public void setWriter(String writer) 
	{
		this.writer = writer;
	}
	public String getTitle() 
	{
		return title;
	}
	public void setTitle(String title) 
	{
		this.title = title;
	}
	public String getContent() 
	{
		return content;
	}
	public void setContent(String content) 
	{
		this.content = content;
	}

	public int getHit() 
	{
		return hit;
	}
	public void setHit(int hit) 
	{
		this.hit = hit;
	}
	public int getGroups() 
	{
		return groups;
	}
	public void setGroups(int groups) 
	{
		this.groups = groups;
	}
	public int getStep() 
	{
		return step;
	}
	public void setStep(int step) 
	{
		this.step = step;
	}
	public int getLevels() 
	{
		return levels;
	}
	public void setLevels(int levels) 
	{
		this.levels = levels;
	}
	public String getBname() 
	{
		return bname;
	}
	public void setBname(String bname) 
	{
		this.bname = bname;
	}
	public String getRegdate() 
	{
		return regdate;
	}
	public void setRegdate(String regdate) 
	{
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "BoardVo [seq=" + seq + ", writer=" + writer + ", title=" + title + ", content=" + content + ", hit="
				+ hit + ", groups=" + groups + ", step=" + step + ", levels=" + levels + ", bname=" + bname
				+ ", regdate=" + regdate + "]";
	}

}
