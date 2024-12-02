package com.chan.aws0822.persistance;

import java.util.ArrayList;
import java.util.HashMap;

import com.chan.aws0822.domain.BoardVo;
import com.chan.aws0822.domain.SearchCriteria;

public interface BoardMapper {

	public ArrayList<BoardVo> boardSelectAll(HashMap<String,Object> hm);
	public int boardTotalCount(SearchCriteria scri);
	public int noticeInsert(BoardVo bv);
	public int boardOriginbidxUpdate(int bidx);
	public BoardVo boardSelectOne(int bidx);
	public int boardViewCntUpdate(int bidx);
	public int boardRecomUpdate(BoardVo bv);
	public int boardDelete(HashMap hm);
	public int boardUpdate(BoardVo bv);
	

	

}
