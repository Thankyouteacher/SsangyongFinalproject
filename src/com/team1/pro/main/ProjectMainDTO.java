/*=======================================

 *  projectMainDTO.java
 *  - 개설, 진행중, 완료에 대한 전반적인
 *    바인딩을 담당
 *=====================================*/

package com.team1.pro.main;

public class ProjectMainDTO
{
	private int pid;			//-- 프로젝트 개설번호 
	private String rname;		//-- 프로젝트명
	private String createDate; 	//-- 프로젝트 개설일
	private String ppDate; 		//-- 프로젝트 시작일(진행, 완료)
	private String peDate; 		//-- 프로젝트 종료일(진행, 완료)
	private String startDate; 	//-- 프로젝트 시작일(모집)
	private String finishDate; 	//-- 프로젝트 종료일(모집)
	private String restDate; 	//-- 프로젝트 남은일
	private String nickName;	//-- 프로젝트 개설자 닉네임
	private int onRate;			//-- 온라인 비율
	private int currentCount;	//-- 현재인원수
	private int peoCount;		//-- 전체인원수
	private String gselect;		//-- 성별제한
	private int minLevel;		//-- 최소레벨
	private int maxLevel;		//-- 최대레벨
	private String pcontents;	//-- 프로젝트 소개글
	private int properiod;		//-- 프로젝트 진행 기간
	private String paddress;	//-- 프로젝트 장소 
	
	private String sname;	    //-- 프로젝트 주제 
	private String[] skName; 	//-- 방개설 시 필요기술
	private String[] acName;    //-- 방개설 시 입력한 칭호
	
	private String findCategory;//-- 검색 카테고리
	private String findValue;   //-- 검색 내용
	private String suContent;	//-- 주제 검색 키워드
	private String skContent;   //-- 기술 검색 키워드
	private String acContent;   //-- 칭호 검색 키워드
	
	private int usId;			//-- 회원번호
	private String ugselect;	//-- 회원의 성별
	private int ulevel;			//-- 회원의 레벨
	
	//-- getter / setter 구성
	public int getPid()
	{
		return pid;
	}
	public void setPid(int pid)
	{
		this.pid = pid;
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
	public String getStartDate()
	{
		return startDate;
	}
	public void setStartDate(String startDate)
	{
		this.startDate = startDate;
	}
	public String getFinishDate()
	{
		return finishDate;
	}
	public void setFinishDate(String finishDate)
	{
		this.finishDate = finishDate;
	}
	public String getRestDate()
	{
		return restDate;
	}
	public void setRestDate(String restDate)
	{
		this.restDate = restDate;
	}
	public String getNickName()
	{
		return nickName;
	}
	public void setNickName(String nickName)
	{
		this.nickName = nickName;
	}
	public int getOnRate()
	{
		return onRate;
	}
	public void setOnRate(int onRate)
	{
		this.onRate = onRate;
	}
	public int getCurrentCount()
	{
		return currentCount;
	}
	public void setCurrentCount(int currentCount)
	{
		this.currentCount = currentCount;
	}
	public int getPeoCount()
	{
		return peoCount;
	}
	public void setPeoCount(int peoCount)
	{
		this.peoCount = peoCount;
	}
	public String getGselect()
	{
		return gselect;
	}
	public void setGselect(String gselect)
	{
		this.gselect = gselect;
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
	public String getPcontents()
	{
		return pcontents;
	}
	public void setPcontents(String pcontents)
	{
		this.pcontents = pcontents;
	}
	public int getProperiod()
	{
		return properiod;
	}
	public void setProperiod(int properiod)
	{
		this.properiod = properiod;
	}
	public String getPaddress()
	{
		return paddress;
	}
	public void setPaddress(String paddress)
	{
		this.paddress = paddress;
	}
	public String getSname()
	{
		return sname;
	}
	public void setSname(String sname)
	{
		this.sname = sname;
	}
	public String[] getSkName()
	{
		return skName;
	}
	public void setSkName(String[] skName)
	{
		this.skName = skName;
	}
	public String[] getAcName()
	{
		return acName;
	}
	public void setAcName(String[] acName)
	{
		this.acName = acName;
	}
	public String getFindCategory()
	{
		return findCategory;
	}
	public void setFindCategory(String findCategory)
	{
		this.findCategory = findCategory;
	}
	public String getFindValue()
	{
		return findValue;
	}
	public void setFindValue(String findValue)
	{
		this.findValue = findValue;
	}
	public String getSuContent()
	{
		return suContent;
	}
	public void setSuContent(String suContent)
	{
		this.suContent = suContent;
	}
	public String getSkContent()
	{
		return skContent;
	}
	public void setSkContent(String skContent)
	{
		this.skContent = skContent;
	}
	public String getAcContent()
	{
		return acContent;
	}
	public void setAcContent(String acContent)
	{
		this.acContent = acContent;
	}
	public int getUsId()
	{
		return usId;
	}
	public void setUsId(int usId)
	{
		this.usId = usId;
	}
	public String getUgselect()
	{
		return ugselect;
	}
	public void setUgselect(String ugselect)
	{
		this.ugselect = ugselect;
	}
	public int getUlevel()
	{
		return ulevel;
	}
	public void setUlevel(int ulevel)
	{
		this.ulevel = ulevel;
	}
}
