/*=================================
 *  IProjectMainDAO.java
 *  - 인터페이스
 *  - 프로젝트 모집, 진행중, 완료
 *    에 대한 메소드를 선언
 *===============================*/

package com.team1.pro.main;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IProjectMainDAO
{	
	public ArrayList<ProjectMainDTO> mainProjectList1(@Param("usId") int usId);				//-- 개설된 프로젝트 메소드1(모집)
	public ArrayList<ProjectMainDTO> mainProjectList2(@Param("usId") int usId);				//-- 개설된 프로젝트 메소드2(추가모집) 수정필요
	public ArrayList<ProjectMainDTO> mainProjectList3(@Param("usId") int usId);				//-- 개설된 프로젝트 메소드3(진행)
	public ArrayList<ProjectMainDTO> mainProjectList4(@Param("usId") int usId);				//-- 개설된 프로젝트 메소드4(완료)
	
	public ArrayList<ProjectMainDTO> myMainProjectListMozip(@Param("usId") int usId);		//-- 대기하고 있는 나의 프로젝트
	public ArrayList<ProjectMainDTO> myMainProjectListProgress(@Param("usId") int usId);	//-- 진행하고 있는 나의 프로젝트
	public ArrayList<ProjectMainDTO> myMainProjectListFinish(@Param("usId") int usId);		//-- 완료된 나의 프로젝트
	
	public int currentCount(@Param("pid") int pid);				    									//-- 프로젝트에 들어와있는 인원 수
	public String sname(@Param("pid") int pid);															//-- 프로젝트 제목
	public String[] skName(@Param("pid") int pid);														//-- 프로젝트 필요기술
	public String[] acName(@Param("pid") int pid);														//-- 프로젝트 칭호
	
	public ArrayList<ProjectMainDTO> findListMozip(ProjectMainDTO dto);						//-- 모집 탭에서 skName, sname, acName 검색
	public ArrayList<ProjectMainDTO> findListMozipAdd(ProjectMainDTO dto);					//-- 추가모집 탭에서 skName, sname, acName 검색
	public ArrayList<ProjectMainDTO> findListProgress(ProjectMainDTO dto);					//-- 진행 탭에서 skName, sname, acName 검색
	public ArrayList<ProjectMainDTO> findListFinish(ProjectMainDTO dto);					//-- 완료 탭에서 skName, sname, acName 검색
	
	public ArrayList<ProjectMainDTO> findListAddMozip(ProjectMainDTO dto);					//-- 모집 탭에서 skName, sname, acName 제외한 나머지 검색
	public ArrayList<ProjectMainDTO> findListAddMozipAdd(ProjectMainDTO dto);				//-- 추가모집 탭에서 skName, sname, acName 제외한 나머지 검색
	public ArrayList<ProjectMainDTO> findListAddProgress(ProjectMainDTO dto);				//-- 진행 탭에서 skName, sname, acName 제외한 나머지 검색
	public ArrayList<ProjectMainDTO> findListAddFinish(ProjectMainDTO dto);					//-- 완료 탭에서 skName, sname, acName 제외한 나머지 검색
	
	public ProjectMainDTO userJoin(@Param("usId") int usId);								//-- 유저의 성별과 레벨	
}