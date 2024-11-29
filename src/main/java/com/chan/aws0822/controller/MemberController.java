package com.chan.aws0822.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {
    
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    
   
    @RequestMapping(value = "memberLogin.aws", method = RequestMethod.GET)
    public String memberLogin() {
    	logger.info("�������Ʈ�ѷ� ����α���");
        // memberLogin.jsp�� �̵�
        return "WEB-INF/member/memberLogin";
    }
}