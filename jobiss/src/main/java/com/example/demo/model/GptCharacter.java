package com.example.demo.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("gptcharacter")
public class GptCharacter {

	private int gptcid; // PK
	private int gid; // FK (GPT PK)
	private String memail;
	private String gptccontent;
	private Timestamp gptcreg;

	public int getGptcid() {
		return gptcid;
	}

	public void setGptcid(int gptcid) {
		this.gptcid = gptcid;
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

	public String getGptccontent() {
		return gptccontent;
	}

	public void setGptccontent(String gptccontent) {
		this.gptccontent = gptccontent;
	}

	public Timestamp getGptcreg() {
		return gptcreg;
	}

	public void setGptcreg(Timestamp gptcreg) {
		this.gptcreg = gptcreg;
	}

}
