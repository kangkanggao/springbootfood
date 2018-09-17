package cn.edu.nyist.food.front.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nyist.food.front.service.BuyerService;

@Controller
@RequestMapping("/front")
public class LoginController {
	private BuyerService buyerService;
	/*
	 * 登录的controller
	 */
	
	@RequestMapping("/toLogin")
	public String toReg( ) {
		
		return "/front/login";
	}
	@RequestMapping("/login")
	public String reg(@RequestParam String name,@RequestParam String pwd,@RequestParam String vcode,HttpServletRequest request,HttpSession session) {
		/*
		 * 用户登录判断
		 *  2.验证码是否正确
		 */
		//服务器的验证码
		String serverVcode="";
		//验证码是否正确
		if(!vcode.equalsIgnoreCase(serverVcode)) {
			request.setAttribute("msg", "验证码不正确");
		}
		//登录验证
	    Buyer buyer=  buyerService.findBuyerByNameAndPwd(name,pwd);
	    if(buyer!=null)
	    {
	    	//登陆成功到主界面
	    	session.setAttribute("buyer",buyer );//登录成功，记录在session
	    	return "/front/main";
	    }else {
	    	request.setAttribute("msg","用户名或者密码错误");
	    	return "/front/login";
	    }
	}
	
}
