package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CommunityDao;

@Service
public class CommunityService {

	@Autowired
	private CommunityDao dao;
}
