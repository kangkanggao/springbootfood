package cn.edu.nyist.milk.back.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nyist.milk.back.service.SellerService;
import cn.edu.nyist.milk.common.ValidateController;
import cn.edu.nyist.milk.model.SellerInfo;

@Controller(value = "backLoginContrller")
@RequestMapping("/back")
public class LoginController {

	@Autowired
	private SellerService sellerservice;
	/*
	 * 登录的controller
	 */

	@RequestMapping("/toLogin")
	public String toLogin() {

		return "/back/login";
	}

	@RequestMapping("/login")
	public String reg(@RequestParam String username, @RequestParam String password, @RequestParam String vcode,
			HttpServletRequest request, HttpSession session) {

		String serverVcode = (String) session.getAttribute(ValidateController.SERVER_VCODE);
		System.out.println(serverVcode);
		// 验证码是否正确
		System.out.println(vcode);
		if (!vcode.equalsIgnoreCase(serverVcode)) {
			request.setAttribute("msg", "验证码不正确");
			request.setAttribute("name", username);
			return "/back/login";
		}

		// 登录验证
		SellerInfo seller = sellerservice.findSellerInfo(username, password);
		if (seller != null) {
			// 登陆成功到主界面
			System.out.println(seller.getUsername()+"-----------------------");
			session.setAttribute("seller", seller);// 登录成功，记录在session
			
			return "redirect:/back/index";
		} else {
			request.setAttribute("msg", "用户名或者密码错误");
			request.setAttribute("name", username);
			return "/back/login";
		}
	}
	@RequestMapping("/toWelcome")
	public String toWelcome() {
		return "/back/welcome";
	}
	@RequestMapping("/index")
	public String toIndex() {
		return "/back/index";
	}
	@RequestMapping("/toChat")
	public String toChat() {
		return "/back/chat";
	}
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.removeAttribute("seller");
		return "redirect:/back/toLogin";
	}
}
