package com.example.demo.model;

import java.sql.Timestamp;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public class GPT {

	private int gid; // PK
	private String memail; // FK
	private Timestamp gquestionreg; // 질문한시간
	private Timestamp ganswerreg; // 답변한시간
	
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
	public Timestamp getGquestionreg() {
		return gquestionreg;
	}
	public void setGquestionreg(Timestamp gquestionreg) {
		this.gquestionreg = gquestionreg;
	}
	public Timestamp getGanswerreg() {
		return ganswerreg;
	}
	public void setGanswerreg(Timestamp ganswerreg) {
		this.ganswerreg = ganswerreg;
	}

}
