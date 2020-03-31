/*
	MemberEstimateDTO.java
*/

package com.team1.pro.member.estimate;

public class MemberEstimateDTO
{
	private int meId, melId;
	private double score;
	private String giveScore, doScore, receive;
	
	private int count;

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getMeId() {
		return meId;
	}

	public void setMeId(int meId) {
		this.meId = meId;
	}

	public int getMelId() {
		return melId;
	}

	public void setMelId(int melId) {
		this.melId = melId;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getGiveScore() {
		return giveScore;
	}

	public void setGiveScore(String giveScore) {
		this.giveScore = giveScore;
	}

	public String getDoScore() {
		return doScore;
	}

	public void setDoScore(String doScore) {
		this.doScore = doScore;
	}

	public String getReceive() {
		return receive;
	}

	public void setReceive(String receive) {
		this.receive = receive;
	}
}
