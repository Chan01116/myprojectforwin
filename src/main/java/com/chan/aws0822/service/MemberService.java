package com.chan.aws0822.service;
import java.util.ArrayList;

import com.chan.aws0822.domain.MemberVo;


//���������� Member��ɿ��� ����� �޼��带 �����ϴ°�

public interface MemberService {
	
	public int memberIdCheck(String memberId);
	public MemberVo memberLoginCheck(String memberId);
	
	public int memberInsert(MemberVo mv);
	

}
