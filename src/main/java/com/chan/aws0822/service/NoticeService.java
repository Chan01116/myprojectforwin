package com.chan.aws0822.service;

import java.util.ArrayList;

import com.chan.aws0822.domain.NoticeVo;

import com.chan.aws0822.domain.SearchCriteria;

public interface NoticeService {

	public ArrayList<NoticeVo> noticeSelectAll(SearchCriteria scri);
	
	public int noticeTotalCount(SearchCriteria scri);
	
	public int noticeInsert(NoticeVo nv);
	
	public NoticeVo noticeSelectOne(int nidx);
	
	public int noticeViewCntUpdate(int nidx);
	
	public int noticeRecomUpdate(int nidx);
	
	public int noticeDelete(int nidx, int midx, String password);

	public int noticeUpdate(NoticeVo nv);


	
	
	

}
