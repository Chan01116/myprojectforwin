package com.chan.aws0822.service;



import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chan.aws0822.domain.NoticeVo;
import com.chan.aws0822.domain.QnaVo;
import com.chan.aws0822.domain.SearchCriteria;
import com.chan.aws0822.persistance.NoticeMapper;
import com.chan.aws0822.persistance.QnaMapper;
// Component또는 Bean 타입을 썼지만 세부적으로 구분하기위해 Service를 쓴다


@Service
public class QnaServiceImpl implements QnaService{
	
	private QnaMapper qm; //mybatis용 메서드
	
	
	@Autowired   //스프링코어한테 여기다 주입해줘라고 이야기 하는것
	public QnaServiceImpl(SqlSession sqlSession) {
		this.qm = sqlSession.getMapper(QnaMapper.class);
		
	}


	@Override
	public ArrayList<QnaVo> qnaSelectAll(SearchCriteria scri) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("startPageNum", (scri.getPage()-1)*scri.getPerPageNum());
		hm.put("searchType", scri.getSearchType());
		hm.put("perPageNum", scri.getPerPageNum());
		hm.put("keyword", scri.getKeyword());
		ArrayList<QnaVo> qlist = qm.qnaSelectAll(hm);		
		/* System.out.println("노티스서비스아이엠피엘에서 nlist값이 담기는지 : "+ nlist); */
		return qlist;
	}


	@Override
	public int qnaTotalCount(SearchCriteria scri) {
		
				
				
		int cnt = qm.qnaTotalCount(scri);
		return cnt;
	}


	@Override
	@Transactional
	public int qnaInsert(QnaVo qv) {
		
	
		
		int value = qm.qnaInsert(qv);
		
		
		
		
		
		return value;
	}


	@Override
	public QnaVo qnaSelectOne(int qidx) {
		
		QnaVo qv = qm.qnaSelectOne(qidx);
		return qv;
	}


	@Override
	public int qnaViewCntUpdate(int qidx) {
		
		int cnt = qm.qnaViewCntUpdate(qidx);
		
		
		return cnt;
	}





	@Override
	public int qnaDelete(int qidx, int midx, String password) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		hm.put("qidx", qidx);
		hm.put("midx", midx);
		hm.put("password", password);
		
		int cnt = qm.qnaDelete(hm);
		
		return cnt;
	}

	
	@Override
	public int qnaUpdate(QnaVo qv) {
		int value = qm.qnaUpdate(qv);
		
		
		return value;
	}


	@Override
	public int qnaRecomUpdate(int qidx) {
		QnaVo qv = new QnaVo();
		qv.setQidx(qidx);
		
		int cnt = qm.qnaRecomUpdate(qv);
		int recom = qv.getRecom();
		return recom;
	}


	






	


}
