package com.example.demo.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("gptmotive")
public class GptMotive {

	private int gptmid; // PK
	private int gid; // FK (GPT PK)
	private String memail;
	private String gptmcontent;
	private Timestamp gptmreg;

	public int getGptmid() {
		return gptmid;
	}

	public void setGptmid(int gptmid) {
		this.gptmid = gptmid;
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

	public String getGptmcontent() {
		return gptmcontent;
	}

	public void setGptmcontent(String gptmcontent) {
		this.gptmcontent = gptmcontent;
	}

	public Timestamp getGptmreg() {
		return gptmreg;
	}

	public void setGptmreg(Timestamp gptmreg) {
		this.gptmreg = gptmreg;
	}

}
