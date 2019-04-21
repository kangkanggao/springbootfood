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
			<div class="header-city">
				南阳
				<div class="citylist">
					<div class="citylisttit">
						当前城市：<b>南阳</b>
					</div>
					<ul class="cityitem">
						<li><span>A</span><a href="javascript:;">郑州</a></li>
						<li><span>B</span><a href="javascript:;">开封</a></li>
						<li><span>C</span><a href="javascript:;">洛阳</a>
						<li><span>D</span><a href="javascript:;">平顶山</a>
						<li><span>E</span><a href="javascript:;">安阳</a></li>
						<li><span>F</span><a href="javascript:;">鹤壁</a></li>
						<li><span>G</span><a href="javascript:;">新乡</a></li>
						<li><span>H</span><a href="javascript:;">焦作</a></li>
						<li><span>J</span><a href="javascript:;">濮阳</a></li>
						<li><span>K</span><a href="javascript:;">许昌</a></li>

					</ul>
				</div>
			</div>
			<a class="header-switch" href="javascript:;">[切换区县]</a>
			<p class='header-welcome'>
				欢迎光临本店！<a href="html/login.html">请登录</a><a href="html/register.html">免费注册</a>
			</p>
			<div class="header-myinfo">
				我的信息<span></span>
				<div class="myinfo-list">
					<a href="javascript:;">已买到的宝贝</a> <a href="javascript:;">我的地址管理</a>
				</div>
			</div>
			<a class="header-myfav" href="javascript:;"><i></i>我关注的店铺</a> <a
				class="header-shopcar" href="html/shopcar.html"><i></i>购物车</a>
			<div class="header-collect" href="javascript:;">
				收藏夹<i></i>
				<div class="collectitem">
					<a href="javascript:;">收藏的宝贝</a> <a href="javascript:;">收藏的店铺</a>
				</div>
			</div>
			<div class="header-line">|</div>
			<div class="header-mobile" href="javascript:;">
				<span></span>手机版<i></i>
				<div href="javascript:;" class="app">
					<img src="resources/gkk/img/app.jpg" alt="">
				</div>
			</div>
			<div class="header-seller" href="javascript:;">
				商家支持<i></i>
				<div class="sellerhelp">
					<h5>商家：</h5>
					<p>
						<a href="javascript:;">售后流程</a><a href="javascript:;">购物流程</a><a
							href="javascript:;">订购方式</a><a href="javascript:;">常见问题</a><a
							href="javascript:;">文章资讯</a><a href="javascript:;">聚惠卡</a><a
							href="javascript:;">认证商家</a><a href="javascript:;">商学院</a><a
							href="javascript:;">全面招商</a>
					</p>
					<h6>帮助：</h6>
					<p class="p2">
						<a href="javascript:;">帮助中心</a>
					</p>
				</div>
			</div>
			<div class="header-nav" href="javascript:;">
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
			</div>
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
			<ul id="nav">
				<li><a href="javascript:;">首页</a></li>
				<li><a href="javascript:;">食品生鲜</a></li>
				<li><a href="javascript:;">店铺街</a></li>
				<li><a href="javascript:;">积分商城</a></li>
				<li><a href="javascript:;">优惠活动</a></li>
				<li><a href="javascript:;">智能扫货</a></li>
				<li><a href="javascript:;">文章资讯</a></li>
			</ul>
		</div>
	</div>

	<!--侧边栏-->
	<div id="index-fixed">
		<div class="head">
			<a href="javascript:;"><img src="resources/gkk/img/user_head.png"
				alt="head" /></a>
			<div class="login hide">
				<form action="" name='index-login' class="index-login">
					<div class="login-top">
						<h6>请登录</h6>
						<span>还没有账号？</span> <a href="javascript:;">立即注册</a>
					</div>
					<div class="login-txtwrap">
						<span>账 号</span><input type="text" class='login-txt'>
					</div>
					<div class="login-passwrap">
						<span>密 码</span><input type="password" class='login-pass'>
					</div>
					<div class="login-sel">
						<input type="checkbox" /> <span>记住密码</span> <a
							href="javascript:;">忘记密码？</a>
					</div>
					<input type="button" class="index-sub" value="立即登录">
				</form>
				<div class="cover"></div>
				<div class="icon"></div>
			</div>
		</div>
		<div class="saleo2o">
			在线销售
			<div class="o2o hide">
				<h6>在线销售顾问</h6>
				<div class="o2otop">
					<img src="resources/gkk/img/web_logo.png" alt="">
					<button type="button" id="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="height: 37px;width:77px">在线客服</button>
				</div>
				<div class="o2obottom">
					<img src="resources/gkk/img/qq1.gif" alt="">客服主管
				</div>
				<div class="cover"></div>
				<div class="icon"></div>
			</div>
		</div>
		<div class="research">
			<div class='before'>
				<i></i> 调查
			</div>
			<div class="after">在线调查</div>
			<div class="researchtest hide">
				在线调查问卷
				<div class="cover"></div>
				<div class="icon"></div>
			</div>
		</div>
		<div class="shopcar">
			<i></i>
			<p>购物车</p>
			<span>0</span>
			<div class="shopcaritem hide shopcaritemindex">
				<div class="cover"></div>
				<div class="icon"></div>
			</div>
		</div>
		<div class="look">
			<div class="before">
				<i></i> 关注
			</div>
			<div class="after after2">关注店铺</div>
		</div>

		<div class="totop">
			<div class="before">
				<i></i>
			</div>
			<div class="after after3">回到顶部</div>
		</div>
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
		<a class="wine-active" href="javascript:;">白酒品牌</a> <a
			href="javascript:;">地方名酒</a> <a href="javascript:;">红洋酒品牌</a>
		<div class="wine-container">
			<!--白酒品牌-->

			<div class="wine-spirit-wrap">
				<div class="wine-spirit-btn">
					<a class="left" href="javascript:;"></a> <a class="right"
						href="javascript:;"></a>
				</div>
				<ul class="wine-spirit wine-spirit1">
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit1.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit2.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit3.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit4.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit5.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit6.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit7.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit8.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit9.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit10.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit11.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit12.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit13.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit14.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit15.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit16.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit17.jpg" alt=""></a></li>
					<li><a href="javascript:;"><img
							data-original="resources/gkk/img/wine-spirit18.jpg" alt=""></a></li>
				</ul>
				
			</div>
			<!--地方名酒-->
			<ul class="wine-spirit wine-local">
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-local1.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-local2.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-local3.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-local4.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-local5.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-local6.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-local7.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-local8.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-local9.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-local10.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-local11.jpg" alt=""></a></li>
			</ul>
			<!--红洋酒品牌-->
			<ul class="wine-spirit wine-red">
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red1.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red2.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red3.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red4.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red5.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red6.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red7.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red8.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red9.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red10.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red11.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red12.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red13.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red14.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red15.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red16.jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/wine-red17.jpg" alt=""></a></li>
			</ul>
		</div>
	</div>

	<!--index-1f-->
	<div id="index-1f" class="floorlist">
		<h3 class="index-1f-tit">
			食品生鲜
			<div class="tab">
				<a class="active" href="javascript:;">精挑细选</a><a href="javascript:;">保健食品</a><a
					href="javascript:;">进口水果</a><a href="javascript:;">糖果巧克力</a>
			</div>
		</h3>
		<div class="index-1f-middle">
			<div class="index-1f-middle-pic">
				<div class="index-1f-piclist">
					<a href="javascript:;">芒果桃李</a> <a href="javascript:;">凤梨蓝莓</a> <a
						href="javascript:;">口香糖</a> <a href="javascript:;">棒棒糖</a> <a
						href="javascript:;">软糖</a> <a href="javascript:;">奶糖</a> <a
						href="javascript:;">果冻</a> <a href="javascript:;">杏仁</a> <a
						href="javascript:;">红枣</a>
				</div>
				<a href="javascript:;" class="index-1f-picimg"><img
					src="resources/gkk/img/1437498557902889630.jpg" alt=""></a>
			</div>
			<ul class="index-1f-middle-goods active">
				<li><a href="javascript:;"><img
						src="resources/gkk/img/2687_thumb (1).jpg" alt=""></a>
					<p class="goods-info">邯郸磁州窑·黑釉刻划剔刻·牡丹纹茶具·5头</p>
					<p class="old-price">148.2</p>
					<p class="new-price">148.2</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/2687_thumb (2).jpg" alt=""></a>
					<p class="goods-info">香全城小磨香油礼盒装/250ml*4/瓶</p>
					<p class="old-price">95.7</p>
					<p class="new-price">79.8</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/2687_thumb (3).jpg" alt=""></a>
					<p class="goods-info">酱包瓜 邯郸特产 500g*4包</p>
					<p class="old-price">62.4</p>
					<p class="new-price">52.0</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li style='border-right: 0; width: 161px;'><a
					href="javascript:;"><img
						src="resources/gkk/img/2687_thumb (4).jpg" alt=""></a>
					<p class="goods-info">黑麦糁麦仁 邯郸特产 500g*6袋</p>
					<p class="old-price">62.4</p>
					<p class="new-price">52.0</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/2687_thumb (5).jpg" alt=""></a>
					<p class="goods-info">邯郸特产纯绿豆粉皮礼盒装/1500克</p>
					<p class="old-price">80.7</p>
					<p class="new-price">67.2</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/2687_thumb (6).jpg" alt=""></a>
					<p class="goods-info">邯郸特产曲周小米礼盒装/2500克</p>
					<p class="old-price">61.5</p>
					<p class="new-price">51.3</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/2687_thumb (7).jpg" alt=""></a>
					<p class="goods-info">黑小麦馍片 邯郸特产 1500g</p>
					<p class="old-price">62.4</p>
					<p class="new-price">52.0</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li style='border-right: 0; width: 161px;'><a
					href="javascript:;"><img
						src="resources/gkk/img/2687_thumb (8).jpg" alt=""></a>
					<p class="goods-info">邯郸特产曲周手工挂面礼盒装/2500克</p>
					<p class="old-price">47.8</p>
					<p class="new-price">39.9</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
			</ul>
			<ul class="index-1f-middle-goods">
				<li><a href="javascript:;"><img
						src="resources/gkk/img/2687_thumb (1).jpg" alt=""></a>
					<p class="goods-info">邯郸磁州窑·黑釉刻划剔刻·牡丹纹茶具·5头</p>
					<p class="old-price">148.2</p>
					<p class="new-price">148.2</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/2687_thumb (2).jpg" alt=""></a>
					<p class="goods-info">香全城小磨香油礼盒装/250ml*4/瓶</p>
					<p class="old-price">95.7</p>
					<p class="new-price">79.8</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/2691_thumb_G_1456880324448.jpg" alt=""></a>
					<p class="goods-info">邯郸特产纯绿豆粉皮礼盒装/1500克</p>
					<p class="old-price">80.7</p>
					<p class="new-price">67.2</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li style='border-right: 0; width: 161px;'><a
					href="javascript:;"><img
						src="resources/gkk/img/2687_thumb (6).jpg" alt=""></a>
					<p class="goods-info">邯郸特产曲周小米礼盒装/2500克</p>
					<p class="old-price">61.5</p>
					<p class="new-price">51.3</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/2687_thumb (8).jpg" alt=""></a>
					<p class="goods-info">邯郸特产曲周手工挂面礼盒装/2500克</p>
					<p class="old-price">47.8</p>
					<p class="new-price">39.9</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/2651_thumb_G_1456791725926.jpg" alt=""></a>
					<p class="goods-info">晨光葡萄籽油1L*2</p>
					<p class="old-price">98.0</p>
					<p class="new-price">98.0</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/2651_thumb_G_1456791725926.jpg" alt=""></a>
					<p class="goods-info">晨光亚麻籽油1L*2</p>
					<p class="old-price">98.0</p>
					<p class="new-price">98.0</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li style='border-right: 0; width: 161px;'><a
					href="javascript:;"><img
						src="resources/gkk/img/2653_thumb_G_1456793612209.jpg" alt=""></a>
					<p class="goods-info">晨光珍品油四件套礼盒装</p>
					<p class="old-price">167.5</p>
					<p class="new-price">167.5</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
			</ul>
			<ul class="index-1f-middle-goods">
				<li><a href="javascript:;"><img
						src="resources/gkk/img/20_thumb_G_1453153172314.jpg" alt=""></a>
					<p class="goods-info">佳沛新西兰阳光金奇异果12个/进口猕猴桃/新鲜水...</p>
					<p class="old-price">95.0</p>
					<p class="new-price">88.0</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/11_thumb_G_1453146671846.jpg" alt=""></a>
					<p class="goods-info">七果果 越南白心火龙果1斤【3斤起拍，只多不少】...</p>
					<p class="old-price">36.0</p>
					<p class="new-price">30.0</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/14_thumb_G_1453141980056.jpg" alt=""></a>
					<p class="goods-info">哥伦比亚金燕窝果 新鲜进口水果 麒麟果 黄色白心...</p>
					<p class="old-price">500.0</p>
					<p class="new-price">479.0</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li style='border-right: 0; width: 161px;'><a
					href="javascript:;"><img
						src="resources/gkk/img/2643_thumb_G_1453051289358.jpg" alt=""></a>
					<p class="goods-info">南非进口红西柚葡萄柚 新鲜水果 酸爽味苦回甘</p>
					<p class="old-price">56.4</p>
					<p class="new-price">47.0</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/2644_thumb_G_1453052042594.jpg" alt=""></a>
					<p class="goods-info">4斤装泰国进口龙眼 去枝 小核新鲜桂圆水果湿桂圆</p>
					<p class="old-price">47.4</p>
					<p class="new-price">39.5</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/2645_thumb_G_1453053185435.jpg" alt=""></a>
					<p class="goods-info">泰国新鲜甜酸角 进口新鲜水果罗望子甜角</p>
					<p class="old-price">63.9</p>
					<p class="new-price">53.3</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/2151_thumb_G_1440703065166.jpg" alt=""></a>
					<p class="goods-info">（测试商品）海南青芒 芒果1-2个 约2斤装</p>
					<p class="old-price">24.0</p>
					<p class="new-price">20.0</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li style='border-right: 0; width: 161px;'><a
					href="javascript:;"><img
						src="resources/gkk/img/2149_thumb_G_1440702497705.jpg" alt=""></a>
					<p class="goods-info">（测试商品）马陆夏黑葡萄1斤 【3斤起拍】 毁包...</p>
					<p class="old-price">24.0</p>
					<p class="new-price">20.0</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
			</ul>
			<ul class="index-1f-middle-goods">
				<li><a href="javascript:;"><img
						src="resources/gkk/img/n.jpg" alt=""></a>
					<p class="goods-info">日本进口零食 悠哈味觉糖UHA 100%水果3口...</p>
					<p class="old-price">8.2</p>
					<p class="new-price">6.9</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/2647_thumb_G_1453054816230.jpg" alt=""></a>
					<p class="goods-info">台湾牛轧糖手工进口扎糖果花生蔓越莓</p>
					<p class="old-price">55.0</p>
					<p class="new-price">45.9</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/29_thumb_G_1437506331258.jpg" alt=""></a>
					<p class="goods-info">意大利费列罗巧克力食品进口零食礼盒576粒整箱装...</p>
					<p class="old-price">1545.6</p>
					<p class="new-price">1288.0</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li style='border-right: 0; width: 161px;'><a
					href="javascript:;"><img
						src="resources/gkk/img/26_thumb_G_1437505984631.jpg" alt=""></a>
					<p class="goods-info">韩国进口X-5花生夹心巧克力棒36g榛果仁威化能...</p>
					<p class="old-price">4.5</p>
					<p class="new-price">3.8</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/30_thumb_G_1437506667557.jpg" alt=""></a>
					<p class="goods-info">日本进口 KRACIE（KRACIE）牌玫瑰香味...</p>
					<p class="old-price">14.3</p>
					<p class="new-price">12.0</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/27_thumb_G_1437506372309.jpg" alt=""></a>
					<p class="goods-info">Ferrero/费列罗 意大利进口威化榛果巧克力...</p>
					<p class="old-price">95.0</p>
					<p class="new-price">79.0</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/32_thumb_G_1437506920994.jpg" alt=""></a>
					<p class="goods-info">Lindt瑞士莲黑巧克力特醇排装德国进口 70%...</p>
					<p class="old-price">350.0</p>
					<p class="new-price">299.0</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
				<li style='border-right: 0; width: 161px;'><a
					href="javascript:;"><img
						src="resources/gkk/img/31_thumb_G_1437506821290.jpg" alt=""></a>
					<p class="goods-info">台湾进口 百年老店糖之坊夏威夷果牛轧糖奶糖（蔓越...</p>
					<p class="old-price">42.0</p>
					<p class="new-price">35.0</p> <a class="buy" href="javascript:;"
					title="buy"></a></li>
			</ul>
			<div class="index-1f-middle-ad">
				<img src="resources/gkk/img/1f-right (1).jpg" alt=""><img
					src="resources/gkk/img/1f-right (2).jpg" alt="">
			</div>
		</div>
		<div class="index-1f-bottom">
			<ul>
				<li style='width: 111px;'><a href="javascript:;"><img
						src="resources/gkk/img/1f-index-bottom (1).jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/1f-index-bottom (2).jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/1f-index-bottom (3).jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/1f-index-bottom (4).jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/1f-index-bottom (5).jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/1f-index-bottom (6).jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/1f-index-bottom (7).jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/1f-index-bottom (8).jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/1f-index-bottom (9).jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/1f-index-bottom (10).jpg" alt=""></a></li>
				<li><a href="javascript:;"><img
						src="resources/gkk/img/1f-index-bottom (11).jpg" alt=""></a></li>
			</ul>
			<div class="index-1f-bottombtn">
				<a href="javascript:;"><img
					src="resources/gkk/img/icon-slide-left.png" alt=""></a><a
					class="right" href="javascript:;"><img
					src="resources/gkk/img/icon-slide-right.png" alt=""></a>
			</div>
		</div>
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
	
</body>
</html>