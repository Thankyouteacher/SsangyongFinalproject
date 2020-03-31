/*=================================
 *  IProjectDAO.java
 *  - 인터페이스
 *  - 프로젝트 모집, 진행중, 완료
 *    에 대한 메소드를 선언
 *===============================*/

package com.team1.pro.ing;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;


public interface IProjectDAO
{	
	// 개설된 프로젝트 수
	public Integer projectNumber();																									//-- 개설된 프로젝트의 수
	
	// 모집중 → 진행중
	public Integer chapterUpdate(@Param("num") int num, @Param("pjId") int pjId);													//-- 챕터 단계 입력, pjId 로 챕터 업데이트
	public Integer getChapter(@Param("pjId") int pjId);																				//-- pjId 로 현재 챕터 얻기
	public Integer leaderPropose(@Param("pid") int pid);							                                                //-- 팀장투표 발의 메소드
	public Integer getProId(@Param("pjId") int pjId);																				//-- 회원번호로 프로젝트번호 얻어내기
	public int[] getMembersId(@Param("pid") int pid);																				//-- 프로젝트번호로 팀원들 유저번호 얻어내기
	public Integer usIdToPjId(@Param("pid") int pid, @Param("usId") int usId);														//-- usid와 pid로 psid얻기
	public Integer pjIdToUsId(@Param("pjId") int pjId);																				//-- pjId 로 usId 얻기
	public Integer voteInsert(@Param("voter") int voter,@Param("selecter") int selecter,@Param("proId") int proId);					//-- 투표제출
	public Integer voterToProId(@Param("voter") int voter);																			//-- voter(pjId)로 proId얻기
	public Integer voterGetSelecter(@Param("voter") int voter);																		//-- voter(pjId)로 selecter(pjId) 얻어내기
	public Integer leaderInsert(ProjectDTO dto);							                                               			//-- ※ 이거 프로시져로 해야함!!(해결) 아가리
	public Integer leaderPresent(@Param("pid") int pid);							                                                //-- 해당 프로젝트번호로 뽑힌 팀장이 있는지 확인하기
	public Integer pidToProId(@Param("pid") int pid);																				//-- 해당 프로젝트의 가장 나중 발의된 투표
	                                                                                                                                
	public int[] completeVoteMembers(@Param("pid") int pid);						                                                //-- 투표를 완료한 멤버들 번호 출력
	public int[] progressVoteMembers(@Param("pid") int pid);						                                                //-- 투표를 완료하지않은 멤버들 번호 출력
	                                                                                                                                
	public Integer createProject(ProjectDTO dto);									                                                //-- 프로젝트 개설 메소드
	public Integer memberCount(@Param("pid") int pid);								                                                //-- 프로젝트에 들어와있는 인원수
	public String leaderVoteEnd(@Param("pid") int pid);												                                //-- 프로젝트 리더 투표 종료일자
	public Integer peopleNumber(@Param("pid") int pid);								                                                //-- 프로젝트에서 정해놓은 인원수
	public ArrayList<ProjectDTO> selecterNumber(@Param("pid") int pid);				                                                //-- 프로젝트 팀장투표에서 선택된 회원번호와 그 수(내림차순)
	public ArrayList<ProjectDTO> reSelecterNumber(@Param("pid") int pid);				                                            //-- 프로젝트 이전 팀장투표에서 선택된 회원번호와 그 수(내림차순) 
	public ProjectDTO getLeaderInfo(@Param("pid") int pid);																			//-- 팀장번호, 팀장결정번호 조회하기(pjId)
	
	public ArrayList<ProjectDTO> voteCompleteMember(@Param("pid") int pid);			                                                //-- 팀장투표를 완료한 팀원들의 리스트 출력
	public ProjectDTO proUserInfo(@Param("usId") int usId, @Param("pid") int pid);							                        //-- 프로젝트와 관련된 유저정보 출력(프로젝트번호, 유저번호, 유저 닉네임, 이름, 레벨)
	                                                                                                                                
