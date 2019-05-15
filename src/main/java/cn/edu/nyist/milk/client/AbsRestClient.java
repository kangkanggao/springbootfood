/**
 * gkk
 */
package cn.edu.nyist.milk.client;

import cn.edu.nyist.milk.utils.Config;
import cn.edu.nyist.milk.utils.ParseConfigXmlUtil;

public abstract class AbsRestClient {
	private static Config config=ParseConfigXmlUtil.load("./conf/config.xml");
	private static final String server=config.getProperty("rest_server");
			//SysConfig.getInstance().getProperty("rest_server");
	
	
	/**
	 * 
	 * @param sid
	 * @param token
	 * @param appid
	 * @param templateid
	 * @param param
	 * @param mobile
	 * @param uid
	 * @return
	 */
	public abstract String sendSms(String sid, String token, String appid, String templateid, String param, String mobile, String uid);
	
	/**
	 * 
	 * @param sid
	 * @param token
	 * @param appid
	 * @param templateid
	 * @param param
	 * @param mobile
	 * @param uid
	 * @return
	 */
	public abstract String sendSmsBatch(String sid, String token, String appid, String templateid, String param, String mobile, String uid);
	
	/**
	 * 
	 * @param sid
	 * @param token
	 * @param appid
	 * @param type
	 * @param template_name
	 * @param autograph
	 * @param content
	 * @return
	 */
	public abstract String addSmsTemplate(String sid, String token, String appid, String type, String template_name, String autograph, String content);
	 
	/**
	 * 
	 * @param sid
	 * @param token
	 * @param appid
	 * @param templateid
	 * @param page_num
	 * @param page_size
	 * @return
	 */
	public abstract String getSmsTemplate(String sid, String token, String appid, String templateid, String page_num, String page_size);
	
	/**
	 * 
	 * @param sid
	 * @param token
	 * @param appid
	 * @param templateid
	 * @param type
	 * @param template_name
	 * @param autograph
	 * @param content
	 * @return
	 */
	public abstract String editSmsTemplate(String sid, String token, String appid, String templateid, String type, String template_name, String autograph, String content);
	
	/**
	 * 
	 * @param sid
	 * @param token
	 * @param appid
	 * @param templateid
	 * @return
	 */
	public abstract String deleterSmsTemplate(String sid, String token, String appid, String templateid);
	
	
	public StringBuffer getStringBuffer() {
		StringBuffer sb = new StringBuffer("https://");
		sb.append(server).append("/ol/sms");
		return sb;
	}
}