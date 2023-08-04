package com.malrang.login;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
	@Autowired
	private LoginDAO loginDAO;

	public LoginDTO login(LoginDTO dto) {
		return loginDAO.login(dto);
	}

	public int signup(SignupDTO dto) {
		return loginDAO.signup(dto);
	}

	public List<SignupDTO> members() {
		return loginDAO.members();
	}

	public int checkID(String id) {
		return loginDAO.checkID(id);
	}

	public List<Map<String, Object>> boardList2(int i) {
		return loginDAO.boardList2(i);
	}

	public int totalCount() {
		return loginDAO.totalCount();
	}
}
