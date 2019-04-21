<%@page import="cn.edu.nyist.food.model.ProductInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cn.edu.nyist.food.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
<title>购物车</title>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
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
<style type="text/css">
/* 选项操作点击颜色改变 */
.myoption {
	color: black;
}

.clickhref {
	color: blue;
}

body{
background-color:  #ff;

}
.navbar{

background-color: #FF0000;
}
</style>
<script type="text/javascript">

//计算一个商品小计
function onesubtotal(pid){
	   alert('ds');
	   var num=parseInt(document.getElementById("productnum"+pid).value);
	   //单价
	   var price= parseFloat($("#productprice"+pid).text());
	   //一个商品小计
       document.getElementById("onesubtotal"+pid).value=num*price;
	   }

</script>

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
			<a class="header-shopcar" href="javascript:;"><i></i>购物车</a>
			<div class="header-collect" href="javascript:;">收藏夹<i></i>
				<div class="collectitem">
					<a href="javascript:;">收藏的宝贝</a>
					<a href="javascript:;">收藏的店铺</a>
				</div>
			</div>
			<div class="header-line">|</div>
			<div class="header-mobile" href="javascript:;"><span></span>手机版<i></i>
				<div href="javascript:;" class="app"><img src="resources/gkk/img/app.jpg" alt=""></div>
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
	
</head>
<body>
	<div class="container-fluid " style="margin-top: 0px;padding-top: 0px">
		<!-- 主页导航栏 -->
	
