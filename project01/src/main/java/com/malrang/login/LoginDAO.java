package com.malrang.login;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {
	@Autowired
	SqlSession sqlSession;

	public LoginDTO login(LoginDTO dto) {
		return sqlSession.selectOne("login.member", dto);
	}

	public int signup(SignupDTO dto) {
		return sqlSession.insert("login.signup", dto);
	}

	public List<SignupDTO> members() {
		return sqlSession.selectList("login.list");
	}

	public int checkID(String id) {
		return sqlSession.selectOne("login.checkID", id);
	}

	public List<Map<String, Object>> boardList2(int i) {
		return sqlSession.selectList("login.boardList2", i);
	}

	public int totalCount() {
		return sqlSession.selectOne("login.totalCount");
	}
}
