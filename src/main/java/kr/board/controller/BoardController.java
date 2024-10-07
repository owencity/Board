package kr.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper mapper;
	// boardList.do
	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		List<Board> list = mapper.getLists();
		   if (list == null || list.isEmpty()) {
		        System.out.println("No data found");
		    } else {
		        System.out.println("Data retrieved: " + list.size());
		    }
		model.addAttribute("list", list);
		return "boardList";
	}
	
}
