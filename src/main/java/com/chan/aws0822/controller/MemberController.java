package com.chan.aws0822.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chan.aws0822.domain.MemberVo;
import com.chan.aws0822.service.MemberService;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {
    
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    
    @Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
	private MemberService memberService;
   
    @RequestMapping(value = "memberLogin.aws", method = RequestMethod.GET)
    public String memberLogin() {
    	logger.info("멤버에컨트롤러 멤버로그인");
        // memberLogin.jsp로 이동
        return "/member/memberLogin";
    }
    
    @RequestMapping(value = "memberJoin.aws",method = RequestMethod.GET)
	public String memberJoin() {
		
		//logger.info("memberJoin들어옴");
		
		//logger.info("bCryptPasswordEncoder : "+bCryptPasswordEncoder);
				
		//logger.info("tt값은? : "+tt.test());
		
		return "/member/memberJoin";
	}
    
    @RequestMapping(value = "memberJoinAction.aws",method = RequestMethod.POST)
	public String memberJoinAction(MemberVo mv) {
		
		//logger.info("memberJoinAction들어옴");
		
		
		//비밀번호 암호화 기능
		String memberpwd_enc = bCryptPasswordEncoder.encode(mv.getMemberpassword());
		mv.setMemberpassword(memberpwd_enc);
		
		
		int value = memberService.memberInsert(mv);
		//logger.info("value : "+value);
		
		String path = "";
		if(value == 1) {
			path = "redirect:/";
			
		}else if(value == 0) {
			path = "redirect:/member/memberJoin.aws";
			
		}
				
		
		return path;
	}
    
    
    


}