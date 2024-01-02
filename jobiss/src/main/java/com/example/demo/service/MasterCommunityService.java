package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MasterCommunityDao;
import com.example.demo.model.Community;
import com.example.demo.model.FeedBack;

@Service
public class MasterCommunityService {
	
	@Autowired
	private MasterCommunityDao dao;
	
	// 전체 갯수 구하기
	public int getCount() {
		return dao.getCount();
	}
	
	// 목록 구해오기
	public List<Community> clist(int start) {
		return dao.clist(start);
	}
	
	// 상세 정보 구해오기
	public Community community(String cid) {
		return dao.community(cid);
	}
	
	// 글 삭제하기
	public int masterCommunityDelete(String cid) {
		return dao.masterCommunityDelete(cid);
	}
	
	// 검색 목록 갯수 구해오기
	public int sgetCount(Map<String, Object> map) {
		return dao.sgetCount(map);
	}
	
	// 검색 목록 리스트 구해오기
	public List<Community> scList(Map<String, Object> map) {
		return dao.scList(map);
	}
}
