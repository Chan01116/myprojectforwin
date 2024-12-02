package com.chan.aws0822.service;

import java.util.ArrayList;

import com.chan.aws0822.domain.BoardVo;

import com.chan.aws0822.domain.SearchCriteria;

public interface BoardService {

	public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri);
	
	public int boardTotalCount(SearchCriteria scri);
	
	public int noticeInsert(BoardVo bv);
	
	public BoardVo boardSelectOne(int bidx);
	
	public int boardViewCntUpdate(int bidx);
	

	
	public int boardDelete(int bidx, int midx, String password);

	public int boardUpdate(BoardVo bv);
	
	
	

}
