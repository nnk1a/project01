package com.malrang.pro1;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	
	@GetMapping("/write")
	public String write() {
		return "write";
	}
	
	@PostMapping("/write")
	public String write(HttpServletRequest request) {
		//사용자가 입력한 데이터 변수에 담기
		BoardDTO dto = new BoardDTO();
		dto.setBtitle(request.getParameter("title"));
		dto.setBcontent(request.getParameter("content"));
		dto.setBwrite("말랭");//임시로 작성
		
		//Service → DAO → mybatis → DB로 보내서 저장하기
		boardService.write(dto);
		
		return "redirect:board";
	}
}