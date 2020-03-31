package com.team1.bank;

import org.apache.ibatis.annotations.Param;

public interface iUserBankDAO
{
	public UserBankDTO whatIsAccount(@Param("usId") int usId);
	public void updateUserAccount(UserBankDTO ubdto);
}
