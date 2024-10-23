package kr.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	// 회원가입 처리
	@RequestMapping("/memRegister.do")
	public String memRegister(Member member, String memPassword1 , String memPassword2,
			RedirectAttributes rttr, HttpSession session) {
		
		if(member.getMemUserid() == null || member.getMemUserid().equals("") || 
				memPassword1 == null || memPassword1.equals("") ||
				memPassword2 == null || memPassword2.equals("") ||
				member.getMemName() == null || member.getMemName().equals("") ||
				member.getMemAge() == null || member.getMemAge() == 0 ||
				member.getMemEmail() == null || member.getMemEmail().equals("") || 				
				member.getMemGender() == null || member.getMemGender().equals("") 
				) {
			rttr.addFlashAttribute("msgType", "error"); // 리다이렉트 시 메시지 한번만 보냄
			rttr.addFlashAttribute("msg", "모든 내용을 입력하세요."); // 리다이렉트 시 메시지 한번만 보냄
			return "redirect:/memJoin.do";
		}
		
		if(!memPassword1.equals(memPassword2)) {
			rttr.addFlashAttribute("msgType", "error"); // 리다이렉트 시 메시지 한번만 보냄
			rttr.addFlashAttribute("msg", "비밀번호가 서로 다릅니다."); // 리다이렉트 시 메시지 한번만 보냄
			return "redirect:/memJoin.do";
		}
		
		member.setMemProfile(""); // null 과 공백의 의미가 다르므로 공백
		int checkRegister = memberMapper.register(member);
		if(checkRegister == 1) { // 회원가입 성공
			rttr.addFlashAttribute("msgType", "성공메시지"); 
			rttr.addFlashAttribute("msg", "회원가입에 성공했습니다.");
			// 회원가입이 성공하면 => 로그인처리
			session.setAttribute("member", member);
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("msgType", "실패 메시지"); 
			rttr.addFlashAttribute("msg", "회원가입에 실패하였습니다.");
			return "redirect:/memJoin.do";
		}	
	}
		@RequestMapping("/memLogout.do") 
		public String memLogout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}
		
		// 로그인 화면으로 이동
		@RequestMapping("/memLoginForm.do")
		public String memLoginForm() {
			return "member/memLoginForm";
		}
		
		// 로그인 기능 구현
		@RequestMapping("/memLogin.do")
		public String memLogin(Member member,RedirectAttributes rttr, HttpSession session ) {
			if(member.getMemUserid() == null || member.getMemUserid().equals("") ||
				member.getMemPassword() == null || member.getMemPassword().equals("")) {
				rttr.addFlashAttribute("msgType", "실패 메시지");
				rttr.addFlashAttribute("msg", "모든 내용을 입력해주세요");
				return "redirect:/memLoginForm.do";
			}
			System.out.println(member.toString());
			Member memberVo = memberMapper.memberLogin(member);
			System.out.println(memberVo.toString());
			if(memberVo != null) {
				// 로그인성공
				rttr.addFlashAttribute("msgType", "성공 메시지");
				rttr.addFlashAttribute("msg", "로그인에 성공했습니다.");
				session.setAttribute("memberVo", memberVo); // ${!empty memberVo}
				return "redirect:/";
			} else {
				// 로그인실패
				rttr.addFlashAttribute("msgType", "실패 메시지");
				rttr.addFlashAttribute("msg", "다시 로그인 해주세요");
				return "redirect:/memLoginForm.do";
			}
		}
		// 회원정보 수정화면
		@RequestMapping("/memUpdateForm.do")
		public String memUpdateForm() {
			return "member/memUpdateForm"; 
		}
	}