<div class="xiantiao"></div>

		<!-- 中间模块 -->
		<div class="row mx-auto" style="width: 80%">

	<!--header-->
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
             
			<!-- 顶部导航栏设计 -->
			<!-- <div class="row mx-auto text-center"
				style="border: 1px solid #ff6700; width: 100%; height: 23%; background-color:#ff6700; margin-bottom: 0px">
				<div
					style="padding-left: 20px; padding-right: 15px; padding-top: 5px; border: px solid white;">
					<img class="rounded-circle img-thumbnail "
						src="resources/image/shoping.png"
						style="max-width: 78px; height: 80px">
				</div>

				<div
					style="padding-left: 30px; padding-top: 20px; border: px solid white;">
					<h3 class="text-left" style="color: white;padding-top: 10px">我的购物车</h3>
					<span class="text-left" style="color: white;padding-top: 10px">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</span>
				</div>
					<span style="color: white;padding-left: 100px;padding-top: 45px"></span>

				<div
					style="padding-left: 40px; padding-right: 15px; padding-top: 10px; border: px solid white;">
					<h4 class="text-left" style="color: white;">我的余额</h4>
					<span style="color: white;"><a href="" >没有钱，去充值</a></span>
				</div>

				

			</div> -->
			<!-- 顶部导航栏结束 -->
			<form action="shopingcart" method="post">

				<div class="col-md-12 mx-auto" style="padding-left: 0px;padding-right: 0px">

					
					<div class="row mx-auto text-center" style="width: 100%;border: 2px solid #e31939;">
						<div class="col-md-12">


							<table class="table table-hover">
								<!-- 优化列表界面，自己设置列宽 -->
								<thead class="col-md-12">
									<tr class="row" style="background: #e31939">
										<!-- 设置每一列宽 -->
										<th class=" col-md-1 col-1 text-center"><label style="color: white">编号</label></th>
										<th class=" col-md-3 col-1 text-center"><label style="color: white">图片</label></th>
										<th class=" col-md-2 col-1 text-center"><label style="color: white">名称</label></th>
										<th class=" col-md-1 col-1 text-center"><label style="color: white">价格</label></th>
										<th class=" col-md-2 col-1 text-center"><label style="color: white">数量</label></th>
										<th class=" col-md-2 col-1 text-center"><label style="color: white">小计</label></th>
										<th class=" col-md-1 col-1 text-center"><label style="color: white">操作</label></th>
									</tr>
								</thead>
								<tbody class="col-md-12">
                                     <% int s=0; %> 
                                  <c:choose>
                                  <c:when test="${empty productInfos }">
                                       <tr class="text-center">
                                       <td colspan="7"><img class="img-thumbnail "
						src="resources/image/notfound.jpg" style="max-width: 80%;"></td>
                                       </tr>
                                  </c:when>
                                  <c:otherwise>
                                    	<c:forEach items="${productInfos}" var="productInfo" >
								         <% s++;%>
										<tr class="row">
											<td class="col-md-1 col-1 text-center"><span id="">${productInfo.productId}</span></td>
											<input type="hidden" name="<%=s%>+${productInfo.productId}" value="${productInfo.productId}" id="<%=s %>"/>
											<td class="col-md-3 col-1 text-center"><img id="myimg"
												src="upload/${productInfo.productPhoto}"
												style="width: 30%;"></td>
											<td class="col-md-2 col-1 text-center">${productInfo.productName}</td>
											<td class="col-md-1 col-1 text-center"><span id="productprice<%=s %>">${productInfo.productPrice }</span>

											</td>

											<td class="col-md-2 col-1 text-center">
												<!-- 点击+1  -1 --> 
											<input type="button" class="sub" onclick="sub(<%=s %>)"  value="-" style="width: 23px;"> 
											<!-- 判断session商品数量 -->
												<c:forEach items="${sessionScope.carts}" var="cart">
													<c:if test="${cart.productId==productInfo.productId }">
	                                     	<!-- 	 显示商品数量 -->
											<input  id="productnum<%=s %>" readonly="readonly" value="${cart.productQuantity}" style="max-width: 21px;"> 				
													</c:if>
												</c:forEach>
											 <input  onclick="add(<%=s%>,'${productInfo.productStock}')" type="button" value="+" style="width: 23px;">
											</td>
											<td class="col-md-2 col-1 text-center">
												<!-- 总价 -->
										¥ <input id="onesubtotal<%=s %>" onload="onesubtotal(<%=s %>)" readonly="readonly" style="max-width:80%;border: none;" value="${productInfo.productPrice }">
											</td>
											<td class="col-md-1 col-1 text-center">
											  <button type="button" class="btn btn-outline-danger" onclick="delCart(<%=s %>)">删除</button>
											</td>
											
										</tr>
									</c:forEach>

                                    </c:otherwise>
                                  </c:choose>

								</tbody>
							</table>

						</div>

						<div style="border: px solid white;" class="float-right col-md-5">

							<input type="button" class="gotopay" onclick="clearShopping(event)" value="清空购物车">
								
							<input type="button" class="gotopay"
								onclick="toshopinglist(event)" value="继续购物">
							<input type="button" class="gotopay"
								onclick="toorderpay(event)" value="去结算">

						</div>
						<div style="border: px solid white; padding-left: 100px"
							class="float-right col-md-4">
						</div>
                          
						<div
							style="border: 1px solid #e31939;; margin-left: 0px; background-color: #e31939"
							class="float-right col-md-3">
							<ul
								style="list-style-type: none; padding-top: 10px; padding-left: 50px">
								<li><label style="color: white">
										&yen;&nbsp;小计&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="smallTotal" class="subtotal" value="0"readonly="readonly" style="width:60px;border: none;background-color: white"></input></li>
								<li><label style="color: white">
										&yen;&nbsp;配送费&nbsp;&nbsp;</label><input id="roadmoney<%=s%>" value="10"readonly="readonly" style="width:60px;border: none;background-color: white"></input></li>
								<li id="sumLi">
								   <label style="color: white">&yen;&nbsp;总价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
								   <input  id="totalSum" value="10" readonly="readonly" style="width:60px;border: none;background-color: white; "></input>
								</li>
							</ul>
						</div>
               
					</div>
				</div>
			</form>

		</div>
	</div>




	<!-- js文件放在最后面，提高网页响应速度 -->
	<script type="text/javascript"
		src="resources/bower_components/jquery/dist/jquery.js"></script>
	<script type="text/javascript"
		src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="resources/bower_components/jeasyui/jquery.easyui.min.js"></script>
	<script>
	 $(document).ready(function(){
	       //点击链接的时候调用
	      $("#pn").click(function(){
	    	  var productName = document.getElementById("productName").value;
	          //设置linkToCart的href的值
	          $("#pn").attr("href","front/productInfoOne?productName="+productName);
	         
	      });
	    });
