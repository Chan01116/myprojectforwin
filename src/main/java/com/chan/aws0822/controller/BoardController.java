package com.chan.aws0822.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chan.aws0822.domain.BoardVo;
import com.chan.aws0822.util.UploadFileUtiles;
import com.chan.aws0822.service.BoardService;

@Controller
@RequestMapping(value = "/board/")
public class BoardController {
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	@Autowired(required=false) 
	private BoardService boardService;
	
	@RequestMapping(value = "noticeList.aws", method = RequestMethod.GET)
    public String noticeList() {
    	
        
        return "/board/noticeList";
    }
    
	
	
	
	@RequestMapping(value = "noticeWrite.aws", method = RequestMethod.GET)
    public String noticeWrite() {
    	
        
        return "/board/noticeWrite";
    }
	@RequestMapping(value="noticeWriteAction.aws",method=RequestMethod.POST)
	public String noticeWriteAction(BoardVo bv,@RequestParam("attachfile") MultipartFile attachfile, HttpServletRequest request,RedirectAttributes rttr) throws Exception { //보드Vo타입으로 바인딩해서 받는다, 멀티파트파일로 파일도 받는다
		//System.out.println("boardWriteAction");
		MultipartFile file = attachfile;
		
		String uploadedFiledName = "";
		
		if(! file.getOriginalFilename().equals("")) {
			
			uploadedFiledName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			//System.out.println("OriginalFilename");
		}
		
		String midx = request.getSession().getAttribute("midx").toString();
		//System.out.println("보드 컨트롤러midx : "+ midx);
		
		int midx_int = Integer.parseInt(midx);
		
		
		bv.setUploadedFilename(uploadedFiledName);
		bv.setMidx(midx_int);
		
		
		int value = boardService.noticeInsert(bv);
		
			String path="redirect:/board/noticeList.aws";
			if(value ==2) {
				path ="redirect:/board/noticeList.aws";
								
			}else {
				rttr.addFlashAttribute("msg", "입력이 잘못되었습니다");
				path ="redirect:/board/noticeWrite.aws";
				
			}
		
		 
		return path;
	}
	
	
	@RequestMapping(value = "qnaList.aws", method = RequestMethod.GET)
    public String qnaList() {
    	
        
        return "/board/qnaList";
    }
	
	
	
	@RequestMapping(value = "qnaWrite.aws", method = RequestMethod.GET)
    public String qnaWrite() {
    	
        
        return "/board/qnaWrite";
    }
	
	
	
}
