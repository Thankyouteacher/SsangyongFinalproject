/*
	messageDTO.java
*/

package com.team1.pro.message;

public class messageDTO
{
	private String[] mcontents1;

	private String mcontents, mdate, pjId, nickName;
	
	private int pmId, pmsId;

	public int getPmsId()
	{
		return pmsId;
	}

	public void setPmsId(int pmsId)
	{
		this.pmsId = pmsId;
	}

	public int getPmId()
	{
		return pmId;
	}

	public void setPmId(int pmId)
	{
		this.pmId = pmId;
	}

	public String getNickName()
	{
		return nickName;
	}

	public void setNickName(String nickName)
	{
		this.nickName = nickName;
	}

	public String getMdate()
	{
		return mdate;
	}

	public void setMdate(String mdate)
	{
		this.mdate = mdate;
	}

	public String getPjId()
	{
		return pjId;
	}

	public void setPjId(String pjId)
	{
		this.pjId = pjId;
	}

	public String[] getMcontents1()
	{
		return mcontents1;
	}

	public void setMcontents1(String[] mcontents1)
	{
		this.mcontents1 = mcontents1;
	}

	public String getMcontents()
	{
		return mcontents;
	}

	public void setMcontents(String mcontents)
	{
		this.mcontents = mcontents;
	}

}
