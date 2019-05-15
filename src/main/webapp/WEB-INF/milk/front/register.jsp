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
<head>
<meta charset="UTF-8">
<title>注册</title>
<link rel="stylesheet" href="resources/gkk/css/login.css">
<link rel="stylesheet" href="resources/gkk/css/main.css">
<script src='resources/gkk/js/jquery-1.12.4.min.js'></script>
<script src='resources/gkk/js/login.js'></script>
<script src='resources/gkk/js/jquery.validate.min.js'></script>
<script src='resources/gkk/js/messages_zh.js'></script>
<style type="text/css">
  .phoneYZM{
   height: 82px;
   width: 340px;
  }
</style>
</head>
<body>
	<!--头部-->
	<div id="register-head">
		<h1 id="logo">
			<a href="resources/gkk/index.html"><img
				src="resources/gkk/img/login/logo.jpg" title='logo' alt=""></a>
		</h1>
		<div class="welwrap">
			<p class="welcom">欢迎注册</p>
		</div>
		<div class="chatwrap">
			<div class="wechatwrap">
				<a class="wechat" href="javascript:;" title='wechat'></a>
				<div class="wechatfloat">
					<!-- <img src="resources/gkk/img/weixin.png" alt=""> -->
				</div>
			</div>
			<a class="sina" href="javascript:;" title='sina'></a> <a
				class="tencent" href="javascript:;" title='tencent'></a>
		</div>
		<!-- <div class="createwrap">
			<span>还没有账号？</span><a href="javascript:;">立即注册</a>
		</div> -->
	</div>

	<!--banner-->
	<div id="register-midwrap">
		<div class="register-midwrap-left">
			<img src="resources/gkk/img/login/loginPic.jpg" alt="">
		</div>
		<div class="register-midwrap-right">
			<h3 class="register-mid-tit">
				<a class="registerway active" href="javascript:;">手机注册</a> <a
					class="registerway" href="javascript:;"></a>
				<p>
					已有账号！<a href="<%=basePath%>front/toLogin">登录</a>
				</p>
			</h3>
			<div class="register-container">
				<form action="front/reg" id='registerfromphone' name='registerfromphone'
					method="post">
					<c:if test="${phonemsg!=null }">
					   <div class="alert alert-primary" role="alert"><font color="red">${phonemsg}</font></div>
				    </c:if>
				    <c:if test="${regmsg!=null }">
					   <div class="alert alert-primary" role="alert"><font color="red">${regmsg}</font></div>
				    </c:if>
					<div class="phone-email active">
						 <div class="txt">
						<i></i>
						<input id='phonenumber' name="phonenumber" type="bumber" placeholder="手机">
						<div class="error">
							
						</div>
					</div> 
						<div class="txt">
							<input type="txt" placeholder="用户名" name="name">

						</div>
						<div class="pass">
							<i></i> <input type="password" name="pwd" id='registerpass'
								placeholder="密码">
							<!-- <span class="passstrength">弱</span>
						<span class="passstrength">中</span>
						<span class="passstrength">强</span> -->
						</div>
						<div class="pass passagain">
							<i></i> <input type="password" class="fortrue"  name='secondpwd'
								placeholder="确认密码">
						</div>
						<div class="captcha">
						<i></i>
						<input type="text" placeholder="手机验证码" id="exampleInputSMS" name="yzm">
						<input type="button" class="clicktosms" id="yzm"value="获取手机验证码" onclick="sendSMS(event)" >
						<div class="shortmeassage"></div>
					</div> 
						<div class="captcha">
							<input type="text" class="form-control " id="vcode" maxlength="4"
								name="vcode" placeholder="验证码"
								style="width: 180px; display: inline;"> <img alt=""
								src="vcode.png" class="validateVcode" title="点击换图"
								style="margin-top: -7px; margin-left: 10px;">
						</div>
						<div class="respect">
							<input id='iagree' type="checkbox" checked="checked"> <label
								for="iagree"><span>我已看过并接受《<a href="javascript:;">用户协议</a>》
							</span></label>
						</div>
						<input type="submit" class="sub" value="立即注册">
					</div>
				</form>
			
				
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {

		});
		/* 校检手机号 */
		var phone;
		function checkPhone() {
			//手机号正则
			var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;
			//电话
			phone = $.trim($('#phonenumber').val());
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
			var phone = $.trim($('#phonenumber').val());
			if(!phone){
              alert("请输入手机号");
              return;
			}
			 $.post("front/sendSMS", {
				phone : phone
			}, function(data) {
			}); 

			//event.preventDefult();
		}
	</script>

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
         document.getElementById("yzm").value="获取手机验证码";
         document.getElementsByClassName("sub")[0].value="立即注册";
	   } 
	  
	</script>
</body>
</html>