	//-------모드 선택 ---------------------------------                                                                            
	public Integer modeInsert(ProjectDTO dto);																						//-- 모드 선택 후 등록
	public int[] reportFrequency();													                                                //-- 회의록/업무일지 제출빈도 조회
	public String[] notOracleList();												                                                //-- 오라클을 제외했을 때 수행과제명 리스트 
	public String[] reportArray();													                                                //-- 오라클을 포함했을 때 리스트
	public String[] dbSkill();														                                                //-- 오라클 스킬만 뽑아내기
	public int[] proSkillList(int pid);																								//-- 해당 프로젝트에 사용될 기술번호 조회
	public String[] proSkillNames(int pid);																							//-- 해당 프로젝트에 사용될 기술명 조회
	public String modeSelectEnd(int pid);                                                                                         	//-- 모드선택 마감시간  
	public Integer getModeMsId(@Param("pid") int pid);																				//-- 프로젝트번호로 모드번호(MSID) 조회하기
	public Integer hasMode(@Param("pid") int pid);																					//-- 프로젝트에 모드 존재하는지 조회하기
	public String getModeName(@Param("pid") int pid);																				//-- 프로젝트 번호로 모드명 얻어내기
	
	//-------진행중 프로젝트---------------------------- 
	public Integer createToProgress(@Param("pid") int pid);							                                                //-- 프로젝트개설번호로 진행중 프로젝트번호 얻어내기
	public Integer progressInsert(ProjectDTO dto);																					//-- 프로젝트 개설하기
	public ProgressDTO progressInfo(@Param("pid") int pid);																			//-- 진행중프로젝트 정보조회
	
	// 타임라인
	public ArrayList<ProgressDTO> timeLineList(@Param("pid") int pid);				                                                //-- 해당 프로젝트 타임라인 리스트 얻어내기
	public ArrayList<ProgressDTO> timeLineSearchList(@Param("pid") int pid, @Param("hashName") String hashName);					//-- 해당 프로젝트 타임라인 해시태그 검색 리스트 얻어내기
	public String[] hashTagList(@Param("tid") int tid);								                                                //-- 해당 타임라인 해시태그 리스트 얻어내기
	public Integer recentTimeLine(@Param("usId") int usId, @Param("pid") int pid);													//-- 본인이 가장 최근 등록한 타임라인 번호 얻어내기
	public Integer timeLineInsert(ProgressDTO dto); 																				//-- 타임라인 등록하기
	public Integer timeLineDelete(@Param("tid") int tid);																			//-- 타임라인 삭제하기
	public int hashTagInsert(ProgressDTO dto);																						//-- 해시태그 등록하기
	public Integer timeLineLockInsert(@Param("ppId") int ppId);																		//-- 타임라인 비공개설정하기
	public Integer timeLineLockDelete(@Param("pid") int pid);																		//-- 타임라인 비공개해제하기
	public Integer hasTimeLineLock(@Param("pid") int pid);																			//-- 타임라인 비공개되어있는지 조회하기
	
	// 방명록
	public Integer visitorInsert(ProgressDTO dto);																					//-- 방명록 등록하기
	public Integer visitorDelete(@Param("vid") int vid);																			//-- 방명록 삭제하기
	public ArrayList<ProgressDTO> visitorList(@Param("pid") int pid);																//-- 해당 프로젝트 방명록 리스트 얻어내기
	
