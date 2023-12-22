package com.example.demo.model;

import java.security.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("qna")
public class QnADTO {
	private int qid;
	private String memail;
	private String qtilte;
	private Timestamp qreg;
	private String qcontent;
	private String qdrop;
}
