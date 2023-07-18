package com.malrang.pro1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	@GetMapping(value = {"/", "index"})
	public String index() {
		return "index";
	}
	
	@GetMapping("/board2")
	public String board2() {
		return "board2";
	}
	
	@GetMapping("/mooni")
	public String mooni() {
		return "mooni";
	}
	
	@GetMapping("/notice")
	public String notice() {
		return "notice";
	}
}
