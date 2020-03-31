package com.team1.board;

import java.util.ArrayList;

public class BoardDTO
{
	// 게시판에 사용되는 변수
	/*
		bpid = 게시글 식별 번호
		bid = 게시판 식별 번호
		usId = 유저 식별 번호
		qid = 답변 식별 번호
		coqid = 답변 댓글 식별 번호
		blindId = 블라인드 식별 번호
		commentCount = 댓글 수
		coid = 댓글 식별 번호
		selectid = 답변 채택 식별 번호
		ssid = 비밀글 식별 번호
		likeCheck = 추천 여부 식별 번호, 한사람당 추천은 하나씩!
		lickCount = 한 게시글에서 받은 추천 수
		hideCheck = 건의 게시판 비밀글 체크 식별 번호
		start = 페이지 시작번호
		end = 페이지 끝번호
		rnum = 페이지 번호 정렬
		rpId = 신고 접수 번호
		rtId = 신고 항목들 번호
		
	*/
	private int bpid, bid, usId, click, qid, coqid, blindId
				, commentCount, coid, selectid, ssid, likeCheck, likeCount, hideCheck
				, start, end, rnum, rpId, rtId;
	
	/*
		postTitle = 게시글 제목
		bname = 게시판 이름 (질문, 정보, 자유, 건의)
		nickName = 유저의 닉네임
		content = 게시글 내용
		ccontent = 댓글 내용
		commentDate = 댓글 작성 일자
		quContent = 답변 작성 내용
		quCreateDate = 답변 작성 일자
		coContent = 대댓글 내용
		qucoCreateDate = 답변 댓글 작성 일자
		bFile = 첨부파일
		category = 검색 할 때 option 값 받을 변수
		pageNum = 현재 게시판 페이지의 번호
		searchKey = 검색에서 선택된 option 값
		searchValue = 검색에서 직접 입력하는 input 값
		rtName = 신고 항목 이름
		rpText = 신고 세부 내용
		rpDate = 신고 접수 일자
	  
	 */
	private String postTitle, bname, createDate, nickName, content, ccontent, commentDate
					, quContent, quCreateDate, coContent, qucoCreateDate, bFile, category
					, pageNum, searchKey, searchValue, rpText, rpDate, rtName;
	private Integer[] qidList;
	private Integer[] adminUsid;

	// --------------------------------------------------
	private ArrayList<BoardDTO> answerList;
	