	// 수행과제
	public Integer reportSubmit(ProgressDTO dto);																					//-- 수행과제 제출하기
	public ArrayList<ProgressDTO> reportList();																						//-- 수행과제 양식 리스트 조회
	public Integer getModeNum(@Param("pid") int pid);																				//-- 프로젝트번호로 모드번호 조회하기
	public Integer getPeriodNum(@Param("pid") int pid);																				//-- 프로젝트번호로 프로젝트기간번호 조회하기
	public ArrayList<ProgressDTO> guideReportList(@Param("modeId") int modeId, @Param("proId") int proId);							//-- 모드와 기간에 따른 제출번호 리스트 얻어내기
	public ProgressDTO guideReportOne(@Param("modeId") int modeId, @Param("proId") int proId, @Param("gpId") int gpId);				//-- 모드와 기간에 따른 제출번호 얻어내기
	public Integer getMinGpId(@Param("modeId") int modeId, @Param("proId") int proId);												//-- 모드와 기간에 따른 제출번호 중 업무일지,회의록을 제외한 가장 낮은 번호 얻어내기
    public Integer getMaxGpId(@Param("pid") int pid);																				//-- 프로젝트에서 제출한 수행과제 번호중 가장 큰 번호 조회(현재 어떤것까지 제출했는지...)
    public ArrayList<ProgressDTO> getLogReportId(@Param("modeId") int modeId, @Param("proId") int proId);							//-- 모드와 기간에 따라 회의록, 업무일지 조회하기
    public ArrayList<ProgressDTO> afterSubmitList(@Param("pid") int pid);															//-- 프로젝트번호로 제출된 수행과제 리스트 조회하기
    public ArrayList<ProgressDTO> getAdviceList(@Param("fsId") int fsId);															//-- 수행과제 제출번호로 작성된 평가목록 얻어내기
    public ArrayList<ProgressDTO> allAdviceList();																					//-- 작성된 평가목록 얻어내기
    public ProgressDTO getReportNFile(@Param("fsId") int fsId);																		//-- 과제제출번호로 과제 명 및 첨부파일 받기
    public Integer guideAdviceInsert(ProgressDTO dto);																				//-- 제출된 과제에 대한 평가 등록하기
    public Integer guideAdviceDelete(@Param("saId") int saId);																		//-- 평가 삭제
    public Integer guideSubmitClick(@Param("fsId") int fsId);																		//-- 해당 제출과제 조회수 증가
    public Integer guideLikeInsert(ProgressDTO dto);																				//-- 공감하기(가이드)
    public Integer guideLikeDelete(ProgressDTO dto);																				//-- 공감풀기(가이드)
    public Integer guideLikeOk(ProgressDTO dto);																					//-- 해당 유저가 이미 공감을 했는지 여부 확인(토글 구현)
    public Integer guideLikeCount(@Param("saId") int saId);																			//-- 해당 평가에 대한 공감수 조회
    public Double guideSubmitCount(@Param("pid") int pid, @Param("gpId") int gpId);													//-- 해당 프로젝트에서 제출해야하는 순서의 수행과제가 기간을 넘어섰는지 여부 확인하기(회의록,수행과제제외)
    public ProgressDTO guideMeetLogSubmitCount(@Param("pid") int pid, @Param("ssId") int ssId);										//-- 해당 프로젝트에서 제출해야하는 순서의 회의록, 업무일지가 기간을 넘어섰는지 여부 및 제출종료일자 확인하기
    public ArrayList<ProgressDTO> guideMeetLogSubmitList(@Param("pid") int pid, @Param("ssId") int ssId);							//-- 해당 프로젝트에서 제출된 회의록 or 업무일지의 리스트 조회(갯수, 제출시작일, 제출종료일, 정상제출여부(double))
    public Integer[] fsIdToArray(@Param("fsId") int fsId);																			//-- 회의록/업무일지 fsid 로 해당 프로젝트에 제출되어있는 회의록/업무일지 fsid들 array 조회
    public Integer fsIdToSsId(@Param("fsId") int fsId);																				//-- fsId 로 ssId 얻어내기(회의록/업무일지)
    
    // 프로젝트 종료
    public ArrayList<ProgressDTO> endProjectReportList(@Param("pid") int pid);														//-- 프로젝트 종료로 인해 경험치 계산을 위한 수행과제들의 리스트를 출력 
    public Integer getModeExp(@Param("pid") int pid);																				//-- 프로젝트에서 고른 모드 자체 경험치 조회
    public Double projectEvalCount(@Param("pid") int pid);																			//-- 프로젝트 종료 및 평가기간에 대한 카운트(0 이면 종료, -20 이면 평가 종료)
    public Integer hasEndCheck(@Param("pid") int pid, @Param("usId") int usId);														//-- 프로젝트 종료 후 평가끝난후 결과확인했는지 여부 조회
    public Integer hasEvalEnd(@Param("pid") int pid);																				//-- 프로젝트 종료 후 평가까지 끝났다는 결과가 담겨있는지 조회
    public Integer stackExpInsert(ProgressDTO dto);																					//-- 유저번호에 경험치 입력하기
    public Integer proEvalEndInsert(ProgressDTO dto);																				//-- 프로젝트 결과 입력하기
    public Integer endCheckUpdate(@Param("pid") int pid, @Param("usId") int usId);													//-- 프로젝트 최종결과 확인 입력하기
    public ProgressDTO projectEndInfo(@Param("pid") int pid);																		//-- 프로젝트 결과 조회하기
    
    // 보영이 누나꺼 따오기
    public Integer whatIsNowPoint(@Param("usId") int usId);
    public Integer whatIsPrePoint(@Param("usId") int usId);
    public Integer whatIsNextPoint(@Param("usId") int usId);
    
