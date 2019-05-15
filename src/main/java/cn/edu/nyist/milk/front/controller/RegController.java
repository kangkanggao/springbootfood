package cn.edu.nyist.milk.front.controller;

import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.http.client.ClientProtocolException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.nyist.milk.client.AbsRestClient;
import cn.edu.nyist.milk.client.JsonReqClient;
import cn.edu.nyist.milk.common.ValidateController;
import cn.edu.nyist.milk.front.service.BuyerInfoService;
import cn.edu.nyist.milk.model.BuyerInfo;
import cn.edu.nyist.milk.utils.Config;
import cn.edu.nyist.milk.utils.KeyUtil;
import cn.edu.nyist.milk.utils.ParseConfigXmlUtil;
import cn.edu.nyist.milk.utils.WebUtil;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/front")
public class RegController {
	private static Logger logger=LoggerFactory.getLogger(RegController.class);
	static AbsRestClient InstantiationRestAPI() {
		return new JsonReqClient();
	}
	private static Config config=ParseConfigXmlUtil.load("./conf/config.xml");
	private final static String SID=config.getProperty("sid");
	private final static String TOKEN=config.getProperty("token");
	private final static String APP_ID=config.getProperty("appid");
	private final static String TEMPLATE_ID=config.getProperty("templateid");
	//private final static String UID="";
	/*
	 * 由于注册和登录在一个界面，不用这儿转去注册界面
	 */
	@Autowired
	private BuyerInfoService buyerInfoService;
    
	
	
	@RequestMapping("/reg")
	public String reg(@RequestParam String name,  @RequestParam String yzm,
			@RequestParam String secondpwd, @RequestParam String pwd, 
			@RequestParam String vcode,@RequestParam String phonenumber,
			HttpServletRequest request, HttpSession session) {
		/*
		 * 用户注册判断 1.二次密码是否相同 2.验证码是否正确 3.用户名是否被注册
		 */
		// 服务器的验证
		// 判断二次密码是否相同
		if (!pwd.equals(secondpwd)) {
			request.setAttribute("regmsg", "两次输入的密码不符");
			request.setAttribute("name", name);
			return "/front/register";
		}
		// 判断手机号验证码是否与填写的一致

		String phoneSMS = (String) session.getAttribute("phoneSMS");
		logger.info("前端传过来的手机验证码为:{},后端生成的手机验证码为:{}",yzm,phoneSMS);
		if (StringUtils.isBlank(phoneSMS)||!phoneSMS.equals(yzm)) {
			request.setAttribute("phonemsg", "手机验证码不正确");
			return "/front/register";
		}
		//
		String serverVcode = (String) request.getSession().getAttribute(ValidateController.SERVER_VCODE);
		
		// 验证码是否正确
		if (!vcode.equalsIgnoreCase(serverVcode)) {
			request.setAttribute("phonemsg", "验证码不正确");
			request.setAttribute("name", name);
			return "/front/register";
		}
		// 用户名是否被注册
		BuyerInfo buyer = buyerInfoService.findBuyerByName(name);
		if (buyer == null) {
			BuyerInfo buyerInfo = new BuyerInfo();
			buyerInfo.setBuyerName(name);
			//在这里用sha256Hex进行非对称加密
			String password=WebUtil.encryptUserPwd(name, pwd);
			buyerInfo.setBuyerPwd(password);
			buyerInfo.setBuyerPhone(phonenumber);
			BuyerInfo buyerInfo2 = buyerInfoService.saveBuyer(buyerInfo);
			if (buyerInfo2 != null) {

				request.setAttribute("regmsg", "注册成功");
				return "/front/login";
			} else {
				request.setAttribute("regmsg", "注册失败");
				request.setAttribute("name", name);
			}

		} else {
			request.setAttribute("msg", "用户名已存在");
			request.setAttribute("name", name);
		}
		return "/front/login";
	}

	@RequestMapping("/sendSMS")
	@ResponseBody
	public void sendSMS(@RequestParam String phone, final HttpSession session) throws ClientProtocolException, IOException {
		//随机生成一个验证码
		String phoneSMS = KeyUtil.getVerificationCode();
		String result = testSendSms(SID, TOKEN, APP_ID, TEMPLATE_ID, phoneSMS, phone, "");
		if(StringUtils.isNotBlank(result)) {
			result.substring(result.indexOf("{"),result.length());
			JSONObject data = JSONObject.fromObject(result); 
			String code= (String) data.get("code");
			if("000000".equals(code)) {
				logger.info("发送验证码成功!");
				// 把云之讯发过来的手机验证码存入session
				session.setAttribute("phoneSMS", phoneSMS);
			}else {
				logger.error("发送验证码失败!------>{}",result);
			}
		}else {
			logger.error("短信发送验证码异常!!!");
		}
		//String phoneSMS = SendMessageUtil.SendCode(phone);
		// System.out.println("-----------||----------"+phoneSMS);
		// 设置手机验证码有效时间
		try {
			// TimerTask实现3分钟后从session中删除phoneSMS
			final Timer timer = new Timer();
			timer.schedule(new TimerTask() {
				@Override
				public void run() {
					String code = (String) session.getAttribute("phoneSMS");
					if (code != null) {
						// 确保清除不出错
						session.removeAttribute("phoneSMS");
					}
					timer.cancel();
				}
			}, 3 * 60 * 1000);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static String testSendSms(String sid, String token, String appid, String templateid, String param, String mobile, String uid){
		try {
			String result=InstantiationRestAPI().sendSms(sid, token, appid, templateid, param, mobile, uid);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
