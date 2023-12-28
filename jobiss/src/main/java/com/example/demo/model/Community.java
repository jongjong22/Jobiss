package com.example.demo.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("community")
public class Community {

	private int cid;
	private String memail;
	private String ctitle;
	private String ccontent;
	private String cimage;
	private int creadcount;
	private Timestamp creg;
	private String cdrop;
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getCtitle() {
		return ctitle;
	}
	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getCimage() {
		return cimage;
	}
	public void setCimage(String cimage) {
		this.cimage = cimage;
	}
	public int getCreadcount() {
		return creadcount;
	}
	public void setCreadcount(int creadcount) {
		this.creadcount = creadcount;
	}
	public Timestamp getCreg() {
		return creg;
	}
	public void setCreg(Timestamp creg) {
		this.creg = creg;
	}
	public String getCdrop() {
		return cdrop;
	}
	public void setCdrop(String cdrop) {
		this.cdrop = cdrop;
	}
	
	
}
