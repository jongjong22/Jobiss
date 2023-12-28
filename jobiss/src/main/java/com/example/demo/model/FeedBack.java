package com.example.demo.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("feedback")
public class FeedBack {
	private int fid;
	private String memail;
	private String ftitle;
	private String fcontent;
	private Timestamp freg;
	private String fdrop;
	
	
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
	public String getFtitle() {
		return ftitle;
	}
	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}
	public String getFcontent() {
		return fcontent;
	}
	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	public Timestamp getFreg() {
		return freg;
	}
	public void setFreg(Timestamp freg) {
		this.freg = freg;
	}
	public String getFdrop() {
		return fdrop;
	}
	public void setFdrop(String fdrop) {
		this.fdrop = fdrop;
	}
	
	
	
	
	
}