    // 퇴출투표
    public String memberOutVoteEnd();																								//-- 현시간부터 하루 뒤 나타내기
    public Integer memberOutVoteInsert(ProgressDTO dto);																			//-- 퇴출투표 발의하기
    public Integer memberOutVoteIng(@Param("pid") int pid);																			//-- 해당 프로젝트에 현재 퇴출투표가 진행되고 있는지 나타내기
    public ProgressDTO outVoteRemainTime(@Param("pid") int pid);																	//-- 해당 프로젝트에 진행되고있는 퇴출투표 남은 시간(일, 시, 분, 초)
    public Integer memberOutVoteSubmit(ProgressDTO dto);																			//-- 퇴출투표 제출하기
    public ProgressDTO memberOutVoteInfo(@Param("pid") int pid);																	//-- 프로젝트에 대한 (target, reason, pkpid 받아내기)
    public Integer outVoteEndMember(@Param("pid") int pid, @Param("usId") int usId);												//-- 퇴출투표 완료했는지 여부 조회하기
    public ArrayList<ProgressDTO> outVoteEndList(@Param("pid") int pid);															//-- 퇴출투표 완료한 멤버들 리스트 출력
    public Integer hasOutVoteResult(@Param("pid") int pid);																			//-- 해당 프로젝트 퇴출투표발의에 결과가 있는지 조회하기
    public Integer outVoteResultInsert(@Param("pkpId") int pkpId);																	//-- 해당 퇴출투표 발의번호에 결과 insert					
    public Integer outVoteResultCount(@Param("pid") int pid, @Param("slId") int slId);												//-- 해당 프로젝트에 결과가 얼마나 있는지 조회
    public Integer proExitInsert(@Param("pjId") int pjId);																			//-- 팀원 퇴출하기 insert
    public String getUserNickName(@Param("usId") int usId);																			//-- 유저번호로 닉네임얻어내기
    public ProgressDTO outVoteResultInfo(@Param("pid") int pid);																	//-- 프로젝트 퇴출투표 결과 정보 조회(prid, pkpid, pkdate)
    public Integer isKickVoteCheck(@Param("pjId") int pjId);																		//-- 퇴출투표 결과 확인했는지 여부 조회
    public Integer kickVoteCheckUpdate(@Param("pjId") int pjId);																	//-- 퇴출투표 결과 확인했으면 update

    // 팀해체 및 프로젝트 종료 투표
    public Integer teamRemoveVotePropose(@Param("ppId") int ppId);																	//-- 진행중번호로 투표 발의하기
    public ProgressDTO removeVoteRemainTime(@Param("pid") int pid);																	//-- 팀해체투표 종료까지 남은 시간 조회하기
    public Integer teamRemoveVoteSubmit(ProgressDTO dto);																			//-- 팀해체투표 제출하기
    public Integer teamRemoveVoteIng(@Param("pid") int pid);																		//-- 진행중인 팀해체투표가 있는지 조회하기
    public Integer getTeamRemoveNum(@Param("pid") int pid);																			//-- 프로젝트번호로 팀해체투표 발의번호 조회하기
    public Integer removeVoteEndMember(@Param("pid") int pid, @Param("usId") int usId);												//-- 투표 제출했는지 여부 조회
    public Integer removeVoteEndCount(@Param("pid") int pid);																		//-- 투표제출한 인원이 몇명인지 조회
    public Integer hasRemoveVoteResult(@Param("pid") int pid);																		//-- 해당 프로젝트에서 진행중인 팀해체투표의 결과가 있는지 조회
    public Integer removeVoteResultInsert(@Param("deId") int deId);																	//-- 팀해체투표 결과 insert
    public Integer removeVoteResultCount(@Param("pid") int pid, @Param("slId") int slId);											//-- 찬/반/무 결과 수 조회하기
    public Integer removeProject(@Param("pid") int pid);																			//-- 프로젝트 삭제
    public ProgressDTO removeVoteResultInfo(@Param("pid") int pid);																	//-- 팀해체 투표 결과정보 조회하기
    public Integer isDestroyVoteCheck(@Param("pjId") int pjId);																		//-- 팀해체 투표 결과 확인했는지 여부 조회
    public Integer destroyVoteCheckUpdate(@Param("pjId") int pjId);																	//-- 팀해체 투표 결과 확인했으면 update
}
