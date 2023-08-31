package com.alcohol.sul.board.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alcohol.sul.member.MemberDTO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;
	
	public List<MemberDTO> getMemberList()throws Exception{
		return adminDAO.getMemberList();
	}
}
