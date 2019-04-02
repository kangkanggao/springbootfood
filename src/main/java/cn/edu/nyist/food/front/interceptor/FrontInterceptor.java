package cn.edu.nyist.food.front.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class FrontInterceptor implements HandlerInterceptor{
private static Logger logger=LogManager.getLogger(FrontInterceptor.class);
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		
		
	}

	//配置前端拦截器
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		String requestURI=request.getRequestURI();
		if(requestURI.contains("/front")) {
			if (request.getSession().getAttribute("buyer") == null) {
				if (requestURI.endsWith("/toLogin") || requestURI.endsWith("/login") || requestURI.endsWith("/vcode.png")) {
					return true;
				}
				// 如果没有登录，请求其他，我们将先转到登录界面
				logger.info("執行前端攔截器...");
				response.sendRedirect(request.getContextPath()+"/front/toLogin");
				return false;
			}
		}
		
		return true;
	}
	
	
}
