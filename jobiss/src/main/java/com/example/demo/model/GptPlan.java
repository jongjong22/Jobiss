package com.example.demo.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("gptplan")
public class GptPlan {

	private int gptpid; // PK
	private int gid; // FK (GPT PK)
	private String memail;
	private String gptpcontent;
	private Timestamp gptpreg;

	public int getGptpid() {
		return gptpid;
	}

	public void setGptpid(int gptpid) {
		this.gptpid = gptpid;
	}

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

	public String getGptpcontent() {
		return gptpcontent;
	}

	public void setGptpcontent(String gptpcontent) {
		this.gptpcontent = gptpcontent;
	}

	public Timestamp getGptpreg() {
		return gptpreg;
	}

	public void setGptpreg(Timestamp gptpreg) {
		this.gptpreg = gptpreg;
	}

}
