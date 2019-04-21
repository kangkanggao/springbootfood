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
	<meta charset="UTF-8">
	<title>搜索结果</title>
	<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="resources/icomoon/style.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="resources/gkk/css/main.css" />
	<link rel="stylesheet" href="resources/gkk/css/index.css" />
	<link rel="stylesheet" href="resources/gkk/css/detail.css" />
	<link rel="stylesheet" href="resources/gkk/css/searchresult.css" />
	<script src='resources/gkk/js/jquery-1.12.4.min.js'></script>
	<script src='resources/gkk/js/jquery.countdown.min.js'></script>
	<script src='resources/gkk/js/index.js'></script>
	<script src='resources/gkk/js/searchresult.js'></script>
	<script src='resources/gkk/js/jquery.cookie.js'></script>
	<script src='resources/gkk/js/jquery.lazyload.min.js'></script>
</head>
<body>
	
	<!--header-->
	<div id="headerwrap">
		<div id="header">
			<b class="header-position"></b>
			<div class="header-city">邯郸
				<div class="citylist">
					<div class="citylisttit">当前城市：<b>邯郸</b></div>
					<ul class="cityitem">
						<li><span>S</span><a href="javascript:;">石家庄</a></li>
						<li><span>B</span><a href="javascript:;">保定</a></li>
						<li><span>C</span><a href="javascript:;">沧州</a> <a href="javascript:;">承德</a></li>
						<li><span>C</span><a href="javascript:;">邯郸</a>  <a href="javascript:;">衡水</a></li>
						<li><span>L</span><a href="javascript:;">廊坊</a></li>
						<li><span>Q</span><a href="javascript:;">秦皇岛</a></li>
						<li><span>T</span><a href="javascript:;">唐山</a></li>
						<li><span>X</span><a href="javascript:;">邢台</a></li>
						<li><span>Z</span><a href="javascript:;">张家口</a></li>
					</ul>
				</div>
			</div>
			<a class="header-switch" href="javascript:;">[切换区县]</a>
			<p class='header-welcome'>欢迎光临本店！<a href="login.html">请登录</a><a href="register.html">免费注册</a></p>
			<div class="header-myinfo">我的信息<span></span>
				<div class="myinfo-list">
					<a href="javascript:;">已买到的宝贝</a>
					<a href="javascript:;">我的地址管理</a>
				</div>
			</div>
			<a class="header-myfav" href="javascript:;"><i></i>我关注的店铺</a>
			<a class="header-shopcar" href="shopcar.html"><i></i>购物车</a>
			<div class="header-collect" href="javascript:;">收藏夹<i></i>
				<div class="collectitem">
					<a href="javascript:;">收藏的宝贝</a>
					<a href="javascript:;">收藏的店铺</a>
				</div>
			</div>
			<div class="header-line">|</div>
			<div class="header-mobile" href="javascript:;"><span></span>手机版<i></i>
				<div href="javascript:;" class="app"><img src="resources/gkk/imgapp.jpg" alt=""></div>
			</div>
			<div class="header-seller" href="javascript:;">商家支持<i></i>
				<div class="sellerhelp">
					<h5>商家：</h5>
					<p><a href="javascript:;">售后流程</a><a href="javascript:;">购物流程</a><a href="javascript:;">订购方式</a><a href="javascript:;">常见问题</a><a href="javascript:;">文章资讯</a><a href="javascript:;">聚惠卡</a><a href="javascript:;">认证商家</a><a href="javascript:;">商学院</a><a href="javascript:;">全面招商</a></p>
					<h6>帮助：</h6>
					<p class="p2"><a href="javascript:;">帮助中心</a></p>
				</div>
			</div>
			<div class="header-nav" href="javascript:;"><i></i>网站导航<span></span>
				<div class="navmenu">
					<div class="menuleft">
						<h6 class="menulefttit">产品分类 Product</h6>
						<p class="menuleftlist"><a href="javascript:;">食品生鲜</a><a href="javascript:;">服装服饰</a><a href="javascript:;">个护化妆</a><a href="javascript:;">手机数码</a><a href="javascript:;">家用电器</a><a href="javascript:;">家纺家居</a><a href="javascript:;">酒类饮料</a><a href="javascript:;">母婴用品</a></p>
					</div>
					<div class="menumid">
						<h6 class="menulefttit menumidtit">店铺街 Market</h6>
						<p class="menuleftlist menumidlist"><a href="javascript:;">精选</a><a href="javascript:;">女人</a><a href="javascript:;">男人</a><a href="javascript:;">家装</a><a href="javascript:;">母婴</a><a href="javascript:;">美妆</a><a href="javascript:;">美食</a><a href="javascript:;">数码</a></p>
					</div>
					<div class="menuright">
						<h6 class="menulefttit menurighttit">店铺街 Market</h6>
						<p class="menuleftlist menurightlist"><a href="javascript:;">精选</a><a href="javascript:;">女人</a><a href="javascript:;">男人</a><a href="javascript:;">家装</a><a href="javascript:;">母婴</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--top-->
	<div id="top">
		<h1 id='logo'><a href="../index.html"><img src="resources/gkk/img/logo_hd.jpg" alt="juhuimai" title='logo'></a></h1>
		<form action="front/productInfoList" method="post" name='searchbox' class='top-search' id="ListSearchFrm" >
			<div class="top-search-tabcontainer"><a href="javascript:;" class="top-search-tab top-search-active">宝贝</a><a href="javascript:;" class="top-search-tab">店铺</a></div>
			<div class="top-search-txtcontainer">
				<input class="top-search-txt" type="text" name="productName"  placeholder="请输入关键字" />
				<input
					class="top-search-btn" type="submit" value="搜索" />
				
			</div>
			<ul class="top-search-tips">
				<li>灯饰</li>
				<li class="active">|</li>
				<li>私房菜</li>
				<li class="active">|</li>
				<li>丛台酒</li>
				<li class="active">|</li>
				<li>非凡旅游</li>
				<li class="active">|</li>
				<li>家具</li>
				<li class="active">|</li>
				<li>三星S6</li>
				<li class="active">|</li>
				<li>苹果</li>
			</ul>
		</form>
		<div class="top-link">
			<a class="top-link-a" href="javascript:;">七天包退</a>
			<a class="top-link-a" href="javascript:;">正品保障</a>
			<a class="top-link-a" href="javascript:;">闪电发货</a>
		</div>
	</div>

	<!--nav-->
	<!-- <div id="navcontainer"> -->
		<div id="navwrap">
			<div class="navallwrap">
				<h2 class="nav-all">全部商品分类<i></i></h2>
				<ul class="banner-list bannerlisthide">
				<li style='border:none;'>
					<div class="bannerlistleftside"></div>
					<div class="changeopa">
						<span class="banner-listitem"><b></b>食品生鲜<i></i></span>
						<p>保健食品 进口水果 ...</p>
					</div>
					<div class="banner-listitem-menu">
						<ul class="left">
							<li style='height:12px;'><a href="javascript:;">保健食品：</a></li>
							<li><a href="javascript:;">进口水果：</a><p><a href="javascript:;">释迦芭乐</a> <a href="javascript:;">樱桃车厘子</a> <a href="javascript:;">芒果桃李</a> <a href="javascript:;">龙眼荔枝</a> <a href="javascript:;">小波</a> <a href="javascript:;">奇异果猕猴桃</a> <a href="javascript:;">凤梨蓝莓</a> <a href="javascript:;">榴莲山竹</a></p></li>
							<li><a href="javascript:;">糖果巧克力：</a><p><a href="javascript:;">巧克力</a> <a href="javascript:;">口香糖</a> <a href="javascript:;">棒棒糖</a> <a href="javascript:;">软糖</a> <a href="javascript:;">奶糖</a> <a href="javascript:;">QQ糖</a> <a href="javascript:;">果冻</a></p></li>
							<li><a href="javascript:;">牛奶乳品：</a><p><a href="javascript:;">常温奶</a> <a href="javascript:;">乳饮料</a><a href="javascript:;">儿童奶</a> <a href="javascript:;">酸奶</a> <a href="javascript:;">豆奶</a> <a href="javascript:;">低脂奶</a> <a href="javascript:;">全脂奶</a> <a href="javascript:;">成人奶粉</a> </p></li>
							<li><a href="javascript:;">坚果炒货：</a><p><a href="javascript:;">核桃</a> <a href="javascript:;">夏威夷果</a> <a href="javascript:;">碧根果</a> <a href="javascript:;">开心果</a> <a href="javascript:;">腰果</a> <a href="javascript:;">瓜子</a> <a href="javascript:;">花生</a> <a href="javascript:;">杏仁</a></p></li>
							<li style='border:0;'><a href="javascript:;">蜜饯果干：</a><p><a href="javascript:;">红枣</a> <a href="javascript:;">莓类</a> <a href="javascript:;">葡萄干</a> <a href="javascript:;">芒果干</a> <a href="javascript:;">香蕉干</a> <a href="javascript:;">山楂片</a> <a href="javascript:;">橄榄</a> <a href="javascript:;">其他</a></p></li>
						</ul>
						<ul class="right">
							<li>推荐品牌</li>
							<li style='border:0;'>
								<p>
									<a href="javascript:;">三只松鼠</a><a href="javascript:;">楼兰密语</a><a href="javascript:;">百草味三元</a><a href="javascript:;">伊利</a><a href="javascript:;">肯德基</a><a href="javascript:;">必胜客</a><a href="javascript:;">西域美农</a><a href="javascript:;">美赞臣</a><a href="javascript:;">享爱.</a><a href="javascript:;">糖糖屋</a><a href="javascript:;">宝瑞淇</a><a href="javascript:;">费列罗</a><a href="javascript:;">Vega</a><a href="javascript:;">SUNSIDES</a><a href="javascript:;">Sainsbury's</a><a href="javascript:;">圣牧</a><a href="javascript:;">纽麦福</a>
								</p>
							</li>
						</ul>
					</div>
				</li>
				<li>
					<div class="bannerlistleftside"></div>
					<div class="changeopa">
						<span class="banner-listitem banner-listitem1"><b></b>服装服饰<i></i></span>
						<p>女装馆 T恤 中长款半 ...</p>
					</div>
					<div class="banner-listitem-menu">
						<ul class="left">
							<li><a href="javascript:;">女装馆：</a><p><a href="javascript:;">连衣裙</a><a href="javascript:;">连体裤</a> <a href="javascript:;">棉麻T恤</a> <a href="javascript:;">时尚套装</a> <a href="javascript:;">复古旗袍</a> <a href="javascript:;">牛仔裤</a> <a href="javascript:;">短外套</a> <a href="javascript:;">羽绒服</a></p></li>
							<li style='height:12px;'><a href="javascript:;">T恤：</a></li>
							<li style='height:12px;'><a href="javascript:;">中长款半身裙：</a></li>
							<li style='height:12px;'><a href="javascript:;">夹克/风衣：</a></li>
							<li><a href="javascript:;">男装馆：</a><p><a href="javascript:;">休闲裤</a> <a href="javascript:;">牛仔裤</a> <a href="javascript:;">夹克</a> <a href="javascript:;">风衣</a> <a href="javascript:;">针织衫</a> <a href="javascript:;">长袖衬衫</a> <a href="javascript:;">休闲短裤</a> <a href="javascript:;">POLO衫</a></p></li>
							<li><a href="javascript:;">内衣馆：</a><p><a href="javascript:;">聚拢文胸</a><a href="javascript:;">薄款文胸</a><a href="javascript:;">无钢圈文胸</a><a href="javascript:;">女士内裤</a><a href="javascript:;">男士内裤</a><a href="javascript:;">夏季睡衣</a><a href="javascript:;">性感睡衣</a><a href="javascript:;">瘦腿袜</a></p></li>
							<li><a href="javascript:;">户外鞋服：</a><p><a href="javascript:;">跑步鞋</a><a href="javascript:;">篮球鞋</a><a href="javascript:;">帆布鞋</a><a href="javascript:;">男士皮鞋</a><a href="javascript:;">迷彩裤</a><a href="javascript:;">沙滩鞋</a><a href="javascript:;">钓鱼服</a><a href="javascript:;">登山鞋</a></p></li>
							<li><a href="javascript:;">鞋帽：</a><p><a href="javascript:;">高跟凉拖</a><a href="javascript:;">平底鞋</a><a href="javascript:;">高跟鞋</a><a href="javascript:;">坡跟单鞋</a><a href="javascript:;">浅口单鞋</a><a href="javascript:;">帆布鞋</a><a href="javascript:;">女士皮鞋</a><a href="javascript:;">松糕鞋</a></p></li>
							<li style='border:0;'><a href="javascript:;">箱包馆：</a><p><a href="javascript:;">单肩女包</a> <a href="javascript:;">手提女包</a> <a href="javascript:;">女士钱包</a> <a href="javascript:;">男士双肩</a> <a href="javascript:;">男士钱包</a> <a href="javascript:;">旅行箱</a> <a href="javascript:;">拉杆箱</a> <a href="javascript:;">拉杆包</a></p></li>
						</ul>
						<ul class="right">
							<li>推荐品牌</li>
							<li style='border:0;'>
								<p>
									<a href="javascript:;">泸州老窖</a><a href="javascript:;">茵曼（INMAN）</a><a href="javascript:;">缪诗</a><a href="javascript:;">伊芙丽</a><a href="javascript:;">达芙妮</a><a href="javascript:;">卓诗尼</a><a href="javascript:;">曼妮芬</a><a href="javascript:;">溢彩年华</a><a href="javascript:;">（ManniForm）</a><a href="javascript:;">佐丹奴</a><a href="javascript:;">七匹狼</a><a href="javascript:;">伊莱克斯</a><a href="javascript:;">雪花</a><a href="javascript:;">其他</a><a href="javascript:;">卡欧澜</a><a href="javascript:;">珂尔妮</a><a href="javascript:;">Grlbobra</a><a href="javascript:;">贵绣</a><a href="javascript:;">艺尔</a>
								</p>
							</li>
						</ul>
					</div>
				</li>
				<li>
					<div class="bannerlistleftside"></div>
					<div class="changeopa">
						<span class="banner-listitem banner-listitem2"><b></b>个护化妆<i></i></span>
						<p>美容护肤 香水彩妆 面 ...</p>
					</div>
					<div class="banner-listitem-menu">
						<ul class="left">
							<li style='height:12px;'><a href="javascript:;">美容护肤：</a></li>
							<li><a href="javascript:;">香水彩妆：</a><p><a href="javascript:;">香水</a> <a href="javascript:;">底妆</a> <a href="javascript:;">腮红</a> <a href="javascript:;">眼部</a> <a href="javascript:;">唇部</a> <a href="javascript:;">美甲</a> <a href="javascript:;">美容工具</a> <a href="javascript:;">护肤套装</a></p></li>
							<li><a href="javascript:;">面部护肤：</a><p><a href="javascript:;">清洁</a> <a href="javascript:;">护肤</a> <a href="javascript:;">面膜</a> <a href="javascript:;">剃须</a> <a href="javascript:;">套装</a></p></li>
							<li><a href="javascript:;">洗发护发：</a><p><a href="javascript:;">洗发</a> <a href="javascript:;">护发</a> <a href="javascript:;">染发</a> <a href="javascript:;">造型</a> <a href="javascript:;">假发</a> <a href="javascript:;">套装</a></p></li>
							<li><a href="javascript:;">身体护肤：</a><p><a href="javascript:;">沐浴</a><a href="javascript:;">润肤</a><a href="javascript:;">颈部</a><a href="javascript:;">手足</a><a href="javascript:;">纤体塑形</a><a href="javascript:;">美胸</a><a href="javascript:;">套装</a></p></li>
							<li style='border:0;height:12px;'><a href="javascript:;">口腔护理：</a><p><a href="javascript:;">牙膏/牙粉</a> <a href="javascript:;">牙刷/牙线</a> <a href="javascript:;">漱口水</a> <a href="javascript:;">套装</a></p></li>
						</ul>
						<ul class="right">
							<li>推荐品牌</li>
							<li style='border:0;'>
								<p>
									<a href="javascript:;">资生堂</a><a href="javascript:;">雅诗兰黛</a><a href="javascript:;">SK-ll</a><a href="javascript:;">相宜本草</a><a href="javascript:;">兰芝</a><a href="javascript:;">罗莱</a><a href="javascript:;">韩束</a><a href="javascript:;">碧欧泉</a><a href="javascript:;">Dior</a><a href="javascript:;">珀莱雅</a><a href="javascript:;">CK</a><a href="javascript:;">chanel</a>
								</p>
							</li>
						</ul>
					</div>
				</li>
				<li>
					<div class="bannerlistleftside"></div>
					<div class="changeopa">
						<span class="banner-listitem banner-listitem3"><b></b>手机数码<i></i></span>
						<p>网卡 热卖手机 手机配件 ...</p>
					</div>
					<div class="banner-listitem-menu">
						<ul class="left">
							<li style='height:12px;'><a href="javascript:;">网卡：</a></li>
							<li><a href="javascript:;">热卖手机：</a><p><a href="javascript:;">三星盖乐世</a> <a href="javascript:;">iPhone</a> <a href="javascript:;">小米特供</a> <a href="javascript:;">魅族手机</a> <a href="javascript:;">华为荣耀</a> <a href="javascript:;">联通4G</a> <a href="javascript:;">电信4G</a> <a href="javascript:;">移动4G</a></p></li>
							<li><a href="javascript:;">手机配件：</a><p><a href="javascript:;">电池</a> <a href="javascript:;">移动电源</a> <a href="javascript:;">蓝牙耳机</a> <a href="javascript:;">充电器</a> <a href="javascript:;">创意配件</a><a href="javascript:;">手机饰品</a><a href="javascript:;">手机耳机</a><a href="javascript:;">保护套</a></p></li>
							<li><a href="javascript:;">数码影音：</a><p><a href="javascript:;">数码相机</a> <a href="javascript:;">单反相机</a> <a href="javascript:;">拍立得</a> <a href="javascript:;">运动相机</a> <a href="javascript:;">摄像机</a> <a href="javascript:;">户外器材</a><a href="javascript:;">数码相框</a><a href="javascript:;">影棚器材</a></p></li>
							<li><a href="javascript:;">智能设备：</a><p><a href="javascript:;">智能手环</a><a href="javascript:;">智能手表</a><a href="javascript:;">智能眼镜</a><a href="javascript:;">运动跟踪器</a><a href="javascript:;">智能家居</a><a href="javascript:;">体感车</a></p></li>
							<li style='border:0;height:12px;'><a href="javascript:;">电脑：</a><p><a href="javascript:;">笔记本</a> <a href="javascript:;">台式机</a> <a href="javascript:;">打印机</a> <a href="javascript:;">电脑配件</a></p></li>
						</ul>
						<ul class="right">
							<li>推荐品牌</li>
							<li style='border:0;'>
								<p>
									<a href="javascript:;">小米</a><a href="javascript:;">海信</a><a href="javascript:;">努比亚</a><a href="javascript:;">乐檬</a><a href="javascript:;">中兴</a><a href="javascript:;">伊莱克斯</a><a href="javascript:;">溢彩年华</a><a href="javascript:;">西域美农</a><a href="javascript:;">Dior</a><a href="javascript:;">艾力斯特</a><a href="javascript:;">贝古贝古</a><a href="javascript:;">苹果</a><a href="javascript:;">华为</a><a href="javascript:;">天堂伞</a><a href="javascript:;">五粮液</a>
								</p>
							</li>
						</ul>
					</div>
				</li>
				<li>
					<div class="bannerlistleftside"></div>
					<div class="changeopa">
						<span class="banner-listitem banner-listitem4"><b></b>家用电器<i></i></span>
						<p>大家电 大家电 生活电...</p>
					</div>
					<div class="banner-listitem-menu">
						<ul class="left">
							<li style='height:12px;'><a href="javascript:;">大 家 电：</a></li>
							<li><a href="javascript:;">大家电：</a><p><a href="javascript:;">平板电视</a> <a href="javascript:;">空调冰箱</a> <a href="javascript:;">洗衣机</a> <a href="javascript:;">家庭影院</a> <a href="javascript:;">烟机/灶具</a> <a href="javascript:;">热水器</a> <a href="javascript:;">消毒柜/洗碗机</a> <a href="javascript:;">冷柜/冰吧</a></p></li>
							<li><a href="javascript:;">生活电器：</a><p><a href="javascript:;">电风扇</a> <a href="javascript:;">净化器</a>  <a href="javascript:;">加湿器</a> <a href="javascript:;">吸尘器</a><a href="javascript:;">挂烫机/熨斗</a><a href="javascript:;">取暖电器</a><a href="javascript:;">饮水机</a><a href="javascript:;">其它生活电器</a></p></li>
							<li><a href="javascript:;">厨房电器：</a><p><a href="javascript:;">电饭煲</a> <a href="javascript:;">微波炉</a> <a href="javascript:;">电磁炉</a> <a href="javascript:;">电饼铛/烧烤盘</a> <a href="javascript:;">电炖锅</a> <a href="javascript:;">果蔬解毒机</a><a href="javascript:;">养生壶/煎药壶</a><a href="javascript:;">其它厨房电器</a></p></li>
							<li><a href="javascript:;">个护健康：</a><p><a href="javascript:;">剃须刀</a><a href="javascript:;">电吹风</a><a href="javascript:;">按摩椅</a><a href="javascript:;">足浴盆</a><a href="javascript:;"> 健康秤/厨房秤</a><a href="javascript:;">血糖仪</a><a href="javascript:;">计步器/脂肪检测</a><a href="javascript:;">其它健康电器</a></p></li>
							<li style='border:0;'><a href="javascript:;">五金家装：</a><p><a href="javascript:;">手动工具</a> <a href="javascript:;">厨卫五金</a> <a href="javascript:;">家具五金</a> <a href="javascript:;">电工电料</a><a href="javascript:;">电动工具</a></p></li>
						</ul>
						<ul class="right">
							<li>推荐品牌</li>
							<li style='border:0;'>
								<p>
									<a href="javascript:;">美的</a><a href="javascript:;">格兰仕</a><a href="javascript:;">西门子</a><a href="javascript:;">海尔</a><a href="javascript:;">格力</a><a href="javascript:;">三星</a><a href="javascript:;">伊莱克斯</a><a href="javascript:;">LG</a><a href="javascript:;">爱仕达</a>
								</p>
							</li>
						</ul>
					</div>
				</li>
				<li>
					<div class="bannerlistleftside"></div>
					<div class="changeopa">
						<span class="banner-listitem banner-listitem5"><b></b>家居日用<i></i></span>
						<p>家纺 家具 厨具 灯具...</p>
					</div>
					<div class="banner-listitem-menu">
						<ul class="left">
							<li><a href="javascript:;">家纺：</a><p><a href="javascript:;">床品套件</a> <a href="javascript:;">被子</a> <a href="javascript:;">蚊帐</a> <a href="javascript:;">凉席</a> <a href="javascript:;">床单被罩</a> <a href="javascript:;">毛巾浴巾</a> <a href="javascript:;">床垫/床褥</a> <a href="javascript:;">窗帘/窗纱</a></p></li>
							<li><a href="javascript:;">家具：</a><p><a href="javascript:;">卧室家具</a> <a href="javascript:;">客厅家具</a> <a href="javascript:;">餐厅家具</a> <a href="javascript:;">书房家具</a> <a href="javascript:;">储物家具</a> <a href="javascript:;">阳台/户外</a> <a href="javascript:;">沙发</a> <a href="javascript:;">鞋架/衣帽架</a></p></li>
							<li><a href="javascript:;">厨具：</a><p><a href="javascript:;">烹饪锅具</a> <a href="javascript:;">刀剪菜板</a>  <a href="javascript:;">厨房配件</a> <a href="javascript:;">水具酒具</a><a href="javascript:;">餐具</a><a href="javascript:;">茶具/咖啡具</a></p></li>
							<li><a href="javascript:;">灯具：</a><p><a href="javascript:;">台灯</a> <a href="javascript:;">吸顶灯</a> <a href="javascript:;">筒灯射灯</a> <a href="javascript:;">LED灯</a> <a href="javascript:;">落地灯</a> <a href="javascript:;">应急灯/手电</a><a href="javascript:;">装饰灯</a><a href="javascript:;">吊灯</a></p></li>
							<li><a href="javascript:;">家装软饰：</a><p><a href="javascript:;">桌布/罩件</a><a href="javascript:;">地毯地垫</a><a href="javascript:;">沙发垫套/椅垫</a><a href="javascript:;">帘艺隔断</a><a href="javascript:;"> 相框/照片墙</a><a href="javascript:;">装饰字画</a><a href="javascript:;">墙贴/装饰贴</a><a href="javascript:;">摆件花瓶</a></p></li>
							<li><a href="javascript:;">生活日用：</a><p><a href="javascript:;">收纳用品</a><a href="javascript:;">雨伞雨具</a><a href="javascript:;">浴室用品</a><a href="javascript:;">缝纫/针织用品</a><a href="javascript:;">洗晒/熨烫</a><a href="javascript:;">净化除味</a><a href="javascript:;">饰品</a></p></li>
							<li style='border:0;height:12px;'><a href="javascript:;">办公用品：    </a><p><a href="javascript:;">办公桌椅</a> <a href="javascript:;">笔/本/文件夹</a> <a href="javascript:;">办公耗材</a> <a href="javascript:;">其他</a></p></li>
						</ul>
						<ul class="right">
							<li>推荐品牌</li>
							<li style='border:0;'>
								<p>
									<a href="javascript:;">Dior</a><a href="javascript:;">MISS FACE</a><a href="javascript:;">SK-ll</a><a href="javascript:;">高丝</a><a href="javascript:;">韩束</a><a href="javascript:;">小米</a><a href="javascript:;">摩托罗拉</a><a href="javascript:;">金立</a><a href="javascript:;">苹果</a><a href="javascript:;">楼兰密语</a><a href="javascript:;">猫人</a><a href="javascript:;">茵曼（INMAN）</a><a href="javascript:;">她他/tata</a><a href="javascript:;">稻草人</a><a href="javascript:;">爱华仕</a><a href="javascript:;">罗莱</a><a href="javascript:;">安睡宝</a><a href="javascript:;">溢彩年华</a><a href="javascript:;">慧乐家</a><a href="javascript:;">天堂伞</a><a href="javascript:;">水星家纺</a><a href="javascript:;">五粮液</a><a href="javascript:;">泸州老窖</a><a href="javascript:;">洋河</a><a href="javascript:;">郎酒</a>
								</p>
							</li>
						</ul>
					</div>
				</li>
				<li>
					<div class="bannerlistleftside"></div>
					<div class="changeopa">
						<span class="banner-listitem banner-listitem6"><b></b>酒类饮料<i></i></span>
						<p>酒水 冲调饮品 饮料饮...</p>
					</div>
					<div class="banner-listitem-menu">
						<ul class="left">
							<li><a href="javascript:;">酒水：</a><p><a href="javascript:;">白酒</a> <a href="javascript:;">啤酒</a> <a href="javascript:;">葡萄酒/果酒</a> <a href="javascript:;">黄酒/米酒</a> <a href="javascript:;">养生酒</a> <a href="javascript:;">预调酒</a></p></li>
							<li style='height:65px;'><a href="javascript:;">冲调饮品：</a><p><a href="javascript:;">冲饮品</a> <a href="javascript:;">冲调食品</a> <a href="javascript:;">蜂蜜</a> <a href="javascript:;">成人奶粉</a> <a href="javascript:;">豆浆/豆奶粉</a> <a href="javascript:;">茶叶</a> <a href="javascript:;">奶茶</a> <a href="javascript:;">麦片谷物</a><a href="javascript:;">咖啡</a><a href="javascript:;">果味冲调</a></p></li>
							<li><a href="javascript:;">饮料饮品：</a><p><a href="javascript:;">果蔬汁</a> <a href="javascript:;">茶饮料</a>  <a href="javascript:;">碳酸饮料</a> <a href="javascript:;">功能饮料</a><a href="javascript:;">纯牛奶</a><a href="javascript:;">酸奶</a><a href="javascript:;">风味奶</a><a href="javascript:;">植物蛋白饮料</a></p></li>
							<li style='border:0;'><a href="javascript:;">茗茶：        </a><p><a href="javascript:;">铁观音</a> <a href="javascript:;">普洱</a> <a href="javascript:;">龙井</a> <a href="javascript:;">绿茶</a> <a href="javascript:;">红茶</a> <a href="javascript:;">花果茶</a><a href="javascript:;">养生茶</a><a href="javascript:;">其他茶</a></p></li>
						</ul>
						<ul class="right">
							<li>推荐品牌</li>
							<li style='border:0;'>
								<p>
									<a href="javascript:;">丛台酒</a><a href="javascript:;">雪花</a><a href="javascript:;">哈尔滨</a><a href="javascript:;">王老吉</a><a href="javascript:;">郎酒</a><a href="javascript:;">蒙牛</a><a href="javascript:;">雀氏</a><a href="javascript:;">糖糖屋</a><a href="javascript:;">统一</a><a href="javascript:;">合生元</a><a href="javascript:;">锐澳</a><a href="javascript:;">光明</a>
								</p>
							</li>
						</ul>
					</div>
				</li>
				<li>
					<div class="bannerlistleftside"></div>
					<div class="changeopa">
						<span class="banner-listitem banner-listitem7"><b></b>母婴用品<i></i></span>
						<p>尿裤湿巾 玩具 婴儿尿...</p>
					</div>
					<div class="banner-listitem-menu">
						<ul class="left">
							<li style='height:12px;'><a href="javascript:;">尿裤湿巾：</a></li>
							<li style='height:12px;'><a href="javascript:;">玩具：</a></li>
							<li style='height:12px;'><a href="javascript:;">婴儿尿裤：</a></li>
							<li style='height:12px;'><a href="javascript:;">孕妇装：</a></li>
							<li><a href="javascript:;">孕婴奶粉：</a><p><a href="javascript:;">特配奶粉</a> <a href="javascript:;">孕妈奶粉</a> <a href="javascript:;">pre段</a> <a href="javascript:;">1段</a> <a href="javascript:;">2段</a> <a href="javascript:;">3段</a></p></li>
							<li><a href="javascript:;">营养/辅食：</a><p><a href="javascript:;">米粉</a> <a href="javascript:;">果汁/泥</a>  <a href="javascript:;">面食类</a> <a href="javascript:;">宝宝零食</a><a href="javascript:;">DHA</a><a href="javascript:;">清火开胃</a><a href="javascript:;">钙铁锌</a><a href="javascript:;">益生菌</a></p></li>
							<li><a href="javascript:;">孕婴洗护：</a><p><a href="javascript:;">洗衣液/皂</a> <a href="javascript:;">宝宝沐浴</a><a href="javascript:;">儿童防晒</a> <a href="javascript:;">爽身粉</a><a href="javascript:;">奶瓶清洗</a><a href="javascript:;">孕妇护肤</a></p></li>
							<li><a href="javascript:;">喂养用品：</a><p><a href="javascript:;">奶嘴奶瓶</a> <a href="javascript:;">驱蚊用品</a><a href="javascript:;">浴室用品</a> <a href="javascript:;">水壶/水杯</a><a href="javascript:;">吸奶器</a><a href="javascript:;">理发器</a><a href="javascript:;">防溢乳垫</a></p></li>       
							<li><a href="javascript:;">车床/床品：</a><p><a href="javascript:;">安全座椅</a> <a href="javascript:;">手推车</a><a href="javascript:;">婴儿床</a> <a href="javascript:;">餐椅</a><a href="javascript:;">三轮车</a><a href="javascript:;">儿童家具</a><a href="javascript:;">睡袋/抱被</a><a href="javascript:;">凉席/蚊帐</a></p></li>
							<li><a href="javascript:;">车床/床品：</a><p><a href="javascript:;">安全座椅</a> <a href="javascript:;">手推车</a><a href="javascript:;">婴儿床</a> <a href="javascript:;">餐椅</a><a href="javascript:;">三轮车</a><a href="javascript:;">儿童家具</a><a href="javascript:;">睡袋/抱被</a><a href="javascript:;">凉席/蚊帐</a></p></li>
							<li style='border:0;'><a href="javascript:;">孕妈专区：</a><p><a href="javascript:;">孕妇裙</a> <a href="javascript:;">打底裤</a> <a href="javascript:;">防辐射服</a> <a href="javascript:;">腰凳</a> <a href="javascript:;">妈咪包</a> <a href="javascript:;">收腹带</a><a href="javascript:;">哺乳文胸</a><a href="javascript:;">孕妇内裤</a></p></li>
						</ul>
						<ul class="right">
							<li>推荐品牌</li>
							<li style='border:0;'>
								<p>
									<a href="javascript:;">美赞臣</a><a href="javascript:;">合生元</a><a href="javascript:;">资生堂</a><a href="javascript:;">伊利</a><a href="javascript:;">蒙牛</a><a href="javascript:;">茵曼（INMAN）</a><a href="javascript:;">皇家宝贝</a><a href="javascript:;">青蛙王子</a>
								</p>
							</li>
						</ul>
					</div>
				</li>
			</ul>
			</div>
			
			<ul id="nav">
				<li><a href="../index.html">首页</a></li>
				<li><a href="javascript:;">食品生鲜</a></li>
				<li><a href="javascript:;">店铺街</a></li>
				<li><a href="javascript:;">积分商城</a></li>
				<li><a href="javascript:;">优惠活动</a></li>
				<li><a href="javascript:;">智能扫货</a></li>
				<li><a href="javascript:;">文章资讯</a></li>
			</ul>
		</div>
	</div>

	<!--主要内容区-->
	<div id="searchcontent">
		<div class="search-tree">
			<i></i>
			<a href="javascript:;">首页</a>
			 &gt; 商品搜索_女装
		</div>
		<div id='searchmaincontent'>
			<div class="searchleftside">
				<div class="leftsidemenu">
					<ul>
						<li>
							<div><a href="javascript:;"><i></i>食品生鲜</a></div>
							<ul class="secondmenu">
								<li><a href="javascript:;">保健食品</a></li>
								<li><a href="javascript:;">进口水果</a></li>
								<li><a href="javascript:;">糖果巧克力</a></li>
								<li><a href="javascript:;">牛奶乳品</a></li>
								<li><a href="javascript:;">坚果炒货</a></li>
								<li><a href="javascript:;">蜜饯果干</a></li>
							</ul>
						</li>
						<li>
							<div><a href="javascript:;"><i></i>服装服饰</a></div>
							<ul class="secondmenu">
								<li><a href="javascript:;">女装馆</a></li>
								<li><a href="javascript:;">T恤</a></li>
								<li><a href="javascript:;">中长款半身</a></li>
								<li><a href="javascript:;">夹克/风衣</a></li>
								<li><a href="javascript:;">男装馆</a></li>
								<li><a href="javascript:;">内衣馆</a></li>
								<li><a href="javascript:;">户外鞋服</a></li>
								<li><a href="javascript:;">鞋帽</a></li>
								<li><a href="javascript:;">箱包馆</a></li>
							</ul>
						</li>
						<li>
							<div><a href="javascript:;"><i></i>个护化妆</a></div>
							<ul class="secondmenu">
								<li><a href="javascript:;">美容护肤</a></li>
								<li><a href="javascript:;">香水彩妆</a></li>
								<li><a href="javascript:;">面部护肤</a></li>
								<li><a href="javascript:;">洗发护发</a></li>
								<li><a href="javascript:;">身体护肤</a></li>
								<li><a href="javascript:;">口腔护理</a></li>
							</ul>
						</li>
						<li>
							<div><a href="javascript:;"><i></i>手机数码</a></div>
							<ul class="secondmenu">
								<li><a href="javascript:;">网卡</a></li>
								<li><a href="javascript:;">热卖手机</a></li>
								<li><a href="javascript:;">手机配件</a></li>
								<li><a href="javascript:;">数码影音</a></li>
								<li><a href="javascript:;">智能设备</a></li>
								<li><a href="javascript:;">电脑</a></li>
							</ul>
						</li>
						<li>
							<div><a href="javascript:;"><i></i>家用电器</a></div>
							<ul class="secondmenu">
								<li><a href="javascript:;">大 家 电</a></li>
								<li><a href="javascript:;">大家电</a></li>
								<li><a href="javascript:;">生活电器</a></li>
								<li><a href="javascript:;">厨房电器</a></li>
								<li><a href="javascript:;">个护健康</a></li>
								<li><a href="javascript:;">五金家装</a></li>
							</ul>
						</li>
						<li>
							<div><a href="javascript:;"><i></i>家居日用</a></div>
							<ul class="secondmenu">
								<li><a href="javascript:;">家纺</a></li>
								<li><a href="javascript:;">家具</a></li>
								<li><a href="javascript:;">厨具</a></li>
								<li><a href="javascript:;">灯具</a></li>
								<li><a href="javascript:;">家装软饰</a></li>
								<li><a href="javascript:;">生活日用</a></li>
								<li><a href="javascript:;">办公用品</a></li>
							</ul>
						</li>
						<li>
							<div><a href="javascript:;"><i></i>酒类饮料</a></div>
							<ul class="secondmenu">
								<li><a href="javascript:;">酒水</a></li>
								<li><a href="javascript:;">冲调饮品</a></li>
								<li><a href="javascript:;">饮料饮品</a></li>
								<li><a href="javascript:;">茗茶</a></li>
							</ul>
						</li>
						<li>
							<div><a href="javascript:;"><i></i>母婴用品</a></div>
							<ul class="secondmenu">
								<li><a href="javascript:;">尿裤湿巾</a></li>
								<li><a href="javascript:;">玩具</a></li>
								<li><a href="javascript:;">婴儿尿裤</a></li>
								<li><a href="javascript:;">孕妇装</a></li>
								<li><a href="javascript:;">孕婴奶粉</a></li>
								<li><a href="javascript:;">营养/辅食</a></li>
								<li><a href="javascript:;">孕婴洗护</a></li>
								<li><a href="javascript:;">喂养用品</a></li>
								<li><a href="javascript:;">车床/床品</a></li>
								<li><a href="javascript:;">孕妈专区</a></li>
								<li><a href="javascript:;">童装童鞋</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="salescharts">
					<p>销量排行榜</p>
					<div class="saleschartslist">
						<div class='saleschartsitem'>
							<i>1</i><a href="javascript:;">康婷瑞倪维儿活肤营养水80ml</a>
						</div>
						<div class="saleschartsitems active">
							<i>1</i>
							<dl>
								<dt><a href="javascript:;"><img src="resources/gkk/img4f-index-bottom (9).jpg" alt=""></a></dt>
								<dd>
									<b><a href="javascript:;">康婷瑞倪维儿活肤营养水80ml</a></b>
									<span> 97.0 </span>
								</dd>
							</dl>
						</div>
					</div>
					<div class="saleschartslist">
						<div class='saleschartsitem'>
							<i>1</i><a href="javascript:;">康婷瑞倪维儿活肤营养水80ml</a>
						</div>
						<div class="saleschartsitems active">
							<i>1</i>
							<dl>
								<dt><a href="javascript:;"><img src="resources/gkk/img4f-index-bottom (9).jpg" alt=""></a></dt>
								<dd>
									<b><a href="javascript:;">康婷瑞倪维儿活肤营养水80ml</a></b>
									<span> 97.0 </span>
								</dd>
							</dl>
						</div>
					</div>
					<div class="saleschartslist">
						<div class='saleschartsitem'>
							<i>1</i><a href="javascript:;">康婷瑞倪维儿活肤营养水80ml</a>
						</div>
						<div class="saleschartsitems active">
							<i>1</i>
							<dl>
								<dt><a href="javascript:;"><img src="resources/gkk/img4f-index-bottom (9).jpg" alt=""></a></dt>
								<dd>
									<b><a href="javascript:;">康婷瑞倪维儿活肤营养水80ml</a></b>
									<span> 97.0 </span>
								</dd>
							</dl>
						</div>
					</div>
					<div class="saleschartslist">
						<div class='saleschartsitem'>
							<i>1</i><a href="javascript:;">康婷瑞倪维儿活肤营养水80ml</a>
						</div>
						<div class="saleschartsitems active">
							<i>1</i>
							<dl>
								<dt><a href="javascript:;"><img src="resources/gkk/img4f-index-bottom (9).jpg" alt=""></a></dt>
								<dd>
									<b><a href="javascript:;">康婷瑞倪维儿活肤营养水80ml</a></b>
									<span> 97.0 </span>
								</dd>
							</dl>
						</div>
					</div>
					<div class="saleschartslist">
						<div class='saleschartsitem'>
							<i>1</i><a href="javascript:;">康婷瑞倪维儿活肤营养水80ml</a>
						</div>
						<div class="saleschartsitems active">
							<i>1</i>
							<dl>
								<dt><a href="javascript:;"><img src="resources/gkk/img4f-index-bottom (9).jpg" alt=""></a></dt>
								<dd>
									<b><a href="javascript:;">康婷瑞倪维儿活肤营养水80ml</a></b>
									<span> 97.0 </span>
								</dd>
							</dl>
						</div>
					</div>
					<div class="saleschartslist">
						<div class='saleschartsitem active'>
							<i>2</i><a href="javascript:;">Huawei/华为 荣耀6 Plus高配版 移动...</a>
						</div>
						<div class="saleschartsitems">
							<i>2</i>
							<dl>
								<dt><a href="javascript:;"><img src="resources/gkk/img4f-index-mid(3).jpg" alt=""></a></dt>
								<dd>
									<b><a href="javascript:;">Huawei/华为 荣耀6 Plus高配版 移动...</a></b>
									<span> 1899.0 </span>
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
			<div class="searchrightside">
				<div class="searchresulttop">
					<div class="searchresulttopitem1">
						搜索结果
					</div>
					<div class="searchresulttopitem2">
						  <a href="javascript:;">上架<i></i></a>
					</div>
					<div class="searchresulttopitem2">
						  <a href="javascript:;">价格<i></i></a>
					</div>
					<div class="searchresulttopitem2 active">
						  <a href="javascript:;">更新<i></i></a>
					</div>
					<div class="searchresulttopitem2">
						  <a href="javascript:;">人气<i></i></a>
					</div>
					<div class="searchresulttotal">
						共<b>5</b>个商品
					</div>
					<div class="pages">
						<span>1</span>/1
					</div>
					<div class="btn">
						<input type="button" class="left" value="<">
						<input type="button" class="left" value=">">
					</div>
				</div>
				<div class="searchresultgoods">
					<ul>
					<c:forEach items="${pageInfo.content}" var="productInfo">
						<li>
							<i class="newgoods">新品</i>
							<dl>
								<dt><a href="javascript:;"><img src="upload/${productInfo.productPhoto }" alt=""></a></dt>
								<dd>
									<a href="javascript:;">${productInfo.productName}</a>
									<p><i>${productInfo.productPrice }</i> <span>199</span></p>
								</dd>
							</dl>
							<div class="popular">
								<div class="popularleft">
									<span><a href="javascript:;">0</a></span>
									<p>商品销量</p>
								</div>
								<div class="popularcenter">
									<span><a href="javascript:;">0</a></span>
									<p>用户评论</p>
								</div>
								<div class="popularright">
									<span><a href="javascript:;">620</a></span>
									<p>关注人气</p>
								</div>
							</div>
							<div class="bottomcompare">
								<a class="compare" href="javascript:;"></a>
								<a class="love" href="javascript:;"></a>
							</div>
							<div class="puttoshopcart">
								<a href="front/shopingCart?productId=${productInfo.productId}">加入购物车</a>
								<div class="puttoshopcarttop"></div>
								<div class="puttoshopcartleft"></div>
								<div class="puttoshopcartright"></div>
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<!-- 分页 -->
		<div>
		   <tr>
					<td colspan="9">
						<nav aria-label="...">
							<ul class="pagination">
								<c:choose>
									<c:when test="${pageInfo.first }">
										<li class="page-item">
											<!-- javascript:void(0)用来取消超级链接的默认行为方式，即可选中点击超级链接 --> 
											<a href="javascript:void(0)" class="page-link">&laquo;</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<a href="front/productInfoList?pageNo=${pageInfo.number+1-1 }" class="page-link">&laquo;</a>
										</li>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${pageInfo.totalPages<=5 }">
										<c:forEach begin="1" end="${pageInfo.totalPages }" var="i">
											<li class="page-item">
												<a href="front/productInfoList?pageNo=${i }" class="page-link">${i }</a>
											</li>
										</c:forEach>
									</c:when>
									<c:when test="${pageInfo.number+1<=3 }">
										<li class="page-item"><a href="front/productInfoList?pageNo=1" class="page-link">1</a></li>
										<li class="page-item"><a href="front/productInfoList?pageNo=2" class="page-link">2</a></li>
										<li class="page-item"><a href="front/productInfoList?pageNo=3" class="page-link">3</a></li>
										<li class="page-item"><a href="front/productInfoList?pageNo=4" class="page-link">4</a></li>
										<li class="page-item"><a href="front/productInfoList?pageNo=${pageInfo.totalPages }" class="page-link">..${pageInfo.totalPages }</a></li>
									</c:when>
									<c:when test="${pageInfo.number+1>=pageInfo.totalPages-2 }">
										<li class="page-item"><a href="front/productInfoList?pageNo=1" class="page-link">1..</a></li>
										<li class="page-item"><a href="front/productInfoList?pageNo=${pageInfo.totalPages-3 }" class="page-link">${pageInfo.totalPages-3 }</a></li>
										<li class="page-item"><a href="front/productInfoList?pageNo=${pageInfo.totalPages-2 }" class="page-link">${pageInfo.totalPages-2 }</a></li>
										<li class="page-item"><a href="front/productInfoList?pageNo=${pageInfo.totalPages-1 }" class="page-link">${pageInfo.totalPages-1 }</a></li>
										<li class="page-item"><a href="front/productInfoList?pageNo=${pageInfo.totalPages }" class="page-link">${pageInfo.totalPages }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a href="front/productInfoList?pageNo=1" class="page-link">1..</a></li>
										<li class="page-item"><a href="front/productInfoList?pageNo=${pageInfo.number+1-1 }" class="page-link">${pageInfo.number+1-1 }</a></li>
										<li class="page-item"><a href="front/productInfoList?pageNo=${pageInfo.number+1 }" class="page-link">${pageInfo.number+1 }</a></li>
										<li class="page-item"><a href="front/productInfoList?pageNo=${pageInfo.number+1+1 }" class="page-link">${pageInfo.number+1+1 }</a></li>
										<li class="page-item"><a href="front/productInfoList?pageNo=${pageInfo.totalPages }" class="page-link">..${pageInfo.totalPages }</a></li>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${pageInfo.last }">
										<li class="page-item"><a href="javascript:void(0)" class="page-link">&raquo;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a
											href="front/productInfoList?pageNo=${pageInfo.number+1+1 }" class="page-link">&raquo;</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
					</td>
				</tr>
				<!-- 为上一行有下边框 -->
				<tr></tr>
		</div>
		<!--猜你喜欢-->
		<div id="guess">
			<div class="guessleft">
				<p>最近浏览</p>
				<ul>
					<li>
						<a href="javascript:;"><img src="resources/gkk/img34_thumb_G_1452797720522.jpg" alt=""></a>
						<p><a href="javascript:;">2016春秋季新款韩版胖MM大码女装宽松中长</a><span>78.0</span></p>
					</li>
					<li>
						<a href="javascript:;"><img src="resources/gkk/img40_thumb_G_1437515363345.jpg" alt=""></a>
						<p><a href="javascript:;">伊芙丽秋装新款翻领小西装女 2015新款 西装</a><span>299.0</span></p>
					</li>
					<li>
						<a href="javascript:;"><img src="resources/gkk/img46_thumb_G_1437516342367.jpg" alt=""></a>
						<p><a href="javascript:;">2015夏季小西装女外套夏装薄款韩版修身短款</a><span>213.0</span></p>
					</li>
					<li>
						<a href="javascript:;"><img src="resources/gkk/img51_thumb_G_1437519866381.jpg" alt=""></a>
						<p><a href="javascript:;">高端2015夏装新款修身淑坊女女装蕾丝短袖复</a><span>199.0</span></p>
					</li>
					<li>
						<a href="javascript:;"><img src="resources/gkk/img4f-index-mid(4).jpg" alt=""></a>
						<p><a href="javascript:;">苹果（Apple）iPhone 6 (A1586) 16GB 金色 </a><span>4888.0</span></p>
					</li>
					<li class="clearrecent"><a href="javascript:;">清空最近浏览商品>></a></li>
				</ul>
			</div>
			<div class="guessright">
				<p>根据浏览猜你喜欢</p>
				<a href="javascript:;" class="btnleft"></a>
				<div class="guessprobable">
					<ul>
						<li>
							<a href="javascript:;"><img src="resources/gkk/img33_thumb_G_1437507221390.jpg" alt=""></a>
							<p><a href="javascript:;">夏装新款修身假两件无袖绣花蕾丝连衣裙</a></p>
							<span></span>
							<a href="javascript:;">(已有0人评价)</a>
							<b>279.00</b>
						</li>
						<li>
							<a href="javascript:;"><img src="resources/gkk/img34_thumb_G_1452797720522.jpg" alt=""></a>
							<p><a href="javascript:;">2016春秋季新款韩版胖MM大码女装宽松...</a></p>
							<span></span>
							<a href="javascript:;">(已有0人评价)</a>
							<b>78.00</b>
						</li>
						<li>
							<a href="javascript:;"><img src="resources/gkk/img36_thumb_G_1452809642710.jpg" alt=""></a>
							<p><a href="javascript:;">千与千寻 2016春秋新款 女装蕾丝长裙...</a></p>
							<span></span>
							<a href="javascript:;">(已有0人评价)</a>
							<b>186.00</b>
						</li>
						<li>
							<a href="javascript:;"><img src="resources/gkk/img38_thumb_G_1452801081271.jpg" alt=""></a>
							<p><a href="javascript:;">欧洲站2016春秋女宽松显瘦长袖中长款针...</a></p>
							<span></span>
							<a href="javascript:;">(已有0人评价)</a>
							<b>328.00</b>
						</li>
						<li>
							<a href="javascript:;"><img src="resources/gkk/img40_thumb_G_1437515363345.jpg" alt=""></a>
							<p><a href="javascript:;">伊芙丽秋装新款翻领小西装女 2015新款...</a></p>
							<span></span>
							<a href="javascript:;">(已有0人评价)</a>
							<b>299.00</b>
						</li>
						<li>
							<a href="javascript:;"><img src="resources/gkk/img42_thumb_G_1437515742056.jpg" alt=""></a>
							<p><a href="javascript:;">2015新款修身开衫短款七分袖小西装女薄...</a></p>
							<span></span>
							<a href="javascript:;">(已有0人评价)</a>
							<b>259.00</b>
						</li>
						<li>
							<a href="javascript:;"><img src="resources/gkk/img45_thumb_G_1437516035103.jpg" alt=""></a>
							<p><a href="javascript:;">2015夏装韩版修身白色小西装女薄外套</a></p>
							<span></span>
							<a href="javascript:;">(已有0人评价)</a>
							<b>399.00</b>
						</li>
						<li>
							<a href="javascript:;"><img src="resources/gkk/img46_thumb_G_1437516342367.jpg" alt=""></a>
							<p><a href="javascript:;">2015夏季小西装女外套夏装薄款韩版修身...</a></p>
							<span></span>
							<a href="javascript:;">(已有0人评价)</a>
							<b>213.00</b>
						</li>
					</ul>
				</div>
				<a href="javascript:;" class="btnright"></a>
			</div>
		</div>
	</div>
	
	<!--footer-->
	<div id='footer' style="border-top:1px solid #ddd;">
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
				<li>
					400-0310-707
					<p class="p1">周一至周五 9:00-17:30</p>
					<p class="p2">（仅收市话费）</p>
				</li>
				<li>
					<a href="javascript:;">24小时在线客服</a>
				</li>
			</ul>
		</div>

		<!--friend link-->
		<div id="friendlink">
			<p>友情链接： <a href="javascript:;">邢台亿搜人才网</a> | <a href="javascript:;">邯郸中小企业网</a> | <a href="javascript:;">亿搜人才网</a> | <a href="javascript:;">众贤服务网</a> | <a href="javascript:;">快递查询</a></p>
			<p><a href="javascript:;">关于我们</a> | <a href="javascript:;">管理团队</a> | <a href="javascript:;">商家入驻</a> | <a href="javascript:;">媒体报道</a> | <a href="javascript:;">站点地图</a> | <a href="javascript:;">招贤纳士</a> | <a href="javascript:;">帮助中心</a> ICP备案证书号:<a href="javascript:;">冀ICP备14019346号-1</a></p>
			<p><a href="javascript:;">© 2005-2016 聚惠买商城 版权所有，并保留所有权利。</a> <a href="javascript:;">邯郸市开发区世纪大街2号才智港</a> <a href="javascript:;">Tel: 400-0310-707</a> <a href="javascript:;">E-mail: juhuimai@126.com</a></p>
		</div>
	</div>

	<!--对比栏-->
	<div id="compare">
		<a href="javascript:;">对<br>比<br>栏</a>
	</div>

	<!--侧边栏-->
	<div id="index-fixed">
		<div class="head">
			<a href="javascript:;"><img src="resources/gkk/imguser_head.png" alt="head" /></a>
			<div class="login hide">
				<form action="" name='index-login' class="index-login">
					<div class="login-top">
						<h6>请登录</h6>
						<span>还没有账号？</span>
						<a href="register.html">立即注册</a>
					</div>
					<div class="login-txtwrap">
						<span>账 号</span><input type="text" class='login-txt'>
					</div>
					<div class="login-passwrap">
						<span>密 码</span><input type="password" class='login-pass'>
					</div>
					<div class="login-sel">
						<input type="checkbox" />
						<span>记住密码</span>
						<a href="javascript:;">忘记密码？</a>
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
				<div class="o2otop"><img src="resources/gkk/imgweb_logo.png" alt="">在线客服</div>
				<div class="o2obottom"><img src="resources/gkk/imgqq1.gif" alt="">客服主管</div>
				<div class="cover"></div>
				<div class="icon"></div>
			</div>
		</div>
		<div class="research">
			<div class='before'><i></i>
			调查</div>
			<div class="after">在线调查</div>
			<div class="researchtest hide">
				在线调查问卷
				<div class="cover"></div>
				<div class="icon"></div>
			</div>
		</div>
		<div class="shopcar">
			<i></i>
			<a href="shopcar.html" style='color:#fff;'><p>购物车</p></a>
			<span>0</span>
			<div class="shopcaritem hide">
				<a href="javascript:;">您的购物车里什么都没有哦，再去看看吧</a>
				<div class="cover"></div>
				<div class="icon"></div>
			</div>
		</div>
		<div class="look">
			<div class="before">
				<i></i>
				关注
			</div>
			<div class="after after2">
				关注店铺
			</div>
		</div>
		<div class="collect">
			<div class="before">
				<i></i>
				收藏
			</div>
			<div class="after after2">
				收藏商品
			</div>
		</div>
		<div class="code">
			<div class="wrap">
				<div class="before">
					<i></i>
				</div>
				<div class="after after2">
					官方微信
				</div>
			</div>
			
			<div class="codeitem hide">
				<img src="resources/gkk/img/weixin.png" alt="">
				扫描二维码，码上有礼！
				<div class="cover"></div>
				<div class="icon icon2"></div>
			</div>
		</div>
		<div class="totop">
			<div class="before">
				<i></i>
			</div>
			<div class="after after3">
				回到顶部
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="resources/bower_components/uri-util/dist/uri-util.js"></script>
	<script type="text/javascript">
		$("a[href^='front/productInfoList?pageNo=${pageInfo.number+1}']").parent("li").addClass("active");
		$(function() {
			
			var prePage = ${pageInfo.number+1-1};
			var nextPage = ${pageInfo.number+1+1};
			$('a[class="page-link"][href^="front/productInfoList?pageNo="]').click(function(evt) {
				evt.preventDefault();
				//修改表单中pageNo的值
				if ($(this).text() == "»") {
					$('#ListSearchFrm input[name="pageNo"]').val(nextPage);
				} else if ($(this).text() == "«") {
					$('#ListSearchFrm input[name="pageNo"]').val(prePage);
				} else {
					$('#ListSearchFrm input[name="pageNo"]').val($(this).text().replace(/\./g,""));
				}
				$("#ListSearchFrm").submit();
			});
			</script>
</body>
</html>