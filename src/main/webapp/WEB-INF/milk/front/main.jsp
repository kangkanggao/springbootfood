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
<title>同城天天订</title>
<link rel="stylesheet" href="resources/gkk/css/main.css" />

<link rel="stylesheet" href="resources/gkk/css/index.css" />
<script src='resources/gkk/js/jquery-1.12.4.min.js'></script>
<script src='resources/gkk/js/index.js'></script>
<script src='resources/gkk/js/jquery.lazyload.min.js'></script>
<script src='resources/gkk/js/jquery.cookie.js'></script>
</head>
<body>
	<!--header-->
	<div id="headerwrap">
		<div id="header">
			<b class="header-position"></b>
			<div class="header-city" >
				<span id="header-city">南阳</span>
				<div class="citylist">
					<div class="citylisttit">
						当前城市：<span id="dangqian">南阳</span>
					</div>
					<ul class="cityitem" id="city">
						<li class="city"><span>A</span><a href="javascript:;">郑州</a></li>
						<li class="city"><span>B</span><a href="javascript:;">开封</a></li>
						<li class="city"><span>C</span><a href="javascript:;">洛阳</a></li>
						<li class="city"><span>D</span><a href="javascript:;">平顶山</a></li>
						<li class="city"><span>E</span><a href="javascript:;">安阳</a></li>
						<li class="city"><span>F</span><a href="javascript:;">鹤壁</a></li>
						<li class="city"><span>G</span><a href="javascript:;">新乡</a></li>
						<li class="city"><span>H</span><a href="javascript:;">焦作</a></li>
						<li class="city"><span>J</span><a href="javascript:;">濮阳</a></li>
						<li class="city"><span>K</span><a href="javascript:;">许昌</a></li>

					</ul>
				</div>
			</div>
			<a class="header-switch" href="javascript:;">[切换区县]</a>
			<p class='header-welcome'>
				
				<a>欢迎您${sessionScope.buyer.buyerName }登录</a>
				<a href="<%=basePath %>front/exit?name=${sessionScope.buyer.buyerName}">退出登录</a>
			</p>
			<div class="header-myinfo">
				
			</div>
			<a class="header-myfav" href="front/order"><i></i>我的订单</a> <a
				class="header-shopcar" href="front/shopingCart"><i></i>购物车</a>
			<!-- <div class="header-collect" href="javascript:;">
				收藏夹<i></i>
				<div class="collectitem">
					<a href="javascript:;">收藏的宝贝</a> <a href="javascript:;">收藏的店铺</a>
				</div>
			</div> -->
			<div class="header-line">|</div>
			<!-- <div class="header-mobile" href="javascript:;">
				<span></span>手机版<i></i>
				<div href="javascript:;" class="app">
					<img src="resources/gkk/img/app.jpg" alt="">
				</div>
			</div> -->
			<div class="header-seller" >
				<a href="front/toChat">在线沟通</a>
			
			</div>
		<!-- 	<div class="header-nav" href="javascript:;">
				<i></i>网站导航<span></span>
				<div class="navmenu">
					<div class="menuleft">
						<h6 class="menulefttit">产品分类 Product</h6>
						<p class="menuleftlist">
							<a href="javascript:;">食品生鲜</a><a href="javascript:;">服装服饰</a><a
								href="javascript:;">个护化妆</a><a href="javascript:;">手机数码</a><a
								href="javascript:;">家用电器</a><a href="javascript:;">家纺家居</a><a
								href="javascript:;">酒类饮料</a><a href="javascript:;">母婴用品</a>
						</p>
					</div>
					<div class="menumid">
						<h6 class="menulefttit menumidtit">店铺街 Market</h6>
						<p class="menuleftlist menumidlist">
							<a href="javascript:;">精选</a><a href="javascript:;">女人</a><a
								href="javascript:;">男人</a><a href="javascript:;">家装</a><a
								href="javascript:;">母婴</a><a href="javascript:;">美妆</a><a
								href="javascript:;">美食</a><a href="javascript:;">数码</a>
						</p>
					</div>
					<div class="menuright">
						<h6 class="menulefttit menurighttit">店铺街 Market</h6>
						<p class="menuleftlist menurightlist">
							<a href="javascript:;">精选</a><a href="javascript:;">女人</a><a
								href="javascript:;">男人</a><a href="javascript:;">家装</a><a
								href="javascript:;">母婴</a>
						</p>
					</div>
				</div>
			</div> -->
		</div>
	</div>

	<!--遮罩层
	<div id="index-shadewrap">
		<div id="index-shade"></div>
		<div id="index-window">
			<div class="index-windowtit">请选择您的收货地区<i>X</i></div>
			<ul>
				<li><a href="javascript:;">郑州</a></li>
				<li><a href="javascript:;">开封</a></li>
				<li><a href="javascript:;">洛阳</a></li>
				<li><a href="javascript:;">平顶山</a></li>
				<li><a href="javascript:;">安阳</a></li>
				<li><a href="javascript:;">鹤壁</a></li>
				<li><a href="javascript:;">新乡</a></li>
				<li><a href="javascript:;">焦作</a></li>
				<li><a href="javascript:;">濮阳</a></li>
				<li><a href="javascript:;">许昌</a></li>
				
			</ul>
		</div>
	</div>
