/*
	userAchievementDTO.java
*/

package com.team1.user.userAchievement;

public class userAchievementDTO
{
	private int gainAcId, acId, uid;
	private String gainDate;

	public int getGainAcId()
	{
		return gainAcId;
	}

	public void setGainAcId(int gainAcId)
	{
		this.gainAcId = gainAcId;
	}

	public int getAcId()
	{
		return acId;
	}

	public void setAcId(int acId)
	{
		this.acId = acId;
	}

	public int getUid()
	{
		return uid;
	}

	public void setUid(int uid)
	{
		this.uid = uid;
	}

	public String getGainDate()
	{
		return gainDate;
	}

	public void setGainDate(String gainDate)
	{
		this.gainDate = gainDate;
	}

}
