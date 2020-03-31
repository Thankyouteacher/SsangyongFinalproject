/*========================================
	IBoardDAO.java
	- 게시판 이름들을 불러올 메소드 선언
=========================================*/

package com.team1.board;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IBoardDAO
{
	public ArrayList<BoardDTO> boardName();													// 게시판 이름들을 불러올 메소드
	public ArrayList<BoardDTO> reportName();												// 신고 항목들을 불러올 메소드
	public ArrayList<BoardDTO> lists(int bid);												// 게시판에 보여질 리스트들 불러올 메소드
	public ArrayList<BoardDTO> searchLists(BoardDTO dto);									// 자유게시판에 검색한 리스트 불러올 메소드
	public ArrayList<BoardDTO> readData(@Param("bid") int bid, @Param("bpid") int bpid);		// 게시글 열람하는 메소드
	public ArrayList<BoardDTO> readComment(@Param("bpid") int bpid);
	public ArrayList<BoardDTO> questionList(int bid);										// 질문게시판 게시글 뿌리는 메소드 (답변 채택 여부까지)
	public ArrayList<BoardDTO> questionComment(int bpid);									// 질문게시판 답변 뿌리는 메소드
	public ArrayList<BoardDTO> answerComment(int qid);										// 질문게시판 답변에 댓글 뿌리는 메소드
	public ArrayList<BoardDTO> infoList(int bid);											// 정보게시판 게시글 뿌리는 메소드 (추천 수 까지)
	public ArrayList<BoardDTO> suggestList(int bid);										// 건의게시판 게시글 뿌리는 메소드 (비밀 글 여부)
	
	public int boardInsert(BoardDTO dto);													// 게시판 글 작성
	public int freeModify(BoardDTO dto);													// 게시판 글 수정
	public int freeDelete(int bpid);															// 게시판 글 삭제
	public int freeBlind(int bpid);															// 게시판 글 블라인드 처리
	public int secretInsert(int bpid);														// 건의게시판 비밀글 작성
	public int answerInsert(BoardDTO dto);													// 질문 게시판 답변 작성
	public int answerCheck(int bpid);														// 질문 게시판 게시글 답변 채택 값 반환
	public int answerSelect(int qid);														// 질문 게시판 답변 채택
	public int answerCancle(int selectid);														// 질문 게시판 답변 취소
	public int answerSelectId(int bpid);														// 질문 게시판 채택된 답변ID 가져오기
	public int answerBlind(int qid);														// 질문 게시판 답변 블라인드 처리
	public int answerDelete(int qid);														// 질문 게시판 답변 삭제 쿼리문
	public Integer[] readQuestion(@Param("bid") int bid, @Param("bpid") int bpid);			// 질문 게시글 열람하는 메소드
	
	public int likeOk(BoardDTO dto);													// 정보 게시판 게시글 추천 확인 여부 메소드
	public int likeInsert(BoardDTO dto);												// 정보 게시판 추천한 사람 정보 넣는 메소드
	public int likeDelete(BoardDTO dto);												// 정보 게시판 추천 취소 메소드
	public int likeCount(int bpid);														// 게시글 추천 수 출력 메소드
	
	public int maxBoardNumber(int bid);													// 건의 게시판 제일 높은 게시글 번호
	
	public int commentInsert(BoardDTO dto);												// 게시판 댓글 작성
	public int commentCount(int bpid);													// 게시판 댓글 수
	public int commentBlind(int coid);													// 게시판 댓글 블라인드(삭제)
	public void hitCount(int bpid);														// 게시판 조회 수 증가
	public int hit(@Param("bid") int bid, @Param("bpid") int bpid);						// 게시판 조회 수 출력
	
	public int dataCount(int bid);														// 게시판 총 게시글 수
	public int boardCount(int bid);														// 게시글 개수 구하는 메소드 (검색값이 없을 시)
	public int searchDataCount(BoardDTO dto);											// 게시글 개수 구하는 메소드 (검색값이 있을 시)											
	public int getTotalDataCount(String searchKey, String searchValue);
	
	public ArrayList<BoardDTO> listPage(@Param("bid") int bid);												// 검색 안 했을 시 게시글 리스트 뿌리기
	public ArrayList<BoardDTO> searchPage(int bid, String category, String content, int start, int end);	// 검색 했을 시 게시글 리스트 뿌리기
	public void adminUsid(int[] adminUsid);												// 관리자들 usId 가져오는 메소드
	
	public int reportInsert(BoardDTO dto);												// 게시글 신고 접수 하는 메소드
	
}
