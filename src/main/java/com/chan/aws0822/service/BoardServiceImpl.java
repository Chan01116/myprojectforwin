package com.chan.aws0822.service;



import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chan.aws0822.domain.BoardVo;
import com.chan.aws0822.domain.SearchCriteria;
import com.chan.aws0822.persistance.BoardMapper;
// Component또는 Bean 타입을 썼지만 세부적으로 구분하기위해 Service를 쓴다


@Service
public class BoardServiceImpl implements BoardService{
	
	private BoardMapper bm; //mybatis용 메서드
	
	
	@Autowired   //스프링코어한테 여기다 주입해줘라고 이야기 하는것
	public BoardServiceImpl(SqlSession sqlSession) {
		this.bm = sqlSession.getMapper(BoardMapper.class);
		
	}


	@Override
	public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("startPageNum", (scri.getPage()-1)*scri.getPerPageNum());
		hm.put("searchType", scri.getSearchType());
		hm.put("perPageNum", scri.getPerPageNum());
		hm.put("keyword", scri.getKeyword());
		ArrayList<BoardVo> blist = bm.boardSelectAll(hm);		
		
		return blist;
	}


	@Override
	public int boardTotalCount(SearchCriteria scri) {
		
				
				
		int cnt = bm.boardTotalCount(scri);
		return cnt;
	}


	@Override
	@Transactional
	public int noticeInsert(BoardVo bv) {
		
		//System.out.println("서비스 midx값:"+bv.getMidx());
		
		int value = bm.noticeInsert(bv);
		int maxNidx = bv.getNidx();
		int value2 = bm.boardOriginbidxUpdate(maxNidx);
		
		
		
		return value+value2;
	}


	@Override
	public BoardVo boardSelectOne(int bidx) {
		
		BoardVo bv = bm.boardSelectOne(bidx);
		return bv;
	}


	@Override
	public int boardViewCntUpdate(int bidx) {
		
		int cnt = bm.boardViewCntUpdate(bidx);
		
		
		return cnt;
	}





	@Override
	public int boardDelete(int bidx, int midx, String password) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		hm.put("bidx", bidx);
		hm.put("midx", midx);
		hm.put("password", password);
		
		int cnt = bm.boardDelete(hm);
		
		return cnt;
	}

	
	@Override
	public int boardUpdate(BoardVo bv) {
		int value = bm.boardUpdate(bv);
		
		
		return value;
	}



	




	
	
	

}
