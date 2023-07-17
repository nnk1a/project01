package com.malrang.pro1;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	//user → Controller → Service → DAO → mybatis → DB
	//Service 연결하기
	@Resource(name = "boardService")
	private BoardService boardService;
	@GetMapping("/board")
	public String board(Model model) {
		//Service에서 값 가져오기
		model.addAttribute("list", boardService.boardList());
		return "board";
	}
	
	@GetMapping("/detail")
	public String detail(HttpServletRequest request, Model model) {
		String bno = request.getParameter("bno");
		BoardDTO dto = boardService.detail(bno);
		model.addAttribute("dto", dto);
		return "detail";
	}
}