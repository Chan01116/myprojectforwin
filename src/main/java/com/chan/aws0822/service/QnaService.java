package com.chan.aws0822.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.chan.aws0822.domain.QnaVo;
import com.chan.aws0822.domain.SearchCriteria;

public interface QnaService {

	public int qnaTotalCount(SearchCriteria scri);
	public int qnaInsert(QnaVo qv);
	public QnaVo qnaSelectOne(int qidx);
	public int qnaViewCntUpdate(int qidx);
	public int qnaUpdate(QnaVo qv);
	public int qnaRecomUpdate(int qidx);
	public int qnaDelete(int qidx, int midx, String password);
	public ArrayList<QnaVo> qnaSelectAll(SearchCriteria scri);
	
	
	

}
