package com.malrang.pro1;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

//Inject 사용해보기
@Repository("boardDAO")
public class BoardDAO {
	@Inject
	@Named("sqlSession")
	private SqlSession sqlSession;
	
	public List<BoardDTO> boardList(PageDTO page){
		return sqlSession.selectList("board.boardList", page);
	}
	
	public BoardDTO detail(BoardDTO dto) {
		return sqlSession.selectOne("board.detail", dto);
	}

	public void write(BoardDTO dto) {
		sqlSession.insert("board.write", dto);
	}

	public void delete(BoardDTO dto) {
		sqlSession.delete("board.delete", dto);
	}

	public void edit(BoardDTO dto) {
		sqlSession.update("board.edit", dto);
	}

	public void likeUp(BoardDTO dto) {
		sqlSession.update("board.likeUp", dto);
	}

	public int totalCount() {
		return sqlSession.selectOne("board.totalCount");
	}

	/*public String reply(BoardDTO dto) {
		return sqlSession.selectList("board.reply", dto);
	}*/

}
