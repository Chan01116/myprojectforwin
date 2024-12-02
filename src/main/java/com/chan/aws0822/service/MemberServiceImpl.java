package com.chan.aws0822.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chan.aws0822.domain.MemberVo;
import com.chan.aws0822.persistance.MemberMapper;
import com.chan.aws0822.util.RandomIdGenerator;
@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
    private SqlSession sqlSession;
	private MemberMapper mm;
	@Autowired   //스프링코어한테 여기다 주입해줘라고 이야기 하는것
	public MemberServiceImpl(SqlSession sqlSession) {
		this.mm = sqlSession.getMapper(MemberMapper.class);
		
	}	
	
	@Override
	public int memberIdCheck(String memberId) {
		int value = mm.memberIdCheck(memberId);
		return value;
	}

	@Override
	public MemberVo memberLoginCheck(String memberId) {
		MemberVo mv = mm.memberLoginCheck(memberId);
		return mv;
	}

	@Override
	public int memberInsert(MemberVo mv) {
		String ridx;
        boolean isUnique = false;

        // 중복되지 않는 ridx를 찾을 때까지 반복
        while (!isUnique) {
            ridx = RandomIdGenerator.generateRandomId();
            mv.setRidx(ridx);

            // 중복 확인 쿼리 실행
            int count = sqlSession.selectOne("memberCheckRidx", ridx);
            if (count == 0) {
                isUnique = true; // 중복이 없으면 루프 종료
            }
        }

        // 중복이 없는 ridx로 회원 정보 삽입
        return sqlSession.insert("memberInsert", mv);
    }
}
	

