package com.malrang.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	@Autowired
	private Util util;
	
	@GetMapping(value = {"/", "index"})
	public String index() {
		System.out.println(util.getIp());
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
