<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>

<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>订单结算</title>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
	<link href="resources/icomoon/style.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="resources/gkk/css/main.css" />
	<link rel="stylesheet" href="resources/gkk/css/index.css" />
	<link rel="stylesheet" href="resources/gkk/css/shopcar.css" />
	<link rel="stylesheet" href="resources/gkk/css/detail.css" />
	<link rel="stylesheet" href="resources/gkk/css/searchresult.css" />
	<script src='resources/gkk/js/jquery-1.12.4.min.js'></script>
	<script src='resources/gkk/js/jquery.countdown.min.js'></script>
	<script src='resources/gkk/js/index.js'></script>
	<script src='resources/gkk/js/searchresult.js'></script>
	<script src='resources/gkk/js/jquery.cookie.js'></script>
	<script src='resources/gkk/js/jquery.lazyload.min.js'></script>
<link
	href="resources/bower_components/jeasyui/themes/bootstrap/easyui.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
<style type="text/css">
/* 选项操作点击颜色改变 */
.myoption {
	color: black;
}

.navbar {
	background-color: #FF0000;
}
</style>
<!--header-->
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
			<a
				class="header-myfav" href="front/toMain"><i></i>主界面</a>
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
	<!--header-->
</head>
<body>
	<div class="container-fluid" style="background-color: #F5F5F5">
		<!-- 主页导航栏 -->
		<div class="row">
			
		</div>
		<!-- 中间模块 -->
		<div class="row mx-auto" style="width: 90%">
			<div class="col-md-12">
				<!-- 用户操作目录 -->
				<nav>
					<ol class="breadcrumb"
						style="background-color: #e31939; border: 2px solid white;">
						<li class="breadcrumb-item"><span style="color: white">当前位置</span></li>
						<li class="breadcrumb-item">
							<!-- 获取用户位置 --> <a href="#" style="color: white">南阳理工学院</a>
						</li>
						<li class="breadcrumb-item active">
							<!-- 追加用户操作目录 --> <span class="mydir" style="color: white"></span>
						</li>
					</ol>
				</nav>

				<div class="row">
			<!-- 		<div class="col-md-2" >
						<div
							style="border: 2px solid #424242; width: 80%; height:570px; background-color: #ff6700">
							<ul role="navigation" style="list-style-type: none; height: 100%">
								<li style="padding-bottom: 30px; padding-top: 20px"><h5>
										<a href="front/defaultifarme" class="myoption"
											onclick="delconfirm(event)" style="color: white;">个人中心</a>
									</h5></li>
								<li style="padding-bottom: 10px"><h5 style="color: white;">我的订单</h5>
									<ul style="list-style-type: none; display: inline;">
										<li><a href="front/recentmsg" class="myoption"
											onclick="delconfirm(event)" style="color: white;">近期订单</a></li>
									</ul></li>
								<li style="padding-bottom: 20px"><h5 style="color: white;">我的资产</h5>
									<ul style="list-style-type: none; display: inline;">
										<li><a href="front/mypacket" class="myoption"
											onclick="delconfirm(event)" style="color: white;">我的红包</a></li>
										<li><a href="front/mymoney" class="myoption"
											onclick="delconfirm(event)" style="color: white;">账户余额</a></li>
										<li><a href="front/myglod" class="myoption"
											onclick="delconfirm(event)" style="color: white;">我的金币</a></li>
									</ul></li>
								<li style="padding-bottom: 10px"><h5 style="color: white;">我的资料</h5>
									<ul style="list-style-type: none; display: inline;">
										<li><a href="front/personmsg" class="myoption"
											onclick="delconfirm(event)" style="color: white;">个人资料</a></li>
										<li><a href="front/address" class="myoption"
											onclick="delconfirm(event)" style="color: white;">地址管理</a></li>
									</ul></li>
								<li style="padding-bottom: 10px"><h5>
										<a href="" class="myoption" onclick="delconfirm(event)"
											style="color: white;">我的收藏</a>
									</h5></li>
							</ul>
						</div>
					</div> -->
					<div class="col-md-12">

						<!-- 右边ifarme显示信息 -->
						<iframe id="iframe" src="<%=basePath%>front/defaultifarme"
							style="width: 100%; height: 570px; border: 2px solid #e31939;">
						</iframe>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- js文件放在最后面，提高网页响应速度 -->
	<script type="text/javascript"
		src="resources/bower_components/jquery/dist/jquery.js"></script>
	<script type="text/javascript"
		src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="resources/bower_components/jeasyui/jquery.easyui.min.js"></script>
	<script type="text/javascript">
		/* 点击超链接时候通过js去哪href修改iframe的src */
		function delconfirm(event) {
			//取消超级链接的默认行为
			event.preventDefault();
			/*   获取超链接的href 修改iframe的src*/
			var url = $(event.target).attr("href");
			document.getElementById('iframe').src = $(event.target)
					.attr("href");

		};
		//获取用户点击的超链接的内容填充到目录
		$("a").click(function() {

			var dir = $(this).text();
			$(dir).parent().children("h5");
			$(".mydir").text($(this).text());
		});
	</script>
		<script type="text/javascript">
	$("ul#city").on("click","li",function(){ 
		 document.getElementById('header-city').innerText = $(this).text().substring(1);
	     document.getElementById('dangqian').innerText = $(this).text().substring(1);
	 });
	
	</script>
</body>
</html>