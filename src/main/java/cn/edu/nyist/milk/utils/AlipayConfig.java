package cn.edu.nyist.milk.utils;

public class AlipayConfig {
	private static Config config=ParseConfigXmlUtil.load("./conf/config.xml");
  
	/**
	 * 沙箱测试start 需要手机安装沙箱支付寶
	 *  账号：rnehet2161@sandbox.com
	 *  支付密碼：111111
	 *  登陸密碼：111111
	 *  
	 */
    
	public static String APPID = config.getProperty("APPID");
	// 私钥 pkcs8格式的
	public static String RSA_PRIVATE_KEY =config.getProperty("RSA_PRIVATE_KEY");
	// 支付宝公钥
	public static String ALIPAY_PUBLIC_KEY =config.getProperty("ALIPAY_PUBLIC_KEY"); 
	// 服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = config.getProperty("notify_url");
	// 页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	// 商户可以自定义同步跳转地址
	public static String return_url = config.getProperty("return_url");
	// 请求网关地址test
	public static String URL = config.getProperty("URL");
	// 编码
	public static String CHARSET = config.getProperty("CHARSET");
	// 返回格式
	public static String FORMAT = config.getProperty("FORMAT");
	// 日志记录目录
	public static String log_path = config.getProperty("log_path");
	// RSA2
	public static String SIGNTYPE = config.getProperty("SIGNTYPE");
	/**
	 * 沙箱测试end
	 *
	 */

}
