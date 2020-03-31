package com.team1.project;

public class UserProjectDTO
{
	// 프로젝트 고유 번호, 인원 수
	private int pid, peoCount;
	// 프로젝트 명, 시작일자, 끝일자, 프로젝트 소개글
	private String rname, ppDate, peDate, pcontents;
	// 프로젝트에서 사용하는 기술명
	private String[] skName;
	
	public String[] getSkName()
	{
		return skName;
	}
	public void setSkName(String[] skName)
	{
		this.skName = skName;
	}
	// getter/setter
	public int getPid()
	{
		return pid;
	}
	public void setPid(int pid)
	{
		this.pid = pid;
	}
	public int getPeoCount()
	{
		return peoCount;
	}
	public void setPeoCount(int peoCount)
	{
		this.peoCount = peoCount;
	}
	public String getRname()
	{
		return rname;
	}
	public void setRname(String rname)
	{
		this.rname = rname;
	}
	public String getPpDate()
	{
		return ppDate;
	}
	public void setPpDate(String ppDate)
	{
		this.ppDate = ppDate;
	}
	public String getPeDate()
	{
		return peDate;
	}
	public void setPeDate(String peDate)
	{
		this.peDate = peDate;
	}
	
	public String getPcontents()
	{
		return pcontents;
	}
	public void setPcontents(String pcontents)
	{
		this.pcontents = pcontents;
	}
	
}