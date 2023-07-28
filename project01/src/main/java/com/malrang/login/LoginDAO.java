package com.malrang.login;

import java.util.List;

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
}
