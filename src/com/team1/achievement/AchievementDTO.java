package com.team1.achievement;

public class AchievementDTO
{
	// U.USID, U.USERID, U.NICKNAME, A.ACID, A.ACNAME, 
	// A.REQUIRE, A.REQUIRENUM, UA.GAINDATE
	
	private int usId, acId;
	private String userId, nickname, acName, require, requireNum, gainDate;
	
 	
	public int getUsId()
	{
		return usId;
	}
	public void setUsId(int usId)
	{
		this.usId = usId;
	}
	public int getAcId()
	{
		return acId;
	}
	public void setAcId(int acId)
	{
		this.acId = acId;
	}
	public String getUserId()
	{
		return userId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	public String getNickname()
	{
		return nickname;
	}
	public void setNickname(String nickname)
	{
		this.nickname = nickname;
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
	public String getRequireNum()
	{
		return requireNum;
	}
	public void setRequireNum(String requireNum)
	{
		this.requireNum = requireNum;
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