</script>
	<script type="text/javascript">
	    
		$(function() {
                    
			$(".myoption").click(function() {
				$(".myoption")[0].addClass("clickhref");

			})
			
			$("onesubtotal"+<%=s %>)
		//计算每件商品小计
		    var smallSum=0.0;
			for(var i=1;i<="${fn:length(sessionScope.carts)}";i++ ){
				//每件商品的数量
				var num=parseInt(document.getElementById("productnum"+i).value);	
				//每件商品的价格
			    var price= parseFloat($("#productprice"+i).text()).toFixed(2);
			    //每件商品的总价
			    var productInfoSum=num*price;
			    document.getElementById("onesubtotal"+i).value=parseFloat(productInfoSum).toFixed(2);		
			    //所有商品小计相加
			    smallSum=parseFloat(smallSum)-0+productInfoSum;
			    
			}
			//小计		
			document.getElementById("smallTotal").value=parseFloat(smallSum).toFixed(2);
			//总计//当购物车没有商品时总价为0
			if(${fn:length(sessionScope.carts)}==0){
				document.getElementById("totalSum").value=parseFloat(smallSum).toFixed(2);
			}else{
			    document.getElementById("totalSum").value=parseFloat(smallSum+10).toFixed(2);
			}
		
		});
		  // 9.26需解决问题 总小计出现问题   另外用户直接输入会出现问题(用失去焦点时再次计算或者直接让input不能修改值)
		  function sub(pid){
			  //某件数量
			  var num=parseInt(document.getElementById("productnum"+pid).value);
			  //某件单价
			  var price= parseFloat($("#productprice"+pid).text()).toFixed(2);
			  
              var  onesubtotal=parseFloat(document.getElementById("onesubtotal"+pid).value).toFixed(2);
			  if(num>=2){
				  document.getElementById("productnum"+pid).value=num-1;//数量
				    //一个商品小计
	              document.getElementById("onesubtotal"+pid).value=parseFloat((num-1)*price).toFixed(2);
	              //所有商品小计 //每当按下减号应该减去每件商品的单价
	              //$(".subtotal").val(parseFloat($(".subtotal").val()).toFixed(2)-price);
	              var small=parseFloat(document.getElementById("smallTotal").value);
		          document.getElementById("smallTotal").value=(small-parseFloat(price)).toFixed(2);
		        //总计+配送费
		          document.getElementById("totalSum").value=(small+10-parseFloat(price)).toFixed(2);
				  }else{
					  document.getElementById("productnum"+pid).value=1;//数量
					  document.getElementById("onesubtotal"+pid).value=price;
					  }
				
		 }
			 
		  function add(pid,stock){
			
			  /*  先判断商品总量再加*/
			  var totalProductInfoStock=parseInt(stock);
			  var num=parseInt(document.getElementById("productnum"+pid).value);
			  var val="productnum"+pid;
			  //单价
			  var price= parseFloat($("#productprice"+pid).text()).toFixed(2);
			 
              var  onesubtotal=parseFloat(document.getElementById("onesubtotal"+pid).value).toFixed(2);
                  if(num<totalProductInfoStock){
                	  document.getElementById("productnum"+pid).value=num+1;//数量
                	  
                	 //一个商品小计
                	  document.getElementById("onesubtotal"+pid).value=parseFloat((num+1)*price).toFixed(2);
    		          var small=parseFloat(document.getElementById("smallTotal").value);
    		          document.getElementById("smallTotal").value=(small+parseFloat(price)).toFixed(2); 
    		          //总计+配送费
    		          document.getElementById("totalSum").value=(small+10+parseFloat(price)).toFixed(2);
    		       }
		}
	
		/* 点击到订单结算界面 */
		function toorderpay(event) {
			/* 点击到订单结算界面 */
			var totalprice=  $("#totalSum").val();
			//如果没有商品先购买商品
			if(totalprice==0.00)
				{
                     alert('\u2764 你的购物车为空，请先选择商品 ！');

				}else{


			var url = "front/orderpay?totalprice="+totalprice;

			window.location.href = url;
					}
		}
	</script>
	<script type="text/javascript">
		/*  到商品列表界面购物 */
		function toshopinglist(event) {
			/* 点击到继续购物，到商品列表界面 */
			//定义一个数组存放json
		    var arrJson=new Array();
			var productJson={};
			for(var i=1;i<="${fn:length(sessionScope.carts)}";i++ ){
				//每件商品的数量
				var num=parseInt(document.getElementById("productnum"+i).value);
				//每件商品的id
			    var stringid=document.getElementById(i).name;
			    //prodcutInfoId
				var productid=parseInt(stringid.split('+')[1]);
				productJson.productId=productid;
				productJson.productQuantity=num;
				arrJson.push(productJson);
				productJson={};			
			} 
			
			//发送ajax请求把商品数据id num传给后端
			 $.ajax({
               type:'POST',
               url:'front/shopCartsModify',
	           dataType:"json",      
	           contentType:"application/json",   
	           data:JSON.stringify(arrJson),
               success:function(){			
	           }
             });
		 
			var url = "front/productInfoList";
			window.location.href = url;
		}
		/* 清空购物车 */
		function clearShopping(event){
			 window.location.href="front/clearCarts";
		}
		/* 指定删除某一项商品 */
		function delCart(s){
			for(var i=1;i<="${fn:length(sessionScope.carts)}";i++ ){
				if(s==i){
					var stringid=document.getElementById(i).name;
				    //prodcutInfoId
					var productid=parseInt(stringid.split('+')[1]);
					window.location.href="front/delCart?productInfoId="+productid;
			  }
		  }
	   }
	</script>
</body>
</html>