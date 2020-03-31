package com.team1.user;

public class UserDTO
{
	// 개인정보 관련 변수
	private int usId;
	private String uname, userId, password, nickName;
	private String ssdFront, ssdBack;
	private String telephone, telephone1, telephone2, telephone3;
	private String uaddress, uaddress1, uaddress2, uaddress3;
	private String usPhoto;
	
	// 레벨 및 경험치 관련 변수
	private int ulevel;
	private int nowPoint, prePoint, nextPoint;
	
	
	public int getNowPoint()
	{
		return nowPoint;
	}
	public void setNowPoint(int nowPoint)
	{
		this.nowPoint = nowPoint;
	}
	public int getPrePoint()
	{
		return prePoint;
	}
	public void setPrePoint(int prePoint)
	{
		this.prePoint = prePoint;
	}
	public int getNextPoint()
	{
		return nextPoint;
	}
	public void setNextPoint(int nextPoint)
	{
		this.nextPoint = nextPoint;
	}
	public int getUlevel()
	{
		return ulevel;
	}
	public void setUlevel(int ulevel)
	{
		this.ulevel = ulevel;
	}
	public String getUsPhoto()
	{
		return usPhoto;
	}
	public void setUsPhoto(String usPhoto)
	{
		this.usPhoto = usPhoto;
	}
	public String getUaddress1()
	{
		return uaddress1;
	}
	public void setUaddress1(String uaddress1)
	{
		this.uaddress1 = uaddress1;
	}
	public String getUaddress2()
	{
		return uaddress2;
	}
	public void setUaddress2(String uaddress2)
	{
		this.uaddress2 = uaddress2;
	}
	public String getUaddress3()
	{
		return uaddress3;
	}
	public void setUaddress3(String uaddress3)
	{
		this.uaddress3 = uaddress3;
	}
	public int getUsId()
	{
		return usId;
	}
	public void setUsId(int usId)
	{
		this.usId = usId;
	}
	public String getUname()
	{
		return uname;
	}
	public void setUname(String uname)
	{
		this.uname = uname;
	}
	public String getUserId()
	{
		return userId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public String getNickName()
	{
		return nickName;
	}
	public void setNickName(String nickName)
	{
		this.nickName = nickName;
	}
	public String getSsdFront()
	{
		return ssdFront;
	}
	public void setSsdFront(String ssdFront)
	{
		this.ssdFront = ssdFront;
	}
	public String getSsdBack()
	{
		return ssdBack;
	}
	public void setSsdBack(String ssdBack)
	{
		this.ssdBack = ssdBack;
	}
	public String getTelephone()
	{
		return telephone;
	}
	public void setTelephone(String telephone)
	{
		this.telephone = telephone;
	}
	public String getTelephone1()
	{
		return telephone1;
	}
	public void setTelephone1(String telephone1)
	{
		this.telephone1 = telephone1;
	}
	public String getTelephone2()
	{
		return telephone2;
	}
	public void setTelephone2(String telephone2)
	{
		this.telephone2 = telephone2;
	}
	public String getTelephone3()
	{
		return telephone3;
	}
	public void setTelephone3(String telephone3)
	{
		this.telephone3 = telephone3;
	}
	public String getUaddress()
	{
		return uaddress;
	}
	public void setUaddress(String uaddress)
	{
		this.uaddress = uaddress;
	}
	
	
}
