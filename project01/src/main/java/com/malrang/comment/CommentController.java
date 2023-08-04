package com.malrang.comment;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@PostMapping("/comment")
	public String comment(@RequestParam Map<String, Object> map, HttpSession session) {
		//System.out.println(map);
		//로그인 여부 확인, 로그인 유저의 mid 값을 뽑아 map에 저장
		if(session.getAttribute("mid") != null) {
			map.put("mid", session.getAttribute("mid"));
			int result = commentService.commentInsert(map);
			if(result == 1) {
				return "redirect:/detail?bno=" + map.get("bno");
			} else {
				return "redirect:/warning";
			}			
		} else {
			return "redirect:/warning";
		}
		
	}
}
