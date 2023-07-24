package com.malrang.pro1;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	// user → Controller → Service → DAO → mybatis → DB
	// Service 연결하기
	@Resource(name = "boardService")
	private BoardService boardService;
	@Autowired
	private Util util;

	@GetMapping("/board")
	public String board(Model model) {
		// Service에서 값 가져오기
		model.addAttribute("list", boardService.boardList());
		return "board";
	}

	@GetMapping("/detail")
	public String detail(HttpServletRequest request, Model model) {
		BoardDTO dto = new BoardDTO();
		dto.setBno(util.strTOInt(request.getParameter("bno")));
		BoardDTO result = boardService.detail(dto);
		model.addAttribute("dto", result);
		return "detail";
	}

	@GetMapping("/write")
	public String write(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("mname") != null) {
			return "write";			
		} else {
			return "redirect:/login";
		}
	}

	@PostMapping("/write")
	public String write2(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("mid") != null) {
			BoardDTO dto = new BoardDTO();
			dto.setBtitle(request.getParameter("title"));
			dto.setBcontent(request.getParameter("content"));
			dto.setM_id((String) session.getAttribute("mid"));
			dto.setM_name((String) session.getAttribute("mname"));

			// Service → DAO → mybatis → DB로 보내서 저장하기
			boardService.write(dto);

			return "redirect:board";
		} else {
			return "redirect:/login";
		}		
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam(value = "bno", required = false, defaultValue = "0") int bno) {
		System.out.println("bno : " + bno);
		BoardDTO dto = new BoardDTO();
		dto.setBno(bno);
		//dto.setBwrite(null);
		//추후 로그인을 하면 사용자의 정보도 담아서 보냅니다
		boardService.delete(dto);
		return "redirect:board";
	}
	
	@GetMapping("/edit")
	public ModelAndView edit(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("edit");
		BoardDTO dto = new BoardDTO();
		dto.setBno(util.strTOInt(request.getParameter("bno")));
		dto.setM_id((String) session.getAttribute("mid"));//내 글만 수정할 수 있도록 mid도 같이 보냄
		
		BoardDTO result = boardService.detail(dto);
		mv.addObject("dto", result);
		return mv;
	}
	
	@PostMapping("/edit")
	public String edit(BoardDTO dto) {
		boardService.edit(dto);
		return "redirect:detail?bno=" + dto.getBno();		
	}
}