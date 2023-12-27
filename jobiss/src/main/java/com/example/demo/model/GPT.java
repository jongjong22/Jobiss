package com.example.demo.model;

import java.sql.Timestamp;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.type.Alias;

@Alias("gpt")
public class GPT {

	private int gid; // PK
	private String memail; // FK
	private Timestamp gptreg; // 질문한시간

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public Timestamp getGptreg() {
		return gptreg;
	}

	public void setGptreg(Timestamp gptreg) {
		this.gptreg = gptreg;
	}

}
