package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.board.entity.Board;

@Mapper
public interface BoardMapper {
	public List<Board> getLists(); 
	public void boardInsert(Board vo);
	public Board boardContent(int id);
	public void boardDelete(int id);
	public void boardUpdate(Board vo);
	
	@Update("update myboard set count=count+1 where id=#{id}")
	public void boardCount(int id);
}
