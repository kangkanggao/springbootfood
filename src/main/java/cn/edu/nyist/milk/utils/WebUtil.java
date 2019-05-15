package cn.edu.nyist.milk.utils;
/**
 * gkk
 */


import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class WebUtil {
	public static final String rows = "5";

	public enum LoginFlag {
		LOGINED_USER_REALNAME,
		LOGINED_USER_ID,
		USER_MENUS,
		USER_AUTH_MENUS,
		USER_ROLE_LEVE, 
		USER_INFO
	}

	public enum DirType {
		orderFile,
		mobileRegion,
		taskFile,
		notice,
		help
	}

	public enum RoleLevel {
		SUPER_ADMIN( "SUPER_ADMIN", 1 ),
		ENTERPRISE_ADMIN( "ENTERPRISE_ADMIN", 2 ),
		ORG_ADMIN( "ORG_ADMIN", 3 ),
		ap_ADMIN( "ap_ADMIN", 4 );

		private String levelName;
		private int leve;

		RoleLevel( String levelName, int leve ) {
			this.levelName = levelName;
			this.leve = leve;
		}

		public String getLevelName( ) {
			return levelName;
		}

		public void setLevelName( String levelName ) {
			this.levelName = levelName;
		}

		public int getLeve( ) {
			return leve;
		}

		public void setLeve( int leve ) {
			this.leve = leve;
		}

		public static RoleLevel parse( int level ) {
			for( RoleLevel type : RoleLevel.values( ) ) {
				if( type.leve == level ) {
					return type;
				}
			}
			return null;
		}

	}

	public static Timestamp[] parseDateScope( String[] timePrefix, String[] timeSufix, long[] timeAddSeconds, SimpleDateFormat sdf )
			throws ParseException {
		Timestamp[] timestamps = new Timestamp[timePrefix.length];
		for( int i = 0; i < timePrefix.length; i++ ) {
			String s0 = timePrefix[i];
			if( s0 != null && !s0.trim( ).isEmpty( ) ) {
				if( timeSufix != null && timeSufix.length > i ) {
					String s1 = timeSufix[i];
					if( s1 != null && !s1.trim( ).isEmpty( ) ) {
						s0 = s0 + s1;
					}
				}
				long time = sdf.parse( s0 ).getTime( );
				if( timeAddSeconds != null && timeAddSeconds.length > i ) {
					time += timeAddSeconds[i] * 1000;
				}
				timestamps[i] = new Timestamp( time );
			}
		}
		return timestamps;
	}

	public static void addCookie( HttpServletResponse response, String key, String value, Integer expiry ) throws UnsupportedEncodingException {
		Cookie cookie = new Cookie( key, URLEncoder.encode( value, "UTF-8" ) );
		cookie.setHttpOnly( true );
		if( expiry != null ) {
			cookie.setMaxAge( expiry );
		}
		response.addCookie( cookie );
	}

	public static List<Cookie> getCookies( HttpServletRequest request, String key ) throws UnsupportedEncodingException {
		List<Cookie> list = new LinkedList<>( );
		Cookie[] cookies = request.getCookies( );
		if( cookies != null ) {
			for( Cookie c : cookies ) {
				if( c != null && c.getName( ).equals( key ) ) {
					c.setValue( URLDecoder.decode( c.getValue( ), "UTF-8" ) );
					list.add( c );
				}
			}
		}
		return list;
	}

	public static String formatURL( HttpServletRequest request, String suffixURL ) {
		return formatURL( request.getContextPath( ), suffixURL );
	}

	public static String formatURL( String prifixURL, String suffixURL ) {
		prifixURL = prifixURL.trim( );
		suffixURL = suffixURL.trim( );
		if( suffixURL.length( ) > 0 ) {
			prifixURL = ( prifixURL.endsWith( "/" ) ? prifixURL : prifixURL + "/" );
			suffixURL = ( suffixURL.startsWith( "/" ) ? suffixURL.substring( 1 ) : suffixURL );
			return prifixURL + suffixURL;
		}
		return prifixURL;
	}




	private static String getURI( String url ) {
		return URI.create( url ).getPath( );
	}

	


	public static boolean auth( String url, Map<Integer, Set<String>> map ) {
		String key = getURI( url );
		Set<String> set = map.get( key.length( ) );
		if( set != null ) {
			for( String s : set ) {
				if( url.startsWith( s ) ) {
					return true;
				}
			}
		}
		return false;
	}

	public static boolean isPost( HttpServletRequest request ) {
		return request.getMethod( ).equalsIgnoreCase( "POST" );
	}

	public static String getRequestPath( HttpServletRequest request ) {
		String query = request.getQueryString( );
		String url = request.getRequestURI( );
		if( query != null && ( query = query.trim( ) ).length( ) > 0 ) {
			url += "?" + query;
		}
		return url;
	}

	

	public static BeanPropertyBindingResult invokeValidator( Validator validator, Object target ) {
		if( !validator.supports( target.getClass( ) ) ) {
			throw new RuntimeException( "非有效的validator" );
		}
		BeanPropertyBindingResult errors = new BeanPropertyBindingResult( target, target.getClass( ).getSimpleName( ) );
		ValidationUtils.invokeValidator( validator, target, errors );
		return errors;
	}

	public static void parameters( HttpServletRequest request ) {
		Enumeration<String> parameterNames = request.getParameterNames( );
		while( parameterNames.hasMoreElements( ) ) {
			String name = parameterNames.nextElement( );
			request.setAttribute( name, request.getParameter( name ) );
		}
	}

	
	public static Map<String, String> getParam( HttpServletRequest request ) {
		Map<String, String> param = new HashMap<>( );
		Enumeration<String> parameterNames = request.getParameterNames( );
		while( parameterNames.hasMoreElements( ) ) {
			String name = parameterNames.nextElement( );
			param.put( name, request.getParameter( name ) );
		}
		return param;
	}

	public static String encryptUserPwd( String userName, String userPwd ) {
		return DigestUtils.sha256Hex( userName + userPwd);
	}



	public static String getRemoteHost( HttpServletRequest request ) {
		String ip = request.getHeader( "x-forwarded-for" );
		if( ip == null || ip.length( ) == 0 || "unknown".equalsIgnoreCase( ip ) ) {
			ip = request.getHeader( "Proxy-Client-IP" );
		}
		if( ip == null || ip.length( ) == 0 || "unknown".equalsIgnoreCase( ip ) ) {
			ip = request.getHeader( "WL-Proxy-Client-IP" );
		}
		if( ip == null || ip.length( ) == 0 || "unknown".equalsIgnoreCase( ip ) ) {
			ip = request.getRemoteAddr( );
		}
		return ip.equals( "0:0:0:0:0:0:0:1" ) ? "127.0.0.1" : ip;
	}

	/**
	 * @param request
	 * @return
	 * @throws Exception String
	 * @Title: getBrowser
	 * @Description: 获取发起请求的浏览器类型
	 * @Date : 
	 */
	public static String getBrowser( HttpServletRequest request ) {
		String userAgent = request.getHeader( "User-Agent" );
		String value = "Others";
		if( null != userAgent ) {
			if( userAgent.toLowerCase( ).indexOf( "firefox" ) > 0 ) {
				value = "firefox";// firefox浏览器
			} else if( userAgent.toUpperCase( ).indexOf( "MSIE" ) > 0 ) {
				value = "IE";// IE浏览器
				if( userAgent.toUpperCase( ).indexOf( "MSIE 10" ) > 0 ) {
					value = value + " 10";
				} else if( userAgent.toUpperCase( ).indexOf( "MSIE 9" ) > 0 ) {
					value = value + " 9";
				} else if( userAgent.toUpperCase( ).indexOf( "MSIE 8" ) > 0 ) {
					value = value + " 8";
				}
			} else if( userAgent.toLowerCase( ).indexOf( "applewebkit" ) != -1 ) {
				value = "Chrome"; // chrome 只能使用MimeUtility编码或ISO编码的中文输出
			} else if( userAgent.toLowerCase( ).indexOf( "gecko" ) > 0 && userAgent.toLowerCase( ).indexOf( "rv:11" ) > 0 ) {
				value = "IE 11"; // ie 11
			} else if( userAgent.toLowerCase( ).indexOf( "safari" ) > 0 ) {
				value = "safari"; // safari
			} else if( userAgent.toLowerCase( ).indexOf( "opera" ) > 0 ) {
				value = "opera"; // opera
			} else if( userAgent.toLowerCase( ).indexOf( "webkit" ) > 0 ) {
				value = "webkit"; // webkit
			}
		}
		return value;
	}
public static void main(String[] args) {
	String encryptUserPwd = encryptUserPwd("gkk", "123");
	System.out.println(encryptUserPwd);
}
	
}
