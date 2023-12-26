package com.example.demo.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("gptgrow")
public class GptGrow {

	private int gptgid; // PK
	private int gid; // FK (GPT PK)
	private String gptgcontent;
	private String gptganswer;
	private Timestamp gptgquestionreg;
	private Timestamp gptganswerreg;

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

	public String getGptgcontent() {
		return gptgcontent;
	}

	public void setGptgcontent(String gptgcontent) {
		this.gptgcontent = gptgcontent;
	}

	public String getGptganswer() {
		return gptganswer;
	}

	public void setGptganswer(String gptganswer) {
		this.gptganswer = gptganswer;
	}

	public Timestamp getGptgquestionreg() {
		return gptgquestionreg;
	}

	public void setGptgquestionreg(Timestamp gptgquestionreg) {
		this.gptgquestionreg = gptgquestionreg;
	}

	public Timestamp getGptganswerreg() {
		return gptganswerreg;
	}

	public void setGptganswerreg(Timestamp gptganswerreg) {
		this.gptganswerreg = gptganswerreg;
	}

}
