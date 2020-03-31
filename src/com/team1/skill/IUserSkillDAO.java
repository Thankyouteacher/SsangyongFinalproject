package com.team1.skill;

import org.apache.ibatis.annotations.Param;

public interface IUserSkillDAO
{
	public String[] whatIsSkId(@Param("usId") int usId);
}
