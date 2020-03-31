/*
	UserInsertDTO.java
*/

package com.team1.user;

public class UserInsertDTO
{
	private int usId;
	private String uname, userId, passWord, nickName, ssdFront, ssdBack, telephone, uaddress;

	private int pid;
	private int usLv;
	private String usPhoto;
	
	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getUsLv() {
		return usLv;
	}

	public void setUsLv(int usLv) {
		this.usLv = usLv;
	}

	public String getUsPhoto() {
		return usPhoto;
	}

	public void setUsPhoto(String usPhoto) {
		this.usPhoto = usPhoto;
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

	public String getPassWord()
	{
		return passWord;
	}

	public void setPassWord(String passWord)
	{
		this.passWord = passWord;
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

	public String getUaddress()
	{
		return uaddress;
	}

	public void setUaddress(String uaddress)
	{
		this.uaddress = uaddress;
	}

}
