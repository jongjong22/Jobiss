package com.example.demo.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class Member {
	private String memail;
	private String mpw;
	private String mname;
	private String mphone;
	private String mage;
	private String mgender;
	private String maddress;
	private String mcareer;
	private String meducation;
	private String mmajor;
	private String mcertification;
	private String mlang;
	private String mdb;
	private Timestamp mreg;
	private String mdrop;
	
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMage() {
		return mage;
	}
	public void setMage(String mage) {
		this.mage = mage;
	}
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public String getMaddress() {
		return maddress;
	}
	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}
	public String getMcareer() {
		return mcareer;
	}
	public void setMcareer(String mcareer) {
		this.mcareer = mcareer;
	}
	public String getMeducation() {
		return meducation;
	}
	public void setMeducation(String meducation) {
		this.meducation = meducation;
	}
	public String getMmajor() {
		return mmajor;
	}
	public void setMmajor(String mmajor) {
		this.mmajor = mmajor;
	}
	public String getMcertification() {
		return mcertification;
	}
	public void setMcertification(String mcertification) {
		this.mcertification = mcertification;
	}
	public String getMlang() {
		return mlang;
	}
	public void setMlang(String mlang) {
		this.mlang = mlang;
	}
	public String getMdb() {
		return mdb;
	}
	public void setMdb(String mdb) {
		this.mdb = mdb;
	}
	public Timestamp getMreg() {
		return mreg;
	}
	public void setMreg(Timestamp mreg) {
		this.mreg = mreg;
	}
	public String getMdrop() {
		return mdrop;
	}
	public void setMdrop(String mdrop) {
		this.mdrop = mdrop;
	}
	
	
	
}



