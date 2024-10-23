package kr.board.mapper;

import org.apache.ibatis.annotations.Mapper;
import kr.board.entity.Member;

@Mapper
public interface MemberMapper {
	public Member registerCheck(String memId);
	public int register(Member member); // (성공 1,  실패 0)
	public Member memberLogin(Member member);
}
