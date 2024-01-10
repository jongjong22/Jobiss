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
   private String mschoolname;
   private String mschooltype;
   private String mschoolmajor;
   private Timestamp mschoolstartreg;
   private Timestamp mschoolendreg;
   private String mlicensename;
   private String mlicensetype;
   private Timestamp mlicensereg;
   private String mjobtype;
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
   public String getMschoolname() {
      return mschoolname;
   }
   public void setMschoolname(String mschoolname) {
      this.mschoolname = mschoolname;
   }
   public String getMschooltype() {
      return mschooltype;
   }
   public void setMschooltype(String mschooltype) {
      this.mschooltype = mschooltype;
   }
   public String getMschoolmajor() {
      return mschoolmajor;
   }
   public void setMschoolmajor(String mschoolmajor) {
      this.mschoolmajor = mschoolmajor;
   }
   public Timestamp getMschoolstartreg() {
      return mschoolstartreg;
   }
   public void setMschoolstartreg(Timestamp mschoolstartreg) {
      this.mschoolstartreg = mschoolstartreg;
   }
   public Timestamp getMschoolendreg() {
      return mschoolendreg;
   }
   public void setMschoolendreg(Timestamp mschoolendreg) {
      this.mschoolendreg = mschoolendreg;
   }
   public String getMlicensename() {
      return mlicensename;
   }
   public void setMlicensename(String mlicensename) {
      this.mlicensename = mlicensename;
   }
   public String getMlicensetype() {
      return mlicensetype;
   }
   public void setMlicensetype(String mlicensetype) {
      this.mlicensetype = mlicensetype;
   }
   public Timestamp getMlicensereg() {
      return mlicensereg;
   }
   public void setMlicensereg(Timestamp mlicensereg) {
      this.mlicensereg = mlicensereg;
   }
   public String getMjobtype() {
      return mjobtype;
   }
   public void setMjobtype(String mjobtype) {
      this.mjobtype = mjobtype;
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