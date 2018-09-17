package cn.edu.nyist.food.front.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nyist.food.model.BuyerInfo;
import cn.edu.nyist.food.service.BuyerInfoService;

@Controller
@RequestMapping("/front")
public class LoginController {
	@Autowired 
	private BuyerInfoService buyerInfoService;
	/*
	 * 登录的controller
	 */

	@RequestMapping("/toLogin")
	public String toReg() {

		return "/front/login";
	}

	@RequestMapping("/login")
	public String reg(Model model, @RequestParam String name, @RequestParam String pwd, @RequestParam String vcode,
			HttpServletRequest request, HttpSession session) {
		/*
		 * zhang 用户登录判断 2.验证码是否正确
		 */
		String buyerName = name;
		String buyerPwd = pwd;
		// 服务器的验证码
		String serverVcode = "";
		// 验证码是否正确
		if (!vcode.equalsIgnoreCase(serverVcode)) {
			model.addAttribute("msg", "验证码不正确");
		}
		// 登录验证
		BuyerInfo buyer = buyerInfoService.find(buyerName, buyerPwd);
		if (buyer != null) {
			// 登陆成功到主界面
			session.setAttribute("buyer", buyer);// 登录成功，记录在session
			return "/front/main";
		} else {
			model.addAttribute("msg", "用户名或者密码错误");
			return "/front/login";
		}
	}

}
