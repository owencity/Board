package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@RequestMapping("/board")
@RestController
public class RestBoardController {
	
	@Autowired
	BoardMapper boardmapper;
	
	@GetMapping("/getlist")
	public List<Board> boardList() {
		List<Board> list = boardmapper.getLists();
		return list; 
	}
	
	@PostMapping("/saveboard")
	public void boardInsert(Board vo) {
		boardmapper.boardInsert(vo);
	}
	
	@GetMapping("/deleteboard/{id}")
	public void boardDelete(@PathVariable("id") int id) {
		boardmapper.boardDelete(id);
	}
	
	@PutMapping("/updateboard")
	public void boardUpdate(Board vo) {
		boardmapper.boardUpdate(vo);
	}
	
	@GetMapping("/showcontent/{id}")
	public Board boardContent(@PathVariable("id") int id) {
		Board vo = boardmapper.boardContent(id);
		return vo;
	}
	
	@GetMapping("/count/{id}")
	public Board boardCount(@PathVariable("id") int id) {
	 boardmapper.boardCount(id);
	 Board vo = boardmapper.boardContent(id);
	 return vo;
	
	}
}
