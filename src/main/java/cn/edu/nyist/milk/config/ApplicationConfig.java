package cn.edu.nyist.milk.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import cn.edu.nyist.milk.back.interceptor.BackInterceptor;
import cn.edu.nyist.milk.front.interceptor.FrontInterceptor;

@Configuration
public class ApplicationConfig extends WebMvcConfigurerAdapter{


	//图片资源位置注册，配置此处，使得页面能够取到图片资源，必须继承 org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter类
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/upload/**").addResourceLocations("/WEB-INF/upload/");

	}
	
	//配置前后端拦截器
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new BackInterceptor()).addPathPatterns("/back/**");
		registry.addInterceptor(new FrontInterceptor()).addPathPatterns("/front/**");
	}
}
