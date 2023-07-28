package com.malrang.board;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.malrang.util.Util;

@Service("boardService")
public class BoardService {
	@Inject
	@Named("boardDAO")
	private BoardDAO boardDAO;
	@Autowired
	Util util;
	
	//board 리스트 불러오는 메소드
	public List<BoardDTO> boardList(PageDTO page) {
		return boardDAO.boardList(page);
	}
	
	public BoardDTO detail(BoardDTO dto) {
		//좋아요 수 +1 기능
		boardDAO.likeUp(dto);
		BoardDTO result = boardDAO.detail(dto);
		//System.out.println(dto);
		//System.out.println(dto.getBno());
		//System.out.println(dto.getBip());
		if (dto != null) { //내 글이 아닐 때 null
			//ip 중간에 하트 넣어주기 172.30.1.19 -> 172.♡.1.19
			if (result.getBip() != null && result.getBip().indexOf(".") != -1) {
				String ip = result.getBip();
				String[] ipArr = ip.split("\\.");
				ipArr[1] = "😎";
				ip = String.join(".", ipArr);
				result.setBip(ip);
			}
		}
		return result;
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

	public int totalCount() {
		return boardDAO.totalCount();
	}

	/*public String reply(BoardDTO dto) {
		return boardDAO.reply(dto);
	}*/
}
