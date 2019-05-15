<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<!-- 响应式设计 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>注册</title>

<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link
	href="resources/bower_components/jeasyui/themes/bootstrap/easyui.css"
	rel="stylesheet" type="text/css" />
<!-- 背景图片 -->
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

html {
	height: 100%;
}

body {
	height: 100%;
	background: #fff url(resources/image/login_images/backgroud.png) 50% 50%
		no-repeat;
	background-size: cover;
}

.dowebok {
	position: absolute;
	left: 50%;
	top: 50%;
	width: 430px;
	height: 550px;
	margin: -300px 0 0 -215px;
	border: 1px solid #fff;
	border-radius: 20px;
	overflow: hidden;
}

.logo {
	width: 104px;
	height: 104px;
	margin: 50px auto 80px;
	background: url(images/login.png) 0 0 no-repeat;
}

.form-item {
	position: relative;
	width: 360px;
	margin: 0 auto;
	padding-bottom: 10px;
}

.form-item input {
	width: 288px;
	height: 48px;
	padding-left: 70px;
	border: 1px solid #fff;
	border-radius: 25px;
	font-size: 18px;
	color: #fff;
	background-color: transparent;
	outline: none;
}

.form-item button {
	width: 360px;
	height: 50px;
	border: 0;
	border-radius: 25px;
	font-size: 18px;
	color: #1f6f4a;
	outline: none;
	cursor: pointer;
	background-color: #fff;
}

#username {
	background: url(resources/image/login_images/emil.png) 20px 14px
		no-repeat;
}

#password {
	background: url(resources/image/login_images/password.png) 23px 11px
		no-repeat;
}

.tip {
	display: none;
	position: absolute;
	left: 20px;
	top: 52px;
	font-size: 14px;
	color: #f50;
}

.reg-bar {
	width: 360px;
	margin: 20px auto 0;
	font-size: 14px;
	overflow: hidden;
}

.reg-bar a {
	color: #fff;
	text-decoration: none;
}

.reg-bar a:hover {
	text-decoration: underline;
}

.reg-bar .reg {
	float: left;
}

.reg-bar .forget {
	float: right;
}

.dowebok ::-webkit-input-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

.dowebok :-moz-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

.dowebok ::-moz-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

.dowebok :-ms-input-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

@media screen and (max-width: 500px) {
	* {
		box-sizing: border-box;
	}
	.dowebok {
		position: static;
		width: auto;
		height: auto;
		margin: 0 30px;
		border: 0;
		border-radius: 0;
	}
	.logo {
		margin: 50px auto;
	}
	.form-item {
		width: auto;
	}
	.form-item input, .form-item button, .reg-bar {
		width: 100%;
	}
}

