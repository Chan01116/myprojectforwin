package com.chan.aws0822.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chan.aws0822.util.UploadFileUtiles;
import com.chan.aws0822.util.MediaUtils;
import com.chan.aws0822.domain.PageMaker;
import com.chan.aws0822.domain.QnaVo;
import com.chan.aws0822.domain.SearchCriteria;
import com.chan.aws0822.service.QnaService;

@Controller
@RequestMapping(value = "/board/")
public class QnaController {
	@Resource(name="uploadPath")
	private String uploadPath;
	@Autowired(required=false)
	private PageMaker pm;
	
	@Autowired(required=false) 
	private QnaService qnaService;
	
	@RequestMapping(value = "qnaList.aws", method = RequestMethod.GET)
	
    public String qnaList(SearchCriteria scri, Model model) {
		//System.out.println("큐앤에이리스트 들어오나요?");
		int cnt = qnaService.qnaTotalCount(scri);
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		ArrayList<QnaVo> qlist = qnaService.qnaSelectAll(scri);
		
		model.addAttribute("qlist", qlist);
		model.addAttribute("pm", pm);
		
		//System.out.println("qlits값은3333? : "+qlist);
		String path="/board/qnaList";		
		return path;
	}
    
	
	
	
	@RequestMapping(value = "qnaWrite.aws", method = RequestMethod.GET)
    public String qnaWrite() {
    	
        
        return "/board/qnaWrite";
    }
	@RequestMapping(value="qnaWriteAction.aws",method=RequestMethod.POST)
	public String qnaWriteAction(QnaVo qv,@RequestParam("attachfile") MultipartFile attachfile, HttpServletRequest request,RedirectAttributes rttr) throws Exception { //보드Vo타입으로 바인딩해서 받는다, 멀티파트파일로 파일도 받는다
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
		
		
		qv.setUploadedFilename(uploadedFiledName);
		qv.setMidx(midx_int);
		
		
		int value = qnaService.qnaInsert(qv);
		
			String path="redirect:/board/qnaList.aws";
			if(value ==1) {
				path ="redirect:/board/qnaList.aws";
								
			}else {
				rttr.addFlashAttribute("msg", "입력이 잘못되었습니다");
				path ="redirect:/board/qnaWrite.aws";
				
			}
		
		 
		return path;
	}
	
	

	@RequestMapping(value="qnaContents.aws",method=RequestMethod.GET)
	public String qnaContents(@RequestParam("qidx") int qidx, Model model) {
		
		qnaService.qnaViewCntUpdate(qidx);
		QnaVo qv = qnaService.qnaSelectOne(qidx);
		
		model.addAttribute("qv", qv);
		
		String path ="/board/qnaContents"; 
		return path;
	}
	
	@RequestMapping(value="/qna/displayFile.aws", method=RequestMethod.GET)  //가상경로에다가 겟방식으로 파일이름을 넘긴다 
	public ResponseEntity<byte[]> qnadisplayFile(
			@RequestParam("fileName") String fileName,
			@RequestParam(value="down",defaultValue="0") int down
			){
		
		ResponseEntity<byte[]> entity = null;  // 바이트타입 객체를 담는다
		InputStream in = null; // 시작하는 시점의 데이터수로 = 인풋스트림
		
		
		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);//확장자를 물어봄
			MediaType mType = MediaUtils.getMediaType(formatName);//무슨타입인지 알려고
			
			HttpHeaders headers = new HttpHeaders();		
			 
			in = new FileInputStream(uploadPath+fileName); //파일을 읽음			
			
			if(mType != null){ // 이미지파일이면
				
				if (down==1) {
					fileName = fileName.substring(fileName.indexOf("_")+1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition", "attachment; filename=\""+
							new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");	
					
				}else {
					headers.setContentType(mType);	
				}
				
			}else{
				
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
						new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\""); //다운로드받는 방식으로				
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			try {
				in.close();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		
		
		
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="qnaRecom.aws",method=RequestMethod.GET)
	public JSONObject qnaRecom(@RequestParam("qidx") int qidx) {
		
		int value = qnaService.qnaRecomUpdate(qidx);
		
		JSONObject js = new JSONObject();
		
		js.put("recom", value);
		
		return js;
	}
	@RequestMapping(value="qnaDelete.aws",method=RequestMethod.GET)
	public String qnaDelete(@RequestParam("qidx") int qidx, Model model) {
		
		model.addAttribute("qidx", qidx);
		
		String path = "/board/qnaDelete";
		
		
		return path;
	}
	
	
	
	
	
	
	
	@RequestMapping(value="qnaDeleteAction.aws",method=RequestMethod.POST)
	public String qnaDeleteAction(@RequestParam("qidx") int qidx, @RequestParam("password") String password, HttpSession session) {
		
		int midx = Integer.parseInt(session.getAttribute("midx").toString());
		
		int value = qnaService.qnaDelete(qidx,midx,password);
		
		String path = "redirect:/board/qnaList.aws";
		if(value == 0) {
			path = "redirect:/board/qnaDelete.aws?qidx="+qidx;
						
		}
		return path;
	}
	
	@RequestMapping(value="qnaModify.aws",method=RequestMethod.GET)
	public String qnaModify(@RequestParam("qidx") int qidx, Model model) {
		
		
		
		QnaVo qv = qnaService.qnaSelectOne(qidx);
		model.addAttribute("qv", qv);
		
		String path ="/board/qnaModify"; 
		return path;
	}
	
	
	@RequestMapping(value="qnaModifyAction.aws",method=RequestMethod.POST)
	public String qnaModifyAction(QnaVo qv,@RequestParam("attachfile") MultipartFile attachfile, HttpServletRequest request,RedirectAttributes rttr) throws Exception { //보드Vo타입으로 바인딩해서 받는다, 멀티파트파일로 파일도 받는다
		//System.out.println("boardWriteAction");
		//파일업로드를 하고 update를 하기위한 service를 만든다
		
		int value = 0;
		
		
		MultipartFile file = attachfile;
		String uploadedFiledName = "";
		
		if(!file.getOriginalFilename().equals("")) {
			
			uploadedFiledName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			
		}
		String midx = request.getSession().getAttribute("midx").toString();
		int midx_int = Integer.parseInt(midx);
		
		qv.setUploadedFilename(uploadedFiledName);
		qv.setMidx(midx_int);
		qv.setUploadedFilename(uploadedFiledName); //filename 컬럼값으로 넣을려고
		
		
		
		
		value = qnaService.qnaUpdate(qv);
		
				
		
			String path="redirect:/board/qnaList.aws";
			if(value ==0) {
				rttr.addFlashAttribute("msg", "글이 수정되지 않았습니다");
				path ="redirect:/board/qnaModfiy.aws?qidx="+qv.getQidx();
								
			}else {
				
				path ="redirect:/board/qnaContents.aws?qidx="+qv.getQidx();
				
			}
		
		 
		return path;
	}
	

	
	
}