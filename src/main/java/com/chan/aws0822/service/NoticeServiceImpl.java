package com.chan.aws0822.service;



import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chan.aws0822.domain.NoticeVo;
import com.chan.aws0822.domain.SearchCriteria;
import com.chan.aws0822.persistance.NoticeMapper;
// Component또는 Bean 타입을 썼지만 세부적으로 구분하기위해 Service를 쓴다


@Service
public class NoticeServiceImpl implements NoticeService{
	
	private NoticeMapper nm; //mybatis용 메서드
	
	
	@Autowired   //스프링코어한테 여기다 주입해줘라고 이야기 하는것
	public NoticeServiceImpl(SqlSession sqlSession) {
		this.nm = sqlSession.getMapper(NoticeMapper.class);
		
	}


	@Override
	public ArrayList<NoticeVo> noticeSelectAll(SearchCriteria scri) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("startPageNum", (scri.getPage()-1)*scri.getPerPageNum());
		hm.put("searchType", scri.getSearchType());
		hm.put("perPageNum", scri.getPerPageNum());
		hm.put("keyword", scri.getKeyword());
		ArrayList<NoticeVo> nlist = nm.noticeSelectAll(hm);		
		/* System.out.println("노티스서비스아이엠피엘에서 nlist값이 담기는지 : "+ nlist); */
		return nlist;
	}


	@Override
	public int noticeTotalCount(SearchCriteria scri) {
		
				
				
		int cnt = nm.noticeTotalCount(scri);
		return cnt;
	}


	@Override
	@Transactional
	public int noticeInsert(NoticeVo nv) {
		
	
		
		int value = nm.noticeInsert(nv);
		
		
		
		
		
		return value;
	}


	@Override
	public NoticeVo noticeSelectOne(int nidx) {
		
		NoticeVo nv = nm.noticeSelectOne(nidx);
		return nv;
	}


	@Override
	public int noticeViewCntUpdate(int nidx) {
		
		int cnt = nm.noticeViewCntUpdate(nidx);
		
		
		return cnt;
	}





	@Override
	public int noticeDelete(int nidx, int midx, String password) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		hm.put("nidx", nidx);
		hm.put("midx", midx);
		hm.put("password", password);
		
		int cnt = nm.noticeDelete(hm);
		
		return cnt;
	}

	
	@Override
	public int noticeUpdate(NoticeVo nv) {
		int value = nm.noticeUpdate(nv);
		
		
		return value;
	}


	@Override
	public int noticeRecomUpdate(int nidx) {
		NoticeVo nv = new NoticeVo();
		nv.setNidx(nidx);
		
		int cnt = nm.noticeRecomUpdate(nv);
		int recom = nv.getRecom();
		return recom;
	}


	


}
