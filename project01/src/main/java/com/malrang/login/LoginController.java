package com.malrang.login;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.malrang.util.Util;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	@Autowired
	private Util util;
	
	@GetMapping("/login")
	public String login() {
//		System.out.println(util.getIp());
		return "login";
	}
	
	@PostMapping("/login")
	public String login(HttpServletRequest request) {
		//System.out.println(request.getParameter("ID"));
		//System.out.println(request.getParameter("PW"));
		LoginDTO dto = new LoginDTO();
		dto.setM_id(request.getParameter("ID"));
		dto.setM_pw(request.getParameter("PW"));
		//멤버 이름 + count(*) 받기
		dto = loginService.login(dto);
		
		//System.out.println(result.getM_name());
		//System.out.println(result.getCount());
		
		if (dto.getCount() == 1) {
			//세션을 만들어서 로그인을 지정 시간 동안 유지시킵니다.
			HttpSession session = request.getSession();
			session.setAttribute("mname", dto.getM_name());
			session.setAttribute("mid", request.getParameter("ID"));
			//세션 : 서버, 쿠키 : 클라이언트
			System.out.println(request.getParameter("ID"));
			System.out.println(request.getParameter("PW"));
			return "redirect:index";
		} else {
			System.out.println(util.getIp());
			System.out.println(request.getParameter("ID"));
			System.out.println(request.getParameter("PW"));
			return "login";	
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		if (session.getAttribute("mname") != null) {
			//session.invalidate(); //세션 삭제
			session.removeAttribute("mname");
		}
		if (session.getAttribute("mid") != null) {
			//session.invalidate(); //세션 삭제
			session.removeAttribute("id");
		}
		session.setMaxInactiveInterval(0);//세션 유지시간을 0으로 = 종료시키기
		session.invalidate();//세션 초기화 = 종료 = 세션의 모든 속성 값을 제거
		return "redirect:index";
	}
	
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	@PostMapping("/signup")
	public String signup(SignupDTO dto) {
		System.out.println("jsp에서 오는 값 : " + dto.getGender());
		System.out.println("jsp에서 오는 값 : " + dto.getBirth());
		int result = loginService.signup(dto);
		System.out.println(result);
		if (result == 1) {
			return "redirect:/login";
		} else {
			return "signup";			
		}
	}
	
	@GetMapping("/members")
	public ModelAndView members() {
		ModelAndView mv = new ModelAndView("members");
		List<SignupDTO> list = loginService.members();
		mv.addObject("list", list);
		return mv;		
	}	
}
