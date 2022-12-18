package com.shop.vo;

public class MemberVO {
	private int mnum;
	private String mname;
	private String mid;
	private String mpw;
	private String maddr;
	private String email;
	private String mgrade;
	private int adminCK;

	public int getAdminCK() {
		return adminCK;
	}

	public void setAdminCK(int adminCK) {
		this.adminCK = adminCK;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMaddr() {
		return maddr;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGrade() {
		return mgrade;
	}

	public void setGrade(String grade) {
		this.mgrade = grade;
	}

}