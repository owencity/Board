package kr.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.entity.Member;
import kr.board.mapper.MemberMapper;

@Controller
public class MemberController {
	
	@Autowired
	MemberMapper memberMapper;
	
	@RequestMapping("/memJoin.do")
	public String memJoin() {
		return "member/join";
	}
	
	@RequestMapping("/memRegisterCheck.do")
	@ResponseBody
	public int memRegisterCheck(@RequestParam("memId") String memId) {
		
		Member nullMemberCheck = memberMapper.registerCheck(memId);
		if(nullMemberCheck != null || memId.equals(""))  {
			return 0; // 이미 존재하는 회원 , 입력불가
		}
		return 1; // 사용가능한 아이디
	}
}
