package com.team1.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;


public interface IAdminDAO
{
   public void Board_receive_delete(int rpId);                                          //게시판 삭제
   public Integer Board_receive_Insert(@Param("rpText") String rpText, @Param("term") int term
                        , @Param("rpId") int rpId, @Param("adminId") String adminId);         //게시물 패널티 부여

   public int penalty_insert();                        //각각의 신고 처리 테이블에 값 입력
   public ArrayList<AdminDTO> receive_list();               //신고리스트 조회   
   public AdminDTO searchUserDTO(@Param("num")int num);   

   public ArrayList<AdminDTO> received_user();               //게시판 신고된 유저들의 리스트
   public AdminDTO received_info(@Param("num")int num);                  //게시판 신고 처리된 유저의 상세 페이지
   
   
   public int contest_approval_update();                  //공보전 승인
   public ArrayList<AdminDTO> contest_list();               //공모전 리스트 조회
   public AdminDTO conInfo(int conId);                     //공모전 상세 리스트
   public void conOk(@Param("conId") int conId, @Param("adminId") String adminId);            //공모전 승인 << 여기

   public ArrayList<AdminDTO> con_Oklist();               //승인한 공모전 조회
   
   public int adminaccount_add(@Param("usId")int usId);                  //관리자 계정 부여(UPDATE)
   public AdminDTO user_Info(@Param("usId")int usId);                  //일반 유저 상세페이지 (usId 로 DTO 찾기)
   public ArrayList<AdminDTO> user_list();                  //일반 유저 목록 조회
   
   public ArrayList<AdminDTO> admin_list();               //관리자 목록 조회
   public void admindelete(String adminId);               //관리자의 권한을 박탈시킴
   
   
   public ArrayList<AdminDTO> lockUser_list();               //휴면 유저 리스트 조회
   
   
   
   public ArrayList<AdminDTO> searchName_Account(AdminDTO dto);      // 계정 부여 검색
   public ArrayList<AdminDTO> searchName_Received(AdminDTO dto);      // 신고처리된 유저들 검색
   public ArrayList<AdminDTO> searchName_ConOk(AdminDTO dto);         // 승인된 공모전 검색
   public ArrayList<AdminDTO> searchName_LockUser(AdminDTO dto);      // 휴면 계정인 유저 검색
   public ArrayList<AdminDTO> searchName_Receivedlist(AdminDTO dto);   // 신고된 유저 검색
   public ArrayList<AdminDTO> searchName_CON(AdminDTO dto);         // 공모전 검색
   public ArrayList<AdminDTO> searchName_ADMIN(AdminDTO dto);         // 관리자 검색
   
   public ArrayList<AdminDTO> Board_receive_block();      //패널티를 부여한 후, 해당 뷰에서 안보이게 함
   
   public String searchGender(int usId);               //성별을 뿌려줌
      
   public String adminsearch(int usId);                     // 관리자ID 구분
   
   /*
    * public void BoardInfo_receive_delete(int num); //댓글 삭제 public void
    * BoardComment_receive_delete(int num); //답변 삭제
    * public Integer BoardInfo_receive_Insert(AdminDTO dto); //댓글 패널티 부여 public
    * Integer BoardComment_receive_Insert(AdminDTO dto); //답변 패널티 부여
    */   
   
}