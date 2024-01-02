package com.example.demo.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("personalstatement")
public class PersonalStatement {

	private int pid;
	private int gid;
	private String memail;
	private String psgcontent;
	private String psccontent;
	private String psmcontent;
	private String pspcontent;
	private Timestamp psreg;
	
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
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
	public String getPsgcontent() {
		return psgcontent;
	}
	public void setPsgcontent(String psgcontent) {
		this.psgcontent = psgcontent;
	}
	public String getPsccontent() {
		return psccontent;
	}
	public void setPsccontent(String psccontent) {
		this.psccontent = psccontent;
	}
	public String getPsmcontent() {
		return psmcontent;
	}
	public void setPsmcontent(String psmcontent) {
		this.psmcontent = psmcontent;
	}
	public String getPspcontent() {
		return pspcontent;
	}
	public void setPspcontent(String pspcontent) {
		this.pspcontent = pspcontent;
	}
	public Timestamp getPsreg() {
		return psreg;
	}
	public void setPsreg(Timestamp psreg) {
		this.psreg = psreg;
	}
	
	
	
}
