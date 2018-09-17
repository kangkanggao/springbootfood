package cn.edu.nyist.food.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/front")
public class LoginController {
	
	/*
	 * 登录的controller
	 */
	
	@RequestMapping("/toLogin")
	public String toReg() {
		return "/front/login";
	}
	
}
