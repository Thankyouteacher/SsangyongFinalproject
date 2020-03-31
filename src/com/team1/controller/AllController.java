/*==========================
 *  ProjectController.java
 *  - 프로젝트 컨트롤러
 *========================*/

package com.team1.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team1.achievement.AchievementDTO;
import com.team1.achievement.IAchievementDAO;
import com.team1.achievement.proachievementDTO;
import com.team1.admin.AdminDTO;
import com.team1.admin.IAdminDAO;
import com.team1.bank.IBankDAO;
import com.team1.bank.UserBankDTO;
import com.team1.bank.iUserBankDAO;
import com.team1.board.BoardDTO;
import com.team1.board.IBoardDAO;
import com.team1.pro.create.IProjectCreateDAO;
import com.team1.pro.create.ProjectCreateDTO;
import com.team1.pro.ing.IProjectDAO;
import com.team1.pro.ing.ProgressDTO;
import com.team1.pro.ing.ProjectDTO;
import com.team1.pro.main.IProjectMainDAO;
import com.team1.pro.main.ProjectMainDTO;
import com.team1.pro.message.messageDTO;
import com.team1.pro.subject.SubjectDTO;
import com.team1.project.UserProjectDTO;
import com.team1.skill.ISkillDAO;
import com.team1.skill.IUserSkillDAO;
import com.team1.skill.SkillDTO;
import com.team1.user.IUserDAO;
import com.team1.user.UserDTO;
import com.team1.user.UserInsertDTO;
import com.team1.userboard.UserBoardDTO;

