/*
	SkillDTO.java
*/

package com.team1.skill;

public class SkillDTO
{
	private int skId;
	private String skName;
	
	private int[] skId1;
	private String[] skName1;

	public int[] getSkId1()
	{
		return skId1;
	}

	public void setSkId1(int[] skId1)
	{
		this.skId1 = skId1;
	}

	public String[] getSkName1()
	{
		return skName1;
	}

	public void setSkName1(String[] skName1)
	{
		this.skName1 = skName1;
	}

	public int getSkId()
	{
		return skId;
	}

	public void setSkId(int skId)
	{
		this.skId = skId;
	}

	public String getSkName()
	{
		return skName;
	}

	public void setSkName(String skName)
	{
		this.skName = skName;
	}
}
