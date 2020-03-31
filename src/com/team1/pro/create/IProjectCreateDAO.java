package com.team1.pro.create;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.team1.achievement.proachievementDTO;
import com.team1.people.peopleDTO;
import com.team1.pro.member.estimate.MemberEstimateDTO;
import com.team1.pro.message.messageDTO;
import com.team1.pro.onlineRate.onlineRateDTO;
import com.team1.pro.period.PeriodDTO;
import com.team1.skill.SkillDTO;
import com.team1.user.UserInsertDTO;

public interface IProjectCreateDAO
{
	public UserInsertDTO getUser(int usId);						// 유저의 id 를 통해 유저의 닉네임, 주소, 성별을 받아오는 메소드
	public ArrayList<SkillDTO> skillList();						// 기술 리스트를 받아오는 메소드
	public int userLevel(int usId);								// 유저의 id를 통해 레벨을 받아오는 메소드
	public ArrayList<PeriodDTO> getPeriod();					// 프로젝트 기간을 받아오는 메소드
	public ArrayList<peopleDTO> getPeople();					// 인원 수를 받아오는 메소드
	public ArrayList<onlineRateDTO> getOnlineRate();			// 온/오프라인 받아오는 메소드
	
	//-- 배열로 수정 필요
	//public int userAchievementCount(int usId);					// 유저의 id를 통해 유저가 가진 칭호의 갯수를 받아오는 메소드
	public ArrayList<proachievementDTO> userAchievement(@Param("usId") int usId);	// 유저의 id를 통해 유저의 칭호 받아오는 메소드
	// 배열로 수정 필요 --
	
	public int projectCreate(ProjectCreateDTO dto);				// 프로젝트 개설 메소드
	
	public Integer getPeopleCount(int pid);						// 프로젝트 id 를 이용하여 모집 인원 수 를 받아오는 메소드
	public Integer getProPeriod(int pid);						// 프로젝트 id 를 이용하여 프로젝트 기간을 받아오는 메소드
	public Integer getOnRate(int pid);							// 프로젝트 id 를 이용하여 온라인 비율을 받아오는 메소드
	
	//-- 배열로 수정 필요
//public int test13(int pid);									// 프로젝트에 등록한 칭호 갯수를 반환하는 메소드
	public ArrayList<proachievementDTO> getAchievement(int pid);	// 프로젝트에 등록한 칭호를 반환하는 메소드
	// 배열로 수정 필요 --
	
	//-- 배열로 수정 필요
//public int getSkillCount(int pid);							// 프로젝트에 등록한 기술 갯수를 반환하는 메소드
	public ArrayList<SkillDTO> getSkill(int pid);				// 프로젝트에 등록한 기술을 반환하는 메소드
	// 배열로 수정 필요 --
	
	public String getSubject(int pid);							// 프로젝트 id 를 이용하여 프로젝트에 등록한 주제를 반환하는 메소드
	
	public ProjectCreateDTO getProject(int pid);				// 프로젝트의 정보를 반환하는 메소드
	
	public String getProjectStartDate(int pid);					// 프로젝트 시작일을 반환하는 메소드
	
	public Integer getCreatePrjId(int usId);					// 프로젝트 개설 시(바로 직후에) 프로젝트 번호를 알아오는 메소드
	
	public int insertPcontents(@Param("pid") int pid, @Param("sname") String sname);			// 주제를 등록하는 메소드
	
	
//public int joinCount(int pid);								// 프로젝트에 참여한 인원
//public int exitCount(int pid);								// 프로젝트에 탈퇴한 인원
// 위에 두개를 합친 쿼리문
	public int totProJoinCount(int pid);						// 현재 프로젝트에 참여중인 인원
	
// 수정 필요
	public int[] totProJoin(int pid);		// 참여 인원
	
	public int insertSkill(@Param("pid") int pid, @Param("skId") int skId);							// 기술을 등록하는 메소드
	
	public int insertAch(@Param("pid") int pid, @Param("usId") int usId, @Param("acId") int acId);	// 칭호를 등록하는 메소드
	
	public ArrayList<messageDTO> getMessage(int pid);	// 채팅창
	
	public int sendMessage(@Param("mcontents") String mcontents, @Param("usId") int usId, @Param("pid") int pid, @Param("pmId") int pmId);		// 채팅 입력
	
	public int deleteProject(int pid);		// 프로젝트 삭제
	
	public int exitProject(@Param("pid") int pid, @Param("usId") int usId);	// 프로젝트 나가기
	
	public int userAge(int usId);			// 나이 구하는 메소드
	
	public int ingProject(int usId);		// 진행 중인 프로젝트의 갯수를 구하는 메소드(진행중+완료된 갯수)
	public int completedProject(int usId);	// 완료된 프로젝트의 갯수를 구하는 메소드
	public double avgPeriod(int usId);		// 완료된 프로젝트의 평균 기간을 구하는 메소드
	
//	public ArrayList<UserInsertDTO> getOne(int pid);	//====================== 안쓰임...
//	public ArrayList<UserInsertDTO> getTwo(int pid);	//====================== 안쓰임...
	
	public int[] divOne(int pid);			// 윗 줄에 있을 멤버의 usId를 구하는 메소드
	public int[] divTwo(int pid);			// 아래줄에 있을 멤버의 usId를 구하는 메소드
	
	public int projectUpdate(ProjectCreateDTO dto);				// 프로젝트 수정 메소드
	
	//public int deleteSkill(int pid);			// 등록된 기술을 제거하는 메소드. 사용 안함.
	public int deleteAch(int pid);				// 등록된 칭호를 제거하는 메소드
	public int deletePcontents(int pid);		// 등록된 주제를 제거하는 메소드

// 
	public ArrayList<proachievementDTO> getUserAch(int usId);	// 회원이 등록한 대표 칭호
	
	public UserInsertDTO memberInfo(@Param("pid") int pid, @Param("usId") int usId);
	
	public MemberEstimateDTO avgEstimate1(int usId);	// 1번째 평가 평균 점수
	public MemberEstimateDTO avgEstimate2(int usId);	// 2번째 평가 평균 점수
	public MemberEstimateDTO avgEstimate3(int usId);	// 3번째 평가 평균 점수
	public MemberEstimateDTO avgEstimate4(int usId);	// 4번째 평가 평균 점수
	public MemberEstimateDTO avgEstimate5(int usId);	// 5번째 평가 평균 점수
	public MemberEstimateDTO avgEstimate6(int usId);	// 6번째 평가 평균 점수
	public MemberEstimateDTO avgEstimate7(int usId);	// 7번째 평가 평균 점수
	public double avgEstimate(int usId);				// 평가 총 평균 점수
	
	public String[] manyUseSkill(int usId);				// 주로 사용한 기술
	public String manyActiveAddress(int usId);			// 주로 활동한 지역
	public String startDate();							// 프로젝트 예상 시작일
	
	public int proJoin(@Param("pid") int pid, @Param("usId") int usId);	// 프로젝트 입장 메소드
}