@Controller
@SessionAttributes(
{
		"usId", "pid", "prId", "adminId", "nickName"
}) // 세션 생성
public class AllController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/projectnavi.action", method = RequestMethod.GET)
	public String projectNaviCont(Model model, @ModelAttribute("usId") int usId, ProjectDTO dto)
	{
		String view = null;

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		model.addAttribute("usPhoto", dao2.getUsPhoto(usId));

		model.addAttribute("usId", usId);
		model.addAttribute("pid", dto.getPid());

		// 팀원이 아닌경우
		if ((Integer) dao.getChapter(dao.usIdToPjId(dto.getPid(), usId)) == null)
		{
			view = "/team_main.action";
		}
		// 팀원인 경우
		else if (dao.getChapter(dao.usIdToPjId(dto.getPid(), usId)) == 1)
		{
			view = "/start_display_page1.action";
		}
		else if (dao.getChapter(dao.usIdToPjId(dto.getPid(), usId)) == 2)
		{
			view = "/start_display_page2.action";
		}
		else if (dao.getChapter(dao.usIdToPjId(dto.getPid(), usId)) == 3)
		{
			view = "/start_display_page3.action";
		}
		else if (dao.getChapter(dao.usIdToPjId(dto.getPid(), usId)) == 5)
		{
			view = "/start_display_page5.action";
		}
		else if (dao.getChapter(dao.usIdToPjId(dto.getPid(), usId)) == 6)
		{
			view = "/start_display_page6.action";
		}
		else if (dao.getChapter(dao.usIdToPjId(dto.getPid(), usId)) == 7)
		{
			view = "/start_display_page7.action";
		}
		else if (dao.getChapter(dao.usIdToPjId(dto.getPid(), usId)) == 8)
		{
			view = "/start_display_page8.action";
		}
		else if (dao.getChapter(dao.usIdToPjId(dto.getPid(), usId)) == 9)
		{
			view = "/start_display_page9.action";
		}
		else if (dao.getChapter(dao.usIdToPjId(dto.getPid(), usId)) == 10)
		{
			view = "/team_main.action";
		}

		return view;

	}

	// -- 진행중 → 모집중 page1 담당 메소드
	@RequestMapping(value = "/start_display_page1.action", method = RequestMethod.GET)
	public String startDisplayPage1(Model model, @ModelAttribute("pid") int pid, @ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/Start_Display_Page1.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// chapter 1
		dao.chapterUpdate(1, dao.usIdToPjId(pid, usId));

		// 팀장 투표 발의
		if (dao.pidToProId(pid) == null || dao.pidToProId(pid) == 0)
			dao.leaderPropose(pid);

		// 투표마감기간
		model.addAttribute("startVoteEnd", dao.leaderVoteEnd(pid));

		return view;
	}

	// -- 진행중 → 모집중 page2 담당 메소드
	@RequestMapping(value = "/start_display_page2.action", method = RequestMethod.GET)
	public String startDisplayPage2(Model model, ProjectDTO dto, @ModelAttribute("pid") int pid,
			@ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/Start_Display_Page2.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// chapter 2
		dao.chapterUpdate(2, dao.usIdToPjId(pid, usId));

		ArrayList<ProjectDTO> memberInfo = new ArrayList<ProjectDTO>();

		for (Integer usid : dao.getMembersId(pid))
		{ // 유저 정보 얻어내는 메소드(프로젝트번호, 유저번호, 유저이름, 닉네임, 레벨)
			memberInfo.add(dao.proUserInfo(usid, pid));
		}

		// 해당 프로젝트 번호에 속해있는 팀원들의 정보 리스트
		model.addAttribute("member", memberInfo);

		return view;

	}

	// -- 프로젝트 관련 유저정보 리스트
	public ArrayList<ProjectDTO> getMembersInfo(int[] usIdArr, int pid)
	{
		ArrayList<ProjectDTO> memberInfo = new ArrayList<ProjectDTO>();

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		for (Integer usid : usIdArr)
		{ // 유저 정보 얻어내는 메소드(프로젝트번호, 유저번호, 유저이름, 닉네임, 레벨)
			memberInfo.add(dao.proUserInfo(usid, pid));
		}

		return memberInfo;
	}

	@RequestMapping(value = "/start_display_page3.action", method = RequestMethod.GET)
	public String startDisplayPage3(Model model, ProjectDTO dto, @ModelAttribute("pid") int pid,
			@ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/Start_Display_Page3.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// chapter 3
		dao.chapterUpdate(3, dao.usIdToPjId(pid, usId));

		// -- 투표 완료 키
		boolean completeKey = true;

		System.out.println("reTicket : " + dto.getReTicket());

		// -- 재투표로 됐을시에 재투표 진행했는지 여부 확인하기
//		if (dto.getReTicket() != 1 && dao.leaderPresent(pid) == 0)
//		{
//			int n = 0; // -- 루프변수 생성
//			int[] maxCount = new int[dao.reSelecterNumber(pid).size()];
//			int[] leader = new int[dao.reSelecterNumber(pid).size()];
//
//			// selecter 의 수만큼 루프
//			for (ProjectDTO selecte : dao.reSelecterNumber(pid))
//			{
//				maxCount[n] = selecte.getSelecterCount();
//				leader[n] = selecte.getSelecter(); // -- PJID 가 아닌 USID
//				if (n > 0 && maxCount[0] == maxCount[n])
//				{
//					leader[n] = selecte.getSelecter();
//				}
//				n++;
//			}
//			
//			// member.getPid() // 투표완료한 멤버들의 정보
//			System.out.println("=================구간1===================");
//			model.addAttribute("completeMembers", getMembersInfo(dao.completeVoteMembers(pid), pid));
//			// 투표 아직 진행중인 멤버들의 정보
//			System.out.println("=================구간2===================");
//			model.addAttribute("progressMembers", getMembersInfo(dao.progressVoteMembers(pid), pid));
//
//			// 뽑힌 사람들의 리스트(다중투표 포함)
//			System.out.println("=================구간3===================");
//			model.addAttribute("leaders", getMembersInfo(leader, pid));
//
//			return "/WEB-INF/views/Start_Display_Page4.jsp";
//		}

		// -- 투표완료한 인원중에 내가 있으면 completekey 를 false로
		for (int completeMember : dao.completeVoteMembers(pid))
		{
			if (completeMember == usId)
				completeKey = false;
		}

		if (completeKey)
		{
			// ----------------------------------------------------------------------------------------
			// voter, selecter 얻어낸 후 투표테이블에 등록하기
			// voter
			int voter = dao.usIdToPjId(pid, usId);
			// proId
			int proId = dao.pidToProId(pid);
			// selecter
			int selecter = dao.usIdToPjId(pid, dto.getSelecter());
			// 투표접수 완료

			dao.voteInsert(voter, selecter, proId);
			// ----------------------------------------------------------------------------------------
		}

		/* dto.getUsId() */
		// 본인의 selecter
		model.addAttribute("selecter", dao.proUserInfo(dto.getSelecter(), pid));

		/*
		 * // 프로젝트와 관련된 유저정보 출력 ProjectDTO member = dao.proUserInfo(dto.getUsId());
		 */

		// member.getPid() // 투표완료한 멤버들의 정보
		System.out.println("=================구간4===================");
		model.addAttribute("completeMembers", getMembersInfo(dao.completeVoteMembers(pid), pid));
		// 투표 아직 진행중인 멤버들의 정보
		System.out.println("=================구간5===================");
		model.addAttribute("progressMembers", getMembersInfo(dao.progressVoteMembers(pid), pid));

		// 프로젝트의 정해놓은 인원수 == 투표를 완료한 인원수
		// → 그대로 start_display_page3.action 으로 보내기
		if (dao.peopleNumber(pid) == dao.voteCompleteMember(pid).size())
		{
			int n = 0; // -- 루프변수 생성
			int[] maxCount = new int[dao.selecterNumber(pid).size()];
			int[] leader = new int[dao.selecterNumber(pid).size()];

			// selecter 의 수만큼 루프
			for (ProjectDTO selecte : dao.selecterNumber(pid))
			{
				maxCount[n] = selecte.getSelecterCount();
				leader[n] = selecte.getSelecter(); // -- PJID 가 아닌 USID
				if (n > 0 && maxCount[0] == maxCount[n])
				{
					leader[n] = selecte.getSelecter();
				}
				n++;
			}

			// 뽑힌 사람들의 리스트(다중투표 포함)
			System.out.println("=================구간6===================");
			model.addAttribute("leaders", getMembersInfo(leader, pid));

			if (n > 1)
			{
				// 투표 재발의
				dao.leaderPropose(pid);
				// 투표 재발의에 따른 투표한 멤버들의 정보
				System.out.println("=================구간7===================");
				model.addAttribute("completeMembers", getMembersInfo(dao.completeVoteMembers(pid), pid));
				// 투표 아직 진행중인 멤버들의 정보
				System.out.println("=================구간8===================");
				model.addAttribute("progressMembers", getMembersInfo(dao.progressVoteMembers(pid), pid));

				// 재투표 페이지로 보내기
				return "/WEB-INF/views/Start_Display_Page4.jsp";
			}

			// 해당 발의번호 입력
			dto.setProId(dao.pidToProId(pid));

			dto.setPjId(dao.usIdToPjId(pid, leader[0]));

			// 팀장 입력하기
			if (dao.leaderPresent(pid) == 0)
				dao.leaderInsert(dto);

			// 다음 단계로 보내기
			return "start_display_page5.action";

		}

		return view;
	}

	@RequestMapping(value = "/start_display_page5.action", method = RequestMethod.GET)
	public String startDisplayPage5(Model model, ProjectDTO dto, @ModelAttribute("pid") int pid,
			@ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/Start_Display_Page5.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// chapter 5
		dao.chapterUpdate(5, dao.usIdToPjId(pid, usId));

		return view;
	}

	@RequestMapping(value = "/start_display_page6.action", method = RequestMethod.GET)
	public String startDisplayPage6(Model model, @ModelAttribute("pid") int pid, @ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/Start_Display_Page6.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// chapter 6
		dao.chapterUpdate(6, dao.usIdToPjId(pid, usId));

		model.addAttribute("modeSelectEnd", dao.modeSelectEnd(pid));

		return view;
	}

	@RequestMapping(value = "/start_display_page7.action", method = RequestMethod.GET)
	public String startDisplayPage7(Model model, @ModelAttribute("usId") int usId, @ModelAttribute("pid") int pid)
	{
		String view = "/WEB-INF/views/Start_Display_Page7.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		if (dao.hasMode(pid) == 1)
		{
			return "start_display_page9.action";
		}

		// chapter 7
		dao.chapterUpdate(7, dao.usIdToPjId(pid, usId));

		// 팀장이면 8띄워주고
		if (dao.pjIdToUsId(dao.getLeaderInfo(pid).getPjId()) == usId) // pid 랑 usid 들어가야함
		{
			return "start_display_page8.action";
		}
		// 팀장아니면 7띄워주고

		return view;

	}

	@RequestMapping(value = "/start_display_page8.action", method = RequestMethod.GET)
	public String startDisplayPage8(Model model, @ModelAttribute("usId") int usId, @ModelAttribute("pid") int pid)
	{
		String view = "/WEB-INF/views/Start_Display_Page8.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// chapter 8
		dao.chapterUpdate(8, dao.usIdToPjId(pid, usId));

		return view;
	}

	@RequestMapping(value = "/start_display_page9.action", method = RequestMethod.GET)
	public String startDisplayPage9(Model model, ProjectDTO dto, @ModelAttribute("pid") int pid,
			@ModelAttribute("usId") int usId)
	{
		String view = "team_main.action";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// chapter 10
		dao.chapterUpdate(10, dao.usIdToPjId(pid, usId));

		// 모드 insert 하기-------------------------------
		if (dao.hasMode(pid) == 0)
		{
			// 팀장선출번호 넣기
			dto.setTfId(dao.getLeaderInfo(pid).getTfId());

			// 모드 insert
			dao.modeInsert(dto);
		}
		// ------------------------------------------------

		// 진행중 프로젝트 insert 하기--------------------

		// 모드번호 넣기
		dto.setMsId(dao.getModeMsId(pid));

		// 프로젝트 번호 넣기
		dto.setPid(pid);

		if (dao.createToProgress(pid) == null)
			// 진행중 프로젝트 insert
			dao.progressInsert(dto);
		// -----------------------------------------------

		// 알리미모드가 아닌이상 프로젝트 시작으로 보내기
		if (dto.getModeId() == 4)
		{
			// 회의록/업무일지 제출빈도 보내기
			model.addAttribute("reportFrequency", dao.reportFrequency());

			// 오라클을 포함하지 않았을 때 리스트
			model.addAttribute("reportList", dao.notOracleList());

			// 수행과제 리스트 보내기(회의록/업무일지 제외)
			for (int reportId : dao.proSkillList(pid)) // 여기에 pid 들어가야 함.
			{
				if (reportId >= 9 && reportId <= 15)
				{
					// 오라클을 포함했을 때의 리스트
					model.addAttribute("reportList", dao.reportArray());
					break;
				}
			}

			// chapter 9
			dao.chapterUpdate(9, dao.usIdToPjId(pid, usId));

			return "/WEB-INF/views/Start_Display_Page9.jsp";
		}

		return view;

	}

	// 결과 계산 메소드(프로젝트에 해당하는 팀원)
	public ProgressDTO resultCalculate(int pid, int usId)
	{
		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// exp, failCount 를 담기 위함
		ProgressDTO dto = new ProgressDTO();

		// 맨처음 기준이 되는 회의록/업무일지의 정보를 받아오기 위한 툴
		boolean meetKey = true;
		boolean logKey = true;

		// 회의록 관련 정보
		double meetSubmitCount = 0;
		double meetAvgScore = 0;
		int meetEvalCount = 0;

		// 업무일지 관련 정보
		double logSubmitCount = 0;
		double logAvgScore = 0;
		int logEvalCount = 0;

		// 회의록/ 업무일지를 제외한 나머지 수행과제 관련 정보
		int failCount = 0; // 기준을 넘지못했을 때 count 하여 fail 을 주기위함

		double eachSubmitCount = 0;
		double eachAvgScore = 0;
		int eachEvalCount = 0;

		// 수행과제들의 토탈 경험치가 될 예정
		double exp = 0;

		double eachExp = 0;

		// -- 제출된 모든 과제 경험치 계산!!--------------------------------------------

		for (ProgressDTO result : dao.endProjectReportList(pid))
		{
			// 업무일지일 경우
			if (dao.fsIdToSsId(result.getFsId()) == 2 && logKey)
			{
				logKey = false;
				logSubmitCount = result.getSubmitCount();
				logAvgScore = result.getGuideAvgScore();
				logEvalCount = result.getGuideAdviceCount();

				// 제때 제출을 했는지?
				if (logSubmitCount < 0)
				{
					if (logSubmitCount > -1)
						eachExp += result.getExp() * 0.8;
					else if (logSubmitCount > -2)
						eachExp += result.getExp() * 0.6;
					else if (logSubmitCount > -3)
						eachExp += result.getExp() * 0.4;
					else if (logSubmitCount > -4)
						eachExp += result.getExp() * 0.2;
					else
						eachExp += 0;
				}
				else
					eachExp += result.getExp();

				// 평가수가 15개 이상인지
				if (logEvalCount < 15)
				{
					if (logAvgScore >= 2 && logAvgScore < 3)
						eachExp += (Math.sqrt(logEvalCount / -60) + 1.5) * 0.6 * eachExp;
					else if (logAvgScore >= 3 && logAvgScore < 4)
						eachExp += (Math.sqrt(logEvalCount / 60) + 0.5) * 0.8 * eachExp;
					else if (logAvgScore >= 4 && logAvgScore <= 5)
						eachExp += (Math.sqrt(logEvalCount / 60) + 0.5) * eachExp;
					else
						eachExp += (Math.sqrt(logEvalCount / -60) + 1.5) * 0.2 * eachExp;

				}
				else
				{
					if (logAvgScore >= 2 && logAvgScore < 3)
						eachExp += 0.6 * eachExp;
					else if (logAvgScore >= 3 && logAvgScore < 4)
						eachExp += 0.8 * eachExp;
					else if (logAvgScore >= 4 && logAvgScore <= 5)
						eachExp += eachExp;
					else
						eachExp += 0;
				}

				exp += eachExp;

			}
			else if (dao.fsIdToSsId(result.getFsId()) == 2)
			{
				// 제때 제출을 했는지?
				if (logSubmitCount < 0)
				{
					if (logSubmitCount > -1)
						eachExp += result.getExp() * 0.8;
					else if (logSubmitCount > -2)
						eachExp += result.getExp() * 0.6;
					else if (logSubmitCount > -3)
						eachExp += result.getExp() * 0.4;
					else if (logSubmitCount > -4)
						eachExp += result.getExp() * 0.2;
					else
						eachExp += 0;
				}
				else
					eachExp += result.getExp();

				// 평가수가 15개 이상인지
				if (logEvalCount < 15)
				{
					if (logAvgScore >= 2 && logAvgScore < 3)
						eachExp += (Math.sqrt(logEvalCount / -60) + 1.5) * 0.6 * eachExp;
					else if (logAvgScore >= 3 && logAvgScore < 4)
						eachExp += (Math.sqrt(logEvalCount / 60) + 0.5) * 0.8 * eachExp;
					else if (logAvgScore >= 4 && logAvgScore <= 5)
						eachExp += (Math.sqrt(logEvalCount / 60) + 0.5) * eachExp;
					else
						eachExp += (Math.sqrt(logEvalCount / -60) + 1.5) * 0.2 * eachExp;

				}
				else
				{
					if (logAvgScore >= 2 && logAvgScore < 3)
						eachExp += 0.6 * eachExp;
					else if (logAvgScore >= 3 && logAvgScore < 4)
						eachExp += 0.8 * eachExp;
					else if (logAvgScore >= 4 && logAvgScore <= 5)
						eachExp += eachExp;
					else
						eachExp += 0;
				}

				exp += eachExp;

			}
			// 회의록일 경우
			else if (dao.fsIdToSsId(result.getFsId()) == 2 && meetKey)
			{
				meetKey = false;
				meetSubmitCount = result.getSubmitCount();
				meetAvgScore = result.getGuideAvgScore();
				meetEvalCount = result.getGuideAdviceCount();

				// 제때 제출을 했는지?
				if (meetSubmitCount < 0)
				{
					if (meetSubmitCount > -1)
						eachExp += result.getExp() * 0.8;
					else if (meetSubmitCount > -2)
						eachExp += result.getExp() * 0.6;
					else if (meetSubmitCount > -3)
						eachExp += result.getExp() * 0.4;
					else if (meetSubmitCount > -4)
						eachExp += result.getExp() * 0.2;
					else
						eachExp += 0;
				}
				else
					eachExp += result.getExp();

				// 평가수가 15개 이상인지
				if (meetEvalCount < 15)
				{
					if (meetAvgScore >= 2 && meetAvgScore < 3)
						eachExp += (Math.sqrt(meetEvalCount / -60) + 1.5) * 0.6 * eachExp;
					else if (meetAvgScore >= 3 && meetAvgScore < 4)
						eachExp += (Math.sqrt(meetEvalCount / 60) + 0.5) * 0.8 * eachExp;
					else if (meetAvgScore >= 4 && meetAvgScore <= 5)
						eachExp += (Math.sqrt(meetEvalCount / 60) + 0.5) * eachExp;
					else
						eachExp += (Math.sqrt(meetEvalCount / -60) + 1.5) * 0.2 * eachExp;

				}
				else
				{
					if (meetAvgScore >= 2 && meetAvgScore < 3)
						eachExp += 0.6 * eachExp;
					else if (meetAvgScore >= 3 && meetAvgScore < 4)
						eachExp += 0.8 * eachExp;
					else if (meetAvgScore >= 4 && meetAvgScore <= 5)
						eachExp += eachExp;
					else
						eachExp += 0;
				}

				exp += eachExp;

			}
			else if (dao.fsIdToSsId(result.getFsId()) == 2)
			{
				// 제때 제출을 했는지?
				if (meetSubmitCount < 0)
				{
					if (meetSubmitCount > -1)
						eachExp += result.getExp() * 0.8;
					else if (meetSubmitCount > -2)
						eachExp += result.getExp() * 0.6;
					else if (meetSubmitCount > -3)
						eachExp += result.getExp() * 0.4;
					else if (meetSubmitCount > -4)
						eachExp += result.getExp() * 0.2;
					else
						eachExp += 0;
				}
				else
					eachExp += result.getExp();

				// 평가수가 15개 이상인지
				if (meetEvalCount < 15)
				{
					if (meetAvgScore >= 2 && meetAvgScore < 3)
						eachExp += (Math.sqrt(meetEvalCount / -60) + 1.5) * 0.6 * eachExp;
					else if (meetAvgScore >= 3 && meetAvgScore < 4)
						eachExp += (Math.sqrt(meetEvalCount / 60) + 0.5) * 0.8 * eachExp;
					else if (meetAvgScore >= 4 && meetAvgScore <= 5)
						eachExp += (Math.sqrt(meetEvalCount / 60) + 0.5) * eachExp;
					else
						eachExp += (Math.sqrt(meetEvalCount / -60) + 1.5) * 0.2 * eachExp;

				}
				else
				{
					if (meetAvgScore >= 2 && meetAvgScore < 3)
						eachExp += 0.6 * eachExp;
					else if (meetAvgScore >= 3 && meetAvgScore < 4)
						eachExp += 0.8 * eachExp;
					else if (meetAvgScore >= 4 && meetAvgScore <= 5)
						eachExp += eachExp;
					else
						eachExp += 0;
				}

				exp += eachExp;

			}
			else
			{

				eachSubmitCount = result.getSubmitCount();
				eachAvgScore = result.getGuideAvgScore();
				eachEvalCount = result.getGuideAdviceCount();

				boolean failKey = false; // exp 가 0 이되었으면 failKey 를 true 로 줌

				// 제때 제출을 했는지?
				if (eachSubmitCount < 0)
				{
					if (eachSubmitCount > -1)
						eachExp += result.getExp() * 0.8;
					else if (eachSubmitCount > -2)
						eachExp += result.getExp() * 0.6;
					else if (eachSubmitCount > -3)
						eachExp += result.getExp() * 0.4;
					else if (eachSubmitCount > -4)
						eachExp += result.getExp() * 0.2;
					else
					{
						eachExp += 0;
						failCount++;
						failKey = true;
					}

				}
				else
					eachExp += result.getExp();

				// 평가수가 15개 이상인지
				if (eachEvalCount < 15 && !failKey)
				{
					if (eachAvgScore >= 2 && eachAvgScore < 3)
						eachExp += (Math.sqrt(eachEvalCount / -60) + 1.5) * 0.6 * eachExp;
					else if (eachAvgScore >= 3 && eachAvgScore < 4)
						eachExp += (Math.sqrt(eachEvalCount / 60) + 0.5) * 0.8 * eachExp;
					else if (eachAvgScore >= 4 && eachAvgScore <= 5)
						eachExp += (Math.sqrt(eachEvalCount / 60) + 0.5) * eachExp;
					else
						eachExp += (Math.sqrt(eachEvalCount / -60) + 1.5) * 0.2 * eachExp;

				}
				else if (eachEvalCount >= 15 && !failKey)
				{
					if (eachAvgScore >= 2 && eachAvgScore < 3)
						eachExp += 0.6 * eachExp;
					else if (eachAvgScore >= 3 && eachAvgScore < 4)
						eachExp += 0.8 * eachExp;
					else if (eachAvgScore >= 4 && eachAvgScore <= 5)
						eachExp += eachExp;
					else
					{
						eachExp += 0;
						failCount++;
					}

				}

				exp += eachExp;
			}

		} // for

		// 모드자체경험치 더하기
		exp += dao.getModeExp(pid);

		// return 할 exp, failCount 담기

		dto.setExp(exp);
		dto.setFailCount(failCount);

		return dto;

	}

	// 팀원들에게 보이는 메인페이지
	@RequestMapping("/team_main.action")
	public String teamMainPage(Model model, ProgressDTO dto, @ModelAttribute("usId") int usId,
			@ModelAttribute("pid") int pid)// @ModelAttribute("prId") int prId
	{
		String view = "/WEB-INF/views/Team_Main.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		dao.chapterUpdate(10, dao.usIdToPjId(pid, usId));

		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		model.addAttribute("usPhoto", dao2.getUsPhoto(usId));

		// 팀장인지, 팀원인지, 객원인지 번호 보내기--------------------------
		// 객원
		if (dao.proUserInfo(usId, pid) == null)
		{
			model.addAttribute("grade", 3);

			// 기간 지났을 때 번호부여 받아야함.(이때부터 평가 가능)
		}
		// 팀장
		else if (dao.pjIdToUsId(dao.getLeaderInfo(pid).getPjId()) == usId)
		{
			model.addAttribute("grade", 1);

			// 평가 불가능 키 줘야함

			// 기간 완료 키 있어야 함
		}
		// 팀원
		else
		{
			model.addAttribute("grade", 2);

			// 평가불가능 키 줘야함
		}
		// --------------------------------------------------------------------

		// 프로젝트가 종료되었는지--------------------------------------------

		/*
		 * if (dao.projectEvalCount(pid) <= -14) { model.addAttribute("endKey", 1);
		 * 
		 * if (dao.hasEvalEnd(pid) != 1) { // 결과 입력하는 페이지로 보내기 return
		 * "project_result_submit.action";
		 * 
		 * }
		 */

		/*
		 * if (dao.hasEndCheck(pid, usId) != 1) { // 결과 보여주는는 페이지로 보내기 return
		 * "project_result_view.action"; } // 프로젝트 종료된 후 평가가 끝났는지 else if
		 * (dao.projectEvalCount(pid) <= 0) model.addAttribute("evalKey", 1);
		 */

		// --------------------------------------------------------------------

		// 퇴출투표가 진행중인지 거르기(기간이 끝나지 않은 발의된 투표인지)
		if (dao.memberOutVoteIng(pid) == 1 && dao.isKickVoteCheck(dao.usIdToPjId(pid, usId)) != 1)
		{
			// 타겟이 아닌경우
			if (dao.pjIdToUsId(dao.memberOutVoteInfo(pid).getPjId()) != usId)
			{
				// 투표를 아직 진행안한경우(pid, usid)
				if (dao.outVoteEndMember(pid, usId) == 0)
					return "redirect:member_out_vote_start.action";
				// 모든인원이 투표를 했으면서, 결과가 없는 발의번호일 경우
				else if ((dao.peopleNumber(pid) - 1) == dao.outVoteEndList(pid).size()
						&& dao.hasOutVoteResult(pid) == 0)
					return "redirect:member_out_result_ok.action";
				// 결과가 있는 발의번호일 경우 이면서 결과확인을 안한 경우
				else if (dao.hasOutVoteResult(pid) == 1 && dao.isKickVoteCheck(dao.usIdToPjId(pid, usId)) != 1)
					return "redirect:member_out_vote_result.action";
			}
			else
			{
				// 퇴출 결과 보내기
				if (dao.hasOutVoteResult(pid) == 1
						&& dao.outVoteResultCount(pid, 1) >= dao.peopleNumber(pid) / (double) 2)
				{
					return "redirect:team_exit.action?outCase=2";
				}
			}

		}

		// 팀해체 투표가 진행중인지 거르기(기간이 끝나지 않은 발의된 투표인지)
		if (dao.teamRemoveVoteIng(pid) == 1 && dao.isDestroyVoteCheck(dao.usIdToPjId(pid, usId)) != 1)
		{
			// 투표를 아직 진행안한경우(pid, usid)
			if (dao.removeVoteEndMember(pid, usId) == 0)
				return "redirect:team_remove_start.action";
			// 모든인원이 투표를 했으면서, 결과가 없는 발의번호일 경우
			else if ((dao.peopleNumber(pid) - 1) == dao.removeVoteEndCount(pid) && dao.hasRemoveVoteResult(pid) == 0)
				return "redirect:team_remove_result_ok.action";
			// 결과가 있는 발의번호일 경우
			else if (dao.hasRemoveVoteResult(pid) == 1 && dao.isDestroyVoteCheck(dao.usIdToPjId(pid, usId)) != 1)
				return "redirect:team_remove_result.action";

		}

		// 멤버 퇴출투표 진행중 여부 확인하는 key 보내기
		model.addAttribute("memberOutKey", dao.memberOutVoteIng(pid));

		// 팀해체투표 진행중 여부 확인하는 key 보내기
		model.addAttribute("teamRemoveKey", dao.teamRemoveVoteIng(pid));

		// 내 정보 보내기(usId, pid)
		model.addAttribute("myInfo", dao.proUserInfo(usId, pid));

		/* model.addAttribute("pid", pid); */

		// -------------------진행중 정보 --------------------------------------
		model.addAttribute("progressInfo", dao.progressInfo(pid));

		// 모드
		model.addAttribute("modeName", dao.getModeName(pid));

		// 스킬
		model.addAttribute("skillNames", dao.proSkillNames(pid));

		// 팀원들 정보
		model.addAttribute("member", getMembersInfo(dao.getMembersId(pid), pid));
		// ---------------------------------------------------------------------

		// --------------------타임라인-------------------------------------
		if (dto.getTimeLineKey() == 0)
		{
			ArrayList<ProgressDTO> timeLineList = new ArrayList<ProgressDTO>();

			for (ProgressDTO dto1 : dao.timeLineList(pid))
			{
				// 해시태그 넣기
				dto1.setHashTag(dao.hashTagList(dto1.getTid()));

				timeLineList.add(dto1);
			}
			// 타임라인 보내기
			// ---------------------------------------------------------------------------------
			model.addAttribute("timeLineList", timeLineList);
			// 타임라인 비공개여부 보내기
			model.addAttribute("hasLock", dao.hasTimeLineLock(pid));

		}
		else if (dto.getTimeLineKey() == 1)
		{
			// ---------------------타임라인 검색리스트 보내기------------------
			ArrayList<ProgressDTO> timeLineList = new ArrayList<ProgressDTO>();

			for (ProgressDTO dto1 : dao.timeLineSearchList(pid, dto.getHashName()))
			{
				// 해시태그 넣기
				dto1.setHashTag(dao.hashTagList(dto1.getTid()));

				timeLineList.add(dto1);
			}
			// 타임라인 보내기
			// ---------------------------------------------------------------------------------
			model.addAttribute("timeLineList", timeLineList);
			// 타임라인 비공개여부 보내기
			model.addAttribute("hasLock", dao.hasTimeLineLock(pid));
		}
		// 타임라인 보여주기 관련 pid 보내기
		model.addAttribute("pid", pid);

		// -----------------------------------------------------------------

		// ---------------------방명록--------------------------------------
		model.addAttribute("visitorList", dao.visitorList(pid));
		// -----------------------------------------------------------------

		// -------------------수행과제--------------------------------------
		model.addAttribute("reportList", dao.reportList());

		// 프로젝트 번호로 모드번호 얻기
		int modeNum = dao.getModeNum(pid);
		int periodNum = dao.getPeriodNum(pid);

		System.out.println("일단 여긴 통과~!!!");

		// 제출할 과제 선택할 수 있는 리스트에 회의록, 업무일지 리스트(번호, 이름) 담기
		ArrayList<ProgressDTO> beforeSubmitList = dao.getLogReportId(modeNum, periodNum);

		// -- 업무일지의 제출기간이 아직 안되었을 때 제출을 못하게 하는 key()
		model.addAttribute("meetKey", dao.guideMeetLogSubmitCount(pid, 2));

		// -- 회의록 제출기간이 아직 안되었을 때 제출을 못하게 하는 key
		model.addAttribute("logKey", dao.guideMeetLogSubmitCount(pid, 1));

		if (dao.getMinGpId(modeNum, periodNum) > dao.getMaxGpId(pid) || dao.getMaxGpId(pid) == 0)
		{
			// 회의록, 업무일지 다음으로 제일 첫번째 단계의 수행과제를 리스트에 담기.
			beforeSubmitList.add(dao.guideReportOne(modeNum, periodNum, dao.getMinGpId(modeNum, periodNum)));

			if (dao.proUserInfo(usId, pid) != null)
			{
				if (dao.guideSubmitCount(pid, dao.getMinGpId(modeNum, periodNum)) <= 0)
				{
					model.addAttribute("reportMessage",
							dao.guideReportOne(modeNum, periodNum, dao.getMinGpId(modeNum, periodNum)).getSsName()
									+ "의 제출일자가 지났습니다. 얼른 제출해주세요!");
				}
				else
				{
					model.addAttribute("reportMessage",
							dao.guideReportOne(modeNum, periodNum, dao.getMinGpId(modeNum, periodNum)).getSsName()
									+ "의 제출일자가 " + dao.guideSubmitCount(pid, dao.getMinGpId(modeNum, periodNum))
									+ "남았습니다.");
				}

			}

		}
		else
		{
			// 회의록, 업무일지를 제외한 다른 과제들이 제출이 되어 있으므로 다음단계의 수행과제를 리스트에 담기.
			beforeSubmitList.add(dao.guideReportOne(modeNum, periodNum, dao.getMaxGpId(pid) + 1));
			if (dao.proUserInfo(usId, pid) != null)
			{
				if (dao.getMaxGpId(pid) + 1 == 370)
				{
					model.addAttribute("reportMessage", "모든 수행과제 제출이 완료되었습니다.");
				}
				else if (dao.guideSubmitCount(pid, dao.getMaxGpId(pid) + 1) <= 0)
				{
					model.addAttribute("reportMessage",
							dao.guideReportOne(modeNum, periodNum, dao.getMaxGpId(pid) + 1).getSsName()
									+ "의 제출일자가 지났습니다. 얼른 제출해주세요!");
				}
				else
				{
					model.addAttribute("reportMessage",
							dao.guideReportOne(modeNum, periodNum, dao.getMaxGpId(pid) + 1).getSsName() + "의 제출일자가 "
									+ dao.guideSubmitCount(pid, dao.getMaxGpId(pid) + 1) + "남았습니다.");
				}

			}

		}

		// 아직 제출하기 전인 수행과제 리스트 출력
		model.addAttribute("beforeSubmitList", beforeSubmitList);

		// 제출된 수행과제 리스트 출력
		model.addAttribute("afterSubmitList", dao.afterSubmitList(pid));

		// -----------------------------------------------------------------

		return view;

	}

	// -- 타임라인 등록
	@RequestMapping(value = "/timelineinsert.action", method = RequestMethod.POST)
	public String timeLineInsert(Model model, ProgressDTO dto, HttpServletRequest request,
			@ModelAttribute("usId") int usId, @ModelAttribute("pid") int pid)
	{
		String view = "redirect:team_main.action";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// -- 본인 유저참여번호 넣기
		dto.setPjId(dao.usIdToPjId(pid, usId));

		// ------------파일업로드 셋팅 -------------------------
		String root = request.getServletContext().getRealPath("/");
		String savePath = root + File.separator + "timeline" + File.separator + "pid" + pid + File.separator + "member"
				+ usId;

		File dir = new File(savePath);

		if (!dir.exists())
		{
			dir.mkdirs();
		}

		String encType = "UTF-8";
		int maxFileSize = 5 * 1024 * 1024;

		try
		{
			MultipartRequest req = null;
			req = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());

			String saveFileName = req.getFilesystemName("pfile");
			int pId = Integer.parseInt(req.getParameter("pid"));

			// 프로젝트 번호 주입
			dto.setPid(pId);

			// content 주입
			dto.setContent(req.getParameter("content"));

			// hashTagLine 주입
			dto.setHashTagLine(req.getParameter("hashTagLine"));

			dto.setPfile(saveFileName);
			System.out.println(saveFileName);

		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}

		// -----------------------------------------------------

		// -- 타임라인 등록
		dao.timeLineInsert(dto);

		// -- 해시태그를 넣기위한 dto 객체 생성
		ProgressDTO hashTagSet = new ProgressDTO();

		// -- dto 에 가장최근등록한 tid 넣기(usid, pid)
		hashTagSet.setTid(dao.recentTimeLine(usId, pid));

		// -- 해시태그 분할하기
		for (String hashName : dto.getHashTagLine().split(" "))
		{
			hashTagSet.setHashName(hashName);

			dao.hashTagInsert(hashTagSet);
		}

		return view;
	}

	// -- 타임라인 수정
	// -- 타임라인 삭제
	@RequestMapping(value = "/timelinedelete.action", method = RequestMethod.GET)
	public String timeLineDelete(Model model, ProgressDTO dto)
	{
		String view = "redirect:team_main.action";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// 타임라인 삭제
		dao.timeLineDelete(dto.getTid());

		return view;
	}

	// -- 타임라인 비공개 설정
	// -- ajax 처리
	@RequestMapping(value = "/timeline_lock.action", method = RequestMethod.POST)
	public String timeLineLockCont(Model model, @ModelAttribute("pid") int pid)
	{
		String view = "/WEB-INF/views/Ajax_Timeline_Lock.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// 타임라인 비공개 되어있는지여부 확인하기
		if (dao.hasTimeLineLock(pid) == 1)
			dao.timeLineLockDelete(pid);
		else
			dao.timeLineLockInsert(dao.createToProgress(pid));

		return view;

	}

	// -- 방명록 등록
	@RequestMapping(value = "/visitorinsert.action", method = RequestMethod.GET)
	public String visitorInsert(Model model, ProgressDTO dto)
	{
		String view = "redirect:team_main.action";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// -- 방명록 등록
		dao.visitorInsert(dto);

		return view;
	}

	// -- 방명록 수정
	// -- 방명록 삭제
	@RequestMapping(value = "/visitordelete.action", method = RequestMethod.GET)
	public String visitorDelete(Model model, ProgressDTO dto)
	{
		String view = "redirect:team_main.action";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// -- 방명록 삭제
		dao.visitorDelete(dto.getVid());

		return view;

	}

	// -- 수행과제 제출
	// --※ 파일업로드 포함
	@RequestMapping(value = "/reportsubmit.action", method = RequestMethod.POST)
	public String reportSubmitCont(Model model, ProgressDTO dto, HttpServletRequest request,
			@ModelAttribute("pid") int pid, @ModelAttribute("usId") int usId)
	{
		String view = "redirect:team_main.action";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// ------------파일업로드 셋팅 -------------------------
		String root = request.getServletContext().getRealPath("/");
		String savePath = root + File.separator + "submitReport" + File.separator + "pid" + pid;

		System.out.println(savePath);

		File dir = new File(savePath);

		if (!dir.exists())
		{
			dir.mkdirs();
		}

		String encType = "UTF-8";
		int maxFileSize = 5 * 1024 * 1024;

		try
		{
			MultipartRequest req = null;
			req = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());

			String saveFileName = req.getFilesystemName("pfile");
			int gpId = Integer.parseInt(req.getParameter("gpId"));

			dto.setGpId(gpId);

			dto.setPfile(saveFileName);
			System.out.println(saveFileName);

		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}

		// -----------------------------------------------------

		System.out.println(dto.getGpId());

		// ppid
		dto.setPpid(dao.createToProgress(pid));

		// pjid
		dto.setPjId(dao.usIdToPjId(pid, usId));

		// 수행과제 제출
		dao.reportSubmit(dto);

		return view;

	}

	@RequestMapping(value = "/advicelist.action", method = RequestMethod.GET)
	public String adviceList(Model model, ProgressDTO dto, @ModelAttribute("pid") int pid,
			@ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/AdviceList.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		model.addAttribute("usPhoto", dao2.getUsPhoto(usId));

		// 조회수 증가
		dao.guideSubmitClick(dto.getFsId());

		// 해당 과제제출 번호에 따른 평가 리스트
		model.addAttribute("adviceList", dao.getAdviceList(dto.getFsId()));

		model.addAttribute("ppName", dao.progressInfo(pid).getPpName());

		// 해당 과제제출 번호에 따른 과제명 및 첨부파일
		ArrayList<ProgressDTO> meetOrLog = new ArrayList<ProgressDTO>();

		String urlFile = null;

		ProgressDTO reportNfile = null;

		// 회의록 or 업무일지일 경우 리스트로 보내기
		if (dao.fsIdToSsId(dto.getFsId()) == 1 || dao.fsIdToSsId(dto.getFsId()) == 2) // 업무일지 or 회의록
		{

			int gpNum = dao.fsIdToArray(dto.getFsId()).length;

			// 회의록 or 업무일지의 제목 및 첨부파일을 리스트에 담기
			for (Integer fsid : dao.fsIdToArray(dto.getFsId()))
			{
				reportNfile = new ProgressDTO();
				// -- 파일 정보 보내기
				// -------------------------------------------------------------------------------
				urlFile = "Report_Download.jsp?saveFileName=" + dao.getReportNFile(fsid).getPfile();
				urlFile += "&originalFileName=" + null + "&pid=" + pid; // pid 입력

				// 저장된 과제명 담기
				reportNfile.setSsName(dao.getReportNFile(fsid).getSsName());

				// 다운로드 경로 담기
				reportNfile.setUrlFile(urlFile);

				// 저장된 파일이름 담기
				reportNfile.setPfile(dao.getReportNFile(fsid).getPfile());

				// 제출된 순서 담기
				reportNfile.setGpNum(gpNum--);
				// --------------------------------------------------------------------------------------------------

				meetOrLog.add(reportNfile);

			}

			model.addAttribute("reportNfileList", meetOrLog);
			model.addAttribute("listKey", 1);
		}
		else
		{
			reportNfile = new ProgressDTO();

			// -- 파일 정보 보내기
			// -------------------------------------------------------------------------------
			urlFile = "Report_Download.jsp?saveFileName=" + dao.getReportNFile(dto.getFsId()).getPfile();
			urlFile += "&originalFileName=" + null + "&pid=" + pid; // pid 입력

			// 저장된 과제명 담기
			reportNfile.setSsName(dao.getReportNFile(dto.getFsId()).getSsName());

			// 다운로드 경로 담기
			reportNfile.setUrlFile(urlFile);

			// 저장된 파일이름 담기
			reportNfile.setPfile(dao.getReportNFile(dto.getFsId()).getPfile());

			// --------------------------------------------------------------------------------------------------

			model.addAttribute("reportNfile", reportNfile);
			model.addAttribute("listKey", 0);

		}

		// 과제제출번호 보내기
		model.addAttribute("fsId", dto.getFsId());

		// 내 정보 보내기
		model.addAttribute("myInfo", dao.proUserInfo(usId, pid));

		return view;

	}

	@RequestMapping(value = "/guideadviceinsert.action", method = RequestMethod.GET)
	public String guideAdviceInsertCont(Model model, ProgressDTO dto)
	{
		String view = "redirect:team_main.action";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// 가이드챌린지 과제에 대한 평가 등록 정보 입력
		dao.guideAdviceInsert(dto);

		return view;
	}

	@RequestMapping(value = "/guideadvicedelete.action", method = RequestMethod.GET)
	public String guideAdviceDeleteCont(Model model, ProgressDTO dto)
	{
		String view = "redirect:team_main.action";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// 가이드챌린지 과제에 대한 평가 삭제
		dao.guideAdviceDelete(dto.getSaId());

		return view;
	}

	// ajax : 공감하기 토글 구현
	@RequestMapping(value = "/guidelikecheck.action", method = RequestMethod.POST)
	public String guideLikeOkCont(Model model, ProgressDTO dto)
	{
		String view = "/WEB-INF/views/Ajax_GuideLikeOk.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		System.out.println(dto.getSaId() + " : " + dto.getUsId());

		System.out.println(dao.guideLikeOk(dto));

		if (dao.guideLikeOk(dto) == 1)
		{
			dao.guideLikeDelete(dto);
			model.addAttribute("guideLikeCount", dao.guideLikeCount(dto.getSaId()));
			System.out.println(dao.guideLikeCount(dto.getSaId()));
		}
		else if (dao.guideLikeOk(dto) == 0)
		{
			dao.guideLikeInsert(dto);
			model.addAttribute("guideLikeCount", dao.guideLikeCount(dto.getSaId()));
			System.out.println(dao.guideLikeCount(dto.getSaId()));
		}
		else
		{
			dao.guideLikeDelete(dto);
			model.addAttribute("guideLikeCount", dao.guideLikeCount(dto.getSaId()));
			System.out.println(dao.guideLikeCount(dto.getSaId()));
		}

		return view;

	}

	// 멤버 퇴출투표 발의
	@RequestMapping(value = "/member_out_propose.action", method = RequestMethod.GET)
	public String memberOutVoteCont(Model model, ProgressDTO dto, @ModelAttribute("pid") int pid,
			@ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/Member_Out_Propose.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		IUserDAO dao1 = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao1.getUsPhoto(usId));

		ArrayList<ProjectDTO> memberInfo = new ArrayList<ProjectDTO>();

		for (Integer usid : dao.getMembersId(pid))
		{ // 유저 정보 얻어내는 메소드(프로젝트번호, 유저번호, 유저이름, 닉네임, 레벨)
			// 팀장 or 개설자인 경우 퇴출투표 리스트에 포함되지 않도록 하는 조건
			if (usid != usId)
				memberInfo.add(dao.proUserInfo(usid, pid));
		}

		// 해당 프로젝트 번호에 속해있는 팀원들의 정보 리스트
		model.addAttribute("member", memberInfo);

		model.addAttribute("myInfo", dao.proUserInfo(usId, pid));

		// 개설할 시 투표 종료일자 찍어주기
		model.addAttribute("memberOutVoteEnd", dao.memberOutVoteEnd());

		return view;

	}

	@RequestMapping(value = "/member_out_propose_ok.action", method = RequestMethod.GET)
	public String memberOutProposeOkCont(Model model, ProgressDTO dto)
	{
		String view = "redirect:member_out_vote_start.action";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// usId → pjId 로 변환하기
		dto.setPjId(dao.usIdToPjId(dto.getPid(), dto.getUsId()));

		// 퇴출투표 실시
		dao.memberOutVoteInsert(dto);

		return view;

	}

	// -- 멤버 퇴출투표 시작
	@RequestMapping(value = "/member_out_vote_start.action", method = RequestMethod.GET)
	public String memberOutStartCont(Model model, ProgressDTO dto, @ModelAttribute("pid") int pid,
			@ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/Member_Out_Vote_Start.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		IUserDAO dao3 = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao3.getUsPhoto(usId));

		// 투표 남은시간 알려주기(일, 시, 분, 초)
		model.addAttribute("remainTime", dao.outVoteRemainTime(pid));
		/*
		 * System.out.println(dao.outVoteRemainTime(3).getOutDays());
		 * System.out.println(dao.outVoteRemainTime(3).getOutHours());
		 * System.out.println(dao.outVoteRemainTime(3).getOutMinutes());
		 * System.out.println(dao.outVoteRemainTime(3).getOutSeconds());
		 */
		// 해당 인원에 대한 정보 알려주기
		model.addAttribute("targetInfo", dao.proUserInfo(dao.pjIdToUsId(dao.memberOutVoteInfo(pid).getPjId()), pid));

		// 해당 인원에 대한 사유
		model.addAttribute("targetReason", dao.memberOutVoteInfo(pid).getPreason());

		return view;

	}

	// 투표 insert
	@RequestMapping(value = "/member_out_vote_ok.action", method = RequestMethod.GET)
	public String memberOutVoteOkCont(Model model, ProgressDTO dto, @ModelAttribute("usId") int usId,
			@ModelAttribute("pid") int pid)
	{
		String view = "redirect:team_main.action";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// 본인 usId 를 pjId 로 바꾸기
		dto.setPjId(dao.usIdToPjId(pid, usId));

		// 발의번호 넣기
		dto.setPkpId(dao.memberOutVoteInfo(pid).getPkpId());

		// 퇴출투표 submit하기
		dao.memberOutVoteSubmit(dto);

		return view;

	}

	// 퇴출투표 결과 테이블에 insert 하기
	@RequestMapping(value = "/member_out_result_ok.action", method = RequestMethod.GET)
	public String memberOutResultOkcont(Model model, ProgressDTO dto, @ModelAttribute("pid") int pid)
	{
		String view = "redirect:member_out_vote_result.action";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// 결과 입력
		dao.outVoteResultInsert(dao.memberOutVoteInfo(pid).getPkpId());

		// 찬성표가 과반수 이상이면 퇴출
		if (dao.outVoteResultCount(pid, 1) >= dao.peopleNumber(pid) / (double) 2)
		{
			// -- 퇴출당한 멤버 경험치 까기
			ProgressDTO kickMember = new ProgressDTO();

			kickMember.setExp(-dao.getModeExp(pid));

			kickMember.setUsId(dao.pjIdToUsId(dao.memberOutVoteInfo(pid).getPjId()));

			dao.stackExpInsert(kickMember);

			// -- 프로젝트에서 퇴출
			dao.proExitInsert(dao.memberOutVoteInfo(pid).getPjId());
		}

		return view;
	}

	// 모든 인원이 투표를 다 마친후 결과가 입력되었을 경우
	@RequestMapping(value = "/member_out_vote_result.action", method = RequestMethod.GET)
	public String memberOutVoteResultCont(Model model, ProgressDTO dto, @ModelAttribute("pid") int pid,
			@ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/Member_Out_Vote_Result.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// 확인했다는 표시 update
		dao.kickVoteCheckUpdate(dao.usIdToPjId(pid, usId));

		// 찬성, 반대, 무효표 수 보내기
		model.addAttribute("yes", dao.outVoteResultCount(pid, 1));
		model.addAttribute("no", dao.outVoteResultCount(pid, 2));
		model.addAttribute("noAnswer", dao.outVoteResultCount(pid, 3));
		// 퇴출투표 결과 일자
		model.addAttribute("resultDate", dao.outVoteResultInfo(pid).getPkDate());

		// 찬성표가 과반수 이상인지?
		if (dao.outVoteResultCount(pid, 1) >= dao.peopleNumber(pid) / (double) 2)
		{
			// 팀원 퇴출 결과 출력
			model.addAttribute("target", dao.getUserNickName(dao.pjIdToUsId(dao.memberOutVoteInfo(pid).getPjId())));
			model.addAttribute("message", " 님이 퇴출되었습니다.");

		}
		else
		{
			// 부결 결과 출력
			model.addAttribute("message", "퇴출투표가 부결되었습니다.");
		}

		return view;

	}

	// 팀 해체 버튼 클릭시
	@RequestMapping(value = "team_remove_propose.action", method = RequestMethod.GET)
	public String teamRemoveVoteProposeCont(Model model, ProgressDTO dto, @ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/Team_Remove_Propose.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		IUserDAO dao1 = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao1.getUsPhoto(usId));

		// 개설할 시 투표 종료일자 찍어주기
		model.addAttribute("voteEnd", dao.memberOutVoteEnd());

		return view;

	}

	// 팀 해체 투표발의버튼 클릭시
	@RequestMapping(value = "/team_remove_propose_ok.action", method = RequestMethod.GET)
	public String teamRemoveVoteProposeOkCont(Model model, ProgressDTO dto, @ModelAttribute("pid") int pid)
	{
		String view = "redirect:team_remove_start.action";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// 팀해체 투표 발의
		dao.teamRemoveVotePropose(dao.createToProgress(pid));

		return view;

	}

	// -- 팀해체투표 시작
	@RequestMapping(value = "/team_remove_start.action", method = RequestMethod.GET)
	public String teamRemoveStartCont(Model model, ProgressDTO dto, @ModelAttribute("pid") int pid)
	{
		String view = "/WEB-INF/views/Team_Remove_Start.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// 투표 남은시간 알려주기(일, 시, 분, 초)
		model.addAttribute("remainTime", dao.removeVoteRemainTime(pid));
		/*
		 * System.out.println(dao.outVoteRemainTime(3).getOutDays());
		 * System.out.println(dao.outVoteRemainTime(3).getOutHours());
		 * System.out.println(dao.outVoteRemainTime(3).getOutMinutes());
		 * System.out.println(dao.outVoteRemainTime(3).getOutSeconds());
		 */
		return view;

	}

	// 투표 insert
	@RequestMapping(value = "/team_remove_start_ok.action", method = RequestMethod.GET)
	public String teamRemoveStartOkCont(Model model, ProgressDTO dto, @ModelAttribute("usId") int usId,
			@ModelAttribute("pid") int pid)
	{
		String view = "redirect:team_main.action";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// 본인 usId 를 pjId 로 바꾸기
		dto.setPjId(dao.usIdToPjId(pid, usId));

		// 발의번호 넣기
		dto.setDeId(dao.getTeamRemoveNum(pid));

		// 해체투표 제출하기
		dao.teamRemoveVoteSubmit(dto);

		return view;

	}

	// 팀해체 투표 결과 테이블에 insert 하기
	@RequestMapping(value = "/team_remove_result_ok.action", method = RequestMethod.GET)
	public String teamRemoveResultOkcont(Model model, ProgressDTO dto, @ModelAttribute("pid") int pid)
	{
		String view = "redirect:team_remove_result.action";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// 결과 입력
		dao.removeVoteResultInsert(dao.getTeamRemoveNum(pid));

		// 찬성표가 과반수 이상이면 프로젝트 삭제
		if (dao.removeVoteResultCount(pid, 1) >= dao.peopleNumber(pid) / (double) 2)
		{
			ProgressDTO expcut = null;

			// 경험치 삭감(팀원전체)
			for (Integer usid : dao.getMembersId(pid))
			{
				expcut = new ProgressDTO();

				expcut.setExp(-(dao.getModeExp(pid)));

				expcut.setUsId(usid);

				dao.stackExpInsert(expcut);
			}

			// 프로젝트 제거
			dao.removeProject(pid);
		}

		return view;
	}

	// 모든 인원이 투표를 다 마친후 결과가 입력되었을 경우
	@RequestMapping(value = "/team_remove_result.action", method = RequestMethod.GET)
	public String teamRemoveResultCont(Model model, ProgressDTO dto, @ModelAttribute("pid") int pid,
			@ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/Team_Remove_Result.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// 결과확인했다는 표시 update
		dao.destroyVoteCheckUpdate(dao.usIdToPjId(pid, usId));

		// 찬성, 반대, 무효표 수 보내기
		model.addAttribute("yes", dao.removeVoteResultCount(pid, 1));
		model.addAttribute("no", dao.removeVoteResultCount(pid, 2));
		model.addAttribute("noAnswer", dao.removeVoteResultCount(pid, 3));
		// 퇴출투표 결과 일자
		model.addAttribute("resultDate", dao.removeVoteResultInfo(pid).getPdvDate());

		// 찬성표가 과반수 이상인지?
		if (dao.removeVoteResultCount(pid, 1) >= dao.peopleNumber(pid) / (double) 2)
		{
			// 팀 해체 결과 출력
			model.addAttribute("end", 1);
			model.addAttribute("message", "팀이 해체되었습니다. 모든 프로젝트에 대한 기록이 삭제되었습니다.");

			// 경험치 바 보내기 -------------------------------------------------

			int nextPoint = dao.whatIsNextPoint(usId);
			int nowPoint = dao.whatIsNowPoint(usId);
			int prePoint = dao.whatIsPrePoint(usId);

			double dProgress = ((nowPoint - prePoint) / ((nextPoint - prePoint) * 1.0));

			int progress = (int) (dProgress * 100);

			System.out.println("경험치 퍼센트 : " + progress);

			model.addAttribute("progress", progress);

			// -------------------------------------------------------------------

		}
		else
		{
			// 부결 결과 출력
			model.addAttribute("end", 0);
			model.addAttribute("message", "팀 해체 투표가 부결되었습니다.");
		}

		return view;

	}

	@RequestMapping(value = "/team_exit.action", method = RequestMethod.GET)
	public String teamExitCont(Model model, @ModelAttribute("usId") int usId, @ModelAttribute("pid") int pid,
			ProgressDTO dto)
	{
		String view = "/WEB-INF/views/Member_Out.jsp"; // 결과 페이지로 이동

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// 방나가기(=3), 퇴출된인원(=2)
		if (dto.getOutCase() == 3)
			model.addAttribute("outCase", 3);
		else if (dto.getOutCase() == 2)
			model.addAttribute("outCase", 2);

		// 프로젝트 정보 보내기
		model.addAttribute("projectInfo", dao.progressInfo(pid));

		// 퇴출투표 결과 보내기
		model.addAttribute("date", dao.outVoteResultInfo(pid).getPkDate());

		// 퇴출사유 보내기
		model.addAttribute("reason", dao.memberOutVoteInfo(pid).getPreason());

		// 찬성, 반대, 무효표 수 보내기
		model.addAttribute("yes", dao.removeVoteResultCount(pid, 1));
		model.addAttribute("no", dao.removeVoteResultCount(pid, 2));
		model.addAttribute("noAnswer", dao.removeVoteResultCount(pid, 3));

		// 경험치 퇴출정보 보내기
		// 경험치 바 보내기 -------------------------------------------------

		int nextPoint = dao.whatIsNextPoint(usId);
		int nowPoint = dao.whatIsNowPoint(usId);
		int prePoint = dao.whatIsPrePoint(usId);

		double dProgress = ((nowPoint - prePoint) / ((nextPoint - prePoint) * 1.0));

		int progress = (int) (dProgress * 100);

		System.out.println("경험치 퍼센트 : " + progress);

		model.addAttribute("progress", progress);

		// -------------------------------------------------------------------

		// 팀원 탈퇴
		// 팀장이면 안되게 거르기(아직)
		dao.proExitInsert(dao.usIdToPjId(pid, usId));

		return view;

	}

	// 프로젝트 종료 후 맨처음 팀원이 접속했을때 결과 입력
	@RequestMapping(value = "/project_result_submit.action", method = RequestMethod.GET)
	public String projectResultSubmitCont(Model model, @ModelAttribute("pid") int pid)
	{
		String view = "redirect:project_result_view.action";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		ProgressDTO member = null;

		boolean successKey = true;

		// 팀원들 경험치 입력하기 & 프로젝트 결과 입력하기(fail or success)
		for (Integer usid : dao.getMembersId(pid))
		{
			// 팀원 객체 생성
			member = resultCalculate(pid, usid);

			// failCount 가 3 이상이면 실패
			if (member.getFailCount() >= 3)
			{
				if (successKey)
				{
					// 한번만 입력하기 위해서
					successKey = false;

					// 실패한 의미로 0 입력
					member.setPeSuccess(0);

					// 현재 프로젝트 번호로 진행중프로젝트 번호 입력
					member.setPpId(dao.createToProgress(pid));

					// 실패한 프로젝트 결과 입력하기
					dao.proEvalEndInsert(member);
				}

				// 경험치 삭감
				member.setExp(-(dao.getModeExp(pid)));

				// 삭감된 경험치 입력
				dao.stackExpInsert(member);
			}
			else
			{
				if (successKey)
				{
					// 한번만 입력하기 위해서
					successKey = false;

					// 성공한 의미로 1 입력
					member.setPeSuccess(1);

					// 현재 프로젝트 번호로 진행중프로젝트 번호 입력
					member.setPpId(dao.createToProgress(pid));

					// 성공한 프로젝트 결과 입력하기
					dao.proEvalEndInsert(member);
				}

				// 경험치 정수로 만들기
				member.setExp(Math.round(member.getExp()));

				// 경험치 입력
				dao.stackExpInsert(member);
			}

		}

		return view;
	}

	// 프로젝트 종료 후 평가까지 완료된 후에 팀원들에게 보여지는 페이지
	@RequestMapping(value = "/project_result_view.action", method = RequestMethod.GET)
	public String projectResultViewCont(Model model, @ModelAttribute("usId") int usId, @ModelAttribute("pid") int pid)
	{
		String view = "/WEB-INF/views/Project_Result_View.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		IUserDAO dao1 = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao1.getUsPhoto(usId));

		// 혹여나 잘못들어왔을 경우 다시 돌려보내기
		/*
		 * if (dao.hasEndCheck(pid, usId) == 1) return "redirect:team_main.action";
		 */

		// 결과 확인했다는 update 필요
		dao.endCheckUpdate(pid, usId);

		// 내 정보 보내기
		model.addAttribute("myInfo", dao.proUserInfo(usId, pid));

		// 팀원들 정보 보내기
		model.addAttribute("member", getMembersInfo(dao.getMembersId(pid), pid));

		// 제출된 리스트 보내기
		model.addAttribute("afterSubmitList", dao.afterSubmitList(pid));

		// 프로젝트 fail 여부 보내기
		model.addAttribute("projectEndInfo", dao.projectEndInfo(pid));

		// 경험치 바 보내기 -------------------------------------------------

		int nextPoint = dao.whatIsNextPoint(usId);
		int nowPoint = dao.whatIsNowPoint(usId);
		int prePoint = dao.whatIsPrePoint(usId);

		double dProgress = ((nowPoint - prePoint) / ((nextPoint - prePoint) * 1.0));

		int progress = (int) (dProgress * 100);

		System.out.println("경험치 퍼센트 : " + progress);

		model.addAttribute("progress", progress);

		// -------------------------------------------------------------------

		return view;
	}
	// =================================================== 광현 끝
	// ============================================================

	// =================================================== 보영 시작
	// ============================================================
	// -------------------------------------------------------------------------------

	// 로그아웃용 거치는 페이지
	// 로그아웃용 거치는 페이지
	@RequestMapping(value = "/none.action", method =
	{
			RequestMethod.GET, RequestMethod.POST
	})
	public String toMain_Pre()
	{
		return "redirect:/doproject.action";
	}

	// 로그인을 안했을 경우 메인페이지로
	@RequestMapping(value = "/doproject.action", method = RequestMethod.GET)
	public String startMainCont(Model model)
	{
		String view = "/WEB-INF/views/MainPage.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		model.addAttribute("usId", 0);

		model.addAttribute("projectNum", dao.projectNumber());

		return view;
	}

	// 메인 페이지로
	@RequestMapping(value = "/mainpage.action", method =
	{
			RequestMethod.GET, RequestMethod.POST
	})
	public String toMain(Model model, @ModelAttribute("usId") int usId)
	{
		/* model.addAttribute("usId", 0); */

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);
		IUserDAO dao1 = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao1.getUsPhoto(usId));

		model.addAttribute("projectNum", dao.projectNumber());

		return "/WEB-INF/views/MainPage.jsp";
	}

	// 아이디 중복체크 Ajax
	@RequestMapping(value = "/idcheck.action", method = RequestMethod.POST)
	public String checkId(String userId, Model model)
	{

		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		int count = dao.dupliId(userId);

		if (count == 0) // 중복된 아이디가 없다
			model.addAttribute("message", true);
		else if (count == 1)
			model.addAttribute("message", false);

		return "/WEB-INF/ajaxviews/IdCheck.jsp";
	}

	// 닉네임 중복체크 Ajax
	@RequestMapping(value = "/nickcheck.action", method = RequestMethod.POST)
	public String checkNick(String nickName, Model model)
	{

		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		int count = dao.dupliNick(nickName);

		if (count == 0) // 중복된 닉네임이 없다
			model.addAttribute("message", true);
		else if (count == 1)
			model.addAttribute("message", false);

		return "/WEB-INF/ajaxviews/NickCheck.jsp";
	}

	// 로그인 창으로
	@RequestMapping(value = "/loginform.action", method = RequestMethod.GET)
	public String toLogin()
	{
		return "/WEB-INF/views/Login.jsp";
	}

	// 로그인 실행 @ModelAttribute("usId") int usId,
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String userId, String password, Model model)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		System.out.println(userId + " " + password);

		String url = "";

		if (userId == "" || password == "")
		{
			url = "/WEB-INF/views/Login.jsp";
		}

		int result = dao.isLoginOk(userId, password);
		String admin = dao.isAdmin(userId);

		System.out.println("결과 : " + admin);

		if (result == 1)
		{
			// mainpage.action
			url = "mainpage.action";

			String nick = dao.whatNickName(userId);
			model.addAttribute("nickName", nick);

			// usId 저장해야함
			UserDTO dto = dao.whatIsSsd(userId);
			int usId = dao.whatIsUsId(userId, dto.getSsdFront(), dto.getSsdBack());

			model.addAttribute("usId", usId);

			if (admin != "" && admin != null)
				model.addAttribute("adminId", admin);
		}
		else if (result != 1)
		{
			model.addAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
			url = "/WEB-INF/views/Login.jsp";
		}

		return url;
	}

	// 로그아웃
	@RequestMapping(value = "/logout.action", method = RequestMethod.POST)
	public String logout(Model model, SessionStatus sessionStatus, @ModelAttribute("usId") int usId)
	{
		// usId 초기화
		sessionStatus.setComplete();
		System.out.println("로그아웃 실행!");

		return "/none.action";
	}

	// 아이디 찾기, 비밀번호 찾기 선택지로 이동
	@RequestMapping(value = "/findIdPwdForm.action", method = RequestMethod.GET)
	public String toFindIdPwd(Model model)
	{
		return "/WEB-INF/views/FindIdPwd.jsp";
	}

	// 비밀번호 바꾸러 아이디와 주민번호 확인하는 곳으로 이동
	@RequestMapping(value = "/preChangePwdForm.action", method = RequestMethod.GET)
	public String toPreChangePwd(Model model)
	{
		return "/WEB-INF/views/FindPwd.jsp";
	}

	// 비밀번호 바꾸러 아이디와 주민번호 확인
	@RequestMapping(value = "/changePwdForm.action", method =
	{
			RequestMethod.GET, RequestMethod.POST
	})
	public String toChangePwd(String userId, String ssdFront, String ssdBack, Model model)
	{
		String url = "";

		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		int result = dao.isUserExist(userId, ssdFront, ssdBack);

		// 일치하는 계정이 없다면 메세지가 함께 돌려보낼 것.
		if (result == 0)
		{
			model.addAttribute("message", "일치하는 계정이 없습니다.");
			url = "/WEB-INF/views/FindPwd.jsp";
		}

		// 일치하는 계정이 있다면 변경하는 페이지로 보낼 것.
		if (result == 1)
		{
			model.addAttribute("userId", userId);

			url = "/WEB-INF/views/ChangePwd.jsp";
		}
		return url;
	}

	// 휴면계정 비밀번호 변경
	@RequestMapping(value = "/changePwdForm_2.action", method = RequestMethod.POST)
	public String toChangePwd(String userId, Model model)
	{
		model.addAttribute("userId", userId);

		return "/WEB-INF/views/ChangePwd.jsp";
	}

	// 비밀번호 변경
	@RequestMapping(value = "/changePwd.action", method = RequestMethod.GET)
	public String changePwd(String userId, String password, Model model)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		UserDTO dto = dao.whatIsSsd(userId);

		dao.changePwd(password, userId, dto.getSsdFront(), dto.getSsdBack());

		return "/WEB-INF/views/NoticePwd.jsp";
	}

	// 아이디 알려주는 페이지로 이동 or 없음을 알림
	@RequestMapping(value = "/findId.action", method = RequestMethod.GET)
	public String toFindId(String uname, String ssdFront, String ssdBack, Model model)
	{
		String url = "";
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		int result = dao.isIdExist(uname, ssdFront, ssdBack);
		// 이름과 민번 받아서 일치하는 게 없으면 메세지와 함께 돌려보내기
		if (result == 0)
		{
			url = "/WEB-INF/views/FindId.jsp";
			model.addAttribute("message", "일치하는 계정이 없습니다.");
		}

		// 일치하는 게 있다면 아이디를 알려줄 것
		if (result == 1)
		{
			String userId = dao.whatIsId(uname, ssdFront, ssdBack);
			model.addAttribute("userId", userId);
			url = "/WEB-INF/views/NoticeId.jsp";
		}

		return url;
	}

	// 아이디 찾기 페이지로 이동
	@RequestMapping(value = "/findIdForm.action", method = RequestMethod.GET)
	public String toFindIdForm()
	{

		return "/WEB-INF/views/FindId.jsp";
	}

	// 약관 동의 페이지로 이동
	@RequestMapping(value = "/prejoin.action", method = RequestMethod.GET)
	public String toPreJoin()
	{

		return "/WEB-INF/views/PreJoin.jsp";
	}

	// 약관 동의 후 중복 가입 체크하는 페이지로 이동
	@RequestMapping(value = "/preidcheck.action", method = RequestMethod.GET)
	public String toPreIdCheck()
	{
		return "/WEB-INF/views/PreIdExistCheck.jsp";
	}

	// 회원 가입 폼으로 이동 / 혹은 이미 존재함 알림
	@RequestMapping(value = "/joinform.action", method = RequestMethod.POST)
	public String toJoin(String uname, String ssdFront, String ssdBack, Model model)
	{
		String url = "";
		IUserDAO udao = sqlSession.getMapper(IUserDAO.class);

		int exist = udao.isIdExist(uname, ssdFront, ssdBack);

		model.addAttribute("ssdFront", ssdFront);
		model.addAttribute("ssdBack", ssdBack);
		model.addAttribute("uname", uname);

		if (exist == 0)
		{
			IBankDAO bdao = sqlSession.getMapper(IBankDAO.class);
			ISkillDAO sdao = sqlSession.getMapper(ISkillDAO.class);

			ArrayList<String> blist = bdao.lists();
			ArrayList<String> slist = sdao.lists();

			model.addAttribute("blist", blist);
			model.addAttribute("slist", slist);

			url = "/WEB-INF/views/Join.jsp";
		}
		else
		{
			url = "/WEB-INF/views/AlrExist.jsp";
		}

		return url;
	}

	// 회원 가입
	// UNAME, USERID,PASSWORD, NICKNAME, SSDFRONT, SSDBACK, TELEPHONE, UADDRESS
	@RequestMapping(value = "/join.action", method = RequestMethod.GET)
	public String join(UserDTO dto, Model model, int bkId, String account, int[] skId)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		try
		{
			// System.out.println(skId.length + " " + bkId +" "+ account);

			dto.setTelephone(dto.getTelephone1() + dto.getTelephone2() + dto.getTelephone3());
			dto.setUaddress(dto.getUaddress1() + "/" + dto.getUaddress2() + "/" + dto.getUaddress3());
			// 주소와 핸드폰은 쪼개져있으므로 합쳤음

			// 유저 insert
			dao.addUser(dto);

			// 유저의 고유번호 받아오기
			int usId = dao.whatIsUsId(dto.getUserId(), dto.getSsdFront(), dto.getSsdBack());

			// for문 돌리기
			for (int i = 0; i < skId.length; i++)
			{
				// 유저 관심기술 insert
				dao.addUserSkill(usId, skId[i]);
			}

			// 유저 계좌 정보 insert
			dao.addUserAccount(usId, account, bkId);

		}
		catch (Exception e)
		{
			// TODO: handle exception
			System.out.println(e.toString());
		}

		return "/WEB-INF/views/JoinConfirm.jsp";
	}

	// 회원탈퇴 페이지로 이동
	@RequestMapping(value = "/quitform.action", method = RequestMethod.GET)
	public String toQuit()
	{
		return "/WEB-INF/views/Quit.jsp";
	}

	// 회원탈퇴 실행
	@RequestMapping(value = "/quit.action", method = RequestMethod.GET)
	public String quit(String password, Model model, @ModelAttribute("usId") int usId, SessionStatus sessionStatus)
	{
		System.out.println("회원탈퇴 : " + usId + " " + password);

		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		String url = "";
		String pwd = dao.whatIsPassword(password, usId);

		System.out.println("pwd : " + pwd);

		// 입력한 비밀번호가 일치하지 않으면 메세지와 함께 되돌려보낼 것
		if (!password.equals(pwd))
		{
			// System.out.println(password.equals(pwd));
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			url = "/WEB-INF/views/Quit.jsp";
		}

		// 일치한다면 탈퇴되었다는 delete 처리와 함께 페이지로 안내할 것.
		if (password.equals(pwd))
		{
			System.out.println(password.equals(pwd));

			dao.removeUser(usId);
			// 세션 초기화
			sessionStatus.setComplete();

			url = "/WEB-INF/views/QuitConfirm.jsp";
		}

		return url;
	}

	// 마이페이지 입장 페이지로 이동 (0104 수정되었음)
	@RequestMapping(value = "/mypage.action", method =
	{
			RequestMethod.POST, RequestMethod.GET
	})
	public String toMyPage(Model model, @ModelAttribute("usId") int usId)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		int level = dao.whatIsLevel(usId);
		model.addAttribute("ulevel", level);

		model.addAttribute("usPhoto", dao.getUsPhoto(usId));

		int nextPoint = dao.whatIsNextPoint(usId);
		int nowPoint = dao.whatIsNowPoint(usId);
		int prePoint = dao.whatIsPrePoint(usId);

		System.out.println("레벨 :" + level);
		System.out.println("지금 누적 경험치 :" + nowPoint);
		System.out.println("지금 레벨까지의 경험치 :" + prePoint);
		System.out.println("다음 레벨까지의 경험치 :" + nextPoint);

		double dProgress = ((nowPoint - prePoint) / ((nextPoint - prePoint) * 1.0));

		int progress = (int) (dProgress * 100);

		System.out.println("경험치 퍼센트 : " + progress);

		model.addAttribute("progress", progress);

		return "/WEB-INF/views/MyPage.jsp";
	}

	// 마이페이지 > 개인정보 수정으로 이동하기 전 비번 치기
	@RequestMapping(value = "/prechangeinfo.action", method =
	{
			RequestMethod.POST, RequestMethod.GET
	})
	public String toPreChangeInfo(@ModelAttribute("usId") int usId, Model model)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		model.addAttribute("usPhoto", dao.getUsPhoto(usId));

		return "/WEB-INF/views/PreInfoCheck.jsp";
	}

	// 비밀번호 확인 → 마이페이지 > 개인정보 수정으로 이동
	@RequestMapping(value = "/changeinfoform.action", method =
	{
			RequestMethod.POST, RequestMethod.GET
	})
	public String toChangeInfo(@ModelAttribute("usId") int usId, String password, Model model)
	{
		String url = "";

		IUserSkillDAO usdao = sqlSession.getMapper(IUserSkillDAO.class);
		iUserBankDAO ubdao = sqlSession.getMapper(iUserBankDAO.class);
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao.getUsPhoto(usId));
		String pwd = dao.whatIsPassword(password, usId);
		// 입력한 비밀번호가 일치하지 않으면 되돌려보내기
		if (!pwd.equals(password))
		{
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			url = "/WEB-INF/views/PreInfoCheck.jsp";
		}
		else if (pwd.equals(password))
		{
			// 입력한 비밀번호가 일치하면 수정 폼으로 이동 시키기

			// 은행과 기술목록 리스트
			IBankDAO bdao = sqlSession.getMapper(IBankDAO.class);
			ISkillDAO sdao = sqlSession.getMapper(ISkillDAO.class);

			ArrayList<String> blist = bdao.lists();
			ArrayList<String> slist = sdao.lists();

			model.addAttribute("blist", blist);
			model.addAttribute("slist", slist);

			// 유저 정보 전달을 위한 전체 정보 dto
			UserDTO dto = dao.allUserInfo(usId);
			dto.setPassword(password);
			model.addAttribute("dto", dto);

			dto.setTelephone1(dto.getTelephone().substring(0, 3));
			dto.setTelephone2(dto.getTelephone().substring(3, 7));
			dto.setTelephone3(dto.getTelephone().substring(7));

			String[] addr = dto.getUaddress().split("/");

			dto.setUaddress1(addr[0]);
			dto.setUaddress2(addr[1]);
			if (addr.length == 3)
				dto.setUaddress3(addr[2]);

			UserBankDTO ubdto = ubdao.whatIsAccount(usId);
			model.addAttribute("ubdto", ubdto);

			String[] usSk = usdao.whatIsSkId(usId);

			model.addAttribute("usSk", usSk);

			url = "/WEB-INF/views/ChangeInfo.jsp";
		}

		return url;
	}

	// 마이페이지에서 수정한 내용 업데이트
	@RequestMapping(value = "/updateuserinfo.action", method =
	{
			RequestMethod.POST, RequestMethod.GET
	})
	public String updateInfo(UserDTO dto, UserBankDTO ubdto, String newPassword, Model model,
			@ModelAttribute("usId") int usId, int[] skId)
	{
		if (newPassword != "")
			dto.setPassword(newPassword);

		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		iUserBankDAO ubdao = sqlSession.getMapper(iUserBankDAO.class);

		model.addAttribute("usPhoto", dao.getUsPhoto(usId));

		// 기존 기술들 지우는 것 필요
		dao.removeUserSkill(usId);
		// 기술들 인서트
		for (int i = 0; i < skId.length; i++)
		{
			dao.addUserSkill(usId, skId[i]);
		}
		// 계좌 업데이트
		ubdto.setUsId(usId);

		if (dao.isHaveAccount(usId) > 0)
			ubdao.updateUserAccount(ubdto);
		else
			dao.addUserAccount(usId, ubdto.getAccount(), ubdto.getBkId());

		// 유저 개인 정보들 업데이트
		dto.setTelephone(dto.getTelephone1() + dto.getTelephone2() + dto.getTelephone3());
		dto.setUaddress(dto.getUaddress1() + "/" + dto.getUaddress2() + "/" + dto.getUaddress3());
		// 주소와 핸드폰은 쪼개져있으므로 합쳤음
		dto.setUsId(usId);

		dao.updateUser(dto);

		System.out.println("여기까지 오는지 확인");

		return "/WEB-INF/views/UpdateConfirm.jsp";
	}

	@RequestMapping(value = "/achievepage.action")
	public String toAchievePage(@ModelAttribute("usId") int usId, Model model)
	{
		IAchievementDAO acdao = sqlSession.getMapper(IAchievementDAO.class);
		ArrayList<AchievementDTO> lists = acdao.userAchievement(usId);

		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		model.addAttribute("usPhoto", dao2.getUsPhoto(usId));

		model.addAttribute("aclist", lists);

		return "/WEB-INF/views/Achievement.jsp";
	}

	@RequestMapping(value = "/notachievepage.action")
	public String toNotAchievePage(@ModelAttribute("usId") int usId, Model model)
	{
		IAchievementDAO acdao = sqlSession.getMapper(IAchievementDAO.class);
		ArrayList<AchievementDTO> lists = acdao.userNotAchievement(usId);

		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		model.addAttribute("usPhoto", dao2.getUsPhoto(usId));

		model.addAttribute("acnlist", lists);

		return "/WEB-INF/views/AchievementNot.jsp";
	}

	@RequestMapping(value = "/projecting.action")
	public String toProject_Ing(@ModelAttribute("usId") int usId, Model model)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao.getUsPhoto(usId));

		ArrayList<UserProjectDTO> lists = dao.whatIsProjectIng(usId);
		// 리스트의 길이만큼 for문 돌리면서 스킬 채워넣기
		for (UserProjectDTO dto : lists)
		{
			dto.setSkName(dao.whatIsProjectSkill(dto.getPid()));

			if (dto.getPcontents().length() > 25)
			{
				dto.setPcontents(dto.getPcontents().subSequence(0, 24).toString() + "...");
			}
		}

		model.addAttribute("prjlist", lists);

		return "/WEB-INF/views/Project_Ing.jsp";
	}

	@RequestMapping(value = "/projectwait.action")
	public String toProject_Wait(@ModelAttribute("usId") int usId, Model model)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao.getUsPhoto(usId));

		ArrayList<UserProjectDTO> lists = dao.whatIsProjectWait(usId);
		// 리스트의 길이만큼 for문 돌리면서 스킬 채워넣기
		for (UserProjectDTO dto : lists)
		{
			dto.setSkName(dao.whatIsProjectSkill(dto.getPid()));

			if (dto.getPcontents().length() > 25)
			{
				dto.setPcontents(dto.getPcontents().subSequence(0, 24).toString() + "...");
			}
		}

		model.addAttribute("prjlist", lists);

		return "/WEB-INF/views/Project_Wait.jsp";
	}

	@RequestMapping(value = "/projectend.action")
	public String toProject_End(@ModelAttribute("usId") int usId, Model model)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao.getUsPhoto(usId));

		ArrayList<UserProjectDTO> lists = dao.whatIsProjectEnd(usId);
		// 리스트의 길이만큼 for문 돌리면서 스킬 채워넣기
		for (UserProjectDTO dto : lists)
		{
			dto.setSkName(dao.whatIsProjectSkill(dto.getPid()));

			if (dto.getPcontents().length() > 25)
			{
				dto.setPcontents(dto.getPcontents().subSequence(0, 24).toString() + "...");
			}
		}

		model.addAttribute("prjlist", lists);

		return "/WEB-INF/views/Project_End.jsp";
	}

	@RequestMapping(value = "/boardcollection.action")
	public String toBoard_collect(@ModelAttribute("usId") int usId, Model model)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao.getUsPhoto(usId));

		ArrayList<UserBoardDTO> lists = dao.whatIsBoardWrite(usId);

		// 리스트 길이만큼 돌리면서 제목이랑 내용 길이 쳐내기
		for (UserBoardDTO dto : lists)
		{
			if (dto.getPostTitle().length() > 16)
			{
				dto.setPostTitle(dto.getPostTitle().subSequence(0, 15).toString() + " ...");
			}

			if (dto.getContent().length() > 46)
			{
				dto.setContent(dto.getContent().subSequence(0, 45).toString() + " ...");
			}
		}

		model.addAttribute("ublist", lists);

		return "/WEB-INF/views/Board_Collect.jsp";
	}

	@RequestMapping(value = "/commentcollect.action")
	public String toComment_collect(@ModelAttribute("usId") int usId, Model model)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao.getUsPhoto(usId));

		ArrayList<UserBoardDTO> lists = dao.whatIsCommentWrite(usId);

		// 리스트 길이만큼 돌리면서 제목 간이 설정, 내용 길이 쳐내기
		for (UserBoardDTO dto : lists)
		{
			if (dto.getCcontent().length() > 51)
			{
				dto.setCcontent(dto.getCcontent().subSequence(0, 50).toString() + " ...");
			}
		}

		model.addAttribute("ublist", lists);

		return "/WEB-INF/views/Comment_Collect.jsp";
	}

	@RequestMapping(value = "/profilephoto.action", method = RequestMethod.POST)
	public String profilephotoCont(Model model, HttpServletRequest request, @ModelAttribute("usId") int usId)
	{
		String view = "redirect:mypage.action";

		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		// ------------파일업로드 셋팅 -------------------------
		String root = request.getServletContext().getRealPath("/");
		String savePath = root + File.separator + "profilePhoto" + File.separator + "member" + usId;

		File dir = new File(savePath);

		if (!dir.exists())
		{
			dir.mkdirs();
		}

		String encType = "UTF-8";
		int maxFileSize = 5 * 1024 * 1024;

		try
		{
			MultipartRequest req = null;

			req = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());

			String usPhoto = req.getFilesystemName("usPhoto");

			// 유저 프로필사진 업데이트
			dao.usPhotoUpdate(usId, usPhoto);

		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}

		return view;

	}

	// =================================================== 보영 끝
	// ============================================================

	// =================================================== 종범 시작
	// ============================================================
	// ---------------------------------------------------------------------------------
	// -- 프로젝트 모집 메인 + 내가 참여한 진행 프로젝트 + 내가 참여한 완료 프로젝트 + 내가 참여한 대기 프로젝트
	@RequestMapping(value = "/moziplist.action", method = RequestMethod.GET)
	public String mainProjectList1(@ModelAttribute("usId") int usId, Model model)
	{
		IProjectMainDAO dao = sqlSession.getMapper(IProjectMainDAO.class);
		String view = "/WEB-INF/views/Mozip.jsp";

		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		model.addAttribute("usPhoto", dao2.getUsPhoto(usId));

		model.addAttribute("usId", usId);
		model.addAttribute("userJoin", dao.userJoin(usId));

		// -------------------------- Project_create.action 기능
		// --------------------------------------

		IProjectCreateDAO dao1 = sqlSession.getMapper(IProjectCreateDAO.class);

		int achCount = dao1.userAchievement(usId).size(); // 칭호 갯수

		model.addAttribute("getUser", dao1.getUser(usId)); // 해당 유저의 정보

		model.addAttribute("skillList", dao1.skillList()); // 사이트에 등록된 기술 리스트
		model.addAttribute("userLevel", dao1.userLevel(usId)); // 해당 유저의 레벨
		model.addAttribute("period", dao1.getPeriod()); // 기간
		model.addAttribute("people", dao1.getPeople()); // 인원
		model.addAttribute("onlineRate", dao1.getOnlineRate()); // 온라인 비율
		model.addAttribute("achCount", achCount); // 칭호 갯수
		model.addAttribute("achievement", dao1.userAchievement(usId)); // 해당 유저의 칭호

		model.addAttribute("startDate", dao1.startDate()); // 프로젝트 예상 시작일

		model.addAttribute("usId", usId);

		// ---------------------------------------------------------------------------------------------

		// 프로젝트 모집 메인
		ArrayList<ProjectMainDTO> list1 = new ArrayList<ProjectMainDTO>();
		for (ProjectMainDTO mainList1 : dao.mainProjectList1(usId))
		{
			mainList1.setAcName(dao.acName(mainList1.getPid()));
			mainList1.setSkName(dao.skName(mainList1.getPid()));
			mainList1.setSname(dao.sname(mainList1.getPid()));
			mainList1.setCurrentCount(dao.currentCount(mainList1.getPid()));
			list1.add(mainList1);
		}

		model.addAttribute("projectmainlist1", list1);

		// -------------------------------------------------------------
		// 내가 참여한 진행프로젝트

		ArrayList<ProjectMainDTO> list5 = new ArrayList<ProjectMainDTO>();
		for (ProjectMainDTO mainList5 : dao.myMainProjectListProgress(usId))
		{
			mainList5.setAcName(dao.acName(mainList5.getPid()));
			mainList5.setSkName(dao.skName(mainList5.getPid()));
			mainList5.setSname(dao.sname(mainList5.getPid()));
			mainList5.setCurrentCount(dao.currentCount(mainList5.getPid()));
			list5.add(mainList5);
		}

		model.addAttribute("myMainProjectListProgress", list5);

		// 내가 참여한 완료프로젝트
		ArrayList<ProjectMainDTO> list6 = new ArrayList<ProjectMainDTO>();
		for (ProjectMainDTO mainList6 : dao.myMainProjectListFinish(usId))
		{
			mainList6.setAcName(dao.acName(mainList6.getPid()));
			mainList6.setSkName(dao.skName(mainList6.getPid()));
			mainList6.setSname(dao.sname(mainList6.getPid()));
			mainList6.setCurrentCount(dao.currentCount(mainList6.getPid()));
			list6.add(mainList6);
		}

		model.addAttribute("myMainProjectListFinish", list6);

		// 내가 참여한 대기프로젝트
		/*
		 * ArrayList<ProjectMainDTO> list7 = new ArrayList<ProjectMainDTO>(); for
		 * (ProjectMainDTO mainList7 : dao.myMainProjectListMozip(usId)) {
		 * mainList7.setAcName(dao.acName(mainList7.getPid()));
		 * mainList7.setSkName(dao.skName(mainList7.getPid()));
		 * mainList7.setSname(dao.sname(mainList7.getPid()));
		 * mainList7.setCurrentCount(dao.currentCount(mainList7.getPid()));
		 * list7.add(mainList7); }
		 * 
		 * model.addAttribute("myMainProjectListMozip", list7);
		 * 
		 */
		// -------------------------------------------------------------
		return view;
	}

	// -- 프로젝트 추가모집 메인 + 내가 참여한 진행 프로젝트 + 내가 참여한 완료 프로젝트 + 내가 참여한 대기 프로젝트
	@RequestMapping(value = "/mozipaddlist.action", method = RequestMethod.GET)
	public String mainProjectList2(@ModelAttribute("usId") int usId, Model model)
	{
		IProjectMainDAO dao = sqlSession.getMapper(IProjectMainDAO.class);
		model.addAttribute("usId", usId);
		model.addAttribute("userJoin", dao.userJoin(usId));

		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		model.addAttribute("usPhoto", dao2.getUsPhoto(usId));

		String view = "/WEB-INF/views/MozipAdd.jsp";

		// 프로젝트 추가모집 메인
		ArrayList<ProjectMainDTO> list2 = new ArrayList<ProjectMainDTO>();
		for (ProjectMainDTO mainList2 : dao.mainProjectList2(usId))
		{
			mainList2.setAcName(dao.acName(mainList2.getPid()));
			mainList2.setSkName(dao.skName(mainList2.getPid()));
			mainList2.setSname(dao.sname(mainList2.getPid()));
			mainList2.setCurrentCount(dao.currentCount(mainList2.getPid()));
			list2.add(mainList2);
		}

		model.addAttribute("projectmainlist2", list2);

		// -------------------------------------------------------------
		// 내가 참여한 진행프로젝트
		ArrayList<ProjectMainDTO> list5 = new ArrayList<ProjectMainDTO>();
		for (ProjectMainDTO mainList5 : dao.myMainProjectListProgress(usId))
		{
			mainList5.setAcName(dao.acName(mainList5.getPid()));
			mainList5.setSkName(dao.skName(mainList5.getPid()));
			mainList5.setSname(dao.sname(mainList5.getPid()));
			mainList5.setCurrentCount(dao.currentCount(mainList5.getPid()));
			list5.add(mainList5);
		}

		model.addAttribute("myMainProjectListProgress", list5);

		// 내가 참여한 완료프로젝트
		ArrayList<ProjectMainDTO> list6 = new ArrayList<ProjectMainDTO>();
		for (ProjectMainDTO mainList6 : dao.myMainProjectListFinish(usId))
		{
			mainList6.setAcName(dao.acName(mainList6.getPid()));
			mainList6.setSkName(dao.skName(mainList6.getPid()));
			mainList6.setSname(dao.sname(mainList6.getPid()));
			mainList6.setCurrentCount(dao.currentCount(mainList6.getPid()));
			list6.add(mainList6);
		}

		model.addAttribute("myMainProjectListFinish", list6);

		// 내가 참여한 대기프로젝트
		/*
		 * ArrayList<ProjectMainDTO> list7 = new ArrayList<ProjectMainDTO>(); for
		 * (ProjectMainDTO mainList7 : dao.myMainProjectListMozip(usId)) {
		 * mainList7.setAcName(dao.acName(mainList7.getPid()));
		 * mainList7.setSkName(dao.skName(mainList7.getPid()));
		 * mainList7.setSname(dao.sname(mainList7.getPid()));
		 * mainList7.setCurrentCount(dao.currentCount(mainList7.getPid()));
		 * list7.add(mainList7); }
		 * 
		 * model.addAttribute("myMainProjectListMozip", list7);
		 */
		// -------------------------------------------------------------

		return view;
	}

	// -- 프로젝트 진행 메인 + 내가 참여한 진행 프로젝트 + 내가 참여한 완료 프로젝트 + 내가 참여한 대기 프로젝트
	@RequestMapping(value = "/progresslist.action", method = RequestMethod.GET)
	public String mainProjectList3(@ModelAttribute("usId") int usId, Model model)
	{
		IProjectMainDAO dao = sqlSession.getMapper(IProjectMainDAO.class);
		model.addAttribute("usId", usId);
		model.addAttribute("userJoin", dao.userJoin(usId));

		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		model.addAttribute("usPhoto", dao2.getUsPhoto(usId));

		String view = "/WEB-INF/views/Progress.jsp";

		// 프로젝트 진행 메인
		ArrayList<ProjectMainDTO> list3 = new ArrayList<ProjectMainDTO>();
		for (ProjectMainDTO mainList3 : dao.mainProjectList3(usId))
		{
			mainList3.setAcName(dao.acName(mainList3.getPid()));
			mainList3.setSkName(dao.skName(mainList3.getPid()));
			mainList3.setSname(dao.sname(mainList3.getPid()));
			mainList3.setCurrentCount(dao.currentCount(mainList3.getPid()));
			list3.add(mainList3);
		}

		model.addAttribute("projectmainlist3", list3);

		// -------------------------------------------------------------
		// 내가 참여한 진행프로젝트
		ArrayList<ProjectMainDTO> list5 = new ArrayList<ProjectMainDTO>();
		for (ProjectMainDTO mainList5 : dao.myMainProjectListProgress(usId))
		{
			mainList5.setAcName(dao.acName(mainList5.getPid()));
			mainList5.setSkName(dao.skName(mainList5.getPid()));
			mainList5.setSname(dao.sname(mainList5.getPid()));
			mainList5.setCurrentCount(dao.currentCount(mainList5.getPid()));
			list5.add(mainList5);
		}

		model.addAttribute("myMainProjectListProgress", list5);

		// 내가 참여한 완료프로젝트
		ArrayList<ProjectMainDTO> list6 = new ArrayList<ProjectMainDTO>();
		for (ProjectMainDTO mainList6 : dao.myMainProjectListFinish(usId))
		{
			mainList6.setAcName(dao.acName(mainList6.getPid()));
			mainList6.setSkName(dao.skName(mainList6.getPid()));
			mainList6.setSname(dao.sname(mainList6.getPid()));
			mainList6.setCurrentCount(dao.currentCount(mainList6.getPid()));
			list6.add(mainList6);
		}

		model.addAttribute("myMainProjectListFinish", list6);

		// 내가 참여한 대기프로젝트
		/*
		 * ArrayList<ProjectMainDTO> list7 = new ArrayList<ProjectMainDTO>(); for
		 * (ProjectMainDTO mainList7 : dao.myMainProjectListMozip(usId)) {
		 * mainList7.setAcName(dao.acName(mainList7.getPid()));
		 * mainList7.setSkName(dao.skName(mainList7.getPid()));
		 * mainList7.setSname(dao.sname(mainList7.getPid()));
		 * mainList7.setCurrentCount(dao.currentCount(mainList7.getPid()));
		 * list7.add(mainList7); }
		 * 
		 * 
		 * model.addAttribute("myMainProjectListMozip", list7);
		 */
		// -------------------------------------------------------------

		return view;
	}

	// -- 프로젝트 완료 메인 + 내가 참여한 진행 프로젝트 + 내가 참여한 완료 프로젝트 + 내가 참여한 대기 프로젝트
	@RequestMapping(value = "/finishlist.action", method = RequestMethod.GET)
	public String mainProjectList4(@ModelAttribute("usId") int usId, Model model)
	{
		IProjectMainDAO dao = sqlSession.getMapper(IProjectMainDAO.class);
		model.addAttribute("usId", usId);
		model.addAttribute("userJoin", dao.userJoin(usId));

		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		model.addAttribute("usPhoto", dao2.getUsPhoto(usId));

		String view = "/WEB-INF/views/Finish.jsp";

		// 프로젝트 완료 메인
		ArrayList<ProjectMainDTO> list4 = new ArrayList<ProjectMainDTO>();
		for (ProjectMainDTO mainList4 : dao.mainProjectList4(usId))
		{
			mainList4.setAcName(dao.acName(mainList4.getPid()));
			mainList4.setSkName(dao.skName(mainList4.getPid()));
			mainList4.setSname(dao.sname(mainList4.getPid()));
			mainList4.setCurrentCount(dao.currentCount(mainList4.getPid()));
			list4.add(mainList4);
		}

		model.addAttribute("projectmainlist4", list4);

		// -------------------------------------------------------------
		// 내가 참여한 진행프로젝트
		ArrayList<ProjectMainDTO> list5 = new ArrayList<ProjectMainDTO>();
		for (ProjectMainDTO mainList5 : dao.myMainProjectListProgress(usId))
		{
			mainList5.setAcName(dao.acName(mainList5.getPid()));
			mainList5.setSkName(dao.skName(mainList5.getPid()));
			mainList5.setSname(dao.sname(mainList5.getPid()));
			mainList5.setCurrentCount(dao.currentCount(mainList5.getPid()));
			list5.add(mainList5);
		}

		model.addAttribute("myMainProjectListProgress", list5);

		// 내가 참여한 완료프로젝트
		ArrayList<ProjectMainDTO> list6 = new ArrayList<ProjectMainDTO>();
		for (ProjectMainDTO mainList6 : dao.myMainProjectListFinish(usId))
		{
			mainList6.setAcName(dao.acName(mainList6.getPid()));
			mainList6.setSkName(dao.skName(mainList6.getPid()));
			mainList6.setSname(dao.sname(mainList6.getPid()));
			mainList6.setCurrentCount(dao.currentCount(mainList6.getPid()));
			list6.add(mainList6);
		}

		model.addAttribute("myMainProjectListFinish", list6);

		// 내가 참여한 대기프로젝트
		/*
		 * ArrayList<ProjectMainDTO> list7 = new ArrayList<ProjectMainDTO>(); for
		 * (ProjectMainDTO mainList7 : dao.myMainProjectListMozip(usId)) {
		 * mainList7.setAcName(dao.acName(mainList7.getPid()));
		 * mainList7.setSkName(dao.skName(mainList7.getPid()));
		 * mainList7.setSname(dao.sname(mainList7.getPid()));
		 * mainList7.setCurrentCount(dao.currentCount(mainList7.getPid()));
		 * list7.add(mainList7); }
		 * 
		 * model.addAttribute("myMainProjectListMozip", list7);
		 */
		// -------------------------------------------------------------

		return view;
	}

	// -- 프로젝트 모집에서 검색
	@RequestMapping(value = "/findlistmozip.action", method = RequestMethod.GET)
	public String findListMozip(Model model, ProjectMainDTO dto, @ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/Mozip.jsp";

		IProjectMainDAO dao = sqlSession.getMapper(IProjectMainDAO.class);

		IUserDAO dao1 = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao1.getUsPhoto(usId));

		if (dto.getAcContent() != null || dto.getSuContent() != null || dto.getSkContent() != null)
		{
			ArrayList<ProjectMainDTO> list1 = new ArrayList<ProjectMainDTO>();

			for (ProjectMainDTO mainList1 : dao.findListMozip(dto))
			{
				mainList1.setAcName(dao.acName(mainList1.getPid()));
				mainList1.setSkName(dao.skName(mainList1.getPid()));
				mainList1.setSname(dao.sname(mainList1.getPid()));
				mainList1.setCurrentCount(dao.currentCount(mainList1.getPid()));
				list1.add(mainList1);
			}
			model.addAttribute("projectmainlist1", list1);
		}
		else
		{
			ArrayList<ProjectMainDTO> list1 = new ArrayList<ProjectMainDTO>();

			for (ProjectMainDTO mainList1 : dao.findListAddMozip(dto))
			{
				mainList1.setAcName(dao.acName(mainList1.getPid()));
				mainList1.setSkName(dao.skName(mainList1.getPid()));
				mainList1.setSname(dao.sname(mainList1.getPid()));
				mainList1.setCurrentCount(dao.currentCount(mainList1.getPid()));
				list1.add(mainList1);
			}
			model.addAttribute("projectmainlist1", list1);
		}
		return view;
	}

	// -- 프로젝트 추가모집에서 검색
	@RequestMapping(value = "/findlistmozipadd.action", method = RequestMethod.GET)
	public String findListMozipAdd(Model model, ProjectMainDTO dto)
	{
		String view = "/WEB-INF/views/MozipAdd.jsp";

		IProjectMainDAO dao = sqlSession.getMapper(IProjectMainDAO.class);

		if (dto.getAcContent() != null || dto.getSuContent() != null || dto.getSkContent() != null)
		{
			ArrayList<ProjectMainDTO> list2 = new ArrayList<ProjectMainDTO>();

			for (ProjectMainDTO mainList2 : dao.findListMozip(dto))
			{
				mainList2.setAcName(dao.acName(mainList2.getPid()));
				mainList2.setSkName(dao.skName(mainList2.getPid()));
				mainList2.setSname(dao.sname(mainList2.getPid()));
				mainList2.setCurrentCount(dao.currentCount(mainList2.getPid()));
				list2.add(mainList2);
			}
			model.addAttribute("projectmainlist2", list2);
		}
		else
		{
			ArrayList<ProjectMainDTO> list2 = new ArrayList<ProjectMainDTO>();

			for (ProjectMainDTO mainList2 : dao.findListAddMozip(dto))
			{
				mainList2.setAcName(dao.acName(mainList2.getPid()));
				mainList2.setSkName(dao.skName(mainList2.getPid()));
				mainList2.setSname(dao.sname(mainList2.getPid()));
				mainList2.setCurrentCount(dao.currentCount(mainList2.getPid()));
				list2.add(mainList2);
			}
			model.addAttribute("projectmainlist2", list2);
		}
		return view;
	}

	// -- 프로젝트 진행에서 검색
	@RequestMapping(value = "/findlistprogress.action", method = RequestMethod.GET)
	public String findListProgress(Model model, ProjectMainDTO dto, @ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/Progress.jsp";

		IProjectMainDAO dao = sqlSession.getMapper(IProjectMainDAO.class);

		IUserDAO dao1 = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao1.getUsPhoto(usId));

		if (dto.getAcContent() != null || dto.getSuContent() != null || dto.getSkContent() != null)
		{
			ArrayList<ProjectMainDTO> list3 = new ArrayList<ProjectMainDTO>();

			for (ProjectMainDTO mainList3 : dao.findListProgress(dto))
			{
				mainList3.setAcName(dao.acName(mainList3.getPid()));
				mainList3.setSkName(dao.skName(mainList3.getPid()));
				mainList3.setSname(dao.sname(mainList3.getPid()));
				mainList3.setCurrentCount(dao.currentCount(mainList3.getPid()));
				list3.add(mainList3);
			}
			model.addAttribute("projectmainlist3", list3);
		}
		else
		{
			ArrayList<ProjectMainDTO> list3 = new ArrayList<ProjectMainDTO>();

			for (ProjectMainDTO mainList3 : dao.findListAddProgress(dto))
			{
				mainList3.setAcName(dao.acName(mainList3.getPid()));
				mainList3.setSkName(dao.skName(mainList3.getPid()));
				mainList3.setSname(dao.sname(mainList3.getPid()));
				mainList3.setCurrentCount(dao.currentCount(mainList3.getPid()));
				list3.add(mainList3);
			}
			model.addAttribute("projectmainlist3", list3);
		}
		return view;
	}

	// -- 프로젝트 완료에서 검색
	@RequestMapping(value = "/findlistfinish.action", method = RequestMethod.GET)
	public String findListFinish(Model model, ProjectMainDTO dto, @ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/Finish.jsp";

		IUserDAO dao1 = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao1.getUsPhoto(usId));

		IProjectMainDAO dao = sqlSession.getMapper(IProjectMainDAO.class);

		if (dto.getAcContent() != null || dto.getSuContent() != null || dto.getSkContent() != null)
		{
			ArrayList<ProjectMainDTO> list4 = new ArrayList<ProjectMainDTO>();

			for (ProjectMainDTO mainList4 : dao.findListFinish(dto))
			{
				mainList4.setAcName(dao.acName(mainList4.getPid()));
				mainList4.setSkName(dao.skName(mainList4.getPid()));
				mainList4.setSname(dao.sname(mainList4.getPid()));
				mainList4.setCurrentCount(dao.currentCount(mainList4.getPid()));
				list4.add(mainList4);
			}
			model.addAttribute("projectmainlist4", list4);
		}
		else
		{
			ArrayList<ProjectMainDTO> list4 = new ArrayList<ProjectMainDTO>();

			for (ProjectMainDTO mainList4 : dao.findListAddFinish(dto))
			{
				mainList4.setAcName(dao.acName(mainList4.getPid()));
				mainList4.setSkName(dao.skName(mainList4.getPid()));
				mainList4.setSname(dao.sname(mainList4.getPid()));
				mainList4.setCurrentCount(dao.currentCount(mainList4.getPid()));
				list4.add(mainList4);
			}
			model.addAttribute("projectmainlist4", list4);
		}
		return view;
	}

	// =================================================== 종범 끝
	// ============================================================

	// =================================================== 동현 시작
	// ============================================================

	// -------------------------------------------- 게시판
	// -----------------------------------------------------------
	// 게시판을 처음 요청하는 컨트롤러
	// 합쳐지기 전에 사용자가 어떤 게시판을 요청하는지 모르기 때문에
	// 기본적으로 자유 게시판이 보여지는 것으로 시작

	// 게시판을 처음 요청하는 컨트롤러
	@RequestMapping(value = "board.action", method = RequestMethod.GET)
	public String board(@ModelAttribute("usId") int usId, Model model, BoardDTO dto)
	{
		// bid 분기
		/*
		 * 1 - 질문 2 - 정보 3 - 자유 4 - 건의
		 */
		int bid = dto.getBid();

		// 테스트용 usId 정적입력
		// 세션에서 usId 받아서 입력되게
		model.addAttribute("usId", usId);

		// 게시판을 요청하는 데 get 방식으로 넘어온 식별번호가 없을경우.. 자동으로 자유게시판
		if (bid == 0)
		{
			bid = 3;

			String view = "/WEB-INF/views/FreeBoard.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));

			return view;
		}

		// 질문 게시판으로 이동
		else if (bid == 1)
		{
			String view = "/WEB-INF/views/QuestionBoard.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			// model.addAttribute("lists", dao.lists(bid));

			// 질문 게시판 게시글 넘겨주기 (답변 채택 여부까지)
			model.addAttribute("questionList", dao.questionList(bid));

			model.addAttribute("usId", usId);

			return view;
		}

		// 정보게시판으로 이동
		else if (bid == 2)
		{
			String view = "/WEB-INF/views/InfoBoard.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			// model.addAttribute("lists", dao.lists(bid));
			model.addAttribute("infoList", dao.infoList(bid));
			model.addAttribute("usId", usId);

			return view;
		}

		// 자유 게시판으로 이동
		else if (bid == 3)
		{
			String view = "/WEB-INF/views/FreeBoard.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));
			model.addAttribute("usId", usId);

			return view;
		}

		// 건의 게시판으로 이동
		else if (bid == 4)
		{
			String view = "/WEB-INF/views/SuggestBoard.jsp";

			int ssid = dto.getSsid();

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("suggestList", dao.suggestList(bid));

			// 비밀글 체크 여부를 넘겨주기
			model.addAttribute("ssid", ssid);
			model.addAttribute("usId", usId);

			return view;
		}

		// 1,2 3, 4 아무것도 안넘어왔거나 이상한 값이 넘어올 경우
		// 자유게시판으로 이동
		else
		{
			String view = "/WEB-INF/views/FreeBoard.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));

			return view;
		}
	}

	// 게시판에서 검색액션을 취하는 컨트롤러
	@RequestMapping(value = "/searchboard.action", method = RequestMethod.GET)
	public String searchBoard(Model model, BoardDTO dto)
	{

		// System.out.println(dto.getCategory() + " " + dto.getBid() + " " +
		// dto.getContent());

		int bid = dto.getBid();

		// 게시판을 요청하는 데 get 방식으로 넘어온 식별번호가 없을경우.. 자동으로 자유게시판
		if (bid == 0)
		{
			bid = 3;

			String view = "/WEB-INF/views/FreeBoard.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 검색 된 게시글 넘겨주기'
			model.addAttribute("searchList", dao.searchLists(dto));
			model.addAttribute("lists", dao.searchLists(dto));

			return view;
		}

		// 질문 게시판으로 이동
		else if (bid == 1)
		{
			String view = "/WEB-INF/views/QuestionBoard.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 검색 된 게시글 넘겨주기
			model.addAttribute("questionList", dao.searchLists(dto));

			return view;
		}

		// 정보게시판으로 이동
		else if (bid == 2)
		{
			String view = "/WEB-INF/views/InfoBoard.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 검색 된 게시글 넘겨주기
			model.addAttribute("infoList", dao.searchLists(dto));

			return view;
		}

		// 자유 게시판으로 이동
		else if (bid == 3)
		{
			bid = 3;

			String view = "/WEB-INF/views/FreeBoard.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 검색 된 게시글 넘겨주기
			model.addAttribute("lists", dao.searchLists(dto));

			return view;
		}

		// 건의 게시판으로 이동
		else if (bid == 4)
		{
			String view = "/WEB-INF/views/SuggestBoard.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 검색 된 게시글 넘겨주기
			model.addAttribute("suggestList", dao.searchLists(dto));

			return view;
		}

		// 1,2 3, 4 아무것도 안넘어왔거나 이상한 값이 넘어올 경우
		// 자유게시판으로 이동
		else
		{
			String view = "/WEB-INF/views/FreeBoard.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 검색 된 게시글 넘겨주기
			model.addAttribute("searchList", dao.searchLists(dto));
			model.addAttribute("lists", dao.searchLists(dto));

			return view;
		}
	}

	// 게시판에서 게시글 리스트 중 하나를 클릭해서 열람하는 액션
	@RequestMapping(value = "/boardread.action", method = RequestMethod.GET)
	public String freeBoardRead(@ModelAttribute("usId") int usId, Model model, BoardDTO dto)
	{
		int bid = dto.getBid();
		int bpid = dto.getBpid();
		// System.out.println(usId);

		if (bid == 0)
		{
			bid = 3;

			String view = "/WEB-INF/views/FreeRead.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			dao.hitCount(bpid); // 열람을 하러 들어왔기 때문에 조회수 증가

			model.addAttribute("boardName", dao.boardName());
			model.addAttribute("readData", dao.readData(bid, bpid)); // 게시글 제목, 내용 등 게시글의 정보 출력
			model.addAttribute("readComment", dao.readComment(bpid)); // 해당 게시글의 댓글 출력
			model.addAttribute("commentCount", dao.commentCount(bpid)); // 해당 게시글 댓글 수
			model.addAttribute("hit", dao.hit(bid, bpid)); // 조회 수 조회
			model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기

			return view;
		}

		// 질문 게시판
		else if (bid == 1)
		{
			String view = "/WEB-INF/views/QuestionRead.jsp";

			System.out.println(usId);

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
			int check = dao.answerCheck(bpid); // 답변 채택 여부 확인하는 메소드 1이면 채택 아니면 미채택

			dao.hitCount(bpid);

			model.addAttribute("boardName", dao.boardName());
			model.addAttribute("readData", dao.readData(bid, bpid));
			model.addAttribute("answerCheck", dao.answerCheck(bpid)); // 답변 채택 여부 확인하는 메소드
			model.addAttribute("questionComment", dao.questionComment(bpid));
			model.addAttribute("commentCount", dao.commentCount(bpid)); // 댓글 수 메소드
			model.addAttribute("readComment", dao.readComment(bpid));
			model.addAttribute("bid", bid);
			model.addAttribute("bpid", bpid);
			model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기
			model.addAttribute("hit", dao.hit(bid, bpid));
			model.addAttribute("check", check); // 답변 채택 여부 확인하는 메소드
			System.out.println(check);
			model.addAttribute("reportName", dao.reportName()); // 신고항목들을 보내주기

			return view;
		}

		// 정보 게시판
		else if (bid == 2)
		{
			String view = "/WEB-INF/views/InfoRead.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			dao.hitCount(bpid); // 조회 수 증가 메소드

			model.addAttribute("boardName", dao.boardName());
			model.addAttribute("readData", dao.readData(bid, bpid));
			model.addAttribute("readComment", dao.readComment(bpid));
			model.addAttribute("bid", bid);
			model.addAttribute("bpid", bpid);
			model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기
			model.addAttribute("likeCount", dao.likeCount(bpid)); // 추천 수 메소드
			model.addAttribute("commentCount", dao.commentCount(bpid)); // 댓글 수 메소드
			model.addAttribute("hit", dao.hit(bid, bpid)); // 조회 수 메소드
			model.addAttribute("reportName", dao.reportName()); // 신고항목들을 보내주기

			return view;
		}

		// 자유 게시판
		else if (bid == 3)
		{
			String view = "/WEB-INF/views/FreeRead.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			dao.hitCount(bpid);

			model.addAttribute("boardName", dao.boardName());
			model.addAttribute("readData", dao.readData(bid, bpid));
			model.addAttribute("readComment", dao.readComment(bpid));
			model.addAttribute("bid", bid);
			model.addAttribute("bpid", bpid);
			model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기
			model.addAttribute("commentCount", dao.commentCount(bpid));
			model.addAttribute("hit", dao.hit(bid, bpid));
			model.addAttribute("reportName", dao.reportName()); // 신고항목들을 보내주기

			return view;
		}

		// 건의 게시판
		else if (bid == 4)
		{
			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			dao.hitCount(bpid);

			int ssid = dto.getSsid();

			// 비밀글인 경우
			if (ssid != 0)
			{
				if (usId == dto.getUsId())
				{
					String view = "/WEB-INF/views/SuggestRead.jsp";

					model.addAttribute("boardName", dao.boardName());
					model.addAttribute("readData", dao.readData(bid, bpid));
					model.addAttribute("readComment", dao.readComment(bpid));
					model.addAttribute("bid", bid);
					model.addAttribute("bpid", bpid);
					model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기
					model.addAttribute("commentCount", dao.commentCount(bpid));
					model.addAttribute("hit", dao.hit(bid, bpid));
					model.addAttribute("reportName", dao.reportName()); // 신고항목들을 보내주기

					return view;
				}

				// 작성자 본인이 아닌 경우
				else
				{
					String view = "redirect:board.action?bid=4";
					return view;
				}
			}

			else
			{
				String view = "/WEB-INF/views/SuggestRead.jsp";

				dao.hitCount(bpid);

				model.addAttribute("boardName", dao.boardName());
				model.addAttribute("readData", dao.readData(bid, bpid));
				model.addAttribute("readComment", dao.readComment(bpid));
				model.addAttribute("bid", bid);
				model.addAttribute("bpid", bpid);
				model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기
				model.addAttribute("commentCount", dao.commentCount(bpid));
				model.addAttribute("hit", dao.hit(bid, bpid));
				model.addAttribute("reportName", dao.reportName()); // 신고항목들을 보내주기

				return view;
			}
		}

		else
		{
			String view = "/WEB-INF/views/FreeRead.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			dao.hitCount(bpid);

			model.addAttribute("boardName", dao.boardName());
			model.addAttribute("readData", dao.readData(bid, bpid));
			model.addAttribute("readComment", dao.readComment(bpid));
			model.addAttribute("bid", bid);
			model.addAttribute("bpid", bpid);
			model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기
			model.addAttribute("commentCount", dao.commentCount(bpid));
			model.addAttribute("hit", dao.hit(bid, bpid));

			return view;
		}
	}

	// 전체 페이지 수 구하기
	// numPerPage : 한 페이지에 표시할 데이터의 개수
	// dataCount : 전체 데이터 수
	public int getPageCount(int numPerPage, int dataCount)
	{
		int pageCount = 0;

		pageCount = dataCount / numPerPage;

		if (dataCount % numPerPage != 0)
			pageCount++;

		return pageCount;
	}

	// 페이지 처리 메소드 (GET 방식)

	// current_page : 현재 표시할 페이지
	// total_page : 전체 페이지 수
	// list_url : 링크를 설정할 url

	public String pageIndexList(int current_page, int total_page, String list_url)
	{
		if (current_page < 1 || total_page < 1)
			return "";

		StringBuffer sb = new StringBuffer();
		int numPerBlock = 10;
		int currentPageSetup;
		int n, page;

		if (list_url.indexOf("?") != -1)
			list_url = list_url + "&";
		else
			list_url = list_url + "?";

		// currentPageSetup : 표시할 첫 페이지 -1
		currentPageSetup = (current_page / numPerBlock) * numPerBlock;
		if (current_page % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;

		// 1 페이지, [Prev]:10 페이지를 이전 페이지로 이동
		n = current_page - numPerBlock;

		if (total_page > numPerBlock && currentPageSetup > 0)
		{
			sb.append("<a href='" + list_url + "pageNum=1'>1</a>&nbsp;");
			sb.append("[<a href='" + list_url + "pageNum=" + n + "'>Prev</a>]&nbsp;");
		}

		// 바로가기 페이지
		page = currentPageSetup + 1;
		while (page <= total_page && (page <= currentPageSetup + numPerBlock))
		{
			if (page == current_page)
			{
				sb.append("<font color='Fuchsia'>" + page + "</font>&nbsp;");
			}
			else
			{
				sb.append("<a href='" + list_url + "pageNum=" + page + "'>" + page + "</a>&nbsp;");
			}
			page++;
		}

		// [Next]: 10페이지를 다음페이지로 이동, 마지막 페이지
		n = current_page + numPerBlock;
		if (total_page - currentPageSetup > numPerBlock)
		{
			sb.append("[<a href='" + list_url + "pageNum=" + n + "'>Next</a>]&nbsp;");
			sb.append("<a href='" + list_url + "pageNum=" + total_page + "'>" + total_page + "</a>");
		}

		return sb.toString();
	}

	// 질문게시판 답변 채택 메소드
	@RequestMapping(value = "/answerselect.action", method = RequestMethod.GET)
	public String answerSelect(@ModelAttribute("usId") int usId, Model model, BoardDTO dto)
	{
		int bid = dto.getBid();
		// System.out.println(bid);
		int bpid = dto.getBpid();
		// System.out.println(pid);
		int qid = dto.getQid();
		// System.out.println(qid);
		// int sid = dto.getSelectid();
		// System.out.println(sid);

		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

		int check = dao.answerCheck(bpid);
		// System.out.println(check);

		if (check >= 1)
		{
			String view = "redirect:boardread.action";
			model.addAttribute("bid", bid);
			model.addAttribute("bpid", bpid);
			model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기
			model.addAttribute("check", check);

			model.addAttribute("questionComment", dao.questionComment(bpid));

			return view;
		}

		else
		{
			dao.answerSelect(qid);

			String view = "redirect:boardread.action";
			model.addAttribute("bid", bid);
			model.addAttribute("bpid", bpid);
			model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기
			model.addAttribute("check", check);
			model.addAttribute("questionComment", dao.questionComment(bpid));

			return view;
		}
	}

	// 질문 게시판 답변 취소 메소드
	@RequestMapping(value = "/answercancle.action", method = RequestMethod.GET)
	public String answerCancle(@ModelAttribute("usId") int usId, Model model, BoardDTO dto)
	{
		int bid = dto.getBid();
		int bpid = dto.getBpid();
		int selectid = dto.getSelectid();

		System.out.println(selectid);

		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

		int check = dao.answerCheck(bpid);

		String view = "";

		if (check >= 1)
		{
			dao.answerCancle(selectid);

			view = "redirect:boardread.action";
			model.addAttribute("bid", bid);
			model.addAttribute("bpid", bpid);
			model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기
			model.addAttribute("check", check);
			model.addAttribute("questionComment", dao.questionComment(bpid));

			return view;
		}

		else
		{
			view = "redirect:boardread.action";
			model.addAttribute("bid", bid);
			model.addAttribute("bpid", bpid);
			model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기
			model.addAttribute("check", check);
			model.addAttribute("questionComment", dao.questionComment(bpid));

			return view;
		}

	}

	// ajax: 공감하기 토글 구현
	@RequestMapping(value = "/boardlikecheck.action", method = RequestMethod.POST)
	public String boardLikeOkCount(@ModelAttribute("usId") int usId, Model model, BoardDTO dto)
	{
		String view = "/WEB-INF/views/ajax_boardLikeOk.jsp";

		System.out.println(dto.getBpid());

		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

		model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기

		// 이미 추천을 한 상태..
		if (dao.likeOk(dto) == 1)
		{
			dao.likeDelete(dto);
			model.addAttribute("likeCount", dao.likeCount(dto.getBpid()));

			return view;
		}
		// 추천을 아직 안한 상태..
		else if (dao.likeOk(dto) == 0)
		{
			dao.likeInsert(dto);
			model.addAttribute("likeCount", dao.likeCount(dto.getBpid()));

			return view;
		}

		// 과부화가 걸려서 count가 2이상 들어올 시..
		else
		{
			dao.likeDelete(dto);
			model.addAttribute("boardLikeCount", dao.likeCount(dto.getBpid()));

			return view;
		}

	}

	// 작성하기 버튼을 누를 시 게시글 작성폼으로 이동하는 메소드
	@RequestMapping(value = "/boardwrite.action", method = RequestMethod.GET)
	public String boardWrite(@ModelAttribute("usId") int usId, Model model, BoardDTO dto)
	{
		int bid = dto.getBid();

		if (bid == 1)
		{
			String view = "/WEB-INF/views/QuestionWrite.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			model.addAttribute("bid", bid);
			model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기
			model.addAttribute("boardName", dao.boardName());
			model.addAttribute("reportName", dao.reportName()); // 신고항목들을 보내주기

			return view;

		}

		else if (bid == 2)
		{
			String view = "/WEB-INF/views/InfoWrite.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			model.addAttribute("bid", bid);
			model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기
			model.addAttribute("boardName", dao.boardName());
			model.addAttribute("reportName", dao.reportName()); // 신고항목들을 보내주기

			return view;
		}

		else if (bid == 3)
		{
			String view = "/WEB-INF/views/FreeWrite.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			model.addAttribute("boardName", dao.boardName());
			model.addAttribute("bid", bid);
			model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기
			model.addAttribute("reportName", dao.reportName()); // 신고항목들을 보내주기

			return view;
		}

		else if (bid == 4)
		{
			String view = "/WEB-INF/views/SuggestWrite.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			model.addAttribute("boardName", dao.boardName());
			model.addAttribute("bid", bid);
			model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기
			model.addAttribute("reportName", dao.reportName()); // 신고항목들을 보내주기

			return view;
		}

		else
		{
			String view = "/WEB-INF/views/FreeBoard.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			model.addAttribute("bid", bid);
			model.addAttribute("usId", usId); // 세션에 저장된 usId 보내주기
			model.addAttribute("boardName", dao.boardName());
			model.addAttribute("reportName", dao.reportName()); // 신고항목들을 보내주기

			return view;
		}
	}

	// 작성완료 버튼을 누를 시 다시 해당 게시판으로 이동하는 메소드
	@RequestMapping(value = "/boardinsert.action", method = RequestMethod.POST)
	public String boardInsert(@ModelAttribute("usId") int usId, Model model, BoardDTO dto)
	{
		int bid = dto.getBid();

		if (bid == 1)
		{
			String view = "redirect:board.action?bid=1";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));

			// 세션에 저장된 usId 보내주기
			model.addAttribute("usId", usId);

			dao.boardInsert(dto);

			return view;
		}

		else if (bid == 2)
		{
			String view = "redirect:board.action?bid=2";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));

			// 세션에 저장된 usId 보내주기
			model.addAttribute("usId", usId);

			dao.boardInsert(dto);

			return view;
		}

		else if (bid == 3)
		{
			String view = "redirect:board.action";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));

			// 세션에 저장된 usId 보내주기
			model.addAttribute("usId", usId);

			dao.boardInsert(dto);

			return view;
		}

		else if (bid == 4)
		{
			// ssid = 비밀글 체크여부 테이블 식별자
			int ssid = dto.getSsid();
			// S ystem.out.println(ssid);

			// 만약 비밀글 체크가 되어있다면?
			if (ssid == 1)
			{
				String view = "redirect:board.action?bid=4";

				IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

				model.addAttribute("boardName", dao.boardName());
				model.addAttribute("lists", dao.lists(bid));

				// 세션에 저장된 usId 보내주기
				model.addAttribute("usId", usId);

				// 우선 게시글 작성 테이블에 insert
				dao.boardInsert(dto);

				// 그 다음 건의게시판의 제일 높은 게시글 번호 받아오기
				int max = dao.maxBoardNumber(bid);

				// 받아온 게시글 번호를 비밀글 체크 테이블에 insert
				dao.secretInsert(max);

				return view;
			}

			else
			{
				String view = "redirect:board.action?bid=4";

				IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

				// 게시판 이름을 모델에 넘겨주기
				model.addAttribute("boardName", dao.boardName());

				// 해당 게시판에 맞는 게시글 넘겨주기
				model.addAttribute("lists", dao.lists(bid));

				// 세션에 저장된 usId 보내주기
				model.addAttribute("usId", usId);

				dao.boardInsert(dto);

				return view;
			}
		}

		else
		{
			String view = "/WEB-INF/views/SuggestBoard.jsp";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));

			// 세션에 저장된 usId 보내주기
			model.addAttribute("usId", usId);

			dao.boardInsert(dto);

			return view;
		}
	}

	// 질문 게시판 글 수정 폼 컨트롤러
	@RequestMapping(value = "/questionupdateform.action", method = RequestMethod.GET)
	public String questionUpdate(@ModelAttribute("usId") int usId, Model model, BoardDTO dto)
	{
		int bid = dto.getBid();
		int bpid = dto.getBpid();

		String view = "/WEB-INF/views/QuestionUpdateForm.jsp";

		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

		model.addAttribute("boardName", dao.boardName());
		model.addAttribute("readData", dao.readData(bid, bpid));
		model.addAttribute("bid", bid);
		model.addAttribute("bpid", bpid);

		// 세션에 저장된 usId 보내주기
		model.addAttribute("usId", usId);
		return view;
	}

	// 정보 게시판 글 수정 폼 컨트롤러
	@RequestMapping(value = "/infoupdateform.action", method = RequestMethod.GET)
	public String infoUpdate(@ModelAttribute("usId") int usId, Model model, BoardDTO dto)
	{
		int bid = dto.getBid();
		int bpid = dto.getBpid();

		String view = "/WEB-INF/views/InfoUpdateForm.jsp";

		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

		model.addAttribute("boardName", dao.boardName());
		model.addAttribute("readData", dao.readData(bid, bpid));
		model.addAttribute("bid", bid);
		model.addAttribute("bpid", bpid);

		// 세션에 저장된 usId 보내주기
		model.addAttribute("usId", usId);

		return view;
	}

	// 자유 게시판 글 수정폼 컨트롤러
	@RequestMapping(value = "/freeupdateform.action", method = RequestMethod.GET)
	public String freeUpdate(@ModelAttribute("usId") int usId, Model model, BoardDTO dto)
	{
		int bid = dto.getBid();
		int bpid = dto.getBpid();

		String view = "/WEB-INF/views/FreeUpdateForm.jsp";

		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

		model.addAttribute("boardName", dao.boardName());
		model.addAttribute("readData", dao.readData(bid, bpid));
		model.addAttribute("bid", bid);
		model.addAttribute("bpid", bpid);

		// 세션에 저장된 usId 보내주기
		model.addAttribute("usId", usId);

		return view;
	}

	// 건의 게시판 글 수정폼 컨트롤러
	@RequestMapping(value = "/suggestupdateform.action", method = RequestMethod.GET)
	public String suggestUpdate(@ModelAttribute("usId") int usId, Model model, BoardDTO dto)
	{
		int bid = dto.getBid();
		int bpid = dto.getBpid();

		String view = "/WEB-INF/views/SuggestUpdateForm.jsp";

		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

		model.addAttribute("boardName", dao.boardName());
		model.addAttribute("readData", dao.readData(bid, bpid));
		model.addAttribute("bid", bid);
		model.addAttribute("bpid", bpid);

		// 세션에 저장된 usId 보내주기
		model.addAttribute("usId", usId);
		return view;
	}

	// 게시글 수정 후 해당 게시판으로 넘어가는 메소드
	@RequestMapping(value = "/boardupdate.action", method = RequestMethod.POST)
	public String freeModify(@ModelAttribute("usId") int usId, Model model, BoardDTO dto)
	{
		int bid = dto.getBid();
		int bpid = dto.getBpid();

		if (bid == 0)
		{
			String view = "redirect:board.action";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));
			model.addAttribute("bid", bid);
			model.addAttribute("bpid", bpid);

			System.out.println(bid);

			// 세션에 저장된 usId 보내주기
			model.addAttribute("usId", usId);

			dao.freeModify(dto);

			return view;
		}

		// 질문 게시판으로 이동
		else if (bid == 1)
		{
			String view = "redirect:board.action";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));
			model.addAttribute("bid", bid);
			model.addAttribute("bpid", bpid);

			// 세션에 저장된 usId 보내주기
			model.addAttribute("usId", usId);

			dao.freeModify(dto);

			return view;
		}

		// 정보게시판으로 이동
		else if (bid == 2)
		{
			String view = "redirect:board.action";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));
			model.addAttribute("bid", bid);
			model.addAttribute("bpid", bpid);

			// 세션에 저장된 usId 보내주기
			model.addAttribute("usId", usId);

			dao.freeModify(dto);

			return view;
		}

		// 자유 게시판으로 이동
		else if (bid == 3)
		{
			String view = "redirect:board.action";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));
			model.addAttribute("bid", bid);
			model.addAttribute("bpid", bpid);

			System.out.println(dto.getPostTitle());
			System.out.println(dto.getContent());
			System.out.println(bpid);

			// 세션에 저장된 usId 보내주기
			model.addAttribute("usId", usId);

			dao.freeModify(dto);

			return view;
		}

		// 건의 게시판으로 이동
		else if (bid == 4)
		{
			String view = "redirect:board.action";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));
			model.addAttribute("bid", bid);
			model.addAttribute("bpid", bpid);

			// 세션에 저장된 usId 보내주기
			model.addAttribute("usId", usId);

			dao.freeModify(dto);

			return view;
		}

		else
		{
			String view = "redirect:board.action";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));
			model.addAttribute("bid", bid);
			model.addAttribute("bpid", bpid);

			// 세션에 저장된 usId 보내주기
			model.addAttribute("usId", usId);

			dao.freeModify(dto);

			return view;
		}
	}

	// 게시판들 삭제(블라인드) 메소드
	@RequestMapping(value = "/freedelete.action", method = RequestMethod.GET)
	public String freeBlind(@ModelAttribute("usId") int usId, Model model, int bid, int bpid)
	{
		if (bid == 0)
		{
			String view = "redirect:board.action";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));
			model.addAttribute("bpid", bpid);
			model.addAttribute("bid", bid);

			// 세션에 저장된 usId 보내주기
			model.addAttribute("usId", usId);

			dao.freeBlind(bpid);

			return view;
		}

		// 질문 게시판으로 이동
		else if (bid == 1)
		{
			String view = "redirect:board.action?bid=1";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));
			model.addAttribute("bpid", bpid);

			// 세션에 저장된 usId 보내주기
			model.addAttribute("usId", usId);

			dao.freeBlind(bpid);

			return view;
		}

		// 정보게시판으로 이동
		else if (bid == 2)
		{
			String view = "redirect:board.action?bid=2";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));
			model.addAttribute("bpid", bpid);

			// 세션에 저장된 usId 보내주기
			model.addAttribute("usId", usId);

			dao.freeBlind(bpid);

			return view;
		}

		// 자유 게시판으로 이동
		else if (bid == 3)
		{
			String view = "redirect:board.action?bid=3";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));
			model.addAttribute("bpid", bpid);

			// 세션에 저장된 usId 보내주기
			model.addAttribute("usId", usId);

			dao.freeBlind(bpid);

			return view;
		}

		// 건의 게시판으로 이동
		else if (bid == 4)
		{
			String view = "redirect:board.action?bid=4";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));
			model.addAttribute("bpid", bpid);

			// 세션에 저장된 usId 보내주기
			model.addAttribute("usId", usId);

			dao.freeBlind(bpid);

			return view;
		}

		else
		{
			String view = "redirect:board.action";

			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

			// 게시판 이름을 모델에 넘겨주기
			model.addAttribute("boardName", dao.boardName());

			// 해당 게시판에 맞는 게시글 넘겨주기
			model.addAttribute("lists", dao.lists(bid));
			model.addAttribute("bpid", bpid);

			// 세션에 저장된 usId 보내주기
			model.addAttribute("usId", usId);

			dao.freeBlind(bpid);

			return view;
		}
	}

	// 질문게시판 답변 작성
	@RequestMapping(value = "/answerinsert.action", method = RequestMethod.POST)
	public String answerInsert(@ModelAttribute("usId") int usId, Model model, BoardDTO dto)
	{
		String view = "redirect:boardread.action";

		int bid = dto.getBid();
		int bpid = dto.getBpid();

		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

		model.addAttribute("readData", dao.readData(bid, bpid));
		model.addAttribute("bid", bid);
		model.addAttribute("bpid", bpid);

		// 세션에 저장된 usId 보내주기
		model.addAttribute("usId", usId);

		dao.answerInsert(dto);

		return view;
	}

	// 질문 게시판 답변 블라인드
	@RequestMapping(value = "/answerblind.action", method = RequestMethod.GET)
	public String answerBlind(@ModelAttribute("usId") int usId, Model model, int bid, int pid, int qid)
	{
		String view = "redirect:boardread.action";

		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

		model.addAttribute("readData", dao.readData(bid, pid));
		model.addAttribute("qid", qid);
		model.addAttribute("bid", bid);
		model.addAttribute("pid", pid);

		// 세션에 저장된 usId 보내주기
		model.addAttribute("usId", usId);

		dao.answerBlind(qid);

		return view;
	}

	// 질문 게시판 답변 삭제
	@RequestMapping(value = "/answerdelete.action", method = RequestMethod.GET)
	public String answerDelete(@ModelAttribute("usId") int usId, Model model, int bid, int bpid, int qid)
	{
		String view = "redirect:boardread.action";

		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

		model.addAttribute("readData", dao.readData(bid, bpid));
		model.addAttribute("qid", qid);
		model.addAttribute("bid", bid);
		model.addAttribute("bpid", bpid);

		// 세션에 저장된 usId 보내주기
		model.addAttribute("usId", usId);

		dao.answerDelete(qid);

		return view;
	}

	// 게시판 댓글 작성
	@RequestMapping(value = "/comment.action", method = RequestMethod.POST)
	public String commentInsert(@ModelAttribute("usId") int usId, Model model, BoardDTO dto)
	{
		String view = "redirect:boardread.action";

		int bid = dto.getBid();
		int bpid = dto.getBpid();

		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

		model.addAttribute("readData", dao.readData(bid, bpid));
		model.addAttribute("bid", bid);
		model.addAttribute("bpid", bpid);

		// 세션에 저장된 usId 보내주기
		model.addAttribute("usId", usId);

		dao.commentInsert(dto);

		return view;
	}

	// 게시판 댓글 삭제(블라인드) 메소드
	@RequestMapping(value = "/commentblind.action", method = RequestMethod.GET)
	public String commentBlind(@ModelAttribute("usId") int usId, Model model, int coid, int bid, int bpid)
	{
		// System.out.println(bid +", " + pid);

		String view = "redirect:boardread.action";

		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		model.addAttribute("coid", coid);
		model.addAttribute("bid", bid);
		model.addAttribute("bpid", bpid);

		// 세션에 저장된 usId 보내주기
		model.addAttribute("usId", usId);

		dao.commentBlind(coid);

		return view;
	}

	// 게시글 신고 접수 메소드
	@RequestMapping(value = "/reportinsert.action", method = RequestMethod.POST)
	public String reportInsert(@ModelAttribute("usId") int usId, Model model, BoardDTO dto)
	{
		String view = "redirect:board.action";

		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);

		model.addAttribute("bid", dto.getBid());
		model.addAttribute("bpid", dto.getBpid());
		model.addAttribute("hit", dao.hit(dto.getBid(), dto.getBpid())); // 조회 수 조회

		// 세션에 저장된 usId 보내주기
		model.addAttribute("usId", usId);

		dao.reportInsert(dto);
		dao.freeBlind(dto.getBpid());

		return view;

	}

	// =================================================== 동현 끝
	// ============================================================

	// =================================================== 원정 시작
	// ========================================================
	// == ○ 검색
	// ================================================================================================================================//

	// == ○ 검색
	// ================================================================================================================================//

	// 이름을 검색 할 경우 - 관리자 계정
	@RequestMapping(value = "/admin_searchname.action", method = RequestMethod.GET)
	public String Admin_searchName(Model model, AdminDTO dto)
	{
		String view = "/WEB-INF/views/ADMIN_AccountUserList.jsp";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		model.addAttribute("user_list", dao.searchName_Account(dto));

		return view;
	}

	// 신고처리된(패널티 부여)유저 검색

	@RequestMapping(value = "/ReceivedPenalty_searchname.action", method = RequestMethod.GET)
	public String ReceivedPenalty_searchName(Model model, AdminDTO dto)
	{
		String view = "/WEB-INF/views/ADMIN_ReceivedList.jsp";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		model.addAttribute("received_user", dao.searchName_Received(dto));

		return view;
	}

	// 신고된 유저 검색
	@RequestMapping(value = "/Received_searchname.action", method = RequestMethod.GET)
	public String ReceivedList_searchName(Model model, AdminDTO dto)
	{
		String view = "/WEB-INF/views/ADMIN_ReceiveList.jsp";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		model.addAttribute("receive_list", dao.searchName_Receivedlist(dto));

		return view;
	}

	// 승인된 공모전 검색
	@RequestMapping(value = "/conOk_searchname.action", method = RequestMethod.GET)
	public String ConOk_searchName(Model model, AdminDTO dto)
	{
		String view = "/WEB-INF/views/ADMIN_ConOkList.jsp";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		model.addAttribute("conOk_list", dao.searchName_ConOk(dto));

		return view;
	}

	// 휴면 계정인 유저 검색
	@RequestMapping(value = "/lockUser_searchname.action", method = RequestMethod.GET)
	public String LockUser_searchName(Model model, AdminDTO dto)
	{
		String view = "/WEB-INF/views/ADMIN_LockUserList.jsp";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		model.addAttribute("lockUser_list", dao.searchName_LockUser(dto));

		return view;
	}

	// 공모전 검색
	@RequestMapping(value = "/CON_searchname.action", method = RequestMethod.GET)
	public String CON_searchName(Model model, AdminDTO dto)
	{
		String view = "/WEB-INF/views/ADMIN_ConList.jsp";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		model.addAttribute("contest_list", dao.searchName_CON(dto));

		return view;
	}

	// 관리자 검색
	@RequestMapping(value = "/Admin_searchname.action", method = RequestMethod.GET)
	public String ADMIN_searchName(Model model, AdminDTO dto)
	{
		String view = "/WEB-INF/views/ADMIN_AdminList.jsp";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		model.addAttribute("admin_list", dao.searchName_ADMIN(dto));

		return view;
	}

	// ===========================================================================================================================================//

	// == ○ 관리자 - 게시판 신고
	// =======================================================================================================================//

	// 신고 접수된 목록을 불러온다.
	@RequestMapping(value = "/receive.action", method = RequestMethod.GET)
	public String receiveList(Model model, @ModelAttribute("usId") int usId)
	{

		String view = "";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		String result = dao.adminsearch(usId);
		if (result == null)
		{
			System.out.println("관리자 전용 페이지입니다.");// 헿
			model.addAttribute("msg", "관리자 전용 페이지입니다.");
			view = "redirect:mainpage.action";
		}
		else
		{
			model.addAttribute("receive_list", dao.receive_list());
			view = "/WEB-INF/views/ADMIN_ReceiveList.jsp";
		}

		return view;
	}

	// 신고 목록을 삭제한다.
	@RequestMapping(value = "/receivedelete.action", method = RequestMethod.GET)
	public String receiveDelete(AdminDTO dto)
	{
		String view = "";
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		String result = dao.adminsearch(dto.getUsId());
		if (result == null)
		{
			System.out.println("관리자 전용 페이지입니다.");// 헿
			view = "redirect:mainpage.action";
		}
		else
		{
			dao.Board_receive_delete(dto.getRpId());

			view = "redirect:receive.action";
			return view;
		}
		return view;
	}

	// 신고 처리(패널티 부여)를 기다리는 유저의 상세페이지
	@RequestMapping(value = "/receivedinformation.action", method = RequestMethod.GET)
	public String searchDTO(int num, Model model, @ModelAttribute("usId") int usId)
	{
		String view = "";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		String result = dao.adminsearch(usId);
		if (result == null)
		{
			System.out.println("관리자 전용 페이지입니다.");// 헿
			view = "redirect:mainpage.action";
		}
		else
		{
			model.addAttribute("searchUser", dao.searchUserDTO(num));

			view = "/WEB-INF/views/ADMIN_ReceivePenalty.jsp";
		}

		return view;
	}

	// 패널티를 부여하여 각각의 신고 처리테이블에 값을 넣는다.
	@RequestMapping(value = "/receivepenalty.action", method = RequestMethod.GET)
	public String penaltyInsert(AdminDTO dto, @ModelAttribute("adminId") String adminId, Model model)
	{
		String view = "";
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		System.out.println("rpText : " + dto.getRpText());

		dao.Board_receive_Insert(dto.getRpText(), dto.getTerm(), dto.getRpId(), adminId);

		view = "redirect:receive.action";
		return view;
	}

	// 신고 처리된(패널티 부여) 유저들의 리스트를 불러온다.
	@RequestMapping(value = "/receivedlist.action", method = RequestMethod.GET)
	public String receivedUserList(Model model, @ModelAttribute("usId") int usId)
	{
		String view = "";
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		String result = dao.adminsearch(usId);
		if (result == null)
		{
			System.out.println("관리자 전용 페이지입니다.");// 헿
			view = "redirect:mainpage.action";
		}
		else
		{
			model.addAttribute("received_user", dao.received_user());
			view = "/WEB-INF/views/ADMIN_ReceivedList.jsp";
		}

		return view;
	}

	// 신고 처리된(패널티 부여) 유저들의 상세 페이지로 넘어간다.
	@RequestMapping(value = "/receivedinfo.action", method = RequestMethod.GET)
	public String receiveUserInfo(AdminDTO dto, Model model)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		model.addAttribute("receivedinfo", dao.received_info(dto.getNum()));

		String view = "/WEB-INF/views/ADMIN_ReceivedUser.jsp";
		return view;
	}
	// ===========================================================================================================================================//

	// == ○ 관리자 - 댓글 신고
	// =======================================================================================================================//

	// ===========================================================================================================================================//

	// == ○ 관리자 - 공모전
	// =====================================================================================================================//

	// 공모전 목록을 불러온다.
	@RequestMapping(value = "/conlist.action", method = RequestMethod.GET)
	public String contestList(Model model, @ModelAttribute("usId") int usId)
	{
		String view = null;

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		String result = dao.adminsearch(usId);
		if (result == null)
		{
			System.out.println("관리자 전용 페이지입니다.");// 헿
			view = "redirect:mainpage.action";
		}
		else
		{
			model.addAttribute("contest_list", dao.contest_list());

			view = "/WEB-INF/views/ADMIN_ConList.jsp";
		}

		return view;
	}

	// 공모전의 상세페이지
	@RequestMapping(value = "/conInfo.action", method = RequestMethod.GET)
	public String conUser(int conId, Model model)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		model.addAttribute("conInfo", dao.conInfo(conId));

		String view = "/WEB-INF/views/ADMIN_ConInfo.jsp";
		return view;
	}

	// 공모전을 승인시킨다. << 여기
	@RequestMapping(value = "/conOk.action", method = RequestMethod.GET)
	public String conOk(int conId, @ModelAttribute("adminId") String adminId)
	{
		System.out.println("관리자인 이 사람의 번호는 : " + adminId);

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		dao.conOk(conId, adminId);

		String view = "redirect:conlist.action";
		return view;

		// ,dto.getAdminId() → 공모전 승인 시 관리자 계정 부여해야 할 것.
	}

	// 승인한 공모전을 볼 수 있는 리스트
	@RequestMapping(value = "/conOklist.action", method = RequestMethod.GET)
	public String contestOkList(Model model, @ModelAttribute("usId") int usId)
	{
		String view = null;

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		String result = dao.adminsearch(usId);
		if (result == null)
		{
			System.out.println("관리자 전용 페이지입니다.");// 헿
			view = "redirect:mainpage.action";
		}
		else
		{
			model.addAttribute("conOk_list", dao.con_Oklist());

			view = "/WEB-INF/views/ADMIN_ConOkList.jsp";
		}

		return view;
	}
	// ===========================================================================================================================================//

	// == ○ 관리자 - 관리자 계정 관리
	// ===========================================================================================================//

	// 관리자 계정을 부여할 일반 유저들의 목록을 불러온다.
	@RequestMapping(value = "/userlist.action", method = RequestMethod.GET)
	public String userList(Model model, @ModelAttribute("usId") int usId)
	{
		String view = null;

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		String result = dao.adminsearch(usId);
		System.out.println(result);
		if (result.equals("2"))
		{

			model.addAttribute("user_list", dao.user_list());

			view = "/WEB-INF/views/ADMIN_AccountUserList.jsp";
		}
		else
		{
			System.out.println("총 관리자 전용 페이지입니다.");// 헿
			view = "redirect:receive.action";
		}

		return view;
	}

	// 관리자 계정을 부여한다.(INSERT)
	@RequestMapping(value = "/useraccountinsert.action", method = RequestMethod.GET)
	public String userAccountInsert(int usId)
	{
		String view = "redirect:userlist.action";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		dao.adminaccount_add(usId);

		return view;
	}

	// 관리자 계정 부여 - 상세 페이지 넘어가기
	@RequestMapping(value = "/useraccountinfo.action", method = RequestMethod.GET)
	public String userAccountInfo(int usId, Model model, String ugSelect)
	{

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		model.addAttribute("useraccountinfo", dao.user_Info(usId));
		model.addAttribute("ugSelect", dao.searchGender(usId));

		System.out.println(dao.searchGender(usId));
		// System.out.println(usId);

		String view = "/WEB-INF/views/ADMIN_GiveAccount.jsp";
		return view;
	}

	// 관리자 목록을 확인할 수 있다.
	@RequestMapping(value = "/adminlist.action", method = RequestMethod.GET)
	public String adminList(Model model, @ModelAttribute("usId") int usId)
	{
		String view = null;

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		String result = dao.adminsearch(usId);
		if (result.equals("2"))
		{

			model.addAttribute("admin_list", dao.admin_list());

			view = "/WEB-INF/views/ADMIN_AdminList.jsp";
		}
		else
		{
			System.out.println("관리자 전용 페이지입니다.");// 헿
			view = "redirect:receive.action";
		}

		return view;
	}

	// 관리자의 권한을 박탈한다
	@RequestMapping(value = "/admindelete.action", method = RequestMethod.GET)
	public String adminDelete(AdminDTO dto)
	{
		String view = null;

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		dao.admindelete(dto.getAdminId());

		view = "redirect:adminlist.action";

		return view;
	}
	// ===========================================================================================================================================//

	// == ○ 관리자 - 휴면 계정 관리(이거 문제)
	// =============================================================================================================//

	// 휴면 계정인 유저들을 목록을 불러온다.
	@RequestMapping(value = "/lockuser.action", method = RequestMethod.GET)
	public String lockUserList(Model model, @ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/ADMIN_LockUserList.jsp";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		String result = dao.adminsearch(usId);
		if (result == null)
		{
			System.out.println("관리자 전용 페이지입니다.");// 헿
			view = "redirect:mainpage.action";
		}
		else
		{
			System.out.println(usId);
			model.addAttribute("lockUser_list", dao.lockUser_list());
			view = "/WEB-INF/views/ADMIN_LockUserList.jsp";
		}
		return view;
	}

	// =================================================== 원정 끝
	// ========================================================\

	// ==================================================== 현수 시작
	// ========================================================================
	// -- 개설 페이지로

	/*
	 * @RequestMapping(value = "/project_create.action", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public String projectCreate(Model
	 * model, @ModelAttribute("usId") int usId) { String view =
	 * "/WEB-INF/views/Project_Create_modal.jsp";
	 * 
	 * IProjectCreateDAO dao = sqlSession.getMapper(IProjectCreateDAO.class);
	 * 
	 * int achCount = dao.userAchievement(usId).size(); // 칭호 갯수
	 * 
	 * model.addAttribute("getUser", dao.getUser(usId)); // 해당 유저의 정보
	 * 
	 * model.addAttribute("skillList", dao.skillList()); // 사이트에 등록된 기술 리스트
	 * model.addAttribute("userLevel", dao.userLevel(usId)); // 해당 유저의 레벨
	 * model.addAttribute("period", dao.getPeriod()); // 기간
	 * model.addAttribute("people", dao.getPeople()); // 인원
	 * model.addAttribute("onlineRate", dao.getOnlineRate()); // 온라인 비율
	 * model.addAttribute("achCount", achCount); // 칭호 갯수
	 * model.addAttribute("achievement", dao.userAchievement(usId)); // 해당 유저의 칭호
	 * 
	 * model.addAttribute("startDate", dao.startDate()); // 프로젝트 예상 시작일
	 * 
	 * model.addAttribute("usId", usId);
	 * 
	 * return view; }
	 */

	// -- 개설 → 모집중
	@RequestMapping(value = "/project_create_ok.action", method =
	{
			RequestMethod.GET, RequestMethod.POST
	})
	public String projectCreateOk(Model model, ProjectCreateDTO prjDto, SubjectDTO subDto, SkillDTO skDto,
			proachievementDTO achDto)
	{
		String view = "redirect:recruitment_project.action";

		int usId = prjDto.getUsId(); // 유저 id

		// 위에서 데이터를 받아서
		// insert 쿼리문 실행해야 함

		IProjectCreateDAO dao = sqlSession.getMapper(IProjectCreateDAO.class);

		// 프로젝트 개설 메소드
		dao.projectCreate(prjDto);

		// 방금 개설된 프로젝트 번호
		int pid = dao.getCreatePrjId(usId); // 받아오는거 확인.

		// 개설된 프로젝트에 기술 등록 메소드
		for (int skId : skDto.getSkId1())
		{
			if (skId != 0)
				dao.insertSkill(pid, skId);
		}

		// 개설된 프로젝트에 주제 등록 메소드
		// 주제가 있을 경우!
		if (subDto.getSname() != null && subDto.getSname() != "")
		{
			dao.insertPcontents(pid, subDto.getSname());
		}

		// 개설된 프로젝트에 칭호 등록 메소드
		if (achDto.getAcId1() != null)
		{
			for (int acId : achDto.getAcId1())
			{
				System.out.print("  < acId : " + acId + ">");

				if (acId != 0)
					dao.insertAch(pid, usId, acId);
			}
		}

		model.addAttribute("pid", pid);
		model.addAttribute("usId", usId);

		return view;

	}

	// -- 프로젝트 수정
	@RequestMapping(value = "/project_edit.action", method =
	{
			RequestMethod.GET, RequestMethod.POST
	})
	public String projectEdit(Model model, ProjectCreateDTO prjDto, SubjectDTO subDto, SkillDTO skDto,
			proachievementDTO achDto)
	{
		String view = "/WEB-INF/views/Project_Create.jsp";

		int pid = prjDto.getPid();
		int usId = prjDto.getUsId();

		IProjectCreateDAO dao = sqlSession.getMapper(IProjectCreateDAO.class);

		int achCount = dao.userAchievement(usId).size(); // 개설자의 칭호 갯수

		model.addAttribute("project", dao.getProject(pid)); // 해당 프로젝트

		model.addAttribute("proAch", dao.getAchievement(pid)); // 칭호 받아와서 넘겨주기

		model.addAttribute("proPeriod", dao.getProPeriod(pid)); // 프로젝트 기간
		model.addAttribute("onRate", dao.getOnRate(pid)); // 온라인/오프라인 비율

		model.addAttribute("sname", dao.getSubject(pid)); // 주제

		model.addAttribute("getUser", dao.getUser(usId)); // 개설자의 정보

		model.addAttribute("userLevel", dao.userLevel(usId)); // 개설자의 레벨
		model.addAttribute("period", dao.getPeriod()); // 기간
		model.addAttribute("people", dao.getPeople()); // 인원
		model.addAttribute("onlineRate", dao.getOnlineRate()); // 온라인 비율
		model.addAttribute("achCount", achCount); // 개설자의 칭호 갯수
		model.addAttribute("achievement", dao.userAchievement(usId)); // 개설자의 칭호
		model.addAttribute("totProJoinCount", dao.totProJoinCount(pid)); // 현재 프로젝트에 참여한 인원

		model.addAttribute("pid", pid);
		model.addAttribute("usId", usId);

		return view;
	}

	// -- 수정 → 수정 완료
	@RequestMapping(value = "/project_update_ok.action", method =
	{
			RequestMethod.GET, RequestMethod.POST
	})
	public String projectUpdateOk(Model model, ProjectCreateDTO prjDto, SubjectDTO subDto, SkillDTO skDto,
			proachievementDTO achDto)
	{
		String view = "redirect:recruitment_project.action";
		// 위에서 데이터를 받아서
		// insert 쿼리문 실행해야 함

		int pid = prjDto.getPid();
		int usId = prjDto.getUsId();

		IProjectCreateDAO dao = sqlSession.getMapper(IProjectCreateDAO.class);
		ProjectCreateDTO gprjDto = dao.getProject(pid);

		String mcontents = "<프로젝트가 수정되었습니다.>\n";

		String rname = gprjDto.getRname(); // 기존 제목
		String pcontents = gprjDto.getPcontents(); // 기존 소개글
		int oid = gprjDto.getOid(); // 기존 온라인 비율
		String paddress = gprjDto.getPaddress(); // 기존 지역
		int proId = gprjDto.getProId(); // 기존 기간
		int minLevel = gprjDto.getMinLevel(); // 기존 참여 레벨
		int maxLevel = gprjDto.getMaxLevel(); // 기존 참여 레벨
		int gid = gprjDto.getGid(); // 기존 성별
		int peoId = gprjDto.getPeoId(); // 기존 모집 인원

		model.addAttribute("pid", pid);
		model.addAttribute("usId", usId);

		dao.projectUpdate(prjDto);

		// dao.deleteSkill(pid); // 프로젝트 개설 후에는 기술 변경을 못하기 때문에 주석으로 처리
		dao.deletePcontents(pid);
		dao.deleteAch(pid);

		/*
		 * // 프로젝트 개설 후에는 기술 변경을 못하기 때문에 주석으로 처리 // 개설된 프로젝트에 기술 등록 메소드 for (int skId :
		 * skDto.getSkId1()) { System.out.println("< skId : " + skId + ">"); // 잘 찍힘~
		 * 
		 * if(skId != 0) dao.insertSkill(pid, skId); }
		 */

		// 개설된 프로젝트에 주제 등록 메소드
		// 주제가 있을 경우!
		if (subDto.getSname() != null && subDto.getSname() != "")
		{
			dao.insertPcontents(pid, subDto.getSname());
		}

		// 개설된 프로젝트에 칭호 등록 메소드
		if (achDto.getAcId1() != null)
		{
			for (int acId : achDto.getAcId1())
			{
				if (acId != 0)
					dao.insertAch(pid, usId, acId);
			}
		}

		int pmId = 2; // 로그는 2
		dao.sendMessage(mcontents, usId, pid, pmId);

		if (rname != prjDto.getRname())
		{
			mcontents = "제목 : " + rname + " → " + prjDto.getRname();
			dao.sendMessage(mcontents, usId, pid, pmId);
		}

		if (pcontents != prjDto.getPcontents())
		{
			mcontents = "소개글 : " + pcontents + " → " + prjDto.getPcontents();
			dao.sendMessage(mcontents, usId, pid, pmId);
		}

		if (oid != prjDto.getOid())
		{
			mcontents = "온라인 비율이 변경되었습니다.";
			dao.sendMessage(mcontents, usId, pid, pmId);
		}

		if (paddress != prjDto.getPaddress())
		{
			mcontents = "지역이 변경되었습니다.";
			dao.sendMessage(mcontents, usId, pid, pmId);
		}

		if (proId != prjDto.getProId())
		{
			mcontents = "기간이 변경되었습니다.";
			dao.sendMessage(mcontents, usId, pid, pmId);
		}

		if (minLevel != prjDto.getMinLevel() || maxLevel != prjDto.getMaxLevel())
		{
			mcontents = "참여 레벨이 변경되었습니다.";
			dao.sendMessage(mcontents, usId, pid, pmId);
		}

		if (gid != prjDto.getGid())
		{
			mcontents = "참여 성별이 변경되었습니다.";
			dao.sendMessage(mcontents, usId, pid, pmId);
		}

		if (peoId != prjDto.getPeoId())
		{
			mcontents = "모집 인원이 변경되었습니다.";
			dao.sendMessage(mcontents, usId, pid, pmId);
		}

		return view;

	}

	// -- 모집중 페이지
	@RequestMapping(value = "/recruitment_project.action", method =
	{
			RequestMethod.GET, RequestMethod.POST
	})
	public String recruitmentProject(Model model, ProjectCreateDTO dto, @ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/Recruitment_Project.jsp";

		int pid = dto.getPid();

		IProjectCreateDAO dao = sqlSession.getMapper(IProjectCreateDAO.class);

		IUserDAO dao1 = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao1.getUsPhoto(usId));

		// -- pid 세션에 넣어주는

		// --

		IProjectDAO dao2 = sqlSession.getMapper(IProjectDAO.class);

		model.addAttribute("usId", usId);

		int flag = 1;

		// 참여하지 않은 인원일 경우
		for (int i : dao.totProJoin(pid)) // 해당 프로젝트의 참여한 usId를 비교하여
		{
			if (usId != i) // 참여하지 않은 경우
				flag = -1;
			else
			{
				flag = 1;
				break;
			}
		}

		if (flag == -1)
		{
			// 모집 리스트로 보내버리기~
			view = "redirect:moziplist.action";

			return view;
		}

		model.addAttribute("pid", pid);

		// 퇴출투표가 진행중인지 거르기(기간이 끝나지 않은 발의된 투표인지)
		if (dao2.memberOutVoteIng(pid) == 1)
		{
			// 타겟이 아닌경우
			if (dao2.pjIdToUsId(dao2.memberOutVoteInfo(pid).getPjId()) != usId)
			{
				// 투표를 아직 진행안한경우(pid, usid)
				if (dao2.outVoteEndMember(pid, usId) == 0)
					return "redirect:rec_member_out_vote_start.action";
				// 모든인원이 투표를 했으면서, 결과가 없는 발의번호일 경우
				else if ((dao2.peopleNumber(pid) - 1) == dao2.outVoteEndList(pid).size()
						&& dao2.hasOutVoteResult(pid) == 0)
					return "redirect:rec_member_out_result_ok.action";
				// 결과가 있는 발의번호일 경우 이면서 결과확인을 안한 경우
				else if (dao2.hasOutVoteResult(pid) == 1 && dao2.isKickVoteCheck(dao2.usIdToPjId(pid, usId)) != 1)
					return "redirect:rec_member_out_vote_result.action";
			}

		}

		// 멤버 퇴출투표 진행중 여부 확인하는 key 보내기
		model.addAttribute("memberOutKey", dao2.memberOutVoteIng(pid)); // 쓰이지는 않음.

		model.addAttribute("getUser", dao.getUser(usId)); // 해당 유저의 정보

		model.addAttribute("getProject", dao.getProject(pid)); // 프로젝트 정보

		model.addAttribute("proSkill", dao.getSkill(pid)); // 프로젝트 등록된 기술

		model.addAttribute("proAch", dao.getAchievement(pid)); // 칭호 받아와서 넘겨주기

		model.addAttribute("proPeriod", dao.getProPeriod(pid)); // 프로젝트 기간
		model.addAttribute("onRate", dao.getOnRate(pid)); // 온라인/오프라인 비율

		model.addAttribute("sname", dao.getSubject(pid)); // 주제

		String startDate = dao.getProjectStartDate(pid); // 프로젝트 시작일

		model.addAttribute("startDate", dao.getProjectStartDate(pid)); // 프로젝트 시작일

		int totalCount = dao.totProJoinCount(pid); // 현재 인원 수
		int peopleCount = dao.getPeopleCount(pid); // 모집 인원 수

		model.addAttribute("totalCount", totalCount); // 현재 인원 수
		model.addAttribute("peopleCount", peopleCount); // 모집 인원 수

		model.addAttribute("message", dao.getMessage(pid)); // 채팅창

		model.addAttribute("usId", usId);

		int divOne[] = dao.divOne(pid); // 윗 줄에 있을 멤버의 usId를 받아옴.
		int divTwo[] = dao.divTwo(pid); // 아래 줄에 있을 멤버의 usId를 받아옴.

		ArrayList<UserInsertDTO> memberInfo1 = new ArrayList<UserInsertDTO>(); // 윗 줄에 멤버 정보 리스트
		ArrayList<UserInsertDTO> memberInfo2 = new ArrayList<UserInsertDTO>(); // 아랫줄에 멤버 정보 리스트

		// 윗 줄에 있을 멤버의 usId를 ArrayList에 저장.
		for (int i : divOne)
			memberInfo1.add(dao.memberInfo(pid, i));
		model.addAttribute("memberInfo1", memberInfo1);

		int memberInfo1Size = memberInfo1.size(); // 빈 공간을 매꿔주기 위해서 사용. 반복문의 초기값으로 사용 (피라미드 해결하기 위해서)
		model.addAttribute("memberInfo1Size", memberInfo1Size);

		// 아랫 줄에 있을 멤버의 usId를 ArrayList에 저장.
		for (int i : divTwo)
			memberInfo2.add(dao.memberInfo(pid, i));
		model.addAttribute("memberInfo2", memberInfo2);

		int memberInfo2Size = memberInfo2.size(); // 빈 공간을 매꿔주기 위해서 사용. 반복문의 초기값으로 사용 (피라미드 해결하기 위해서)
		model.addAttribute("memberInfo2Size", memberInfo2Size);

		model.addAttribute("<proSkill> : ", dao.getSkill(pid)); // 개설자가 등록한 필요한 기술

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Calendar time = Calendar.getInstance();

		String sysTime = format1.format(time.getTime()); // 현재 시간

		// startDate = "2019년12월27일 08시59분";

		// 현재 날짜와 비교하기 위해 변환
		startDate = startDate.replace("년 ", "-");
		startDate = startDate.replace("월 ", "-");
		startDate = startDate.replace("일", "");
		startDate = startDate.replace("시 ", ":");
		startDate = startDate.replace("분", "");

		int compare = startDate.compareTo(sysTime); // 현재 시간과 프로젝트 시작일 비교.

		System.out.println("<startDate> : " + startDate); // 프로젝트 시작일 콘솔에 출력
		System.out.println("<sysTime> : " + sysTime); // 현재 시간 콘솔에 출력
		System.out.println("<compare> : " + compare);

		if (compare < 0) // 모집 기간이 지난 경우
		{
			if (peopleCount == totalCount) // 모집 인원과 현재 인원이 같은 경우. 즉, 모집이 완료된 경우
			{
				model.addAttribute("start", "start"); // 프로젝트 시작했다는 의미로 넘겨줌. 프로젝트가 시작되고서는 수정을 못하게 하기 위해서!
				// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//					view = "/projectnavi.action";
				view = "projectnavi.action";
				return view;
				// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			}

			else
			{
				// 해당 프로젝트 삭제
				dao.deleteProject(pid);

				// 프로젝트 취소되었다는 뷰로 보내야함.!
				// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//					view = "/moziplist.action";
				view = "project_create.action";
				return view;
				// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			}
		}

		return view;
	}

	// -- 채팅 보내기~
	@RequestMapping(value = "/send_message.action", method =
	{
			RequestMethod.GET, RequestMethod.POST
	})
	public String sendMessage(Model model, ProjectCreateDTO dto, messageDTO msgDto)
	{
		String view = "redirect:recruitment_project.action";

		int pid = dto.getPid();
		int usId = dto.getUsId();

		IProjectCreateDAO dao = sqlSession.getMapper(IProjectCreateDAO.class);

		String mcontents = msgDto.getNickName() + msgDto.getMcontents();

		int pmId = 1; // 채팅은 1
		dao.sendMessage(mcontents, usId, pid, pmId);

		model.addAttribute("pid", pid);
		model.addAttribute("usId", usId);

		return view;
	}

	// -- 프로젝트 나가기
	@RequestMapping(value = "/project_exit.action", method =
	{
			RequestMethod.GET
	})
	public String exitProject(Model model, ProjectCreateDTO dto)
	{
		String view = "/moziplist.action";

		int pid = dto.getPid();
		int usId = dto.getUsId();

		IProjectCreateDAO dao = sqlSession.getMapper(IProjectCreateDAO.class);

		dao.exitProject(pid, usId);

		int pmId = 2; // 로그는 2

		String mcontents = dao.getUser(usId).getNickName() + "님이 퇴장하였습니다.";
		dao.sendMessage(mcontents, usId, pid, pmId);

		if (dao.totProJoinCount(pid) == 0) // 프로젝트에 참여하고 있는 인원이 없을 경우
			dao.deleteProject(pid); // 프로젝트를 삭제.

		return view;
	}

	// -- 유저 정보 열람(프로젝트 모집중)
	@RequestMapping(value = "/member_info.action", method =
	{
			RequestMethod.GET, RequestMethod.POST
	})
	public String memberInfo(Model model, ProjectCreateDTO dto, int member, @ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/Member_Information.jsp";

		int pid = dto.getPid();

		IProjectCreateDAO dao = sqlSession.getMapper(IProjectCreateDAO.class);
		IProjectDAO dao2 = sqlSession.getMapper(IProjectDAO.class);
		IUserDAO dao3 = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao3.getUsPhoto(usId));

		int memberOutVoteIng = dao2.memberOutVoteIng(pid); // 퇴출 투표 진행 여부

		model.addAttribute("memberOutVoteIng", memberOutVoteIng);

		model.addAttribute("getProject", dao.getProject(pid));
		model.addAttribute("member", member);

		model.addAttribute("getUser", dao.getUser(member));
		model.addAttribute("userLevel", dao.userLevel(member));
		model.addAttribute("userAge", dao.userAge(member));
		model.addAttribute("usPhoto_mem", dao3.getUsPhoto(member));

		int totalCount = dao.totProJoinCount(pid); // 현재 인원 수
		model.addAttribute("totalCount", totalCount);

		int ingProject = dao.ingProject(member);
		int completedProject = dao.completedProject(member);

		ingProject = ingProject - completedProject; // 순수하게 진행 중인 프로젝트의 갯수!

		model.addAttribute("ingProject", ingProject);
		model.addAttribute("completedProject", completedProject);
		model.addAttribute("avgPeriod", dao.avgPeriod(member));
		model.addAttribute("userAch", dao.getUserAch(member)); //

		model.addAttribute("pid", pid);

		model.addAttribute("avgEstimate1", dao.avgEstimate1(member));
		model.addAttribute("avgEstimate2", dao.avgEstimate2(member));
		model.addAttribute("avgEstimate3", dao.avgEstimate3(member));
		model.addAttribute("avgEstimate4", dao.avgEstimate4(member));
		model.addAttribute("avgEstimate5", dao.avgEstimate5(member));
		model.addAttribute("avgEstimate6", dao.avgEstimate6(member));
		model.addAttribute("avgEstimate7", dao.avgEstimate7(member));
		model.addAttribute("avgEstimate", dao.avgEstimate(member));

		model.addAttribute("manyUseSkill", dao.manyUseSkill(member));
		model.addAttribute("manyActiveAddress", dao.manyActiveAddress(member));

		model.addAttribute("usId", usId);

		return view;
	}

	// -- 유저 정보 열람(프로젝트 진행중)
	@RequestMapping(value = "/member_info_pro.action", method =
	{
			RequestMethod.GET, RequestMethod.POST
	})
	public String memberProInfo(Model model, @ModelAttribute("pid") int pid, int member,
			@ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/Member_Information.jsp";

		model.addAttribute("naviKey", 1);

		IProjectCreateDAO dao = sqlSession.getMapper(IProjectCreateDAO.class);
		IProjectDAO dao2 = sqlSession.getMapper(IProjectDAO.class);
		IUserDAO dao3 = sqlSession.getMapper(IUserDAO.class);

		model.addAttribute("usPhoto", dao3.getUsPhoto(usId));

		int memberOutVoteIng = dao2.memberOutVoteIng(pid); // 퇴출 투표 진행 여부

		model.addAttribute("memberOutVoteIng", memberOutVoteIng);

		model.addAttribute("getProject", dao.getProject(pid));
		model.addAttribute("member", member);

		model.addAttribute("getUser", dao.getUser(member));
		model.addAttribute("userLevel", dao.userLevel(member));
		model.addAttribute("userAge", dao.userAge(member));
		model.addAttribute("usPhoto_mem", dao3.getUsPhoto(member));

		int totalCount = dao.totProJoinCount(pid); // 현재 인원 수
		model.addAttribute("totalCount", totalCount);

		int ingProject = dao.ingProject(member);
		int completedProject = dao.completedProject(member);

		ingProject = ingProject - completedProject; // 순수하게 진행 중인 프로젝트의 갯수!

		model.addAttribute("ingProject", ingProject);
		model.addAttribute("completedProject", completedProject);
		model.addAttribute("avgPeriod", dao.avgPeriod(member));
		model.addAttribute("userAch", dao.getUserAch(member)); //

		model.addAttribute("pid", pid);

		model.addAttribute("avgEstimate1", dao.avgEstimate1(member));
		model.addAttribute("avgEstimate2", dao.avgEstimate2(member));
		model.addAttribute("avgEstimate3", dao.avgEstimate3(member));
		model.addAttribute("avgEstimate4", dao.avgEstimate4(member));
		model.addAttribute("avgEstimate5", dao.avgEstimate5(member));
		model.addAttribute("avgEstimate6", dao.avgEstimate6(member));
		model.addAttribute("avgEstimate7", dao.avgEstimate7(member));
		model.addAttribute("avgEstimate", dao.avgEstimate(member));

		model.addAttribute("manyUseSkill", dao.manyUseSkill(member));
		model.addAttribute("manyActiveAddress", dao.manyActiveAddress(member));

		return view;
	}

	// 프로젝트 참여하기
	@RequestMapping(value = "/project_join.action", method =
	{
			RequestMethod.GET, RequestMethod.POST
	})
	public String projectJoin(Model model, ProjectCreateDTO dto, @ModelAttribute("usId") int usId)
	{
		String view = "redirect:recruitment_project.action";

		int pid = dto.getPid();

		IProjectCreateDAO dao = sqlSession.getMapper(IProjectCreateDAO.class);

		for (int i : dao.totProJoin(pid)) // 해당 프로젝트의 참여한 usId를 비교하여
		{
			if (usId == i) // 같은 경우... 참여한 경우
			{
				// 모집중 페이지로 이동!
				model.addAttribute("pid", pid);
				model.addAttribute("usId", usId);

				return view;
			}
		}

		// 인원이 다 찼을 경우. 종범이형이 스크립트에서 막는다고 함.

		int totCount = dao.getPeopleCount(pid); // 모집 인원
		int joinCount = dao.totProJoin(pid).length; // 참여 인원

		if (totCount >= joinCount + 1) // 내가 참여했을 때의 참여 인원이 모집 인원과 같거나 작아야만 참여 가능
		{
			// 입장 메소드 넣고
			dao.proJoin(pid, usId);

			int pmId = 2;
			String mcontents = dao.getUser(usId).getNickName() + "님이 입장하였습니다.";

			dao.sendMessage(mcontents, usId, pid, pmId);
			view = "redirect:recruitment_project.action";
		}
		else
		{
			view = "moziplist.action";
		}

		// 입장 메소드 넣고
		/*
		 * dao.proJoin(pid, usId);
		 * 
		 * int pmId = 2; String mcontents = dao.getUser(usId).getNickName() +
		 * "님이 입장하였습니다.";
		 * 
		 * dao.sendMessage(mcontents, usId, pid, pmId);
		 */

		model.addAttribute("pid", pid);
		model.addAttribute("usId", usId);

		return view;
	}

	// ================================================================================================================================================================================================================================================================

	// -- 멤버 퇴출투표 발의 (모집중)
	@RequestMapping(value = "/rec_member_out_propose.action", method =
	{
			RequestMethod.GET, RequestMethod.POST
	})
	public String recMemberOutVoteCont(Model model, ProgressDTO dto, int member, @ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/rec_member_out_propose.jsp";

		int pid = dto.getPid();

		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		model.addAttribute("usPhoto", dao2.getUsPhoto(usId));

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		ArrayList<ProjectDTO> memberInfo = new ArrayList<ProjectDTO>();

		memberInfo.add(dao.proUserInfo(member, pid));

		for (ProjectDTO projectDTO : memberInfo)
		{
			model.addAttribute("memberInfo", projectDTO);
		}

		// 개설할 시 투표 종료일자 찍어주기
		model.addAttribute("memberOutVoteEnd", dao.memberOutVoteEnd());

		model.addAttribute("pid", pid);
		model.addAttribute("member", member);

		return view;

	}

	// -- 퇴출 투표 발의 → db에 저장 (모집중)
	@RequestMapping(value = "/rec_member_out_propose_ok.action", method =
	{
			RequestMethod.GET, RequestMethod.POST
	})
	public String recMemberOutProposeOkCont(Model model, ProgressDTO dto, int member)
	{
		String view = "redirect:rec_member_out_vote_start.action";

		int pid = dto.getPid();

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// usId → pjId 로 변환하기
		dto.setPjId(dao.usIdToPjId(pid, member));

		// 퇴출투표 실시
		dao.memberOutVoteInsert(dto);

		model.addAttribute("pid", pid);

		return view;

	}

	// -- 멤버 퇴출투표 시작 (모집중)
	@RequestMapping(value = "/rec_member_out_vote_start.action", method = RequestMethod.GET)
	public String recMemberOutStartCont(Model model, ProgressDTO dto, @ModelAttribute("usId") int usId)
	{
		String view = "/WEB-INF/views/rec_member_out_vote_start.jsp";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		int pid = dto.getPid();

		// 투표 남은시간 알려주기(일, 시, 분, 초)
		model.addAttribute("remainTime", dao.outVoteRemainTime(pid));

		// 해당 인원에 대한 정보 알려주기
		model.addAttribute("targetInfo", dao.proUserInfo(dao.pjIdToUsId(dao.memberOutVoteInfo(pid).getPjId()), pid));

		// 해당 인원에 대한 사유
		model.addAttribute("targetReason", dao.memberOutVoteInfo(pid).getPreason());

		model.addAttribute("pid", dto.getPid());
		model.addAttribute("usId", dto.getUsId());

		return view;
	}

	// -- 퇴출 투표 insert (모집중)
	@RequestMapping(value = "/rec_member_out_vote_ok.action", method = RequestMethod.GET)
	public String recMemberOutVoteOkCont(Model model, ProgressDTO dto)
	{
		String view = "redirect:recruitment_project.action";

		int pid = dto.getPid();
		int usId = dto.getUsId();

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		// 본인 usId 를 pjId 로 바꾸기
		dto.setPjId(dao.usIdToPjId(pid, usId));

		// 발의번호 넣기
		dto.setPkpId(dao.memberOutVoteInfo(pid).getPkpId());

		// 퇴출투표 submit하기
		dao.memberOutVoteSubmit(dto);

		model.addAttribute("pid", pid);
		model.addAttribute("usId", usId);

		return view;

	}

	// -- 퇴출투표 결과 테이블에 insert 하기 (모집중)
	@RequestMapping(value = "/rec_member_out_result_ok.action", method = RequestMethod.GET)
	public String recMemberOutResultOkcont(Model model, ProgressDTO dto)
	{
		String view = "redirect:rec_member_out_vote_result.action";

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		int pid = dto.getPid();

		// 결과 입력
		dao.outVoteResultInsert(dao.memberOutVoteInfo(pid).getPkpId());

		System.out.println(dao.outVoteResultCount(pid, 1));
		System.out.println(dao.peopleNumber(pid));

		// 찬성표가 과반수 이상이면 퇴출
		if (dao.outVoteResultCount(pid, 1) >= dao.peopleNumber(pid) / (double) 2)
		{
			dao.proExitInsert(dao.memberOutVoteInfo(pid).getPjId());
		}

		model.addAttribute("pid", pid);

		return view;
	}

	// -- 모든 인원이 투표를 다 마친후 결과가 입력되었을 경우 (모집중)
	@RequestMapping(value = "/rec_member_out_vote_result.action", method = RequestMethod.GET)
	public String recMemberOutVoteResultCont(Model model, ProgressDTO dto)
	{
		String view = "/WEB-INF/views/Member_Out_Vote_Result.jsp";

		int usId = dto.getUsId();
		int pid = dto.getPid();

		model.addAttribute("pid", pid);
		model.addAttribute("usId", usId);

		IProjectDAO dao = sqlSession.getMapper(IProjectDAO.class);

		dao.kickVoteCheckUpdate(dao.usIdToPjId(pid, usId));

		// 찬성, 반대, 무효표 수 보내기
		model.addAttribute("yes", dao.outVoteResultCount(pid, 1));
		model.addAttribute("no", dao.outVoteResultCount(pid, 2));
		model.addAttribute("noAnswer", dao.outVoteResultCount(pid, 3));
		// 퇴출투표 결과 일자
		model.addAttribute("resultDate", dao.outVoteResultInfo(pid).getPkDate());

		// 찬성표가 과반수 이상인지?
		if (dao.outVoteResultCount(pid, 1) >= dao.peopleNumber(pid) / (double) 2)
		{
			// 팀원 퇴출 결과 출력
			model.addAttribute("target", dao.getUserNickName(dao.pjIdToUsId(dao.memberOutVoteInfo(pid).getPjId())));
			model.addAttribute("message", " 님이 퇴출되었습니다.");

		}
		else
		{
			// 부결 결과 출력
			model.addAttribute("message", "퇴출투표가 부결되었습니다.");
		}

		model.addAttribute("end", 2);

		return view;

	}

	// ========================================================== 현수 끝
	// ==================================================================

}
