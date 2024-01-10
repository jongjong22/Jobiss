package com.example.demo.model;


import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("ReQnA")
public class ReQnA {
	
	public int qrid;
	public int qid;
	public String memail;
	public String qrcontent;
	private Timestamp qrreg;
	public String qrdrop;
	
	public int getQrid() {
		return qrid;
	}
	public void setQrid(int qrid) {
		this.qrid = qrid;
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getQrcontent() {
		return qrcontent;
	}
	public void setQrcontent(String qrcontent) {
		this.qrcontent = qrcontent;
	}
	public Timestamp getQrreg() {
		return qrreg;
	}
	public void setQrreg(Timestamp qrreg) {
		this.qrreg = qrreg;
	}
	public String getQrdrop() {
		return qrdrop;
	}
	public void setQrdrop(String qrdrop) {
		this.qrdrop = qrdrop;
	}

}
