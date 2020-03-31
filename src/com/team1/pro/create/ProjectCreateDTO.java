package com.team1.pro.create;

public class ProjectCreateDTO
{
	private int pid, usId, oid, peoId, gid, minLevel, maxLevel, proId;
	private String rname, createDate, link, pcontents, paddress;
	private int id;
	
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public int getPid()
	{
		return pid;
	}

	public void setPid(int pid)
	{
		this.pid = pid;
	}

	public int getUsId()
	{
		return usId;
	}

	public void setUsId(int usId)
	{
		this.usId = usId;
	}

	public int getOid()
	{
		return oid;
	}

	public void setOid(int oid)
	{
		this.oid = oid;
	}

	public int getPeoId()
	{
		return peoId;
	}

	public void setPeoId(int peoId)
	{
		this.peoId = peoId;
	}

	public int getGid()
	{
		return gid;
	}

	public void setGid(int gid)
	{
		this.gid = gid;
	}

	public int getMinLevel()
	{
		return minLevel;
	}

	public void setMinLevel(int minLevel)
	{
		this.minLevel = minLevel;
	}

	public int getMaxLevel()
	{
		return maxLevel;
	}

	public void setMaxLevel(int maxLevel)
	{
		this.maxLevel = maxLevel;
	}

	public int getProId()
	{
		return proId;
	}

	public void setProId(int proId)
	{
		this.proId = proId;
	}

	public String getRname()
	{
		return rname;
	}

	public void setRname(String rname)
	{
		this.rname = rname;
	}

	public String getCreateDate()
	{
		return createDate;
	}

	public void setCreateDate(String createDate)
	{
		this.createDate = createDate;
	}

	public String getLink()
	{
		return link;
	}

	public void setLink(String link)
	{
		this.link = link;
	}

	public String getPcontents()
	{
		return pcontents;
	}

	public void setPcontents(String pcontents)
	{
		this.pcontents = pcontents;
	}

	public String getPaddress()
	{
		return paddress;
	}

	public void setPaddress(String paddress)
	{
		this.paddress = paddress;
	}

}