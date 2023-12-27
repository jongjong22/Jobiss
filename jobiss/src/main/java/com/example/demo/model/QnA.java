package com.example.demo.model;

import java.security.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("qna")
public class QnA {
	private int qid;
	private String memail;
	private String qtitle;
	private Timestamp qreg;
	private String qcontent;
	private String qdrop;
	
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
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public Timestamp getQreg() {
		return qreg;
	}
	public void setQreg(Timestamp qreg) {
		this.qreg = qreg;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getQdrop() {
		return qdrop;
	}
	public void setQdrop(String qdrop) {
		this.qdrop = qdrop;
	}
	
	

	

}
