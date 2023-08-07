package com.malrang.board;

import java.util.List;
import java.util.Map;

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
		sqlSession.update("board.delete", dto);
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

	public List<Map<Integer, String>> commentsList(int bno) {
		return sqlSession.selectList("board.commentsList", bno);
	}

	public int cdel(Map<String, Object> map) {
		return sqlSession.update("board.cdel", map);
	}

}
