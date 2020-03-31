/*=======================================
 *  projectDTO.java
 *  - 개설, 진행중, 완료에 대한 전반적인
 *    바인딩을 담당
 *=====================================*/

package com.team1.pro.ing;

public class ProjectDTO
{
	private int pid;				//-- 프로젝트 개설번호 
	private String rname;			//-- 프로젝트명
	private String createDate; 		//-- 프로젝트 개설일
	private int	id;					//-- 프로젝트 개설자
	private String oid;				//-- 온라인 비율코드
	private int peoid;				//-- 인원 코드
	private int gid;				//-- 성별 코드
	private int minLevel;			//-- 최소레벨
	private int maxLevel;			//-- 최대레벨
	private String link;			//-- 외부연락망
	private String pcontents;		//-- 프로젝트 소개글
	private int proid;				//-- 프로젝트 진행 기간코드
	private String paddress;		//-- 프로젝트 주요장소 
	
	/*------------------------------------------------*/
	private String endDate;			//-- 프로젝트 모집종료일
	/*----------------------------------------------------------------*/
	private String startVoteEnd;	//-- 팀장선출 기간종료일
	private String modeSelectEnd;	//-- 모드선택 기간종료일
	
	private int modeId;				//-- 모드번호
	private int msId;				//-- 모드선택번호
	/*--------------------------------------------------------------*/
	private int usId;				//-- 유저 번호
	private int usLv;				//-- 유저 레벨
	private String usName;			//-- 유저 이름
	private String nickName;		//-- 유저 닉네임
	private String usPhoto;			//-- 유저 프로필 사진
	/*--------------------------------------------------------------*/
	private int proId;				//-- 팀장투표 발의번호
	private int tfId;				//-- 팀장선출번호
	private String staDate;			//-- 투표한 시간
	private int voter;				//-- 투표한 사람
	private int selecter;			//-- 투표받은 사람
	private int selecterCount;		//-- 투표받은 사람의 득표수
	
	private int reTicket;			//-- 재투표 확인서
	private int pjId;				//-- 유저 참여번호
	
	

	//-- getter / setter 구성
	public int getSelecterCount()
	{
		return selecterCount;
	}

	public String getUsPhoto()
	{
		return usPhoto;
	}

	public void setUsPhoto(String usPhoto)
	{
		this.usPhoto = usPhoto;
	}

	public int getMsId()
	{
		return msId;
	}

	public void setMsId(int msId)
	{
		this.msId = msId;
	}

	public int getTfId()
	{
		return tfId;
	}

	public void setTfId(int tfId)
	{
		this.tfId = tfId;
	}

	public int getPjId()
	{
		return pjId;
	}

	public void setPjId(int pjId)
	{
		this.pjId = pjId;
	}

	public int getReTicket()
	{
		return reTicket;
	}

	public void setReTicket(int reTicket)
	{
		this.reTicket = reTicket;
	}

	public int getModeId()
	{
		return modeId;
	}

	public void setModeId(int modeId)
	{
		this.modeId = modeId;
	}

	public String getModeSelectEnd()
	{
		return modeSelectEnd;
	}

	public void setModeSelectEnd(String modeSelectEnd)
	{
		this.modeSelectEnd = modeSelectEnd;
	}

	public void setSelecterCount(int selecterCount)
	{
		this.selecterCount = selecterCount;
	}

	public int getProId()
	{
		return proId;
	}

	public int getUsId()
	{
		return usId;
	}

	public void setUsId(int usId)
	{
		this.usId = usId;
	}

	public void setProId(int proId)
	{
		this.proId = proId;
	}

	public String getStaDate()
	{
		return staDate;
	}

	public void setStaDate(String staDate)
	{
		this.staDate = staDate;
	}

	public int getVoter()
	{
		return voter;
	}

	public void setVoter(int voter)
	{
		this.voter = voter;
	}

	public int getSelecter()
	{
		return selecter;
	}

	public void setSelecter(int selecter)
	{
		this.selecter = selecter;
	}

	public int getUsLv()
	{
		return usLv;
	}

	public void setUsLv(int usLv)
	{
		this.usLv = usLv;
	}

	public String getUsName()
	{
		return usName;
	}

	public void setUsName(String usName)
	{
		this.usName = usName;
	}

	public String getNickName()
	{
		return nickName;
	}

	public void setNickName(String nickName)
	{
		this.nickName = nickName;
	}

	public String getStartVoteEnd()
	{
		return startVoteEnd;
	}

	public void setStartVoteEnd(String startVoteEnd)
	{
		this.startVoteEnd = startVoteEnd;
	}

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

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getOid()
	{
		return oid;
	}

	public void setOid(String oid)
	{
		this.oid = oid;
	}

	public int getPeoid()
	{
		return peoid;
	}

	public void setPeoid(int peoid)
	{
		this.peoid = peoid;
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

	public int getProid()
	{
		return proid;
	}

	public void setProid(int proid)
	{
		this.proid = proid;
	}

	public String getPaddress()
	{
		return paddress;
	}

	public void setPaddress(String paddress)
	{
		this.paddress = paddress;
	}

	public String getEndDate()
	{
		return endDate;
	}

	public void setEndDate(String endDate)
	{
		this.endDate = endDate;
	}
	
	
	
}
