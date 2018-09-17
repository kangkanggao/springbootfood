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
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link active" href="#">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Profile</a>
					</li>
					<li class="nav-item"><a class="nav-link disabled" href="#">Messages</a>
					</li>
					<li class="nav-item dropdown ml-md-auto"><a
						class="nav-link dropdown-toggle" href="http://example.com"
						id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown
							link</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a> <a
								class="dropdown-item" href="#">Something else here</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Separated link</a>
						</div></li>
				</ul>
			</div>
		</div>
		<div class="col-md-5">
			<form role="form">
				<div class="easyui-layout" style="width: 700px; height: 350px;">
					<div id="login" data-options="region:'west'" title="登录"
						style="width: 50%; padding: 10px">
					
						
					</div>
					<div data-options="region:'center'" title="注册" id="reg">
					
					
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript"
		src="resources/bower_components/jquery/dist/jquery.js"></script>
	<script type="text/javascript"
		src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="resources/bower_components/jeasyui/jquery.easyui.min.js"></script>
</body>
</html>