	// getter / setter 구성
	public String getCommentDate()
	{
		return commentDate;
	}
	public int getRpId()
	{
		return rpId;
	}
	public void setRpId(int rpId)
	{
		this.rpId = rpId;
	}
	public String getRpText()
	{
		return rpText;
	}
	public void setRpText(String rpText)
	{
		this.rpText = rpText;
	}
	public String getRpDate()
	{
		return rpDate;
	}
	public void setRpDate(String rpDate)
	{
		this.rpDate = rpDate;
	}
	public int getRtId()
	{
		return rtId;
	}
	public void setRtId(int rtId)
	{
		this.rtId = rtId;
	}
	public String getRtName()
	{
		return rtName;
	}
	public void setRtName(String rtName)
	{
		this.rtName = rtName;
	}
	public Integer[] getAdminUsid()
	{
		return adminUsid;
	}
	public void setAdminUsid(Integer[] adminUsid)
	{
		this.adminUsid = adminUsid;
	}
	public int getRnum()
	{
		return rnum;
	}
	public void setRnum(int rnum)
	{
		this.rnum = rnum;
	}
	public int getStart()
	{
		return start;
	}
	public void setStart(int start)
	{
		this.start = start;
	}
	public int getEnd()
	{
		return end;
	}
	public void setEnd(int end)
	{
		this.end = end;
	}
	public String getSearchKey()
	{
		return searchKey;
	}
	public void setSearchKey(String searchKey)
	{
		this.searchKey = searchKey;
	}
	public String getSearchValue()
	{
		return searchValue;
	}
	public void setSearchValue(String searchValue)
	{
		this.searchValue = searchValue;
	}
	public String getPageNum()
	{
		return pageNum;
	}
	public void setPageNum(String pageNum)
	{
		this.pageNum = pageNum;
	}
	public int getHideCheck()
	{
		return hideCheck;
	}
	public void setHideCheck(int hideCheck)
	{
		this.hideCheck = hideCheck;
	}
	public int getSsid()
	{
		return ssid;
	}
	public void setSsid(int ssid)
	{
		this.ssid = ssid;
	}
	public int getLikeCheck()
	{
		return likeCheck;
	}
	public void setLikeCheck(int likeCheck)
	{
		this.likeCheck = likeCheck;
	}
	public int getLikeCount()
	{
		return likeCount;
	}
	public void setLikeCount(int likeCount)
	{
		this.likeCount = likeCount;
	}
	public ArrayList<BoardDTO> getAnswerList()
	{
		return answerList;
	}
	public void setAnswerList(ArrayList<BoardDTO> answerList)
	{
		this.answerList = answerList;
	}
	public Integer[] getQidList()
	{
		return qidList;
	}
	public void setQidList(Integer[] qidList)
	{
		this.qidList = qidList;
	}
	public int getSelectid()
	{
		return selectid;
	}
	public void setSelectid(int selectid)
	{
		this.selectid = selectid;
	}
	public String getCategory()
	{
		return category;
	}
	public void setCategory(String category)
	{
		this.category = category;
	}
	public int getCoid()
	{
		return coid;
	}
	public void setCoid(int coid)
	{
		this.coid = coid;
	}
	public int getCommentCount()
	{
		return commentCount;
	}
	public void setCommentCount(int commentCount)
	{
		this.commentCount = commentCount;
	}
	public String getbFile()
	{
		return bFile;
	}
	public void setbFile(String bFile)
	{
		this.bFile = bFile;
	}
	public int getBlindId()
	{
		return blindId;
	}
	public void setBlindId(int blindId)
	{
		this.blindId = blindId;
	}
	public String getBFile()
	{
		return bFile;
	}
	public void setBFile(String bFile)
	{
		this.bFile = bFile;
	}
	public String getCoContent()
	{
		return coContent;
	}
	public void setCoContent(String coContent)
	{
		this.coContent = coContent;
	}
	public String getQucoCreateDate()
	{
		return qucoCreateDate;
	}
	public void setQucoCreateDate(String qucoCreateDate)
	{
		this.qucoCreateDate = qucoCreateDate;
	}
	public int getCoqid()
	{
		return coqid;
	}
	public void setCoqid(int coqid)
	{
		this.coqid = coqid;
	}
	
	public int getQid()
	{
		return qid;
	}
	public void setQid(int qid)
	{
		this.qid = qid;
	}
	public String getQuContent()
	{
		return quContent;
	}
	public void setQuContent(String quContent)
	{
		this.quContent = quContent;
	}
	public String getQuCreateDate()
	{
		return quCreateDate;
	}
	public void setQuCreateDate(String quCreateDate)
	{
		this.quCreateDate = quCreateDate;
	}
	public String getBname()
	{
		return bname;
	}
	public void setBname(String bname)
	{
		this.bname = bname;
	}
	public int getUsId()
	{
		return usId;
	}
	public void setUsId(int usId)
	{
		this.usId = usId;
	}
	public int getClick()
	{
		return click;
	}
	public void setClick(int click)
	{
		this.click = click;
	}
	public String getCcontent()
	{
		return ccontent;
	}
	public void setCcontent(String ccontent)
	{
		this.ccontent = ccontent;
	}
	public void setCommentDate(String commentDate)
	{
		this.commentDate = commentDate;
	}
	public String getNickName()
	{
		return nickName;
	}
	
	public void setNickName(String nickName)
	{
		this.nickName = nickName;
	}
	
	public int getBpid()
	{
		return bpid;
	}
	public void setBpid(int bpid)
	{
		this.bpid = bpid;
	}
	
	public String getPostTitle()
	{
		return postTitle;
	}
	public void setPostTitle(String postTitle)
	{
		this.postTitle = postTitle;
	}
	public String getCreateDate()
	{
		return createDate;
	}
	public void setCreateDate(String createDate)
	{
		this.createDate = createDate;
	}
	public int getBid()
	{
		return bid;
	}
	public void setBid(int bid)
	{
		this.bid = bid;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	
}
