package com.team1.user;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.team1.project.UserProjectDTO;
import com.team1.userboard.UserBoardDTO;

public interface IUserDAO
{
	public int count();
	
	public int dupliId(String userId);
	public int dupliNick(String nickname);
	
	public UserDTO allUserInfo(@Param("usId") int usId);
	
	public String whatNickName(@Param("userId") String userId);
	public String whatNickName_(int usId);
	public UserDTO whatIsSsd(@Param("userId") String userId);
	public String whatIsId(@Param("uname") String uname, @Param("ssdFront") String ssdFront, @Param("ssdBack") String ssdBack);
	public int whatIsUsId(@Param("userId") String userId, @Param("ssdFront") String ssdFront, @Param("ssdBack") String ssdBack);
	public String whatIsPassword(@Param("password") String password, @Param("usId") int usId);
	public int whatIsLevel(int usId);
	
	public int whatIsNowPoint(int usId);
	public int whatIsPrePoint(int usId);
	public int whatIsNextPoint(int usId);
	
	public ArrayList<UserProjectDTO> whatIsProjectIng(int usId);
	public ArrayList<UserProjectDTO> whatIsProjectWait(int usId);
	public ArrayList<UserProjectDTO> whatIsProjectEnd(int usId);
	
	public ArrayList<UserBoardDTO> whatIsBoardWrite(int usId);
	public ArrayList<UserBoardDTO> whatIsCommentWrite(int usId);

	public String[] whatIsProjectSkill(int pid);
	
	public int isLoginOk(@Param("userId") String userId, @Param("password") String password);
	public String isAdmin(@Param("userId") String userId);
	public int isUserExist(@Param("userId") String userId, @Param("ssdFront") String ssdFront, @Param("ssdBack") String ssdBack);
	public int isIdExist(@Param("uname") String uname, @Param("ssdFront") String ssdFront, @Param("ssdBack") String ssdBack);
	public int isHaveAccount(@Param("usId") int usId);
	
	public void changePwd(@Param("password") String password, @Param("userId") String userId
					, @Param("ssdFront") String ssdFront, @Param("ssdBack") String ssdBack);
	// UNAME, USERID,PASSWORD, NICKNAME, SSDFRONT, SSDBACK, TELEPHONE, UADDRESS
	public void addUser(UserDTO dto);
	public void addUserSkill(@Param("usId") int usId, @Param("skId") int skId);
	public void addUserAccount(@Param("usId") int usId, @Param("account") String account, @Param("bkId") int bkId);
	
	public void updateUser(UserDTO dto);
	public void removeUser(@Param("usId") int usId);
	public void removeUserSkill(int usId);
	
	public Integer usPhotoUpdate(@Param("usId") int usId, @Param("usPhoto") String usPhoto);	// 프로필사진 업데이트
	public String getUsPhoto(@Param("usId") int usId);					// usPhoto 조회
}
