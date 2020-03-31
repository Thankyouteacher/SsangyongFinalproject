/*
	achievementDTO.java
*/

package com.team1.achievement;

public class proachievementDTO
{
	private int acId, requireNum;
	private String acName, require, badgeUrl;
	private String[] acName1;
	private int[] acId1;
	
	public int[] getAcId1()
	{
		return acId1;
	}

	public void setAcId1(int[] acId1)
	{
		this.acId1 = acId1;
	}

	public String[] getAcName1()
	{
		return acName1;
	}

	public void setAcName1(String[] acName1)
	{
		this.acName1 = acName1;
	}

	public int getAcId()
	{
		return acId;
	}

	public void setAcId(int acId)
	{
		this.acId = acId;
	}

	public int getRequireNum()
	{
		return requireNum;
	}

	public void setRequireNum(int requireNum)
	{
		this.requireNum = requireNum;
	}

	public String getAcName()
	{
		return acName;
	}

	public void setAcName(String acName)
	{
		this.acName = acName;
	}

	public String getRequire()
	{
		return require;
	}

	public void setRequire(String require)
	{
		this.require = require;
	}

	public String getBadgeUrl()
	{
		return badgeUrl;
	}

	public void setBadgeUrl(String badgeUrl)
	{
		this.badgeUrl = badgeUrl;
	}
}
