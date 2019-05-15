<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>

<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>主页</title>
<link rel="stylesheet" type="text/css"
	href="resources/lujian/css/style.css"/>
</head>

<body>
	<!-- start header -->
	<header>
		<div class="top center">
			<div class="left fl">
				<ul>
					<li><a href="<%=basePath %>front/toMain" target="_blank">6284游戏</a></li>
					<li>|</li>
					<li><a href="<%=basePath %>front/toMain">我的6284</a></li>
					<li>|</li>
					<li><a href="<%=basePath %>front/toMain">金钻兑换</a></li>
					<li>|</li>
					<li><a href="<%=basePath %>front/toMain">我的收藏</a></li>
					<li>|</li>
					<li><a href="<%=basePath %>front/toMain">客服中心</a></li>
					<li>|</li>
					<li><a href="<%=basePath %>front/toMain">网站导航</a></li>
					<li>|</li>
					<li><a href="<%=basePath %>front/toMain">官方微信</a></li>
					<li>|</li>
					<li><a href="<%=basePath%>front/shopingCart">我的购物车</a></li>
					<li>|</li>
					<li><a href="<%=basePath %>front/order">我的订单</a></li>
					<li>|</li>
					<li><a href="<%=basePath %>front/toMain">主页</a></li>
					<div class="clear"></div>
				</ul>
			</div>
			<div class="right fr">
				<div class="gouwuche fr">
					<a href="<%=basePath %>front/shopingCart">购物车</a>
				</div>
				<div class="fr">
					<ul>
						
						<li><a href="<%=basePath %>front/toMain">消息通知</a></li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
	</header>
	<!--end header -->

	<!-- start banner_x -->
	<div class="banner_x center">
		<a href="<%=basePath %>front/toMain" target="_blank"><div class="logo fl"></div></a>
		<a href="<%=basePath %>front/toMain"><div class="ad_top fl"></div></a>
		<div class="nav fl" style="width: 600px">
			<ul>
				<marquee scrolldelay="180">欢迎来到6284游戏网!</marquee>
			</ul>
		</div>
		<div class="search fr">
			<form action="front/productInfoList" method="post">
				<div class="text fl">
					<input type="text" class="shuru" name="productName"placeholder="武器装备">
				</div>
				<div class="submit fl">
					<input type="submit" class="sousuo" value="搜索" />
				</div>
				<div class="clear"></div>
			</form>
			<div class="clear"></div>
		</div>
	</div>
	<!-- end banner_x -->

	<!-- start banner_y -->
	<div class="banner_y center">
		<div class="nav">
			<ul>
				<c:forEach items="${productInfoTypes}" var="type" varStatus="index">

					<li><a href="front/productInfoList?productType=${type.id }">${type.typeName }</a>
						<div class="pop">
                        
                              <div class="left fl">
                               <c:forEach items="${type.productInfos}"
									var="productInfos" begin="0" end="3">
									
									<div>
									
										<div class="xuangou_left fl">
											<a href="<%=basePath %>front/toMain">
												<div class="img fl">
													<img width="120px" height="70px"
														src="upload/${productInfos.productPhoto }" alt="">
												</div> 
												<span class="fl">${productInfos.productName }</span>
												
												<div class="clear"></div>

											</a>
										</div>
										<span class="xuangou_right fr">
											<a
												href="front/shopingCart?productId=${productInfos.productId}">选购</a>
										</span>
										<div class="clear"></div>
								
									</div>


								</c:forEach>
                            
							</div>
							
							<!-- 中间 -->
							  <div class="ctn fl">
                               <c:forEach items="${type.productInfos}"
									var="productInfos" begin="4" end="7">
									
									<div>
									
										<div class="xuangou_left fl">
											<a href="<%=basePath %>front/toMain">
												<div class="img fl">
													<img width="120px" height="70px"
														src="upload/${productInfos.productPhoto }" alt="">
												</div> 
												<span class="fl">${productInfos.productName }</span>
												<div class="clear"></div>

											</a>
										</div>
										<div class="xuangou_right fr">
											<a
												href="front/shopingCart?productId=${productInfos.productId}">选购</a>
										</div>
										<div class="clear"></div>
								
									</div>


								</c:forEach>
                            
							</div>
							<!-- 右边 -->
							<!-- 中间 -->
							  <div class="right fl">
                               <c:forEach items="${type.productInfos}"
									var="productInfos" begin="8" end="11">
									
									<div>
									
										<div class="xuangou_left fl">
											<a href="<%=basePath %>front/toMain">
												<div class="img fl">
													<img width="120px" height="70px"
														src="upload/${productInfos.productPhoto }" alt="">
												</div> 
												<span class="fl">${productInfos.productName }</span>
												<div class="clear"></div>

											</a>
										</div>
										<div class="xuangou_right fr">
											<a
												href="front/shopingCart?productId=${productInfos.productId}">选购</a>
										</div>
										<div class="clear"></div>
								
									</div>


								</c:forEach>
                            
							</div>
							<div class="clear"></div>
						</div></li>

				</c:forEach>
			</ul>
		</div>

	</div>

	<div class="sub_banner center">
		<div class="sidebar fl">
			<div class="fl">
				<a ><img width="78px" height="85px" src="resources/lujian/image/111.jpg"></a>
			</div>
			<div class="fl">
				<a ><img width="78px" height="85px"src="resources/lujian/image/222.jpg"></a>
			</div>
			<div class="fl">
				<a ><img width="78px" height="85px"src="resources/lujian/image/333.png"></a>
			</div>
			<div class="fl">
				<a ><img width="78px" height="85px"src="resources/lujian/image/444.jpg"></a>
			</div>
			<div class="fl">
				<a ><img width="78px" height="85px"src="resources/lujian/image/555.jpg"></a>
			</div>
			<div class="fl">
				<a ><img width="78px" height="85px"src="resources/lujian/image/666.jpg"></a>
			</div>
			<div class="clear"></div>
		</div>
		<div class="datu fl">
			<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/jiyi.jpg" alt=""></a>
		</div>
		<div class="datu fl">
			<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/luoma.jpg" alt=""></a>
		</div>
		<div class="datu fr">
			<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/trbc.jpg"
				alt=""></a>
		</div>
		<div class="clear"></div>


	</div>
	<!-- end banner -->
	

	<!-- start danpin -->
	<div class="danpin center">

		<div class="biaoti center">武器装备</div>
		<div class="main center">
			<div class="mingxing fl">
				<div class="sub_mingxing">
					<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/001.bmp" alt=""></a>
				</div>
				<div class="pinpai">
					<a href="<%=basePath %>front/toMain">+4钢手无封</a>
				</div>
				<div class="youhui">本周售出20件</div>
				<div class="jiage">￥60-9000</div>
			</div>
			<div class="mingxing fl">
				<div class="sub_mingxing">
					<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/002.bmp" alt=""></a>
				</div>
				<div class="pinpai">
					<a href="<%=basePath %>front/toMain">+8祝福战斧</a>
				</div>
				<div class="youhui">本周售出10件</div>
				<div class="jiage">￥90-1500</div>
			</div>
			<div class="mingxing fl">
				<div class="sub_mingxing">
					<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/003.bmp" alt=""></a>
				</div>
				<div class="pinpai">
					<a href="<%=basePath %>front/toMain">祝福秘银重甲</a>
				</div>
				<div class="youhui">本周售出57件</div>
				<div class="jiage">￥90-16000</div>
			</div>
			<div class="mingxing fl">
				<div class="sub_mingxing">
					<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/004.bmp" alt=""></a>
				</div>
				<div class="pinpai">
					<a href="<%=basePath %>front/toMain">传说熟练大球</a>
				</div>
				<div class="youhui">本周售出20件</div>
				<div class="jiage">￥166-2600</div>
			</div>
			<div class="mingxing fl">
				<div class="sub_mingxing">
					<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/005.bmp" alt=""></a>
				</div>
				<div class="pinpai">
					<a href="<%=basePath %>front/toMain">8重盾</a>
				</div>
				<div class="youhui">本周售出233件</div>
				<div class="jiage">￥35-2390</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="peijian w">
		<div class="biaoti center">不服来战</div>
		<div class="main center">
			<div class="content">
				<div class="remen fl">
					<a href="<%=basePath %>front/toMain"><img width="230px"src="resources/lujian/image/peijian1.jpg"></a>
				</div>
				<div class="remen fl">
					<div class="xinpin">
						<span>6284网</span>
					</div>
					<div class="tu">
						<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/peijian2.jpg"></a>
					</div>
					<div class="miaoshu">
					
					</div>
					
					<div class="pingjia">213人评价</div>
					<div class="piao">
						<a href="<%=basePath %>front/toMain"> <span>6284游戏道具交易网</span> <span>欢迎您的到来!</span>
						</a>
					</div>
				</div>
				<div class="remen fl">
					<div class="xinpin">
						<span style="background: #fff"></span>
					</div>
					<div class="tu">
						<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/peijian3.jpg"></a>
					</div>
					<div class="miaoshu">
					
					</div>
					
					<div class="pingjia">372人评价</div>
				</div>
				<div class="remen fl">
					<div class="xinpin">
						<span style="background: red">6284网</span>
					</div>
					<div class="tu">
						<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/peijian4.jpg"></a>
					</div>
					<div class="miaoshu">
						
					</div>
					
					<div class="pingjia">372人评价</div>
					<div class="piao">
						<a href="<%=basePath %>front/toMain"> <span>6284游戏道具交易网</span> <span>欢迎您的到来!</span>
						</a>
					</div>
				</div>
				<div class="remen fl">
					<div class="xinpin">
						<span style="background: #fff"></span>
					</div>
					<div class="tu">
						<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/peijian5.jpg"></a>
					</div>
					<div class="miaoshu">
						
					</div>
				
					<div class="pingjia">372人评价</div>
					<div class="piao">
						<a href="<%=basePath %>front/toMain"> <span>6284游戏道具交易网</span> <span>欢迎您的到来!</span>
						</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="content">
				<div class="remen fl">
					<a href="<%=basePath %>front/toMain"><img width="230px" src="resources/lujian/image/peijian10.jpg"></a>
				</div>
				<div class="remen fl">
					<div class="xinpin">
						<span style="background: #fff"></span>
					</div>
					<div class="tu">
						<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/peijian7.jpg"></a>
					</div>
					<div class="miaoshu">
						
					</div>
					
					<div class="pingjia">372人评价</div>
					<div class="piao">
						<a href="<%=basePath %>front/toMain"> <span>6284游戏道具交易网</span> <span>欢迎您的到来!</span>
						</a>
					</div>
				</div>
				<div class="remen fl">
					<div class="xinpin">
						<span style="background: #fff"></span>
					</div>
					<div class="tu">
						<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/peijian8.jpg"></a>
					</div>
					
					<div class="pingjia">372人评价</div>
				</div>
				<div class="remen fl">
					<div class="xinpin">
						<span style="background: #fff"></span>
					</div>
					<div class="tu">
						<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/peijian9.jpg"></a>
					</div>
					
					
					<div class="pingjia">775人评价</div>
				</div>
				<div class="remenlast fr">
					<div class="hongmi">
						<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/lscsd.jpg"
							alt=""></a>
					</div>
					<div class="liulangengduo">
						<a href="<%=basePath %>front/toMain"><img src="resources/lujian/image/liulangengduo.png"
							alt=""></a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<footer class="mt20 center">
		<div class="mt20">
			lujian</div>
		<div>©6284.com 豫ICP证110501号 京ICP备100464222号 京公网安备11010802021234号
			京网文[2019]0001-0009号</div>
		<div>违法和不良信息举报电话：15093038468</div>
	</footer>
</body>
</html>