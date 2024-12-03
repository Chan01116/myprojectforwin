package com.chan.aws0822.persistance;

import java.util.ArrayList;
import java.util.HashMap;

import com.chan.aws0822.domain.NoticeVo;
import com.chan.aws0822.domain.SearchCriteria;

public interface NoticeMapper {

	public ArrayList<NoticeVo> noticeSelectAll(HashMap<String,Object> hm);
	public int noticeTotalCount(SearchCriteria scri);
	public int noticeInsert(NoticeVo nv);
	public NoticeVo noticeSelectOne(int nidx);
	public int noticeViewCntUpdate(int nidx);
	public int noticeRecomUpdate(NoticeVo nv);
	public int noticeDelete(HashMap hm);
	public int noticeUpdate(NoticeVo nv);
	public int noticeRecomUpdate(int nidx);

	

}
