package cn.edu.nyist.milk.front.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nyist.milk.common.ValidateController;
import cn.edu.nyist.milk.dto.ProductInfoType;
import cn.edu.nyist.milk.front.service.BuyerInfoService;
import cn.edu.nyist.milk.front.service.ProductInfoService;
import cn.edu.nyist.milk.front.service.ProductTypeService;
import cn.edu.nyist.milk.model.BuyerInfo;
import cn.edu.nyist.milk.model.ProductInfo;
import cn.edu.nyist.milk.model.ProductType;
import cn.edu.nyist.milk.utils.WebUtil;

@Controller
@RequestMapping("/front")
public class LoginController {
	
	@Autowired
	private BuyerInfoService buyerInfoService;
	@Autowired
	private ProductTypeService productTypeSrevice;
	@Autowired
	private ProductInfoService productInfoService;
	/*
	 * 登录的controller
	 */
	@RequestMapping("/toReg")
	public String toReg( ) {
		
		return "/front/register";
	}
	@RequestMapping("/toLogin")
	public String toLogin( ) {
		
		return "/front/login";
	}
	
	@RequestMapping("/login")
	public String reg(@RequestParam String name,@RequestParam String pwd,@RequestParam String vcode,HttpServletRequest request,HttpSession session) {
		/*zhang
		 * 用户登录判断
		 *  2.验证码是否正确
		 */
		//服务器的验证码
		String serverVcode=(String) session.getAttribute(ValidateController.SERVER_VCODE);
		System.out.println(serverVcode);
		//验证码是否正确
		System.out.println(vcode);
		if(!vcode.equalsIgnoreCase(serverVcode)) {
			request.setAttribute("msg", "验证码不正确");
			request.setAttribute("name", name);
			return "/front/login";
		}
		//System.out.println("++++++++++++++++++++++++");
		//登录验证
		String password=WebUtil.encryptUserPwd(name, pwd);
	    BuyerInfo buyer=buyerInfoService.find(name,password);
	    System.out.println(buyer);
	    if(buyer!=null)
	    {
	    	//登陆成功到主界面
	    	session.setAttribute("buyer",buyer);//登录成功，记录在session
	    	session.setAttribute("carts", new ArrayList<>());
	    	List<ProductType> productTypes = productTypeSrevice.findProductTypes();
	        List<ProductInfoType>ls=new ArrayList<>();
	    	for (ProductType productType : productTypes) {
				Integer id = productType.getId();
				String typeName=productType.getTypeName();
				//Page<ProductInfo> findAllProductInfos = productInfoService.findAllProductInfos(1,"", id, "", -1);
				List<ProductInfo> findAllProductInfos=productInfoService.findProductInfosByType(id);
				ProductInfoType infoType=new ProductInfoType();
				infoType.setId(id);
				infoType.setTypeName(typeName);
				infoType.setSize(findAllProductInfos.size());
				infoType.setProductInfos(findAllProductInfos);
				ls.add(infoType);
				
			}
	    	session.setAttribute("productInfoTypes", ls);
	    	return "redirect:/front/toMain";
	    }else {
	    	request.setAttribute("msg","用户名或者密码错误");
	    	request.setAttribute("name", name);
	    	return "/front/login";
	    }
	}
	@RequestMapping("/exit")
	public String exit(@RequestParam String name,HttpServletRequest request,HttpSession session) {
		
		session.removeAttribute(name);
		return "redirect:/front/toLogin";
	}
	
	
}
