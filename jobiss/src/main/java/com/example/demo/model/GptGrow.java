package com.example.demo.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("gptgrow")
public class GptGrow {

	private int gptgid; // PK
	private int gid; // FK (GPT PK)
	private String memail;
	private String gptgcontent;
	private Timestamp gptgreg;

	public int getGptgid() {
		return gptgid;
	}

	public void setGptgid(int gptgid) {
		this.gptgid = gptgid;
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

	public String getGptgcontent() {
		return gptgcontent;
	}

	public void setGptgcontent(String gptgcontent) {
		this.gptgcontent = gptgcontent;
	}

	public Timestamp getGptgreg() {
		return gptgreg;
	}

	public void setGptgreg(Timestamp gptgreg) {
		this.gptgreg = gptgreg;
	}

}
