package com.malrang.pro1;

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
	
	public List<BoardDTO> boardList(){
		return sqlSession.selectList("board.boardList");
	}
	
	public BoardDTO detail(String bno) {
		return sqlSession.selectOne("board.detail", bno);
	}

	public void write(BoardDTO dto) {
		sqlSession.insert("board.write", dto);
	}

}
