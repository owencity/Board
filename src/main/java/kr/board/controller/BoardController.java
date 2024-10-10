package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;


@Controller
public class BoardController {
	
	@Autowired
	BoardMapper boardmapper;
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/boardList.do")
	@ResponseBody
	public List<Board> boardList() {
		List<Board> list = boardmapper.getLists();
		return list; 
	}
	
	@RequestMapping("/boardInsert.do")
	@ResponseBody 
	public void boardInsert(Board vo) {
		boardmapper.boardInsert(vo);
	}
}
