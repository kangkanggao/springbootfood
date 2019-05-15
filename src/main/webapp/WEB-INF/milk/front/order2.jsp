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
<title>订单</title>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link
	href="resources/bower_components/jeasyui/themes/bootstrap/easyui.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="resources/lujian/css/style.css" />

<link
	href="resources/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="resources/bower_components/jqueryui/themes/sunny/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="resources/bower_components/jquery/dist/jquery.js"></script>

<script type="text/javascript"
	src="resources/bower_components/jqueryui/jquery-ui.min.js">
	</script>
<style type="text/css">
/* 选项操作点击颜色改变 */
.myoption {
	color: black;
}

.navbar {
	background-color: #FF0000;
}
</style>
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
						style="background-color: #ff6700; border: 2px solid #424242;">
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
					<div class="col-md-2" >
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
					</div>
					<div class="col-md-10">

						<!-- 右边ifarme显示信息 -->
						<iframe id="iframe" src="<%=basePath%>front/defaultifarme"
							style="width: 100%; height: 570px; border: 2px solid #424242;">
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
</body>
</html>