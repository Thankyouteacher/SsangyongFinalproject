package com.team1.board;

public class AnswerCommentDTO
{
	private int coid, qid;
	private String cocontent, cdate;
	public int getCoid()
	{
		return coid;
	}
	public void setCoid(int coid)
	{
		this.coid = coid;
	}
	public int getQid()
	{
		return qid;
	}
	public void setQid(int qid)
	{
		this.qid = qid;
	}
	public String getCocontent()
	{
		return cocontent;
	}
	public void setCocontent(String cocontent)
	{
		this.cocontent = cocontent;
	}
	public String getCdate()
	{
		return cdate;
	}
	public void setCdate(String cdate)
	{
		this.cdate = cdate;
	}
}
