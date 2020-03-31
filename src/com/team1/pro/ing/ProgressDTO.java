/*=============================
 *  ProgressDTO.java
 *  - 진행중 프로젝트 DTO
 *===========================*/

package com.team1.pro.ing;

public class ProgressDTO
{
	
	//-- 프로젝트 개설 정보
	private String ppName;				//-- 프로젝트 팀명
	private int minLevel;				//-- 프로젝트 최소레벨
	private int maxLevel;				//-- 프로젝트 최대레벨
	private String Link;				//-- 프로젝트 외부연락망
	private String pcontents;			//-- 프로젝트 소개
	private String paddress;			//-- 프로젝트 활동지역
	private String subject;				//-- 프로젝트 주제
	private int onRate;					//-- 온라인비율
	private String ppDate;				//-- 프로젝트 진행 시작일자
	private String peDate;				//-- 프로젝트 진행 종료일자
	private int proPeriod;				//-- 프로젝트 진행기간
	private int peoNum;					//-- 프로젝트 제한 인원수
	private int peoCount;				//-- 프로젝트 현재 참여하고있는 인원수
	private String gselect;				//-- 프로젝트 성별
	
	
	//-- 기본 정보
	
	private int ppId;					//-- 진행중프로젝트 번호
	private int pid;					//-- 프로젝트개설 번호
	private int usId;					//-- 유저번호
	private int pjId;					//-- 유저참여번호
	
	//----- 타임라인
	private int tid;					//-- 타임라인 번호
	private String nickName;			//-- 유저닉네임
	private String content;				//-- 타임라인내용
	private String pfile;				//-- 파일명
	private String pdate;				//-- 등록일자
	private int usLv;					//-- 유저 레벨
	private String[] hashTag;			//-- 해시태그
	private String hashName;			//-- 해시태그 이름
	private String hashTagLine;			//-- 입력받아올 해시태그라인
	private String usPhoto;				//-- 유저 사진
	private int timeLineKey;			//-- 검색키
	
	//----- 방명록
	private int vid;					//-- 방명록 번호
	private String vsDate;				//-- 등록일자
	private String vsText;				//-- 등록내용
	
	//----- 수행과제
	private int ssId;					//-- 수행과제 번호
	private String ssName;				//-- 수행과제명
	private String downLink;			//-- 다운로드 파일명(서버에 저장)
	private int modeId;					//-- 모드 종류 번호
	private int proId;					//-- 프로젝트 진행기간 번호
	private int gpId;					//-- 가이드챌린지 수행과제번호
	private int minGpId;				//-- 해당 모드의 업무일지, 회의록을 제외한 가장 낮은 gpId
	private int maxGpId;				//-- 프로젝트에 제출된 수행과제번호 중 가장 큰 번호(현재 단계)
	private int gpNum;					//-- 제출된 수행과제 리스트 넘버링(rownum)
	private int fsId;					//-- 프로젝트제출번호(평가 테이블에 엮여있음)
	private String pgDate;				//-- 프로젝트 제출 수정일자(수정된것들 중 제일 최근 수정)
	private int saId;					//-- 실제 과제 평가 번호
	private String saDate;				//-- 과제 평가한 일자
	private String saText;				//-- 과제 평가 내용
	private int score;					//-- 과제 평가 별점
	private int adviceNum;				//-- 과제 평가 번호(rownum)
	private int guideAdviceCount;		//-- 과제 평가 수
	private double guideAvgScore;		//-- 과제 평균 별점
	private int guideClick;				//-- 과제 조회수(가이드)
	private int guideLikeCount;			//-- 평가 공감하기 수(가이드)
	private int gperiod;				//-- 수행과제 진행기간
	private double submitCount;			//-- 오늘날짜와 제출날짜의 차이
	private double exp;					//-- 수행과제 경험치
	private int failCount;				//-- 프로젝트 실패 카운트
	private int peSuccess;				//-- 프로젝트 성공여부
	
	private String gpStartDate;			//-- 각각의 회의록, 업무일지 제출시작일자
	private String gpEndDate;			//-- 각각의 회의록, 업무일지 제출종료일자
	
	private String urlFile;				//-- 파일 경로
	
	
	//----- 퇴출투표
	private String preason;				//-- 퇴출투표사유
	private int outDays;				//-- 퇴출남은일자
	private int outHours;				//-- 퇴출남은시간
	private int outMinutes;				//-- 퇴출남은분
	private int outSeconds;				//-- 퇴출남은초
	private int pkpId;					//-- 퇴출투표발의번호
	private int slId;					//-- 찬성,반대,무효번호
	private int slIdCount;				//-- 찬성,반대,무효 수
	private String pkDate;				//-- 퇴출투표 결과 일자
	private int prId;					//-- 퇴출투표 결과 번호
	
