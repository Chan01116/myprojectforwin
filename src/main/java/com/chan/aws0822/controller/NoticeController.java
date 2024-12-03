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

import com.chan.aws0822.domain.NoticeVo;
import com.chan.aws0822.util.UploadFileUtiles;
import com.chan.aws0822.util.MediaUtils;
import com.chan.aws0822.domain.PageMaker;
import com.chan.aws0822.domain.SearchCriteria;
import com.chan.aws0822.service.NoticeService;

@Controller
@RequestMapping(value = "/board/")
public class NoticeController {
	@Resource(name="uploadPath")
	private String uploadPath;
	@Autowired(required=false)
	private PageMaker pm;
	
	@Autowired(required=false) 
	private NoticeService noticeService;
	
	@RequestMapping(value = "noticeList.aws", method = RequestMethod.GET)
	
    public String noticeList(SearchCriteria scri, Model model) {
		//System.out.println("��Ƽ������Ʈ ��������?");
		int cnt = noticeService.noticeTotalCount(scri);
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		ArrayList<NoticeVo> nlist = noticeService.noticeSelectAll(scri);
		
		model.addAttribute("nlist", nlist);
		model.addAttribute("pm", pm);
		
		//System.out.println("nlits����3333? : "+nlist);
		String path="/board/noticeList";		
		return path;
	}
    
	
	
	
	@RequestMapping(value = "noticeWrite.aws", method = RequestMethod.GET)
    public String noticeWrite() {
    	
        
        return "/board/noticeWrite";
    }
	@RequestMapping(value="noticeWriteAction.aws",method=RequestMethod.POST)
	public String noticeWriteAction(NoticeVo nv,@RequestParam("attachfile") MultipartFile attachfile, HttpServletRequest request,RedirectAttributes rttr) throws Exception { //����VoŸ������ ���ε��ؼ� �޴´�, ��Ƽ��Ʈ���Ϸ� ���ϵ� �޴´�
		//System.out.println("boardWriteAction");
		MultipartFile file = attachfile;
		
		String uploadedFiledName = "";
		
		if(! file.getOriginalFilename().equals("")) {
			
			uploadedFiledName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			//System.out.println("OriginalFilename");
		}
		
		String midx = request.getSession().getAttribute("midx").toString();
		//System.out.println("���� ��Ʈ�ѷ�midx : "+ midx);
		
		int midx_int = Integer.parseInt(midx);
		
		
		nv.setUploadedFilename(uploadedFiledName);
		nv.setMidx(midx_int);
		
		
		int value = noticeService.noticeInsert(nv);
		
			String path="redirect:/board/noticeList.aws";
			if(value ==1) {
				path ="redirect:/board/noticeList.aws";
								
			}else {
				rttr.addFlashAttribute("msg", "�Է��� �߸��Ǿ����ϴ�");
				path ="redirect:/board/noticeWrite.aws";
				
			}
		
		 
		return path;
	}
	
	

	@RequestMapping(value="noticeContents.aws",method=RequestMethod.GET)
	public String noticeContents(@RequestParam("nidx") int nidx, Model model) {
		
		noticeService.noticeViewCntUpdate(nidx);
		NoticeVo nv = noticeService.noticeSelectOne(nidx);
		
		model.addAttribute("nv", nv);
		
		String path ="/board/noticeContents"; 
		return path;
	}
	
	@RequestMapping(value="/displayFile.aws", method=RequestMethod.GET)  //�����ο��ٰ� �ٹ������ �����̸��� �ѱ�� 
	public ResponseEntity<byte[]> displayFile(
			@RequestParam("fileName") String fileName,
			@RequestParam(value="down",defaultValue="0") int down
			){
		
		ResponseEntity<byte[]> entity = null;  // ����ƮŸ�� ��ü�� ��´�
		InputStream in = null; // �����ϴ� ������ �����ͼ��� = ��ǲ��Ʈ��
		
		
		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);//Ȯ���ڸ� ���
			MediaType mType = MediaUtils.getMediaType(formatName);//����Ÿ������ �˷���
			
			HttpHeaders headers = new HttpHeaders();		
			 
			in = new FileInputStream(uploadPath+fileName); //������ ����			
			
			if(mType != null){ // �̹��������̸�
				
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
						new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\""); //�ٿ�ε�޴� �������				
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
	@RequestMapping(value="noticeRecom.aws",method=RequestMethod.GET)
	public JSONObject boardRecom(@RequestParam("nidx") int nidx) {
		
		int value = noticeService.noticeRecomUpdate(nidx);
		
		JSONObject js = new JSONObject();
		
		js.put("recom", value);
		
		return js;
	}
	@RequestMapping(value="noticeDelete.aws",method=RequestMethod.GET)
	public String noticeDelete(@RequestParam("nidx") int nidx, Model model) {
		
		model.addAttribute("nidx", nidx);
		
		String path = "/board/noticeDelete";
		
		
		return path;
	}
	
	
	
	
	
	
	
	@RequestMapping(value="noticeDeleteAction.aws",method=RequestMethod.POST)
	public String noticeDeleteAction(@RequestParam("nidx") int nidx, @RequestParam("password") String password, HttpSession session) {
		
		int midx = Integer.parseInt(session.getAttribute("midx").toString());
		
		int value = noticeService.noticeDelete(nidx,midx,password);
		
		String path = "redirect:/board/noticeList.aws";
		if(value == 0) {
			path = "redirect:/board/noticeDelete.aws?nidx="+nidx;
						
		}
		return path;
	}
	
	@RequestMapping(value="noticeModify.aws",method=RequestMethod.GET)
	public String noticeModify(@RequestParam("nidx") int nidx, Model model) {
		
		
		
		NoticeVo nv = noticeService.noticeSelectOne(nidx);
		model.addAttribute("nv", nv);
		
		String path ="/board/noticeModify"; 
		return path;
	}
	
	
	@RequestMapping(value="noticeModifyAction.aws",method=RequestMethod.POST)
	public String noticeModifyAction(NoticeVo nv,@RequestParam("attachfile") MultipartFile attachfile, HttpServletRequest request,RedirectAttributes rttr) throws Exception { //����VoŸ������ ���ε��ؼ� �޴´�, ��Ƽ��Ʈ���Ϸ� ���ϵ� �޴´�
		//System.out.println("boardWriteAction");
		//���Ͼ��ε带 �ϰ� update�� �ϱ����� service�� �����
		
		int value = 0;
		
		
		MultipartFile file = attachfile;
		String uploadedFiledName = "";
		
		if(!file.getOriginalFilename().equals("")) {
			
			uploadedFiledName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			
		}
		String midx = request.getSession().getAttribute("midx").toString();
		int midx_int = Integer.parseInt(midx);
		
		nv.setUploadedFilename(uploadedFiledName);
		nv.setMidx(midx_int);
		nv.setUploadedFilename(uploadedFiledName); //filename �÷������� ��������
		
		
		
		
		value = noticeService.noticeUpdate(nv);
		
				
		
			String path="redirect:/board/noticeList.aws";
			if(value ==0) {
				rttr.addFlashAttribute("msg", "���� �������� �ʾҽ��ϴ�");
				path ="redirect:/board/noticeModfiy.aws?nidx="+nv.getNidx();
								
			}else {
				
				path ="redirect:/board/noticeContents.aws?nidx="+nv.getNidx();
				
			}
		
		 
		return path;
	}
	
	
	
	
}