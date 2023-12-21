package com.example.demo.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class Member {
	private String mEmail;
	private String mPW;
	private String mName;
	private String mPhone;
	private String mAge;
	private String mGender;
	private String mAddress;
	private String mCareer;
	private String mEducation;
	private String mMajor;
	private String mCertification;
	private String mLang;
	private String mDb;
	private Timestamp mreg;
	private String mDrop;
	
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmPW() {
		return mPW;
	}
	public void setmPW(String mPW) {
		this.mPW = mPW;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public String getmAge() {
		return mAge;
	}
	public void setmAge(String mAge) {
		this.mAge = mAge;
	}
	public String getmGender() {
		return mGender;
	}
	public void setmGender(String mGender) {
		this.mGender = mGender;
	}
	public String getmAddress() {
		return mAddress;
	}
	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}
	public String getmCareer() {
		return mCareer;
	}
	public void setmCareer(String mCareer) {
		this.mCareer = mCareer;
	}
	public String getmEducation() {
		return mEducation;
	}
	public void setmEducation(String mEducation) {
		this.mEducation = mEducation;
	}
	public String getmMajor() {
		return mMajor;
	}
	public void setmMajor(String mMajor) {
		this.mMajor = mMajor;
	}
	public String getmCertification() {
		return mCertification;
	}
	public void setmCertification(String mCertification) {
		this.mCertification = mCertification;
	}
	public String getmLang() {
		return mLang;
	}
	public void setmLang(String mLang) {
		this.mLang = mLang;
	}
	public String getmDb() {
		return mDb;
	}
	public void setmDb(String mDb) {
		this.mDb = mDb;
	}
	public Timestamp getMreg() {
		return mreg;
	}
	public void setMreg(Timestamp mreg) {
		this.mreg = mreg;
	}
	public String getmDrop() {
		return mDrop;
	}
	public void setmDrop(String mDrop) {
		this.mDrop = mDrop;
	}
	
	
}



