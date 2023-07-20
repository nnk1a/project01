package com.malrang.pro1;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardService {
	@Inject
	@Named("boardDAO")
	private BoardDAO boardDAO;
	@Autowired
	Util util;
	
	//board 리스트 불러오는 메소드
	public List<BoardDTO> boardList() {
		return boardDAO.boardList();
	}
	
	public BoardDTO detail(int bno) {
		BoardDTO dto = boardDAO.detail(bno);
		//ip 중간에 하트 넣어주기 172.30.1.19 -> 172.♡.1.19
		if (dto.getBip() != null && dto.getBip().indexOf(".") != -1) {
			String ip = dto.getBip();
			String[] ipArr = ip.split("\\.");
			ipArr[1] = "😎";
			ip = String.join(".", ipArr);
			dto.setBip(ip);
		}
		return dto;
	}

	public void write(BoardDTO dto) {
		String title = dto.getBtitle();
		title = util.removeBrackets(title);
		dto.setBip(util.getIp());
		dto.setBtitle(title);
		boardDAO.write(dto);
	}

	public void delete(BoardDTO dto) {
		boardDAO.delete(dto);
	}

	public void edit(BoardDTO dto) {
		boardDAO.edit(dto);
	}
}
