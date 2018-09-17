package cn.edu.nyist.food.front.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nyist.food.front.buyerservice.buyerService;

@Controller
@RequestMapping("/front")
public class RegController {
	/*
	 * 由于注册和登录在一个界面，不用这儿转去注册界面
	 */
	private BuyerService buyerService;
	/*
	 * 登录的controller
	 */

	@RequestMapping("/reg")
	public String reg(@RequestParam String name, @RequestParam String secondpwd, @RequestParam String pwd,
			@RequestParam String vcode, HttpServletRequest request) {
		/*
		 * 用户注册判断 1.二次密码是否相同 2.验证码是否正确 3.用户名是否被注册
		 */
		// 服务器的验证码
		String serverVcode = "";
		// 判断二次密码是否相同
		if (!pwd.equals(secondpwd)) {
			request.setAttribute("msg", "请输入相同密码");
		}
		// 验证码是否正确
		if (!vcode.equalsIgnoreCase(serverVcode)) {
			request.setAttribute("msg", "验证码不正确");
		}
		// 用户名是否被注册
		Buyer buyer = buyerService.findBuyerByName(name);
		if (buyer != null) {
			buyerService.saveBuyer();
			request.setAttribute("msg", "注册成功");
		} else {
			request.setAttribute("msg", "用户名已存在");
		}
		return "/front/login";
	}
}
