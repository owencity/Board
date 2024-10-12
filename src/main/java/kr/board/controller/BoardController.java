package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;


@Controller
public class BoardController {
	
	@Autowired
	BoardMapper boardmapper;
	
	@RequestMapping("/boardMain.do")
	public String main() {
		return "board/main";
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
	
	@RequestMapping("/boardDelete.do")
	@ResponseBody
	public void boardDelete(@RequestParam("id") int id) {
		boardmapper.boardDelete(id);
	}
	
	@RequestMapping("/boardUpdate.do")
	@ResponseBody
	public void boardUpdate(Board vo) {
		boardmapper.boardUpdate(vo);
	}
	
	@RequestMapping("/boardContent.do")
	@ResponseBody
	public Board boardContent(int id) {
		Board vo = boardmapper.boardContent(id);
		return vo;
	}
	
	@RequestMapping("/boardCount.do")
	@ResponseBody
	public Board boardCount(int id) {
	 boardmapper.boardCount(id);
	 Board vo = boardmapper.boardContent(id);
	 return vo;
	
	}
}
