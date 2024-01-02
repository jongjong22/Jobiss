package com.example.demo.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("feedbackreply")
public class FeedbackReply {
	
	private int frid;
	private int fid;
	private String memail;
	private String frcontent;
	private Timestamp frreg;
	private String frdrop;
	
	public int getFrid() {
		return frid;
	}
	public void setFrid(int frid) {
		this.frid = frid;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getFrcontent() {
		return frcontent;
	}
	public void setFrcontent(String frcontent) {
		this.frcontent = frcontent;
	}
	public Timestamp getFrreg() {
		return frreg;
	}
	public void setFrreg(Timestamp frreg) {
		this.frreg = frreg;
	}
	public String getFrdrop() {
		return frdrop;
	}
	public void setFrdrop(String frdrop) {
		this.frdrop = frdrop;
	}
	
	

}
