package com.malrang.board;

import java.util.List;
import java.util.Map;
import java.util.UUID;

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

import com.malrang.util.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BoardController {
	// user → Controller → Service → DAO → mybatis → DB
	// Service 연결하기
	@Resource(name = "boardService")
	private BoardService boardService;
	@Autowired
	private Util util;

	@GetMapping("/board")
	public String board(@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo, Model model) {
		// Service에서 값 가져오기
		//페이지네이션인포 → 값 넣기 → DB → jsp
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo); //현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); //한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); //페이징 리스트의 사이즈
		//전체 글 수 가져오는 명령문장
		int totalCount = boardService.totalCount();
		paginationInfo.setTotalRecordCount(totalCount); //전체 게시물 건 수
		
		int firstRecordIndex = paginationInfo.getFirstRecordIndex(); //시작 위치
		int recordCountPerPage = paginationInfo.getRecordCountPerPage(); //페이지에 게시되는 게시물 건수(10)
		
		//System.out.println(firstRecordIndex);
		//System.out.println(recordCountPerPage);
		//System.out.println(pageNo);
		//System.out.println(totalCount);
		
		PageDTO page = new PageDTO();
		page.setFirstRecordIndex(firstRecordIndex);
		page.setRecordCountPerPage(recordCountPerPage);
 
		model.addAttribute("list", boardService.boardList(page));
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println(util.getIp());
		return "board";
	}

	@GetMapping("/detail")
	public String detail(HttpServletRequest request, Model model) {
		BoardDTO dto = new BoardDTO();
		dto.setBno(util.strTOInt(request.getParameter("bno")));
		BoardDTO result = boardService.detail(dto);
		if(result.getCommentcount() > 0) {
			List<Map<Integer, String>> commentsList = boardService.commentsList(dto.getBno());
			model.addAttribute("commentsList", commentsList);
		}
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
			dto.setUuid(UUID.randomUUID().toString());
			System.out.println(dto.getUuid());
			System.out.println(dto.getUuid().length());

			// Service → DAO → mybatis → DB로 보내서 저장하기
			boardService.write(dto);

			return "redirect:board";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam(value = "bno", required = false, defaultValue = "0") int bno, HttpSession session) {
		System.out.println("삭제 bno : " + bno);
		//로그인 여부 확인
		//System.out.println(session.getAttribute("mid"));
		if (session.getAttribute("mid") != null) {
			BoardDTO dto = new BoardDTO();
			dto.setBno(bno);
			dto.setM_id((String) session.getAttribute("mid"));//본인 아이디만 삭제
			boardService.delete(dto);
			return "redirect:board";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/edit")
	public ModelAndView edit(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("mid") != null) {
			BoardDTO dto = new BoardDTO();
			dto.setBno(util.strTOInt(request.getParameter("bno")));
			dto.setM_id((String) session.getAttribute("mid"));//내 글만 수정할 수 있도록 mid도 같이 보냄
			
			BoardDTO result = boardService.detail(dto);
			
			if (result != null) { //내 글만 수정하기
				mv.addObject("dto", result);
				mv.setViewName("edit");				
			} else { //다른 사람 글이라면 경고창으로 이동
				mv.setViewName("warning");
			}
		} else {
			mv.setViewName("redirect:/login");
		}
		return mv;
	}
	
	@PostMapping("/edit")
	public String edit(BoardDTO dto) {
		boardService.edit(dto);
		return "redirect:detail?bno=" + dto.getBno();		
	}
	
}