package com.alcohol.sul.member;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberDTO getNaverLogin(String phone) {
		return memberDAO.getNaverLogin(phone);
	}
	
	public int setJoin(MemberDTO memberDTO) throws Exception{
		return memberDAO.setJoin(memberDTO);
	}
	
	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception{
		return memberDAO.getLogin(memberDTO);
	}
	
	public int getIdCheck(MemberDTO memberDTO) throws Exception{
		memberDTO = memberDAO.getIdCheck(memberDTO);
		
		int result=0;  //중복
		if(memberDTO == null) {
			result=1; //중복x
		}
		return result;
	}
	public int getPhoneCheck(MemberDTO memberDTO) throws Exception{
		memberDTO = memberDAO.getPhoneCheck(memberDTO);
		int result=0; //중복
		if(memberDTO == null) {
			result=1;
		}
		return result;
	}
	
	//임시비밀번호
	public void certifiedPhoneNumber(String userPhoneNumber, String randomStr) {
		String api_key = "NCS6Z2IHA0RLQUS1"; //쿨sms api
	    String api_secret = "MK0T5L21VZO4FXLBLRMQJBYHJIRAVOZC"; //쿨 sms 시크릿api
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // 수신전화번호
	    params.put("from", "01091957075");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "임시비밀번호는" + "["+randomStr+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	}
	//휴대폰 인증
		public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
			String api_key = "NCS6Z2IHA0RLQUS1"; //쿨sms api
		    String api_secret = "MK0T5L21VZO4FXLBLRMQJBYHJIRAVOZC"; //쿨 sms 시크릿api
		    Message coolsms = new Message(api_key, api_secret);

		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", userPhoneNumber);    // 수신전화번호
		    params.put("from", "01091957075");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		    params.put("type", "SMS");
		    params.put("text", "인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
		    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	}
	
	public int setInfoUpdate(MemberDTO memberDTO) throws Exception{
		return memberDAO.setInfoUpdate(memberDTO);
	}
	
	public MemberDTO myPageReset(MemberDTO memberDTO) throws Exception{
		return memberDAO.getLogin(memberDTO);
	}
	
	public int setPwUpdate(MemberDTO memberDTO) throws Exception{
		return memberDAO.setPwUpdate(memberDTO);
	}
	
	public MemberDTO findId(MemberDTO memberDTO) throws Exception{
		return memberDAO.findId(memberDTO);
	}
	
	public MemberDTO findPw(MemberDTO memberDTO) throws Exception{
		return memberDAO.findPw(memberDTO);
	}
	public int deleteMember(MemberDTO memberDTO) throws Exception{
		return memberDAO.deleteMember(memberDTO);
	}
	
	public MemberDTO getMember(String id) {
		return memberDAO.getMember(id);
	}
}

