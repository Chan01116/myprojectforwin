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
	@Autowired   //�������ھ����� ����� ���������� �̾߱� �ϴ°�
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

        // �ߺ����� �ʴ� ridx�� ã�� ������ �ݺ�
        while (!isUnique) {
            ridx = RandomIdGenerator.generateRandomId();
            mv.setRidx(ridx);

            // �ߺ� Ȯ�� ���� ����
            int count = sqlSession.selectOne("memberCheckRidx", ridx);
            if (count == 0) {
                isUnique = true; // �ߺ��� ������ ���� ����
            }
        }

        // �ߺ��� ���� ridx�� ȸ�� ���� ����
        return sqlSession.insert("memberInsert", mv);
    }
}
	

