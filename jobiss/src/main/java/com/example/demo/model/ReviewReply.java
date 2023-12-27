package com.example.demo.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("ReviewReply")
public class ReviewReply {
	
	public int rrid;
	public int rid;
	public String memail;
	public String rrcontent;
	private Timestamp rrreg;
	public String rrdrop;
	
	public int getRrid() {
		return rrid;
	}
	public void setRrid(int rrid) {
		this.rrid = rrid;
	}
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
	public String getRrcontent() {
		return rrcontent;
	}
	public void setRrcontent(String rrcontent) {
		this.rrcontent = rrcontent;
	}
	public Timestamp getRrreg() {
		return rrreg;
	}
	public void setRrreg(Timestamp rrreg) {
		this.rrreg = rrreg;
	}
	public String getRrdrop() {
		return rrdrop;
	}
	public void setRrdrop(String rrdrop) {
		this.rrdrop = rrdrop;
	}
	

}