-->



	<!--top-->
	<div id="top">
		<h1 id='logo'>
			<a href="index.html"><img src="resources/gkk/img/logo_hd.jpg"
				alt="juhuimai" title='logo'></a>
		</h1>
		<form action="front/productInfoList" method="post" name='searchbox' class='top-search'>
			<div class="top-search-tabcontainer">
				<!-- <a href="html/searchresult.html"
					class="top-search-tab top-search-active">宝贝</a> -->
			</div>
			<div class="top-search-txtcontainer">
				<input class="top-search-txt" type="text" name="productName" placeholder="请输入关键字" /> 
				<input
					class="top-search-btn" type="submit" value="搜索" />
			</div>

		</form>
		<div class="top-link">
			<a class="top-link-a" href="javascript:;">七天包退</a> <a
				class="top-link-a" href="javascript:;">正品保障</a> <a
				class="top-link-a" href="javascript:;">闪电发货</a>
		</div>
	</div>

	<!--nav-->
	<div id="navcontainer">
		<div id="navwrap">
			<h2 class="nav-all">
				全部商品分类<i></i>
			</h2>
			<!-- <ul id="nav">
				<li><a href="javascript:;">首页</a></li>
				<li><a href="javascript:;">食品生鲜</a></li>
				<li><a href="javascript:;">店铺街</a></li>
				<li><a href="javascript:;">积分商城</a></li>
				<li><a href="javascript:;">优惠活动</a></li>
				<li><a href="javascript:;">智能扫货</a></li>
				<li><a href="javascript:;">文章资讯</a></li>
			</ul> -->
		</div>
	</div>

	<!--侧边栏-->
	<div id="index-fixed">
		
		
	</div>

	<!--banner-->
	<div id="bannerwrap">
		<ul id="banner">
			<li class="active"></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>

		<div id="banner-suspend">
			<!--banner的小方块控制-->
			<div class="banner-squarewrap">
				<div class="banner-square"></div>
				<div class="banner-squlist active" style='left: 590px;'>
					<a href="javascript:;"></a>
				</div>
				<div class="banner-squlist" style='left: 618px;'>
					<a href="javascript:;"></a>
				</div>
				<div class="banner-squlist" style='left: 646px;'>
					<a href="javascript:;"></a>
				</div>
				<div class="banner-squlist" style='left: 674px;'>
					<a href="javascript:;"></a>
				</div>
				<div class="banner-squlist" style='left: 702px;'>
					<a href="javascript:;"></a>
				</div>
				<div class="banner-squlist" style='left: 730px;'>
					<a href="javascript:;"></a>
				</div>
				<div class="banner-squlist" style='left: 758px;'>
					<a href="javascript:;"></a>
				</div>
			</div>
			<ul class="banner-list">
				<c:forEach items="${productInfoTypes}" var="type" varStatus="index">
					<li>
						<div class="bannerlistleftside"></div>
						<div class="changeopa">
							<span class="banner-listitem"><b></b>${type.typeName }<i></i></span>
							
						</div> 
						
							<div class="banner-listitem-menu">
								<ul class="left">
								 <li style='height: 12px;'>
								
								<c:forEach items="${type.productInfos}" var="productInfos" begin="0" end="4">
									<a href="front/shopingCart?productId=${productInfos.productId}">${productInfos.productName } </a>	
							    </c:forEach>
							    </li>
							    <li style='height: 12px;'>
								
								<c:forEach items="${type.productInfos}" var="productInfos" begin="5" end="9">
									<a href="front/shopingCart?productId=${productInfos.productId}">${productInfos.productName } </a>	
							    </c:forEach>
							    </li>
							    <li style='height: 12px;'>
								
								<c:forEach items="${type.productInfos}" var="productInfos" begin="10" end="14">
									<a href="front/shopingCart?productId=${productInfos.productId}">${productInfos.productName } </a>	
							    </c:forEach>
							    </li>
								</ul>

							</div>
						
					</li>
				</c:forEach>
			</ul>
			<div class="banner-pic">
				<ul>
					<li><a href="javascript:;"><img
							src="resources/gkk/img/banner-pic1.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							src="resources/gkk/img/banner-pic2.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							src="resources/gkk/img/banner-pic3.jpg" alt=""></a></li>
				</ul>
			</div>
			<div class="banner-right">

				<ul class="banner-way">
					<li class="banner-way1"><span>1</span>访问网站直接下订单</li>
					<li class="banner-way2"><span>2</span>直接拨打电话
						<p>如果在您不方便上网的时候</p>
						<b>18338448958</b></li>

				</ul>

			</div>
		</div>
	</div>

	<!--wine-->
	<div id="wine">
	<c:forEach items="${productInfoTypes}" var="type" varStatus="index">
		<a class="" href="javascript:;">${type.typeName }</a>
	</c:forEach>
		<!-- <div class="wine-container">
			<div class="wine-spirit-wrap">
				<div class="wine-spirit-btn">
					<a class="left" href="javascript:;"></a> <a class="right"
						href="javascript:;"></a>
				</div>
				<ul class="wine-spirit wine-spirit1">
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/004.jpg" alt=""></a></li>
					
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/002.jpg" alt=""></a></li>
				</ul>
				
			</div>
			
			<ul class="wine-spirit wine-local">
				
				<li><a href="javascript:;"><img
						src="resources/gkk/img/001.jpg" alt=""></a></li>
			</ul>
		
			<ul class="wine-spirit wine-red">
				
				<li><a href="javascript:;"><img
						src="resources/gkk/img/002.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/003.jpg" alt=""></a></li>
			</ul>
		</div>  -->
	</div>

	




	<!--footer-->
	<div id='footer'>
		<!--links-->

		<!--footer-nav-->
		<div id="footer-nav">
			<ul>
				<li class="first">关于我们</li>
				<li><a href="javascript:;">隐私保护</a></li>
				<li><a href="javascript:;">公司简介</a></li>
				<li><a href="javascript:;">管理团队</a></li>
				<li><a href="javascript:;">媒体报道</a></li>
				<li><a href="javascript:;">领导关怀</a></li>
				<li><a class="last" href="javascript:;">招贤纳士</a></li>
			</ul>
			<ul>
				<li class="first">新手上路</li>
				<li><a href="javascript:;">售后流程</a></li>
				<li><a href="javascript:;">购物流程</a></li>
				<li><a href="javascript:;">订购方式</a></li>
				<li><a href="javascript:;">商品评价</a></li>
				<li><a class="last" href="javascript:;">在线支付</a></li>
			</ul>
			<ul>
				<li class="first">配送方式</li>
				<li><a href="javascript:;">货到付款区域</a></li>
				<li><a href="javascript:;">配送查询</a></li>
				<li><a href="javascript:;">配送时间</a></li>
				<li><a href="javascript:;">配送收费标准</a></li>
				<li><a class="last" href="javascript:;">上门自提</a></li>
			</ul>
			<ul>
				<li class="first">购物指南</li>
				<li><a href="javascript:;">常见问题</a></li>
				<li><a href="javascript:;">会员服务</a></li>
				<li><a href="javascript:;">红包使用</a></li>
				<li><a class="last" href="javascript:;">返现使用</a></li>
			</ul>
			<ul>
				<li class="first">售后服务</li>
				<li><a href="javascript:;">退换货原则</a></li>
				<li><a href="javascript:;">售后服务保证</a></li>
				<li><a href="javascript:;">退换货流程</a></li>
				<li><a href="javascript:;">联系客服</a></li>
				<li><a class="last" href="javascript:;">商品验收</a></li>
			</ul>
			<ul class="chat">
				<li>400-0310-707
					<p class="p1">周一至周五 9:00-17:30</p>
					<p class="p2">（仅收市话费）</p>
				</li>
				<li><a href="javascript:;">24小时在线客服</a></li>
			</ul>
		</div>



		<!--friend link-->
		<div id="friendlink">
			<p>
				友情链接： <a href="javascript:;">南阳人才网</a> | <a href="javascript:;">南阳中小企业网</a>
				| <a href="javascript:;">亿搜人才网</a> | <a href="javascript:;">南阳服务网</a>
				| <a href="javascript:;">快递查询</a>
			</p>
			<p>
				<a href="javascript:;">关于我们</a> | <a href="javascript:;">管理团队</a> |
				<a href="javascript:;">商家入驻</a> | <a href="javascript:;">媒体报道</a> |
				<a href="javascript:;">站点地图</a> | <a href="javascript:;">招贤纳士</a> |
				<a href="javascript:;">帮助中心</a> ICP备案证书号:<a href="javascript:;">豫ICP备1000002号-1</a>
			</p>
			<p>
				<a href="javascript:;">© 2018-2019 同城天天订商城 版权所有，并保留所有权利。</a> <a
					href="javascript:;">Tel: 18338448958</a> <a href="javascript:;">E-mail:
					gkk15711255657@163.com</a>
			</p>
		</div>
	</div>
	<script type="text/javascript">
	$("ul#city").on("click","li",function(){ 
		 document.getElementById('header-city').innerText = $(this).text().substring(1);
	     document.getElementById('dangqian').innerText = $(this).text().substring(1);
	 });
	
	</script>
</body>
</html>