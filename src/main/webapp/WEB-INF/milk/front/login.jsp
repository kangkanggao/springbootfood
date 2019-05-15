<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<html lang="en">
<head>
<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>登陆</title>
	<link rel="stylesheet" href="resources/gkk/css/login.css">
	<link rel="stylesheet" href="resources/gkk/css/main.css">
	<script src='resources/gkk/js/jquery-1.12.4.min.js'></script>
	<script src='resources/gkk/js/login.js'></script>
	<script src='resources/gkk/js/jquery.validate.min.js'></script>
	<script src='resources/gkk/js/messages_zh.js'></script>
</head>

<body>
	<!--头部-->
	<div id="login-head">
		<h1 id="logo"><a href="#"><img src="resources/gkk/img/login/logo.jpg" title='logo' alt=""></a></h1>
		<div class="welwrap">
			<p class="welcom">欢迎登录</p>
		</div>
		
		<div class="createwrap">
			<span>还没有账号？</span><a href="<%=basePath%>front/toReg">立即注册</a>
		</div>
	</div>

	<!--banner-->
	<div id="midwrap">
	
		<div class="midwrap-left">
			<img src="resources/gkk/img/login/loginPic.jpg" alt="">
		</div>
		<div class="midwrap-right">
			<form action="front/login" method="post"name='loginform' class="loginform">
			 <c:if test="${msg!=null }">
					<div class="alert alert-primary" role="alert"><font color="red">${msg}</font></div>
				</c:if>
				<div class="logintxtwrap">
					<p>账户名</p>
					<input type="text" name="name"class="logintxt" placeholder="手机号/用户名/邮箱">
				</div>
				<div class="loginpasswrap">
					<p>密码</p>
					<input type="password" name="pwd"class="loginpass">
				</div>
				<!-- <div class="logintxtwrap" style="margin-top: 3px">
				<p>验证码</p>
				 <input type="text" id="vcode"
										maxlength="4" name="vcode" 
										style="width: 180px; height:35px;display: inline;"><br>
										 <img alt=""
										src="vcode.png" class="validateVcode" title="点击换图"
										style="margin-top: -7px; margin-left: 10px;"> 
				</div> -->
				<div class="row cl">
                   <div class="">
                       <input class="input-text size-L" type="text" id="vcode" maxlength="4" name="vcode" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:200px;height: 34px">
                       <img alt="" src="vcode.png" class="validateVcode" title="点击换图" style=" display: inline-block;vertical-align: middle;" >
               </div>
				<div class="loginremember">
					
				</div>
				<input id="login" type="submit" value="立即登录 " class="login-submit">
			</form>
			
		</div>
	</div>
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
		});
		window.onload=function(){ 
			var value=document.getElementById('login').value="立即登录"; 
		} 
		
	</script>
	
</body>
</html>