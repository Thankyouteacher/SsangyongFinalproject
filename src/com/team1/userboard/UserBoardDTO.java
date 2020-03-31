package com.team1.userboard;

public class UserBoardDTO
{
	// 게시판 코드
	private int bid;
	// 게시판 이름, 글 제목, 글 내용, 댓글 내용, 작성일자
	private String boardName, postTitle, content, ccontent, createDate;
	// 게시글 번호
	private int bpId;
	
	// getter / setter
	public int getBid()
	{
		return bid;
	}
	
	public void setBid(int bid)
	{
		this.bid = bid;
	}
	
	public int getBpId()
	{
		return bpId;
	}
	public void setBpId(int bpId)
	{
		this.bpId = bpId;
	}
	
	public String getBoardName()
	{
		return boardName;
	}
	public void setBoardName(String boardName)
	{
		this.boardName = boardName;
	}
	public String getPostTitle()
	{
		return postTitle;
	}
	public void setPostTitle(String postTitle)
	{
		this.postTitle = postTitle;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getCcontent()
	{
		return ccontent;
	}
	public void setCcontent(String ccontent)
	{
		this.ccontent = ccontent;
	}
	public String getCreateDate()
	{
		return createDate;
	}
	public void setCreateDate(String createDate)
	{
		this.createDate = createDate;
	}
	
	
}
