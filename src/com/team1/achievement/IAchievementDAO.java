package com.team1.achievement;

import java.util.ArrayList;

public interface IAchievementDAO
{
	// 유저가 달성한 업적 가져오기
	public ArrayList<AchievementDTO> userAchievement(int usId);
	// 유저가 달성하지 못 한 업적 가져오기
	public ArrayList<AchievementDTO> userNotAchievement(int usId);
}
