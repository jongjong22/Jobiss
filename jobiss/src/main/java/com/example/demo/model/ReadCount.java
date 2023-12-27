package com.example.demo.model;

import org.apache.ibatis.type.Alias;

@Alias("readcount")
public class ReadCount {

	private int greadcount; // 성장과정 조회수
	private int creadcount; // 성격장단점 조회수
	private int mreadcount; // 입사동기 조회수
	private int preadcount; // 입사후 포부 조회수

	public int getGreadcount() {
		return greadcount;
	}

	public void setGreadcount(int greadcount) {
		this.greadcount = greadcount;
	}

	public int getCreadcount() {
		return creadcount;
	}

	public void setCreadcount(int creadcount) {
		this.creadcount = creadcount;
	}

	public int getMreadcount() {
		return mreadcount;
	}

	public void setMreadcount(int mreadcount) {
		this.mreadcount = mreadcount;
	}

	public int getPreadcount() {
		return preadcount;
	}

	public void setPreadcount(int preadcount) {
		this.preadcount = preadcount;
	}

}