	//----- 팀해체투표
	private int deId;					//-- 팀해체투표 번호
	private int pdvId;					//-- 팀해체투표 결과 번호
	private String pdvDate;				//-- 팀해체투표 결과 일자
	
	private int outCase;				//-- 팀해체, 퇴출, 방나가기 경우
	
	//-- getter/setter
	public String[] getHashTag()
	{
		return hashTag;
	}
	public int getOutCase()
	{
		return outCase;
	}
	public void setOutCase(int outCase)
	{
		this.outCase = outCase;
	}
	public String getPpName()
	{
		return ppName;
	}
	public void setPpName(String ppName)
	{
		this.ppName = ppName;
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
		return Link;
	}
	public void setLink(String link)
	{
		Link = link;
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
	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	public int getOnRate()
	{
		return onRate;
	}
	public void setOnRate(int onRate)
	{
		this.onRate = onRate;
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
	public int getProPeriod()
	{
		return proPeriod;
	}
	public void setProPeriod(int proPeriod)
	{
		this.proPeriod = proPeriod;
	}
	public int getPeoNum()
	{
		return peoNum;
	}
	public void setPeoNum(int peoNum)
	{
		this.peoNum = peoNum;
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
	public int getPeSuccess()
	{
		return peSuccess;
	}
	public void setPeSuccess(int peSuccess)
	{
		this.peSuccess = peSuccess;
	}
	public int getFailCount()
	{
		return failCount;
	}
	public void setFailCount(int failCount)
	{
		this.failCount = failCount;
	}
	public double getExp()
	{
		return exp;
	}
	public void setExp(double exp)
	{
		this.exp = exp;
	}
	public String getUrlFile()
	{
		return urlFile;
	}
	public void setUrlFile(String urlFile)
	{
		this.urlFile = urlFile;
	}
	public String getGpStartDate()
	{
		return gpStartDate;
	}
	public void setGpStartDate(String gpStartDate)
	{
		this.gpStartDate = gpStartDate;
	}
	public String getGpEndDate()
	{
		return gpEndDate;
	}
	public void setGpEndDate(String gpEndDate)
	{
		this.gpEndDate = gpEndDate;
	}
	public int getGperiod()
	{
		return gperiod;
	}
	public void setGperiod(int gperiod)
	{
		this.gperiod = gperiod;
	}
	public double getSubmitCount()
	{
		return submitCount;
	}
	public void setSubmitCount(double submitCount)
	{
		this.submitCount = submitCount;
	}
	public int getTimeLineKey()
	{
		return timeLineKey;
	}
	public void setTimeLineKey(int timeLineKey)
	{
		this.timeLineKey = timeLineKey;
	}
	public String getUsPhoto()
	{
		return usPhoto;
	}
	public void setUsPhoto(String usPhoto)
	{
		this.usPhoto = usPhoto;
	}
	public void setPpId(int ppId)
	{
		this.ppId = ppId;
	}
	public int getPdvId()
	{
		return pdvId;
	}
	public void setPdvId(int pdvId)
	{
		this.pdvId = pdvId;
	}
	public String getPdvDate()
	{
		return pdvDate;
	}
	public void setPdvDate(String pdvDate)
	{
		this.pdvDate = pdvDate;
	}
	public int getDeId()
	{
		return deId;
	}
	public void setDeId(int deId)
	{
		this.deId = deId;
	}
	public String getPkDate()
	{
		return pkDate;
	}
	public void setPkDate(String pkDate)
	{
		this.pkDate = pkDate;
	}
	public int getPrId()
	{
		return prId;
	}
	public void setPrId(int prId)
	{
		this.prId = prId;
	}
	public int getSlIdCount()
	{
		return slIdCount;
	}
	public void setSlIdCount(int slIdCount)
	{
		this.slIdCount = slIdCount;
	}
	public int getSlId()
	{
		return slId;
	}
	public void setSlId(int slId)
	{
		this.slId = slId;
	}
	public int getPkpId()
	{
		return pkpId;
	}
	public void setPkpId(int pkpId)
	{
		this.pkpId = pkpId;
	}
	public int getOutDays()
	{
		return outDays;
	}
	public void setOutDays(int outDays)
	{
		this.outDays = outDays;
	}
	public int getOutHours()
	{
		return outHours;
	}
	public void setOutHours(int outHours)
	{
		this.outHours = outHours;
	}
	public int getOutMinutes()
	{
		return outMinutes;
	}
	public void setOutMinutes(int outMinutes)
	{
		this.outMinutes = outMinutes;
	}
	public int getOutSeconds()
	{
		return outSeconds;
	}
	public void setOutSeconds(int outSeconds)
	{
		this.outSeconds = outSeconds;
	}
	public String getPreason()
	{
		return preason;
	}
	public void setPreason(String preason)
	{
		this.preason = preason;
	}
	public int getGuideLikeCount()
	{
		return guideLikeCount;
	}
	public void setGuideLikeCount(int guideLikeCount)
	{
		this.guideLikeCount = guideLikeCount;
	}
	public int getGuideClick()
	{
		return guideClick;
	}
	public void setGuideClick(int guideClick)
	{
		this.guideClick = guideClick;
	}
	public int getGuideAdviceCount()
	{
		return guideAdviceCount;
	}
	public void setGuideAdviceCount(int guideAdviceCount)
	{
		this.guideAdviceCount = guideAdviceCount;
	}
	public double getGuideAvgScore()
	{
		return guideAvgScore;
	}
	public void setGuideAvgScore(double guideAvgScore)
	{
		this.guideAvgScore = guideAvgScore;
	}
	public int getSaId()
	{
		return saId;
	}
	public void setSaId(int saId)
	{
		this.saId = saId;
	}
	public String getSaDate()
	{
		return saDate;
	}
	public void setSaDate(String saDate)
	{
		this.saDate = saDate;
	}
	public String getSaText()
	{
		return saText;
	}
	public void setSaText(String saText)
	{
		this.saText = saText;
	}
	public int getScore()
	{
		return score;
	}
	public void setScore(int score)
	{
		this.score = score;
	}
	public int getAdviceNum()
	{
		return adviceNum;
	}
	public void setAdviceNum(int adviceNum)
	{
		this.adviceNum = adviceNum;
	}
	public int getGpNum()
	{
		return gpNum;
	}
	public void setGpNum(int gpNum)
	{
		this.gpNum = gpNum;
	}
	public int getFsId()
	{
		return fsId;
	}
	public void setFsId(int fsId)
	{
		this.fsId = fsId;
	}
	public String getPgDate()
	{
		return pgDate;
	}
	public void setPgDate(String pgDate)
	{
		this.pgDate = pgDate;
	}
	public int getMaxGpId()
	{
		return maxGpId;
	}
	public void setMaxGpId(int maxGpId)
	{
		this.maxGpId = maxGpId;
	}
	public int getMinGpId()
	{
		return minGpId;
	}
	public void setMinGpId(int minGpId)
	{
		this.minGpId = minGpId;
	}
	public int getModeId()
	{
		return modeId;
	}
	public void setModeId(int modeId)
	{
		this.modeId = modeId;
	}
	public int getProId()
	{
		return proId;
	}
	public void setProId(int proId)
	{
		this.proId = proId;
	}
	public int getGpId()
	{
		return gpId;
	}
	public void setGpId(int gpId)
	{
		this.gpId = gpId;
	}
	public String getDownLink()
	{
		return downLink;
	}
	public void setDownLink(String downLink)
	{
		this.downLink = downLink;
	}
	public int getSsId()
	{
		return ssId;
	}
	public void setSsId(int ssId)
	{
		this.ssId = ssId;
	}
	public String getSsName()
	{
		return ssName;
	}
	public void setSsName(String ssName)
	{
		this.ssName = ssName;
	}
	public int getPjId()
	{
		return pjId;
	}
	public void setPjId(int pjId)
	{
		this.pjId = pjId;
	}
	public String getHashName()
	{
		return hashName;
	}
	public void setHashName(String hashName)
	{
		this.hashName = hashName;
	}
	public int getUsId()
	{
		return usId;
	}
	public void setUsId(int usId)
	{
		this.usId = usId;
	}
	public int getVid()
	{
		return vid;
	}
	public void setVid(int vid)
	{
		this.vid = vid;
	}
	public String getVsDate()
	{
		return vsDate;
	}
	public void setVsDate(String vsDate)
	{
		this.vsDate = vsDate;
	}
	public String getVsText()
	{
		return vsText;
	}
	public void setVsText(String vsText)
	{
		this.vsText = vsText;
	}
	public String getHashTagLine()
	{
		return hashTagLine;
	}
	public void setHashTagLine(String hashTagLine)
	{
		this.hashTagLine = hashTagLine;
	}
	public void setHashTag(String[] hashTag)
	{
		this.hashTag = hashTag;
	}
	public int getPpId()
	{
		return ppId;
	}
	public void setPpid(int ppId)
	{
		this.ppId = ppId;
	}
	public int getPid()
	{
		return pid;
	}
	public void setPid(int pid)
	{
		this.pid = pid;
	}
	public int getTid()
	{
		return tid;
	}
	public void setTid(int tid)
	{
		this.tid = tid;
	}
	public String getNickName()
	{
		return nickName;
	}
	public void setNickName(String nickName)
	{
		this.nickName = nickName;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getPfile()
	{
		return pfile;
	}
	public void setPfile(String pfile)
	{
		this.pfile = pfile;
	}
	public String getPdate()
	{
		return pdate;
	}
	public void setPdate(String pdate)
	{
		this.pdate = pdate;
	}
	public int getUsLv()
	{
		return usLv;
	}
	public void setUsLv(int usLv)
	{
		this.usLv = usLv;
	}
	
	
}
