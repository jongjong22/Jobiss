package com.example.demo.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("review")
public class Review {

	private int rid;
	private String memail;
	private String rtitle;
	private String rcontent;
	private String rsuccess;
	private Timestamp rreg;
	private String rconfirm;
	private String rdrop;
	
	private int startRow;
	private int endRow;
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRsuccess() {
		return rsuccess;
	}
	public void setRsuccess(String rsuccess) {
		this.rsuccess = rsuccess;
	}
	public Timestamp getRreg() {
		return rreg;
	}
	public void setRreg(Timestamp rreg) {
		this.rreg = rreg;
	}
	public String getRconfirm() {
		return rconfirm;
	}
	public void setRconfirm(String rconfirm) {
		this.rconfirm = rconfirm;
	}
	public String getRdrop() {
		return rdrop;
	}
	public void setRdrop(String rdrop) {
		this.rdrop = rdrop;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
}

