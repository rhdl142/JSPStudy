package com.test.jsp;

import javax.servlet.http.Cookie;

public class MyCookie {
	public static String getCookie(Cookie[] list, String name) {
		
		for(Cookie cookie : list) {
			if(cookie.getName().equals(name)) {
				return cookie.getValue();
			}
		}
		
		return null;
	}
}
