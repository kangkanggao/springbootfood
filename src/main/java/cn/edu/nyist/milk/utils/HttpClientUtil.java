package cn.edu.nyist.milk.utils;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.util.EntityUtils;

public class HttpClientUtil {
	
	//public static boolean isTest=Boolean.parseBoolean(SysConfig.getInstance().getProperty("is_test"));

	@SuppressWarnings("unused")
	public static String postJson(String url, String body, String charset) {
		
		String result = null;
		
		if (true) {
			if (null == charset) {
				charset = "UTF-8";
			}
			CloseableHttpClient httpClient = null;
			HttpPost httpPost = null;
			try {
				httpClient = HttpConnectionManager.getInstance().getHttpClient();
				httpPost = new HttpPost(url);
				
				// 璁剧疆杩炴帴瓒呮椂,璁剧疆璇诲彇瓒呮椂
				RequestConfig requestConfig = RequestConfig.custom()
						.setConnectTimeout(10000)	
		                .setSocketTimeout(10000)	
		                .build();
				httpPost.setConfig(requestConfig);
				
				httpPost.setHeader("Accept", "application/json");
				httpPost.setHeader("Content-Type", "application/json;charset=utf-8");
				
				// 璁剧疆鍙傛暟
				StringEntity se = new StringEntity(body, "UTF-8");
				httpPost.setEntity(se);
				HttpResponse response = httpClient.execute(httpPost);
				if (response != null) {
					HttpEntity resEntity = response.getEntity();
					if (resEntity != null) {
						result = EntityUtils.toString(resEntity, charset);
					}
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} else {
			result = "config.properties中 is_test 属性值为false, 若已正确设置请求值，请设置为true后再次测试";
		}
		
		return result;
	}
}
