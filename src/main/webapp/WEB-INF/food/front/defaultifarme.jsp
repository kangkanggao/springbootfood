<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>个人中心</title>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="resources/gkk/css/shopcar.css" />
<link
	href="resources/bower_components/jeasyui/themes/bootstrap/easyui.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
body{

    background-color:  white;
}
.step2 p {
background-position: -297px -204px;
}
.step3 p {
background-position: -297px -204px;
}
</style>

</head>
<body>
	<div class="container-fluid" >
		<div class="row">
			<div class="col-md-12">
				<!-- 顶部导航栏设计 -->
				<div class="row mx-auto text-center"
					style="border: 1px solid yellow; width: 100%; height: 130px; ; margin-bottom: 20px">
					<!-- <div
						style="padding-left: 30px; padding-right: 15px; padding-top: 15px; border: px solid white;">
						<img class="rounded-circle img-thumbnail "
							src="resources/image/defaultuser.png"
							style="max-width: 120px; height: 100px">
					</div>

					<div
						style="padding-left: 30px; padding-bottom: 15px; padding-top: 38px; border: px solid white;">
						<h4 class="text-left">亲爱的用户</h4>
						<span style="padding-left: 30px;">火遍全球的游戏交易网等你来!</span>
					</div>

					<div
						style="padding-left: 40px; padding-right: 15px; padding-top: 38px; border: px solid white;">
						<h4 class="text-left">我的余额</h4>
						<span><a style="color: blue;">没有钱，去充值</a></span>
					</div>

					<div
						style="padding-left: 40px; padding-right: 15px; padding-top: 38px; border: px solid white;">
						<h4 class="text-left">我的金币</h4>
						<span><a style="color: blue;">没有金币</a></span>
					</div>
					<div
						style="padding-left: 40px; padding-right: 15px; padding-top: 38px; border: px solid white;">
						<h4 class="text-left">我的红包</h4>
						<span><a style="color: blue;">没有红包</a></span>
					</div>
 -->
 <div id="shopcarthead">
		<h1 id="shopcartlogo"><a href="../index.html"><img src="resources/gkk/img/login/logo.jpg" alt=""></a></h1>
		<div class="step">
			<div class="step1">查看购物车<p></p></div>
			<div class="step2">拍下商品<p>2</p></div>
			<div class="step3">付款<p>3</p></div>
			<div class="step4">确认收货<p>4</p></div>
			<div class="step5">评价<p>5</p></div>
		</div>
	</div>
				</div>
				<!-- 顶部导航栏设计结束 -->
				<!-- 分割线 -->
				<hr style="color: #987cb9; size: 2px; width: 100%">
				<div class="row mx-auto text-center"
					style="border: 1px solid red; width: 92%;">
					<!-- 分割线 -->
					<div
						style="padding-left: 30px; padding-right: 15px; padding-top: 10px; border: px solid white;">
						<h4 class="text-left">最近订单</h4>

					</div>
					<div
						style="padding-left: 700px; padding-right: 15px; padding-top: 20px; border: px solid white;">
						<h6 class="text-left">
							<a href="front/recentmsg">更多订单</a>
						</h6>

					</div>
					<hr
						style="color: #987cb9; size: 5px; width: 100%; margin-top: 0px; margin-bottom: 5px;">
					<table class="table table-hover mx-auto" style="width: 92%;">
						<!-- 优化列表界面，自己设置列宽 -->
						<thead class="col-md-12">
							<tr class="row" style="background: #e31939; height: 50px">
								<!-- 设置每一列宽 -->
								<th class=" col-md-3 col-1 text-center"><font color="white" size="2">下单时间</font></th>
								<th class=" col-md-4 col-1 text-center"><font color="white" size="2">订单编号</font></th>
								<th class=" col-md-2 col-1 text-center"><font color="white" size="2">支付金额</font></th>
								<th class=" col-md-1 col-1 text-center"><font color="white" size="2">支付状态</font></th>
								<th class=" col-md-2 col-1 text-center"><font color="white" size="2">操作</font></th>
							</tr>
						</thead>
						<tbody class="col-md-12">


							<c:choose>
								<c:when test="${empty orders }">
									<tr class="text-center">
										<td colspan="5"><img class="card-img-top img-thumbnail "
											src="resources/image/notfound.jpg" style="max-width: 80%"></td>
									</tr>
								</c:when>
								<c:otherwise>
                                  <c:forEach items="${orders }" var="order">
                                  <tr class="row" style="height: 75px">
								<td class="col-md-3 col-1 text-center">${order.createTime }</td>
								<td class="col-md-4 col-1 text-center">
								<!-- <img class="card-img-top img-thumbnail "
											src="resources/image/notfound.jpg" style="max-width: 35%"> -->
											${order.orderId }
								</td>
								<td class="col-md-2 col-1 text-center">${order.orderAmount }</td>


								<td class="col-md-1 col-1 text-center">${order.payStatus }</td>
								<td class="col-md-2 col-1 text-center"><a style="text-decoration: none;" href="front/orderitems?orderid=${order.orderId }">订单详情</a>
								<p><a style="text-decoration: none;" href="front/delorderitems?orderid=${order.orderId }">删除订单</a>
								<a style="text-decoration: none;" href="front/toEditPayStatus?orderid=${order.orderId }">去支付</a>
								</td>
							</tr>
                                  
                                  </c:forEach>
								</c:otherwise>
							</c:choose>
							

							
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
</body>
</html>