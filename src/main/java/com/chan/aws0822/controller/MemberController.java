package com.chan.aws0822.controller;


import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
    	//logger.info("�������Ʈ�ѷ� ����α���");
        // memberLogin.jsp�� �̵�
        return "/member/memberLogin";
    }
    
    @RequestMapping(value="memberLoginAction.aws",method=RequestMethod.POST)
	public String memberLoginAction(
			
			
			
			@RequestParam("memberid") String memberid, 
			@RequestParam("memberpassword") String memberpassword,
			RedirectAttributes rttr,
			HttpSession session
			) {
    	
    	
    	
    	//System.out.println("�α��ξ׼ǵ��ɴϱ�?");
		MemberVo mv = memberService.memberLoginCheck(memberid);
		//����� ��й�ȣ�� �����´�
		
		String path = "";
		if (mv != null) {  //��ü���� ������
			String reservedPassword = mv.getMemberpassword(); 
		
			if(bCryptPasswordEncoder.matches(memberpassword, reservedPassword)) {
				//System.out.println("��й�ȣ ��ġ");
				rttr.addAttribute("midx", mv.getMidx());
				rttr.addAttribute("memberId", mv.getMemberid());
				rttr.addAttribute("memberName", mv.getMembername());
				rttr.addAttribute("admin", mv.getAdmin());
				
				//logger.info("saveUrl===>"+session.getAttribute("saveUrl"));
				
				if(session.getAttribute("saveUrl") != null) {
					path ="redirect:"+session.getAttribute("saveUrl").toString();
				}else {
				
					path ="redirect:/";
				}
				
				
			}else {
				
				rttr.addAttribute("midx", "");
				rttr.addAttribute("memberId", "");
				rttr.addAttribute("memberName", "");
				rttr.addAttribute("admin", "");
				rttr.addFlashAttribute("msg", "���̵�/��й�ȣ�� Ȯ�����ּ���.");
				path = "redirect:/member/memberLogin.aws";
			}		
		}else {
			rttr.addAttribute("midx", "");
			rttr.addAttribute("memberId", "");
			rttr.addAttribute("memberName", "");    //�����ؼ� �Ⱦ�
			rttr.addAttribute("admin", "");
			rttr.addFlashAttribute("msg", "�ش��ϴ� ���̵� �����ϴ�.");  //�÷����� �ѹ���
			path = "redirect:/member/memberLogin.aws";
		}		
		//ȸ��������  ���ǿ� ��´�
				
		return path;
	}
    
    
    
    
    
    
    @RequestMapping(value = "memberJoin.aws",method = RequestMethod.GET)
	public String memberJoin() {
		
		//logger.info("memberJoin����");
		
		//logger.info("bCryptPasswordEncoder : "+bCryptPasswordEncoder);
				
		//logger.info("tt����? : "+tt.test());
		
		return "/member/memberJoin";
	}
    
    @RequestMapping(value = "memberJoinAction.aws",method = RequestMethod.POST)
	public String memberJoinAction(MemberVo mv) {
		
		//logger.info("memberJoinAction����");
		
		
		//��й�ȣ ��ȣȭ ���
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
    
    @RequestMapping(value = "memberLogout.aws",method = RequestMethod.GET)
	public String memberLogout(HttpSession session) {
		
		//logger.info("memberLogout����");
		session.removeAttribute("midx");
		session.removeAttribute("memberName");
		session.removeAttribute("memberId");
		session.removeAttribute("admin");
		session.invalidate();
				
		return "redirect:/";
	}
    @ResponseBody
	@RequestMapping(value = "memberIdCheck.aws",method = RequestMethod.POST)
	public JSONObject memberIdCheck(@RequestParam("memberId") String memberId) {
				    	
    			
		//MemberDao mv = new MemberDao();  //POJO(Plain Old Java Object)����� ���� �ڹ��� ��ü����
    	int cnt = memberService.memberIdCheck(memberId);
    	
    	    	
    	//PrintWriter out = response.getWriter();
    	//out.println("{\"cnt\":\""+cnt+"\"}");
		
    	JSONObject obj = new JSONObject();  
    	obj.put("cnt", cnt);
    	
		
		return obj;
	}


}