body {
	overflow: hidden;
	position: fixed;
	width: 100%;
	height: 100%;
	/* background:url(resources/image/1.jpg) no-repeat; */
	background-size: cover;
}
</style>
</head>
<body style="background-color: threedlightshadow;">
	<div style="padding-left: 40%;">
		<div class="container-fluid auto-center">
			<div class="row">
				<div class="col-md-12" style="">
					<div style="margin-bottom: 10%;"></div>
					<div class="easyui-layout"
						style="width: 45%; height: 500px; border: solid, black, 1px;">

						<!-- 注册栏 -->
						<%-- <div id="p" data-options="region:'center'" title="注册"
							style="width: 50%; padding: 10px; border: solid, black, 1px; background-image: url(resources/image/2.jpg); background-size: 100%;">
							<c:if test="${requestScope.regmsg!=null }">
								<div class="alert alert-success" role="alert">
									${requestScope.regmsg }</div>
							</c:if>
							<c:if test="${requestScope.phonemsg!=null }">
								<div class="alert alert-success" role="alert">
									${requestScope.phonemsg }</div>
							</c:if>
							<form action="front/reg" method="post">
								<div class="form-group">
									<label for="exampleInputName">用户名</label> <input type="text"
										class="form-control" id="exampleInputName"
										value="${requestScope.name }" aria-describedby="emailHelp"
										placeholder="用户名" name="name">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword">密码</label> <input
										type="password" class="form-control" id="exampleInputPassword"
										name="pwd" placeholder="密码">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword">确认密码</label> <input
										type="password" class="form-control" id="exampleInputPassword"
										name="secondpwd" placeholder="密码">
								</div>
								<!-- 手机号 9.25 gkk-->
								<div class="form-group">
									<label for="exampleInputPhone" id="checkPhone">手机号</label> <input
										type="text" class="form-control" id="exampleInputPhone"
										onblur="checkPhone()" placeholder="手机号" name="secondphone"
										maxlength="11">
								</div>
								<!--  短信验证 9.25 gkk-->
								<div class="form-group ">
									<div>
										<label for="exampleInputSMS">短信验证</label>
									</div>
									<input type="text" class="form-control" id="exampleInputSMS"
										name="secondsms" placeholder="短信验证码"
										style="width: 180px; display: inline;"> <input
										id="btnphone" type="button" class="btn btn-info"
										style="margin-top: -7px; margin-left: 8px;"
										onclick="sendSMS(event)" value="获取验证码">
								</div>
								<div class="form-group">
									<div>
										<label for="vcode">验证码</label>
									</div>
									<input type="text" name="vcode" class="form-control"
										id="exampleInputVcode" maxlength="4"
										style="width: 180px; display: inline;"> <img alt=""
										src="vcode.png" class="validateVcode" title="点击换图"
										style="margin-top: -7px; margin-left: 10px;">

								</div>
								<button type="submit" class="btn btn-primary">注册</button>

							</form>
						</div> --%>

						<!-- 登录栏 -->
						<!--
						<div id="lo" data-options="region:'east'" title="账户登录"
							style="border: solid, black, 1px; padding: 20px;  background-image: url(resources/image/login_images/backgroud.png);  background-size: contain;"> -->
						<form action="front/reg" method="post">
							<div class="dowebok">
								<div class="logo"></div>
								<div class="form-item">
									<input id="username" type="text" autocomplete="off"
										placeholder="邮箱" name="name" value="${requestScope.name }">
									<!-- <p class="tip">请输入合法的邮箱地址</p> -->
								</div>
								<div class="form-item">
									<input id="password" type="password" autocomplete="off"
										name="pwd" placeholder="登录密码">
									<!-- <p class="tip">邮箱或密码不正确</p> -->
								</div>
								<div class="form-item">
								<input id="password" type="password" autocomplete="off"
										name="secondpwd" placeholder="确认密码">
								</div>
								<div class="form-item ">

									<input type="text" class="form-control " id="vcode"
										maxlength="4" name="vcode" placeholder="验证码"
										style="width: 180px; display: inline;"> <img alt=""
										src="vcode.png" class="validateVcode" title="点击换图"
										style="margin-top: -7px; margin-left: 10px;">
										<br>
										
								</div>
						
								<div class="form-item">
									<button id="submit">注册</button>
										
								</div>
								
								



							</div>

						</form>

						<!-- </div> -->

					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="resources/bower_components/jquery/dist/jquery.js"></script>
	<script type="text/javascript"
		src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="resources/bower_components/jeasyui/jquery.easyui.min.js"></script>

	<script type="text/javascript">
		$(function() {

		});
		/* 校检手机号 */
		var phone;
		function checkPhone() {
			//手机号正则
			var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;
			//电话
			phone = $.trim($('#exampleInputPhone').val());
			if (!phoneReg.test(phone)) {
				$('#checkPhone').html("手机号格式不正确");
				document.getElementById('checkPhone').style.color = "red ";

			} else {
				$('#checkPhone').html("手机号");
				document.getElementById('checkPhone').style.color = "black";
			}

		}
		/* 获取短信验证码 */

		function sendSMS(event) {
			var phone = document.getElementById("exampleInputPhone").value;

			$.post("front/sendSMS", {
				phone : phone
			}, function(data) {
			});

			event.preventDefult();
		}
	</script>
	<script src="resources/bower_components/jquery/dist/jquery.js"></script>
	<script>
		$(function() {

			$(".validateVcode").click(

					function() {

						$(".validateVcode").attr("src",
								"vcode.png?t=" + Math.random());
					});

			$('input').val('')
			$('#submit').on('click', function() {
				$('.tip').show()
			})
		})
	</script>
</body>
</html>