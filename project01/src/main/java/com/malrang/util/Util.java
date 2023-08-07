package com.malrang.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Component //객체
public class Util {
	//문자열이 들어오면 숫자로 변경하기
	public int strTOInt(String str) {
		//숫자로 바꿀 수 있는 경우에만 숫자로
		int result = 0;
		try {
			result = Integer.parseInt(str);
		} catch (Exception e) {
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < str.length(); i++) {
				if (Character.isDigit(str.charAt(i))) {
					sb.append(str.charAt(i));
				}
			}
			result = Integer.parseInt(sb.toString());
		}
		return result;
	}
	public String removeBrackets(String str) {
		return str.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
	}
	public String getIp() {
		// 상대방 ip 가져오기
		HttpServletRequest request = ((ServletRequestAttributes)
									RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = null;
		ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-RealIP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("REMOTE_ADDR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	
	//숫자인지 확인
	public boolean isNum(Object obj) {
		try {
			Integer.parseInt((String.valueOf(obj)));
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
