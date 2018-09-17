<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>登录</title>

<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link
	href="resources/bower_components/jeasyui/themes/bootstrap/easyui.css"
	rel="stylesheet" type="text/css" />

</head>
<body style="background-color: threedlightshadow;">
	<div style="padding-left: 40%">
		<div class="container-fluid auto-center">
			<div class="row">
				<div class="col-md-12">
					<div style="margin-bottom: 10%;"></div>
					<div class="easyui-layout" style="width:40%; height: 420px;border: solid,black,1px;">

						<!-- 注册栏 -->
						<div id="p" data-options="region:'center'" title="注册"
							style="width: 50%; padding: 10px;border: solid,black,1px;">

							<form action="front/reg" method="post" >
							   
								<div class="form-group">
									<label for="exampleInputName">用户名</label> <input type="text"
										class="form-control" id="exampleInputName"
										aria-describedby="emailHelp" placeholder="用户名" name="name" value="">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword">密码</label> <input
										type="password" class="form-control" id="exampleInputPassword" name="pwd"
										placeholder="密码">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword">确认密码</label> <input
										type="password" class="form-control" id="exampleInputPassword" name="secondpwd"
										placeholder="密码">
								</div>
								<div class="form-group">
									<label for="exampleInputVcode">验证码</label> <input type="text" name="vcode"
										class="form-control" id="exampleInputVcode" maxlength="4">
								</div>
								<button type="submit" class="btn btn-primary">注册</button>

							</form>
						</div>

						<!-- 登录栏 -->
						<div data-options="region:'east'" title="账户登录"
							style="border: solid,black,1px; padding: 20px;">
							<form action="front/login" method="post">
								<div class="form-group">
									<label for="exampleInputName">用户名</label> <input type="text" name="name"
										class="form-control" id="exampleInputName"
										aria-describedby="emailHelp" placeholder="用户名">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword">密码</label> <input
										type="password" class="form-control" id="exampleInputPassword" name="pwd"
										placeholder="密码">
								</div>
								<div class="form-group" >
									<label for="exampleInputVcode">验证码</label> 
									<input type="text" class="form-control" id="exampleInputVcode" maxlength="4" name="vocde"
										style="width: 180px;" >
									
								</div>
								
								<button type="submit" class="btn btn-primary">登录</button>

							</form>

						</div>

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
		
	</script>
</body>
</html>