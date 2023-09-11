package com.alcohol.sul.admin;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alcohol.sul.member.MemberDTO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;
	
	public List<MemberDTO> getMemberList(MemberDTO memberDTO)throws Exception{
		return adminDAO.getMemberList(memberDTO);
	}
	
	
	public int pointAdd(MemberDTO memberDTO) throws Exception{
		return adminDAO.pointAdd(memberDTO);
	}
	
	
	public MemberDTO getPoint(MemberDTO memberDTO) throws Exception{
		return adminDAO.getPoint(memberDTO);
	}
	
	public List<MemberDTO> getSmsCheckList(MemberDTO memberDTO) throws Exception{
		return adminDAO.getSmsCheckList(memberDTO);
	}
	
	//단체문자
	public void certifiedPhoneNumber(String userPhoneNumber, String smsContents) {
		String api_key = "NCS6Z2IHA0RLQUS1"; //쿨sms api
	    String api_secret = "MK0T5L21VZO4FXLBLRMQJBYHJIRAVOZC"; //쿨 sms 시크릿api
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // 수신전화번호
	    params.put("from", "01091957075");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", smsContents); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	}
	
	
	public List<SalesRevenueDTO> getSalesRevenue() {
		return adminDAO.getSalesRevenue();
	}
	
	public List<SalesRevenueDTO> dailySales(SalesRevenueDTO salesDTO){
		return adminDAO.dailySales(salesDTO);
	}


	
}