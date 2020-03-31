package com.team1.admin;

public class AdminDTO
{
	private int  usId ;
	private int num, received;
	private String id ,rtName, rpText,name,lastLoginDate, receivedName; 
	private String subject,writeDate;
	private String adminId,adminDate, rpDate , uname , nickName ,ssdFront, ssdBack,telephone,uaddress,userId;
	private int board, banswer_info,board_comment, rpId, bcrpId,barpId;
	private int minNum,conId,gadminId ;
	private String recruitDate, endDate, proStDate,proEndDate,content,sname , pnDate,receiver;
	private int first,second,third, term;
	private int rtId, board_penalty, banswer_penalty,boardComment_penalty,pasId;
	private String category, pasDate, gender,receivedNickname,ugSelect;
	
	//getter / setter 구성
	
	public int getReceived()
	{
		return received;
	}
	public String getUgSelect()
	{
		return ugSelect;
	}
	public void setUgSelect(String ugSelect)
	{
		this.ugSelect = ugSelect;
	}
	public String getReceivedNickname()
	{
		return receivedNickname;
	}
	public void setReceivedNickname(String receivedNickname)
	{
		this.receivedNickname = receivedNickname;
	}
	public String getReceiver()
	{
		return receiver;
	}
	public void setReceiver(String receiver)
	{
		this.receiver = receiver;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public int getGadminId()
	{
		return gadminId;
	}
	public void setGadminId(int gadminId)
	{
		this.gadminId = gadminId;
	}
	public String getReceivedName()
	{
		return receivedName;
	}
	public void setReceivedName(String receivedName)
	{
		this.receivedName = receivedName;
	}
	public String getPnDate()
	{
		return pnDate;
	}
	public void setPnDate(String pnDate)
	{
		this.pnDate = pnDate;
	}
	public int getPasId()
	{
		return pasId;
	}
	public void setPasId(int pasId)
	{
		this.pasId = pasId;
	}
	public String getPasDate()
	{
		return pasDate;
	}
	public void setPasDate(String pasDate)
	{
		this.pasDate = pasDate;
	}
	public String getCategory()
	{
		return category;
	}
	public void setCategory(String category)
	{
		this.category = category;
	}
	public String getSname()
	{
		return sname;
	}
	public void setSname(String sname)
	{
		this.sname = sname;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getLastLoginDate()
	{
		return lastLoginDate;
	}
	public void setLastLoginDate(String lastLoginDate)
	{
		this.lastLoginDate = lastLoginDate;
	}
	public int getBoard_penalty()
	{
		return board_penalty;
	}
	public void setBoard_penalty(int board_penalty)
	{
		this.board_penalty = board_penalty;
	}
	public int getBanswer_penalty()
	{
		return banswer_penalty;
	}
	public void setBanswer_penalty(int banswer_penalty)
	{
		this.banswer_penalty = banswer_penalty;
	}
	public int getBoardComment_penalty()
	{
		return boardComment_penalty;
	}
	public void setBoardComment_penalty(int boardComment_penalty)
	{
		this.boardComment_penalty = boardComment_penalty;
	}
	public int getRtId()
	{
		return rtId;
	}
	public void setRtId(int rtId)
	{
		this.rtId = rtId;
	}
	public void setReceived(int received)
	{
		this.received = received;
	}
	
	public String getAdminId()
	{
		return adminId;
	}
	public void setAdminId(String adminId)
	{
		this.adminId = adminId;
	}
	public int getUsId()
	{
		return usId;
	}
	public void setUsId(int usId)
	{
		this.usId = usId;
	}
	public String getRtName()
	{
		return rtName;
	}
	public void setRtName(String rtName)
	{
		this.rtName = rtName;
	}
	
	public String getWriteDate()
	{
		return writeDate;
	}
	public void setWriteDate(String writeDate)
	{
		this.writeDate = writeDate;
	}
	public String getUname()
	{
		return uname;
	}
	public void setUname(String uname)
	{
		this.uname = uname;
	}
	public String getAdminDate()
	{
		return adminDate;
	}
	public void setAdminDate(String adminDate)
	{
		this.adminDate = adminDate;
	}
	public String getRpDate()
	{
		return rpDate;
	}
	public void setRpDate(String rpDate)
	{
		this.rpDate = rpDate;
	}
	
	public int getConId()
	{
		return conId;
	}
	public void setConId(int conId)
	{
		this.conId = conId;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	public String getNickName()
	{
		return nickName;
	}
	public void setNickName(String nickName)
	{
		this.nickName = nickName;
	}
	public int getNum()
	{
		return num;
	}
	public void setNum(int num)
	{
		this.num = num;
	}
	public String getRpText()
	{
		return rpText;
	}
	public void setRpText(String rpText)
	{
		this.rpText = rpText;
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
	public String getUserId()
	{
		return userId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	public int getBoard()
	{
		return board;
	}
	public void setBoard(int board)
	{
		this.board = board;
	}
	
	public int getBanswer_info()
	{
		return banswer_info;
	}
	public void setBanswer_info(int banswer_info)
	{
		this.banswer_info = banswer_info;
	}
	
	public int getBoard_comment()
	{
		return board_comment;
	}
	public void setBoard_comment(int board_comment)
	{
		this.board_comment = board_comment;
	}
	public int getRpId()
	{
		return rpId;
	}
	public void setRpId(int rpId)
	{
		this.rpId = rpId;
	}
	public int getBcrpId()
	{
		return bcrpId;
	}
	public void setBcrpId(int bcrpId)
	{
		this.bcrpId = bcrpId;
	}
	public int getBarpId()
	{
		return barpId;
	}
	public void setBarpId(int barpId)
	{
		this.barpId = barpId;
	}
	public int getMinNum()
	{
		return minNum;
	}
	public void setMinNum(int minNum)
	{
		this.minNum = minNum;
	}
	public String getRecruitDate()
	{
		return recruitDate;
	}
	public void setRecruitDate(String recruitDate)
	{
		this.recruitDate = recruitDate;
	}
	public String getEndDate()
	{
		return endDate;
	}
	public void setEndDate(String endDate)
	{
		this.endDate = endDate;
	}
	public String getProStDate()
	{
		return proStDate;
	}
	public void setProStDate(String proStDate)
	{
		this.proStDate = proStDate;
	}
	public String getProEndDate()
	{
		return proEndDate;
	}
	public void setProEndDate(String proEndDate)
	{
		this.proEndDate = proEndDate;
	}
	public int getFirst()
	{
		return first;
	}
	public void setFirst(int first)
	{
		this.first = first;
	}
	public int getSecond()
	{
		return second;
	}
	public void setSecond(int second)
	{
		this.second = second;
	}
	public int getThird()
	{
		return third;
	}
	public void setThird(int third)
	{
		this.third = third;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public int getTerm()
	{
		return term;
	}
	public void setTerm(int term)
	{
		this.term = term;
	}
	
	
	

	
	
}

