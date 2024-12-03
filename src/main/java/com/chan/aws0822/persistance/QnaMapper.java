package com.chan.aws0822.persistance;

import java.util.ArrayList;
import java.util.HashMap;

import com.chan.aws0822.domain.QnaVo;
import com.chan.aws0822.domain.SearchCriteria;

public interface QnaMapper {

	public ArrayList<QnaVo> qnaSelectAll(HashMap<String,Object> hm);
	public int qnaTotalCount(SearchCriteria scri);
	public int qnaInsert(QnaVo qv);
	public QnaVo qnaSelectOne(int qidx);
	public int qnaViewCntUpdate(int qidx);
	public int qnaRecomUpdate(QnaVo qv);
	public int qnaDelete(HashMap hm);
	public int qnaUpdate(QnaVo qv);
	public int qnaRecomUpdate(int qidx);

	

}
